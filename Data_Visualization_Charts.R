#installing request  libraries
install.packages("ggplot2")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("car")

#loding libraries
library(ggplot2)
library(tidyverse)
library(dplyr)
library(car)

data("mtcars")
summary(mtcars)

# Histogram fro mpg in mtcars dataset
hist(mtcars$mpg,
     main = "Hisrogram of Miles pre Galllon (mpg)",
     xlab="Mile pre Gallon",
     ylab = "number of cars (Frequency)",
     col = "lightgreen",
     border = "black"
  
)

#boxplot

#Boxplot for mpg grouped by cylinder types

boxplot(mpg ~ cyl ,data = mtcars,
        main="bloxplot of mpg by cylinder type",
        xlab = "number of cylender",
        ylab = "Miles pre Gallon",
        col= c("lightgreen","orange","blue")
        )

#scatter plot

#scattter plot  of mpg VS hp

plot(mtcars$mpg , mtcars$hp,
     main = "Scatter plot of mpg Vs hp",
     xlab = "Miles pre Galoon (mpg)",
     ylab = "Horsepower (hp)",
     col="blue",
     pch=20
     )

#barplot

barplot(table(mtcars$cyl),
  main="Bar plot of cylinder counts",
  xlab="number of cylinders",
  ylab = "number of cars",
  col = "brown"
)

#line plot
plot(mtcars$mpg ,type = "o",
     main = "line plot of miles pre gallon",
     xlab = "index",
     ylab = "miles pre gallon",
     col="red"
  
)

plot(mtcars$gear ,type = "o",
     main = "bar plot of gear count",
     ylab="number of gears",
     xlab = "number of cars",
      col="black"
     )
#density plot
plot(density(mtcars$mpg),
     main = "Density plot of miles pre galoon",
     xlab = "miles Pre gallon",
     col="darkgreen",
     lwd=2
     )

#heat map

heatmap(cor(mtcars),
        main = "heat map of corelation matrix",
        col=colorRampPalette(c("red","yellow","green"))(20))
