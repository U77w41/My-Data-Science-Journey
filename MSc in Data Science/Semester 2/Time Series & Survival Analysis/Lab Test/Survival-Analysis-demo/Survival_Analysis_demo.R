getwd()
setwd("C:/Users/Lynn/Documents/R_TCGA_survival")

#------------------------
##https://costalab.ukaachen.de/open_data/Bioinformatics_Analysis_in_R_2019/BIAR_D3/handout.html#1_intro

# Load packages
library("TCGAbiolinks")
library("limma")
library("edgeR")
library("glmnet")
library("factoextra")
library("FactoMineR")
library("caret")
library("SummarizedExperiment")
library("gplots")
library("survival")
library("survminer")
library("RColorBrewer")
library("gProfileR")
library("genefilter")

#----------TCGA data-----------
GDCprojects = getGDCprojects()

head(GDCprojects[c("project_id", "name")])
#https://docs.gdc.cancer.gov/Data_Portal/Users_Guide/Projects/

TCGAbiolinks:::getProjectSummary("TCGA-PRAD")
##the summary shows that TCGA provide data for 500 patients including clinical, expression, DNA methylation, and genotyping data

##Now, we focus on a particular type of data summarization for mRNA-seq data (workflow.type), which is based on raw counts estimated with HTSeq.
query_TCGA = GDCquery(
  project = "TCGA-PRAD",
  data.category = "Transcriptome Profiling", # parameter enforced by GDCquery
  experimental.strategy = "RNA-Seq",
  workflow.type = "HTSeq - Counts")

##Visualize the query results
prad_res = getResults(query_TCGA) # make results as table
# head(prad_res) # data of the first 6 patients.
colnames(prad_res) # columns present in the table

head(prad_res$sample_type) # first 6 types of tissue.
class(prad_res$sample_type)
prad_res$sample_type <- as.factor(prad_res$sample_type)
summary(prad_res$sample_type) # summary of distinct tissues types present in this study

##for simplicity, we ignore the small class of metastasis, therefore, we redo the query
query_TCGA = GDCquery(
  project = "TCGA-PRAD",
  data.category = "Transcriptome Profiling", # parameter enforced by GDCquery
  experimental.strategy = "RNA-Seq",
  workflow.type = "HTSeq - Counts",
  sample.type = c("Primary Tumor", "Solid Tissue Normal"))

##Next, we need to download the files from the query
GDCdownload(query = query_TCGA)

tcga_data = GDCprepare(query_TCGA)

dim(tcga_data)
colnames(colData(tcga_data))
##Note that both clinical and expression data are present in this object
table(tcga_data@colData$vital_status)
table(tcga_data@colData$tumor_state)
table(tcga_data@colData$definition)
table(tcga_data@colData$tissue_or_organ_of_origin)
table(tcga_data@colData$primary_gleason_grade)
table(tcga_data@colData$psecondary_gleason_grade)
#table(tcga_data@colData$gender)
table(tcga_data@colData$race)


dim(assay(tcga_data))     # gene expression matrices
head(assay(tcga_data)[,1:10]) # expression of first 6 genes and first 10 samples
head(rowData(tcga_data))     # ensembl id and gene id of the first 6 genes.
# Save the data as a file, if you need it later, you can just load this file
# instead of having to run the whole pipeline again
saveRDS(object = tcga_data,
        file = "tcga_data.RDS",
        compress = FALSE)

#----------the data can be loaded and begin from here--------
tcga_data = readRDS(file = "tcga_data.RDS")

#---------RNASeq Normalization--------
limma_pipeline = function(
  tcga_data,
  condition_variable,
  reference_group=NULL){
  
  design_factor = colData(tcga_data)[, condition_variable, drop=T]
  
  group = factor(design_factor)
  if(!is.null(reference_group)){group = relevel(group, ref=reference_group)}
  
  design = model.matrix(~ group)
  
  dge = DGEList(counts=assay(tcga_data),
                samples=colData(tcga_data),
                genes=as.data.frame(rowData(tcga_data)))
  
  # filtering
  keep = filterByExpr(dge,design)
  dge = dge[keep,,keep.lib.sizes=FALSE]
  rm(keep)
  
  # Normalization (TMM followed by voom)
  dge = calcNormFactors(dge)
  v = voom(dge, design, plot=TRUE)
  
  # Fit model to data given design
  fit = lmFit(v, design)
  fit = eBayes(fit)
  
  # Show top genes
  topGenes = topTable(fit, coef=ncol(design), number=100, sort.by="p")
  
  return(
    list(
      voomObj=v, # normalized data
      fit=fit, # fitted model and statistics
      topGenes=topGenes # the 100 most differentially expressed genes
    )
  )
}

