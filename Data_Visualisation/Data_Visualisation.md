# Introductory R Workshop
Rick Tearle, Steve Pederson, Lloyd Low  
May 1 2017  

## Packages
Getting started

Clear the environment <br>
Load the following packages


```r
library(knitr)
library(dplyr)
library(stringr)
library(reshape2)
library(magrittr)
```




## The Data

We will use 2 built-in datasets for data visualisation 

A set of samples with measurements of several traits

 - `iris` contains petal and sepal measurements for irises 

A time series

 - `ChickWeight` contains weights for chicks on different diets

## First Data Set

Load and configure the dataset `iris`


```r
data(iris)

iris %<>% as_data_frame() # converts it to a newer data frame format

iris
```

## Plotting packages

`R` has plotting functions in the base package `graphics`


```r
?plot()
?boxplot()
?hist()
```

And other plotting packages have been written

We will focus on the function `ggplot()`

## The package `ggplot2`

`ggplot2` is flexible and powerful

Has a unique approach and syntax 

Consists of layers of plotting information

The main function in `ggplot2` is `ggplot()`


```r
library(ggplot2)
```

## The function `ggplot()`
4 basic steps to plotting with `ggplot()`:

 - Choose the dataset to use <br>
 - Choose the data to plot using `aes()` = aesthetics <br>
 - Choose the way to display the data with a geometry <br>
 - Then make it pretty!

## Dataset

The first value is the dataset to use


```r
ggplot(data = iris)
```
is the same as 


```r
ggplot(iris)
```

We have a blank canvas ie the plot area

## Aesthetics

`aes()` defines what is plotted, colour and shape etc


```r
ggplot(iris, aes(x = Species, y = Petal.Length))
```

Now we have a grid and axes

## Set the Geometry
Note that we have chosen to plot <br>
 - a numeric variable (`Petal.Length`) vs <br>
 - a categorical variable (`Species`)

This will constrain what geometries we can use

Add a geometry using various `geom_...()` functions


```r
ggplot(iris, aes(x = Species, y = Petal.Length)) +    # note the +
    geom_point()
```

## Modify the Geometry

Colour the points by species


```r
ggplot(iris, aes(x = Species, y = Petal.Length, colour = Species)) +
    geom_point()
```
We can modify the points in many ways eg

 - `size()` <br>
 - `shape()` <br>
 - `alpha()` - transparency <br>
 - etc
    
## Prettify the Plot

Add a main title <br>
Clean up the y axis title <br>
Remove the figure legend <br>


```r
ggplot(iris, aes(x = Species, y = Petal.Length, colour = Species)) +
    geom_point() +
    labs(title = "Iris Petal Length by Species", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5), 
          legend.position = "none")
```
There are many options under `theme()`

## Spread the Points

The points are tightly clustered on the species line

We can stagger them using `geom_jitter()`


```r
ggplot(iris, aes(x = Species, y = Petal.Length, colour = Species)) +
    geom_jitter() +
    labs(title = "Iris Petal Length by Species", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5), 
          legend.position = "none")
```

## Abstract Away the Points

Use `geom_boxplot()` to display the data


```r
ggplot(iris, aes(x = Species, y = Petal.Length, colour = Species)) +
    geom_boxplot() +
    labs(title = "Iris Petal Length by Species", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5), 
          legend.position = "none")
```

## Combine Geometries

We can plot more than one geometry onto the same plot <br>
  - `geom_boxplot()` <br>
  - `geom_jitter()`


```r
ggplot(iris, aes(x = Species, y = Petal.Length, colour = Species)) +
    geom_boxplot(colour = "darkgrey", alpha = 0) +
    geom_jitter(alpha = 0.5) +
    labs(title = "Iris Petal Length by Species", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5), 
          legend.position = "none")
```

## Geometries Can Contain Aesthetics
Embed `aes()` within each `geom()`


```r
ggplot(iris) +
    geom_boxplot(aes(x = Species, y = Petal.Length), 
                 colour = "darkblue", alpha = 0) +
    geom_boxplot(aes(x = Species, y = Petal.Width), 
                 colour = "darkgreen", alpha = 0) +
    geom_boxplot(aes(x = Species, y = Sepal.Width), 
                 colour = "purple", alpha = 0) +
    geom_boxplot(aes(x = Species, y = Sepal.Length), 
                 colour = "darkred", alpha = 0) +
    labs(title = "Measurements by Iris Species", y = "Size") +
    theme(plot.title = element_text(hjust = 0.5))
```

## Different Data from the Same Dataset
We will now plot <br>
- a numeric variable (`Petal.Length`) vs <br>
- another numeric variable (`Species`)

Again this will constrain what geometries we can use

Start with `geom_point()`


```r
ggplot(data = iris, aes(x = Sepal.Length, y = Petal.Length)) +
    geom_point()
```

## Colour and Format


```r
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, 
                 colour = Species)) +
    geom_point() +
    labs(title = "Iris Petal Length vs Sepal Length", 
         x = "Sepal Length", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5, face = "bold"))
```

## Add Line of Best Fit
Use `geom_smooth()`<br>
Add line for each species



```r
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, 
                        colour = Species)) +
    geom_point() +
    geom_smooth(method = "lm") +
    labs(title = "Iris Petal Length vs Sepal Length", 
         x = "Sepal Length", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"))
```

## Correlation Between Variables
Correlation between sepal and petal length



```r
library(corrplot)

cor(iris$Sepal.Length, iris$Petal.Length, 
    use = "pairwise.complete.obs")
```
<br>Correlation between all 4 numerical variables


