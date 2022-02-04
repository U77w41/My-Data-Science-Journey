# Assignment 6 Questions:

Using the provided movies.dat (contains movie id, title and genres) and the ratings.dat (contains user id, movie id and rating) data files do the following:


1. read in the data files into dataframes, provide appropriate column names while creating.

2. find the average rating per movie

3. find the number of unique movies

4. make a consolidated dataframe merging the movies and ratings dataframes (Hint: use merge() method of dataframe)

5. make a list of unique genres that are found in the data (Hint: use the genres column a

6. create new datanframe containing the movie id and the corresponding set of dummy columns (i.e. one column for each genre) derived from the genres column of the movies dataframe 

	(i) using get_dummies() vectorized string operation of dataframe

	(ii) w/o using the get_dummies() function

7. find the average movie rating grouped by user id and movie genre value "Action". That is, find the average rating given by each user to all the movies that have been rated by him and that has one of the genres as Action. 
(Hint: work on a merged dataframe having movie, id, user id, rating and genre dummy columns (as derived in q6).

8. create function to accomplish the same (as in q7) for all the genres with as much generalization as possible in the function 
(i.e. w/o hardcoding dataframe names and column names in the function definition).

9. save the data into a dataframe format with the user ids along the row and the genres along the columns, body of the data frame containing the average ratings. 
(Hint: if the averages for movie genre could be derived into Series objects then a dict of aligned Series could be used to build a dataframe)

10. using the dataframe derived in q9 find the average and standard deviation of the average ratings given by each user across the genres and sort the result in descending order.

11. find the number of movies with title starting with alphabet 'E' for the genre 'Action.

12. Can the approach used in q11 be generalised into a function and then used to compute the number of movies starting with title starting with 'E' for each of the other individual genres.

13. create a new dataframe from the merged dataframe from q6 by selecting those rows where the movie title starts with character 'E' and only the columns - title and the 18 individual genre column.
 (Hint: try to retrieve the column names to be selected using the columns attribute of the dataframe and then using list maninupation & concatenation techniques to make the selection. Then use the dataframe.loc option to specify the boolean indexing for the rows and the fancy indexing for the columns)

14. using the dataframe created in 13 find the total number of movies in each genre. (verify if the answer are same as obtained from q12)


NOTE: if the merged dataframes become slow to work on use sample method of dataframe to take a subset of data and work on the questions. Once you are condident of the results apply the code on the entire dataset using command line execution of python script.