limma_res = limma_pipeline(
  tcga_data=tcga_data,
  condition_variable="definition",
  reference_group="Solid Tissue Normal"
)

#race_limma_res = limma_pipeline(
 # tcga_data=tcga_data,
  #condition_variable="race",
  #reference_group="white"
#)

# Save the data as a file, if you need it later, you can just load this file
# instead of having to run the whole pipeline again
saveRDS(object = limma_res,
        file = "limma_res.RDS",
        compress = FALSE)

#----------the data can be loaded and begin from here--------
limma_res = readRDS(file = "limma_res.RDS")

#----------Visualization------------------------------------
plot_PCA = function(voomObj, condition_variable){
  group = factor(voomObj$targets[, condition_variable])
  pca = prcomp(t(voomObj$E))
  # Take PC1 and PC2 for the plot
  plot(pca$x[,1:2],col=group, pch=19)
  # include a legend for points
  legend("bottomleft", inset=.01, levels(group), pch=19, col=1:length(levels(group)))
  return(pca)
}

res_pca = plot_PCA(limma_res$voomObj, "definition")

#---------Survival analysis (Simple)---------------------------
#Question: Does race influence survival in prostate cancer patients?

# extract clinical data
clinical = tcga_data@colData

dim(clinical)

# we are only interested in the "Primary solid Tumor" cases for survival
clin_df = clinical[clinical$definition == "Primary solid Tumor",
                   c("patient",
                     "vital_status", #whether the patient is alive or dead
                     "days_to_death", #the number of days passed from initial diagnosis to the death
                     "days_to_last_follow_up", #the number of days passed from initial diagnosis to last visit
                     "race")]

# create a new boolean variable that has TRUE for dead patients
# and FALSE for live patients
clin_df$deceased = clin_df$vital_status == "Dead"

# create an "overall survival" variable that is equal to days_to_death
# for dead patients, and to days_to_last_follow_up for patients who
# are still alive
clin_df$overall_survival = ifelse(clin_df$deceased,
                                  clin_df$days_to_death,
                                  clin_df$days_to_last_follow_up)

# show first 6 samples
head(clin_df)
table(clin_df$race)

#Let's see if different races have had different prognosis
Surv(clin_df$overall_survival, clin_df$deceased)

Surv(clin_df$overall_survival, clin_df$deceased) ~ clin_df$race
# fit a survival model
fit = survfit(Surv(overall_survival, deceased) ~ race, data=clin_df)

print(fit)

# we produce a Kaplan Meier plot
ggsurvplot(fit, data=clin_df, pval = T)

ggsurvplot(fit, data=clin_df, pval=T, risk.table=T, risk.table.col="strata")

#---------Survival analysis (gene expression and survival)-----------
#Question: does gene expression of gene XYZ affect survival in prostate cancer patients?

#-----Classification---training and validation----
# Transpose and make it into a matrix object
d_mat = as.matrix(t(limma_res$voomObj$E))

# As before, we want this to be a factor
d_resp = as.factor(limma_res$voomObj$targets$definition)

# Divide data into training and testing set

# Set (random-number-generator) seed so that results are consistent between runs
set.seed(42)
train_ids = createDataPartition(d_resp, p=0.75, list=FALSE)

x_train = d_mat[train_ids, ]
x_test  = d_mat[-train_ids, ]

y_train = d_resp[train_ids]
y_test  = d_resp[-train_ids]

# Train model on training dataset using cross-validation
res = cv.glmnet(
  x = x_train,
  y = y_train,
  alpha = 0.5,
  family = "binomial"
)


# Test/Make prediction on test dataset
y_pred = predict(res, newx=x_test, type="class", s="lambda.min")

confusion_matrix = table(y_pred, y_test)

# Evaluation statistics
print(confusion_matrix)

print(paste0("Sensitivity: ",sensitivity(confusion_matrix)))

print(paste0("Specificity: ",specificity(confusion_matrix)))

print(paste0("Precision: ",precision(confusion_matrix)))

# Getting genes that contribute for the prediction
res_coef = coef(res, s="lambda.min") # the "coef" function returns a sparse matrix
dim(res_coef)

head(res_coef) # in a sparse matrix the "." represents the value of zero

# get coefficients with non-zero values
res_coef = res_coef[res_coef[,1] != 0,]
# note how performing this operation changed the type of the variable
head(res_coef)

# remove first coefficient as this is the intercept, a variable of the model itself
res_coef = res_coef[-1]

relevant_genes = names(res_coef) # get names of the (non-zero) variables.
length(relevant_genes) # number of selected genes

head(relevant_genes) # few select genes
head(limma_res$voomObj$genes)
relevant_gene_names = limma_res$voomObj$genes[relevant_genes,"external_gene_name"]

