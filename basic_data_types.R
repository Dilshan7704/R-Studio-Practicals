#numarical data
num_var <-42.5

#integer data
int_var <-42L

#character data
char_var <-"helow, R"

#logical data
log_var <-TRUE

#complex data
com_var <- 2+3i

#check data types
class(int_var)
class(num_var)
class(char_var)
class(log_var)
class(com_var)

#check types
typeof(int_var)
typeof(num_var)
typeof(char_var)
typeof(log_var)
typeof(com_var)


#composite Data types in R

#vector
vec <- c(1,2,3,4,5)

#list
lst <- list(name="Dilshan",Uni="NSBM",is_pass=TRUE)

#matrix
mat<- matrix(1:9 ,nrow=3 , ncol=3)
#Data Frame
df <- data.frame(Name=c("Dilshan","Wijayarathne"),Age=c(21,21),passed=c(TRUE,FALSE))

#factor
fac <-factor(c("low","medium","high","low"))


#print
print(vec)
print(lst)
print(mat)
print(df)
print(fac)


#working With Vectors

#numeric vectors
numberic_vectors <-c(1,2,3,4,5,6,7,8,9,10)

#character vectors
char_vectors <- c("Dilashan","Nethmin","Wijayarathne")

#logical vectors
logical_vectors <- c(1:5 >3)

#print results in Vector

numberic_vectors
char_vectors
logical_vectors


#Exploring List

#create list
list <- list(number=c(1,2,3),greeting="hellow" ,passed =TRUE)

# Access List  Elements
list[[2]]
list[1]
list[3]
#access number list 2nd element
list$number[2]


