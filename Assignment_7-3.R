library(ggplot2)
library(xtable) 
library(gridExtra)
library(ggplot2) 
library(ggthemes) 
library(tufte) 
head(mtcars) 
mtcars$cyl <- factor(mtcars$cyl) 
mtcars$labels <- row.names(mtcars) 

#Boxplot
boxplot(mtcars$mpg)
boxplot(mtcars$mpg, horizontal = TRUE)

boxplot(mtcars$mpg ~ mtcars$cyl) 
mpg_split <- split(mtcars$mpg, mtcars$cyl) 
mpg_split
mpg_4 <- mpg_split$'4'
mpg_6 <- mpg_split$'6'
mpg_8 <- mpg_split$'8'
boxplot(mpg_4, mpg_6, mpg_8,col = c('red', 'blue', 'yellow')) 
p <- ggplot(data = mtcars, aes(x = cyl, y = mpg, fill = cyl))
p <- p + geom_boxplot() +ggtitle("Car Milage Data") +labs(x = "Number of Cylinders", y = "Miles Per Gallon") +scale_fill_discrete(name = "Cylinders")
p

#Whisker type boxplot
p4 <- ggplot(mtcars, aes(factor(cyl), mpg))
p4 + theme_tufte(ticks=FALSE) +geom_tufteboxplot(median.type = "line", whisker.type = 'line', hoffset = 0, width = 3)