head(relevant_gene_names) # few select genes (with readable names now)

#check the common genes between limma and Elastic Net results
print(intersect(limma_res$topGenes$ensembl_gene_id, relevant_genes))
#only two XD

##draw hierarchical clusterin
# define the color palette for the plot
hmcol = colorRampPalette(rev(brewer.pal(9, "RdBu")))(256)

# perform complete linkage clustering
clust = function(x) hclust(x, method="complete")
# use the inverse of correlation as distance.
dist = function(x) as.dist((1-cor(t(x)))/2)

# Show green color for genes that also show up in DE analysis
colorLimmaGenes = ifelse(
  # Given a vector of boolean values
  (relevant_genes %in% limma_res$topGenes$ensembl_gene_id),
  "green", # if true, return green for that value
  "white" # if false, return white for that value
)

# As you've seen a good looking heatmap involves a lot of parameters
gene_heatmap = heatmap.2(
  t(d_mat[,relevant_genes]),
  scale="row",          # scale the values for each gene (row)
  density.info="none",  # turns off density plot inside color legend
  trace="none",         # turns off trace lines inside the heat map
  col=hmcol,            # define the color map
  labRow=relevant_gene_names, # use gene names instead of ensembl annotation
  RowSideColors=colorLimmaGenes,
  labCol=FALSE,         # Not showing column labels
  ColSideColors=as.character(as.numeric(d_resp)), # Show colors for each response class
  dendrogram="both",    # Show dendrograms for both axis
  hclust = clust,       # Define hierarchical clustering method
  distfun = dist,       # Using correlation coefficient for distance function
  cexRow=.6,            # Resize row labels
  margins=c(1,5)        # Define margin spaces
)


#----Gene expression and survival
# let's extract the table of differential expression we got earlier
expr_df = limma_res$topGenes

# print the first row, to see the gene name, the logFC value and the p-value
print(expr_df[1, ])

# get the ensembl gene id of the first row
gene_id = expr_df[1, "ensembl_gene_id"]

# also get the common gene name of the first row
gene_name = expr_df[1, "external_gene_name"]

# we now have selected a gene.
# visualize the gene expression distribution on the diseased samples (in black)
# versus the healthy samples (in red)

expr_diseased = d_mat[rownames(clin_df), gene_id]
expr_healthy = d_mat[setdiff(rownames(d_mat), rownames(clin_df)), gene_id]

boxplot(expr_diseased, expr_healthy,
        names=c("Diseased", "Healthy"), main="Distribution of gene expression")        

# get the expression values for the selected gene
clin_df$gene_value = d_mat[rownames(clin_df), gene_id]


# find the median value of the gene and print it
median_value = median(clin_df$gene_value)
print(median_value)

# divide patients in two groups, up and down regulated.
# if the patient expression is greater or equal to them median we put it
# among the "up-regulated", otherwise among the "down-regulated"
clin_df$gene = ifelse(clin_df$gene_value >= median_value, "UP", "DOWN")


# create a new boolean variable that has TRUE for dead patients
# and FALSE for live patients
clin_df$deceased = clin_df$vital_status == "Dead"

# create an "overall survival" variable that is equal to days_to_death
# for dead patients, and to days_to_last_follow_up for patients who
# are still alive
clin_df$overall_survival = ifelse(clin_df$deceased,
                                  clin_df$days_to_death,
                                  clin_df$days_to_last_follow_up)

# we can fit a survival model, like we did in the previous section
fit = survfit(Surv(overall_survival, deceased) ~ gene, data=clin_df)

# we can extract the survival p-value and print it
pval = surv_pvalue(fit, data=clin_df)$pval
print(pval)

# and finally, we produce a Kaplan-Meier plot
ggsurvplot(fit, data=clin_df, pval=T, risk.table=T, title=paste(gene_name))
###those pval more than 0.05, the gene does not appear to make a differnce for prognosis


##################################
table(clin_df$paper_Reviewed_Gleason_category)
table(clin_df$gene_value)
colnames(clin_df)

sfit = survfit(Surv(overall_survival, paper_Reviewed_Gleason_category == ">=8") ~ gene, data=clin_df)
print(sfit)
ggsurvplot(sfit, data=clin_df, pval=T, risk.table=T, title="paper_Reviewed_Gleason_category")
sfit <- coxph(Surv(overall_survival, paper_Reviewed_Gleason == "4+5") ~ gene, data=clin_df)
sfit
ggsurvplot(sfit, data=clin_df, pval=T, risk.table=T, title=paste(gene_name))

cor(clin_df$paper_Reviewed_Gleason_category,clin_df$gene_value, method = "pearson")
