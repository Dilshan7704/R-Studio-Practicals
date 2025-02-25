#Data Frames

student <- data.frame(
  name=c("Alice","bob","charlin"),
  Age=c(23,24,25),
  Passed=c(TRUE,FALSE,TRUE)
)
print(student)

#Access a column 
student$name
student$Age
student$Passed

#Access a Specific element
student[1,2]
#Access a specific list Element
student$name[1]

#access multiple rows or column
student[1:3,c("name","Age")]  
#this code meaning is some range in name access related that age column


#Add a new column in the list

student$grade <- c("A","B","A")
student

#remove a column in the list
student$Passed <- NULL
student

#filter Specific row in the list
student_pass <- student[student$grade=="A",]
print(student_pass )
#you don't type  this " ' " this  one you cant get outputs

#view first few rows
head(student)

#view the structure of the data frame
str(student)

#get summery of list 
summary(student)

#get dimensions
dim(student)
#this meaning is size of list

student



