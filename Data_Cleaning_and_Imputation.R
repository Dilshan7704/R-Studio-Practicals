data <- airquality
str(data) 
sum(is.na(data))         #find the no.of missing  values
colSums(is.na(data))     #missing values for each column
dim(data)                # no. of rows and columns

data2 <- na.omit(data)  #ignore missing  values
dim(data2)
sum(is.na(data2))

#create a table 
df <- data.frame( 
  
  column1= c(100,200,300,NA),
  column2= c(100,200,300,NA),
  column3= c(100,300,300,NA)
  
  
)
dim(df)
summary(df)

#mean imputation fro column 1
df$column1[is.na(df$column1)] <- mean(df$column1,
                                      na.rm = TRUE)
df
#median imputation column 2
df$column2[is.na(df$column2)] <- median(df$column2,
                                        na.rm = TRUE)
df
# Mode imputation for column3
df$column3[is.na(df$column3)] <- as.numeric(names(which.max(table(df$column3))))
df