```r
iris
correlations <- cor(iris %>% select(-Species), 
                    use = "pairwise.complete.obs")
correlations
```

## Plot Correlations


```r
corrplot(correlations, method = "shade", shade.col = NA, 
         tl.col = "black", tl.srt = 90, order = "AOE", 
         mar=c(2,0,2,0))
```

<br> With values


```r
corrplot(correlations, method = "shade", shade.col = NA, 
         tl.col = "black", tl.srt = 90, order = "AOE", 
         mar=c(2,0,2,0), addCoef.col = "darkgrey")
```

## Second Data Set
Load and configure the dataset `ChickWeight` <br>
And fix column names!



```r
data(ChickWeight)

ChickWeight %<>% as_data_frame() # newer data frame format
ChickWeight

colnames(ChickWeight) <- c("Weight", "Day", "Chick", "Diet") 
ChickWeight
```

## Calculate Number of Chicks by Diet


```r
DietCount <- ChickWeight %>%    # take starting df
    select(Diet, Chick) %>%     # keep 2 of the columns
    unique %>%                  # keep 1 copy of each combination
    count(Diet) %>%             # count number of chicks by diet
    rename(Count = n)           # rename the count column
DietCount
```

## Plot Number of Chicks by Diet
Use `geom_col()`


```r
ggplot(DietCount, aes(x = Diet, y = Count, fill = Diet)) + 
    geom_col() +
    labs(title = "Number of chicks on each diet") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"), 
          legend.position = "none")
```

And again with diets as integers - this is cheating!


```r
ggplot(DietCount, aes(x = Diet, y = Count, fill = as.integer(Diet))) +
    geom_col() +
    labs(title = "Number of chicks on each diet") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"), 
          legend.position = "none")
```

## Histogram of Chick Weights by Day 
Use `geom_histogram()` to get the distributions <br>
Use `facet_wrap()` to plot each day in its own plot



```r
ggplot(ChickWeight, aes(x = Weight)) +
    geom_histogram(fill = "darkblue") +
    labs(title = "Distribution of Chick Weight by Day", y = "Count") +
    facet_wrap(~ Day, scales = "free") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"), 
          axis.text.x = element_text(angle = 45, hjust = 1), 
          legend.position = "none")
```

## Plot Individual Weight vs Day
Back to `geom_point()` to create a scatter plot


```r
ggplot(ChickWeight, aes(x = Day, y = Weight, colour = Chick)) +
    geom_point() +
        labs(title = "Chick Weights by Day") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"), 
          legend.position = "none")
```

## Connect the Dots
Use to `geom_line()` instead of `geom_point()`


```r
ggplot(ChickWeight, aes(x = Day, y = Weight, colour = Chick)) +
    geom_line() +
    labs(title = "Chick Weights by Day") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"), 
          axis.text.x = element_text(angle = 45, hjust = 1), 
          legend.position = "none")
```

## Colour by Diet Instead of by Chick
Group by chick so the data from day to day remains connected
But colour by diet


```r
ggplot(ChickWeight, 
       aes(x = Day, y = Weight, group = Chick, colour = Diet)) +
    geom_line() +
    labs(title = "Chick Weights by Day") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"))
```

## Summary Statistics for Weight by Diet
Want mean, SD and 95% CI to compare the diets


```r
WeightSummary <- ChickWeight %>%
    group_by(Diet, Day) %>%
    summarise(N = length(Weight) %>% as.integer(), 
              Mean = mean(Weight) %>% round(digits = 1), 
              SD = sd(Weight) %>% round(digits = 1)) %>%
    mutate(MeanSD = paste(Mean, SD, sep = " ± ")) %>%
    mutate(CI95 = (qt(0.975,df = N-1)*SD/sqrt(N)) %>% 
               round(digits = 1)) %>%
    mutate(MeanCI95 = paste(Mean, CI95, sep = " ± "))
WeightSummary
```

## Plot Means of Weights by Diet


```r
ggplot(WeightSummary, aes(x = Day, y = Mean, group = Diet, 
                          colour = Diet)) +
    geom_line() +
    labs(title = "Chick Weights over Day") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"), 
          axis.text.x = element_text(angle = 45, hjust = 1))
```
## Reorder the Diets and Plot Again
The diets are not in order of increasing effectiveness <br>
Reorder them


```r
WeightSummary$Diet
WeightSummary$Diet <- ordered(WeightSummary$Diet, 
                              levels = c("1", "2", "4", "3"))
WeightSummary$Diet

ggplot(WeightSummary, aes(x = Day, y = Mean, group = Diet, 
                          colour = Diet)) +
    geom_line() +
    labs(title = "Chick Weights over Day") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"), 
          axis.text.x = element_text(angle = 45, hjust = 1))
```
## Plot Summary Statistics for Each Diet
Use `geom_ribbon()`


```r
ggplot(WeightSummary, aes(x = Day, y = Mean, colour = Diet)) +
    geom_ribbon(aes(ymin = Mean-CI95, ymax = Mean+CI95, 
                    color = Diet), 
                alpha = 0) +
    labs(title = "Chick Weights over Time") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"), 
    axis.text.x = element_text(angle = 45, hjust = 1))
```

## Look at the Numbers!
Go back to the data <br>
Is your visual interpretation consistent?

Convert the data from long to wide format


```r
WeightSummary2 <- WeightSummary %>% 
    dcast(Diet ~ Day, value.var = "MeanCI95")

WeightSummary2 %>% dim()
WeightSummary2[,c(1,13)]
```

## Thank You



<div class="footer" style="text-align:center;width:25%">
[Home](https://github.com/UofABioinformaticsHub/Roseworthy-R-20170501/)
</div>
