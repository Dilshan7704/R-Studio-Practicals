
# smalle intraduction of the  mtcars data set
if(FALSE) {
  "  
      statistic Analysis on Data Set
      mean-average of the value
      median-Middle value When Sorted
      mode-Most frequently occurring vale
  
  
  The mtcars dataset in R is a built-in dataset that contains information about 32 different car models from the 1974 Motor Trend magazine. Here's a brief summary of the dataset:

  Variables:
  mpg: Miles per gallon (fuel efficiency)
  cyl: Number of cylinders
  disp: Displacement (engine size in cubic inches)
  hp: Horsepower
  drat: Rear axle ratio
  wt: Weight (in 1000 lbs)
  qsec: 1/4 mile time (in seconds)
  vs: Engine shape (0 = V-shaped, 1 = straight)
  am: Transmission type (0 = automatic, 1 = manual)
  gear: Number of forward gears
  carb: Number of carburetors

  Summary Statistics:
  mpg: Ranges from 10.4 to 33.9, with a mean of ~20.09.
  cyl: Most cars have 4, 6, or 8 cylinders.
  hp: Ranges from 52 to 335, with a mean of ~146.69.
  wt: Ranges from 1.513 to 5.424, with a mean of ~3.22.
  am: 13 cars have manual transmission, and 19 have automatic.

  Key Insights:
  Cars with more cylinders tend to have lower fuel efficiency (mpg).
  Heavier cars (higher wt) generally have lower mpg.
  Manual transmission cars (am = 1) tend to have slightly higher mpg compared to automatic transmission cars.

  This dataset is often used for exploring relationships between variables, such as how engine size (disp) or weight (wt) affects fuel efficiency (mpg)."
}

data("mtcars")
#this is the inbuilt data set in r studio

#using this code We can get Summery of this mt car data set
summary(mtcars)

#average of the column (mean)
mean(mtcars$mpg)

#median of the  $hp column
median(mtcars$hp)

#standard deviation 
sd(mtcars$wt)

#variance  of disp column
var(mtcars$disp)

#Minimum and Maximum 
min(mtcars$mpg)
max(mtcars$mpg)
 
#get table of a  column in mtcars dataset
table(mtcars$mpg)

#addin Statistical summaries of data frame
mtcars$z_mpg <- (mtcars$mpg -mean(mtcars$mpg)) / sd(mtcars$mpg)

# we use head function  to  view updated dat  frame
head(mtcars)

#custom summary statistics

#custom function to calculate range
range_summary <- function(x){
  return(max(x)-min(x))
}

# apply in to column new function 
range_summary(mtcars$hp)


#group -wise Summaries

#Mean mpg by cylinder group

aggregate(mpg ~ vs ,data = mtcars ,FUN = max)
