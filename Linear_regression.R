#the baseline model
library(ggplot2)

#import data set in to R Studio
age <- read.csv("C:/Users/DELL/Documents/Data Programing With R/longevity (2).csv")
#view the data  set
view(age)
min(age$AgeAtDeath,na.rm = TRUE)
max(age$AgeAtDeath,na.rm = TRUE)

# Create a density plot of AgeofDeath, filled by Smokes, and faceted by Smokes
ggplot(age ,aes(x=AgeAtDeath,fill =factor(Smokes)))+
  geom_density()+
  facet_grid(Smokes ~ .) #The ~ . indicates that the faceting is done vertically (one plot per row).

if(FALSE){
  "This line initializes a ggplot object:

age: The dataset being used for the plot.

aes(x = AgeAtDeath, fill = factor(Smokes)): Specifies the aesthetics of the plot:

x = AgeAtDeath: The AgeAtDeath column is mapped to the x-axis.

fill = factor(Smokes): The Smokes column is used to fill the density plots by color. The factor() function is used to convert Smokes into a categorical variable (if it isn't already).

"
}


# Mean Squared Error (MSE)
if(FALSE){
  " 1. how to get MSE value of dataset?
  
  ANSWER: 
  
  Formula-
  MSE = (Σ(yi − y^i)^2)/ n
  
  n	=	number of data points
  yi	=	observed values
  y^i	=	predicted values
  
  
  ex:
  prediction value=73
  
  AgeAtDeath
  70
  75
  80
  
 
  Calculate the squared differences:
   70= (70-73)^2=(-3)^2 =9
   75= (75-73)^2=(2)^2 =4
   80= (80-73)^2=(7)^2 =49
   
   n=3(70,75,80)
   y^i=73
   
   MSE = (Σ(yi − y^i)^2)/ n
   
   MSE=(9+4+49)/3= 62/3=20.67
  
  The with() function makes the code cleaner by avoiding repeated use of age$.
  
  "
}

if(FALSE){
  
  "
  2.Explain with() funcion 
  
      Create a sample data frame
      
      students <- data.frame(
      name = c(Alice, Bob, Charlie),//use "" you write code every vslues
      age = c(20, 22, 21),
      grade = c(85, 90, 88)
      )
      
      #Calculate the Average Age
      
      Without with():
        mean(students$age)
        
      With with():
        with(students, mean(age))
        
      # Filter Rows Based on a Condition
        
        Without with():subset(students, students$grade > 85)
        With with():subset(students, with(students, grade > 85))
        
      
      
  
  "
}



summary(age$AgeAtDeath)

guess <- 73 
with(age ,mean((AgeAtDeath-guess)^2))
# accuracy of a model's predictions. It quantifies the average squared difference between the predicted values and the actual values.

guess.accuracy <- data.frame()

if(FALSE){
  "
    The data.frame() function in R is used to create a data frame, which is a table-like structure where:

    Columns represent variables.
    
    Rows represent observations.
    
    When you call data.frame() without any arguments, it creates an empty data frame with no rows or columns. 
  "
}
#this code is represent guess value equel to 63 to 83 in one by one
for (guess in seq(52,90,by =1)){
  prediction.error <-with(age,
                          mean((AgeAtDeath-guess)^2))
  
  guess.accuracy <- rbind(guess.accuracy,
                          data.frame(Guess =guess,
                                     Error= prediction.error))
}
if(FALSE){"
AgeAtDeath
72
75
80
78
65

For guess = 63:

Compute the squared differences:
(72−63)^2=81, (75−63)^2=144,(80−63)^2=289,(78−63)^2=225,(65−63)^2=4
  MSE=(81+144+289+225+4)5=144.6
  
  Repeat for guess = 64 to 83, storing each computed MSE in guess.accuracy.
  
  "}





#The x-axis will have values from 63 to 83 (our guess values).
#The y-axis will represent the error for each guess.
#The plot will show how the prediction error changes with different guesses.

ggplot(guess.accuracy,aes(x=Guess,y=Error))+
  geom_point()+
  geom_line()

if(FALSE){
  "
      Starts a for loop that iterates over a sequence of values from 63 to 83, incrementing by 1 (by = 1).
    
      For each iteration, the variable guess takes on a value from the sequence (e.g., 63, 64, 65, ..., 83).

      For each guess, this line calculates the Mean Squared Error (MSE):

      AgeAtDeath - guess: Computes the difference between the actual AgeAtDeath values and the current guess.
      
      (AgeAtDeath - guess)^2: Squares the differences to ensure positive values and penalize larger errors.
      
      mean(...): Computes the average of the squared differences, which is the MSE.
      
      The with(age, ...) function allows you to refer to the AgeAtDeath column directly without repeatedly specifying the data frame name (age$AgeAtDeath).
  "
}



#Root Mean Squared Error (RMSE)

constant.guess<- with(age,mean(AgeAtDeath))
mean(age$AgeAtDeath,na.rm = TRUE)
constant.guess #72.723
#The constant guess is the mean of the AgeAtDeath values.

with(age, sqrt(mean((AgeAtDeath-constant.guess)^2)) )

if(FALSE){
   "
  1. how to sqrt in this code
  
    answer:
            Step 01:
              constant.guess=72.723
            
            AgeAtDeath=75, 72, 66, 74, 69
            
            Step 2: Calculate the RMSE
              
                1.Compute the differences
                 * 75−72.723=2.277
                 * 72−72.723=−0.723
                 * 66−72.723=−6.723
                 * 74−72.723=1.277
                 * 69−72.723=−3.723
                
               2. Square the differences:
               
                  * 2.277^2=5.185
                  * .............
                  * .............
                  
                
              3.Calculate the mean of the squared differences (MSE):
                  
                  *Add up the squared differences:5.185+0.523+45.199+1.631+13.861=66.399
                  
                  *n=number of data
                  
                  *Divide by the number of observations (5 in this case):66.399/5
                    =13.280
            
              4.Take the square root to get the RMSE:
                    
                    RMSE=(1/n)Σ(yi − constant guess)^2 to (i=1  to  n)
                    
                    yi = The actual AgeAtDeath values.
                    
                    n=The total number of observations.
          
          
  
    
  
  "
  
}


smoker.guess <- with (subset(age, Smokes == 1),
                      mean(AgeAtDeath)
                      )

#The subset() function filters the age dataset to include only rows where Smokes == 1.
smoker.guess 


no.smoker.guess <- with(subset(age,Smokes==0),
                        mean(AgeAtDeath)
                        )
no.smoker.guess

age <- transform(age ,
                 NewPrediction = ifelse(Smokes ==0,
                                        no.smoker.guess,
                                        smoker.guess 
                                        )
                 )
#The transform() function is used to modify the age dataset.

with(age, sqrt(mean((AgeAtDeath - NewPrediction)^2)))
