Select a dataset from the UCI dataset on regression (exclude categorical ovaribales for now).
First inspect the predictors for multicollinearity and select a subset which is linearly independent.
Next find solution of linear regression model using normal equations and sequential gradient
descent (Widrow Hoff ). Next fit a LASSO and Ridge model using scipy.optimize library. Plot the
solution path for different values of α using "lassopath" and "ridgepath" libraries of scipy. Compare
the three models in terms of the solution obtained, prediction accuracy etc. Interpret the Lasso and
Ridge solutions in terms of selection and shrinkage. Upload two files - one code and one pdf with
the brief report.
