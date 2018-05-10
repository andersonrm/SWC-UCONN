# SCW May 10 2018

# libraries
library(gapminder)
library(ggplot2)
library(dplyr)
library(ggfortify)

# data structures

# make a data frame

cats<-data.frame(coat=c("calico","black","tabby"),
                 weight=c("2.1","5.0","3.2"),
                 likes_string=c(1,0,1))
View(cats)

cats$weight+cats$coat
cats$coat

tbl_df(cats)
str(cats)

# change order of factors
cats$coat_reorder<-factor(x = cats$coat,
                          levels = c("tabby","calico","black"),
                          ordered=TRUE)
View(cats)
str(cats)
levels(cats$coat_reorder)

write.csv(cats,"cats.csv")

# exploring data frames
gap<-read.csv("gapminder-FiveYearData.csv")
View(gap)
tbl_df(gap)
head(gap)

# subsetting
x<-c(5.4,6.2,7.1,4.8,7.5)
names(x)<-c("a","b","c","d","e")
x
x[c(1,3)]

# slices
x[1:4]

# subsetting the gap data

head(gap["pop"])
head(gap[,1])
gap[3,]

gap[138,]

afganistan<-gap[1:12,]
afganistan$gdp<-afganistan$pop*afganistan$gdpPercap
View(afganistan)
write.csv(afganistan,"afganistan.gdp.csv")
print(afganistan)
