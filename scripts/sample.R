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




number<-37
if(number>100){ # if condition is true
  print("greater than 100") # perform this function
}else{# if false
  print("less than 100") # perform this function
}
print("finished checking")

# comparison operators:
# greater than >
# less than <
# equal to ==
# not equal to !=
# greater than/equal to >=
# less than/equal to  <=

number<-150
if(number>100){ # if condition is true
  print("greater than 100")
}
print("finished checking")

# more than one test
number<--3
if(number>0){
  print(1)
}else if(number<0){
  print(-1)
}else{print(0)}


# combine tests
number1<--15
number2<--40

if(number1>=0 & number2>=0){
  print("both numbers are positive")
}else{
  print("at least one is negative")
}

# 'or'

if (number1>=0 | number2>=0){
  print("at least one number is positive")
}else{
  print("at least one is negative")
}



##############
# creating and using functions

fahr_to_kelvin<-function(temp){
  kelvin<-((temp-32)*(5/9))+273.15
  return(kelvin)
}
fahr_to_kelvin(32) # freezing point
fahr_to_kelvin(212)


kelvin_to_celsius<-function(temp){
  celsius<-(temp-273.15)
  return(celsius)
}

kelvin_to_celsius(0)

# variable scope

# mixing and matching

fahr_to_celsius<-function(temp){
  temp_k<-fahr_to_kelvin(temp)
  temp_c<-kelvin_to_celsius(temp_k)
  return(temp_c)
}

fahr_to_celsius(32)


# nesting
kelvin_to_celsius(fahr_to_kelvin(0))


###############

# making reproducible graphics

#############

# read in some data
gap<-read.csv("gapminder-FiveYearData.csv")
tbl_df(gap)
str(gap)

plot(x=gap$gdpPercap,y=gap$lifeExp)

#### ggplot image
ggplot(gap,aes(gdpPercap,lifeExp))+
  geom_point()+
  theme_bw()

ggplot(gap,aes(gdpPercap,lifeExp,color=continent))+
  geom_point()+
  xlab("GDP/capita")+
  ylab("Life Expectancy")+
  theme_bw()

head(gap)

ggplot(gap,aes(year,lifeExp,by=country))+
  geom_line(aes(color=continent))+
  theme_bw()+
  geom_point(color="blue")


ggplot(gap,aes(gdpPercap,lifeExp))+
  scale_x_log10()+
  geom_point(alpha=0.5)+
  theme_bw()+
  geom_smooth(method = "lm",size=2)+
  xlab("GDP/capita ($)")+
  ylab("Average life expectancy")+
ggtitle("GDP on Life Expectancy (years)")

ggsave(file="results/life_exp.pdf")

# faceting
ggplot(gap,aes(gdpPercap,lifeExp, color=continent))+
  geom_point()+
  scale_x_log10()+
  geom_smooth(method = "lm")+
  facet_wrap(~year)
