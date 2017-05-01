library(knitr)
library(dplyr)
library(stringr)
library(reshape2)
library(magrittr)

# Load and configure the dataset iris
data(iris)
iris %<>% as_data_frame() # converts it to a newer data frame format
iris

# Plotting Packages in Base Package graphics
?plot()
?boxplot()
?hist()

# Load Package ggplot2
library(ggplot2)

# Load Data in to ggplot
ggplot(iris)

# Add Aesthetics
ggplot(iris, aes(x = Species, y = Petal.Length))

# Add a Geometry
ggplot(iris, aes(x = Species, y = Petal.Length)) +  # note the +
    geom_point()

# Modify the Geometry
ggplot(iris, aes(x = Species, y = Petal.Length, colour = Species)) +
    geom_point()

# Prettify the Plot
ggplot(iris, aes(x = Species, y = Petal.Length, colour = Species)) +
    geom_point() +
    labs(title = "Iris Petal Length by Species", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5),
          legend.position = "none")

# Spread the Points
ggplot(iris, aes(x = Species, y = Petal.Length, colour = Species)) +
    geom_jitter() +
    labs(title = "Iris Petal Length by Species", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5),
          legend.position = "none")

# Abstract Away the Points
ggplot(iris, aes(x = Species, y = Petal.Length, colour = Species)) +
    geom_boxplot() +
    labs(title = "Iris Petal Length by Species", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5),
          legend.position = "none")

# Combine Geometries
ggplot(iris, aes(x = Species, y = Petal.Length, colour = Species)) +
    geom_boxplot(colour = "darkgrey", alpha = 0) +
    geom_jitter(alpha = 0.5) +
    labs(title = "Petal Length by Iris Species", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5),
          legend.position = "none")

# Geometries Can Contain Aesthetics
ggplot(iris) +
    geom_boxplot(aes(x = Species, y = Petal.Length), colour = "darkblue", alpha = 0) +
    geom_boxplot(aes(x = Species, y = Petal.Width), colour = "darkgreen", alpha = 0) +
    geom_boxplot(aes(x = Species, y = Sepal.Width), colour = "purple", alpha = 0) +
    geom_boxplot(aes(x = Species, y = Sepal.Length), colour = "darkred", alpha = 0) +
    labs(title = "Measurements by Iris Species", y = "Size") +
    theme(plot.title = element_text(hjust = 0.5))

# Different Data from the Same Dataset
ggplot(data = iris, aes(x = Sepal.Length, y = Petal.Length)) +
    geom_point()

# Colour and Format
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, colour = Species)) +
    geom_point() +
    labs(title = "Iris Petal Length vs Sepal Length",
         x = "Sepal Length", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5, face = "bold"))

# Add Line of Best Fit
ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, colour = Species)) +
    geom_point() +
    geom_smooth(method = "lm") +
    labs(title = "Iris Petal Length vs Sepal Length",
         x = "Sepal Length", y = "Petal Length") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"))

# Correlation Between Variables
library(corrplot)

cor(iris$Sepal.Length, iris$Petal.Length,
    use = "pairwise.complete.obs")

iris
correlations <- cor(iris %>% select(-Species),
                    use = "pairwise.complete.obs")
correlations

# Plot Correlations
corrplot(correlations, method = "shade", shade.col = NA,
         tl.col = "black", tl.srt = 90, order = "AOE",
         mar=c(2,0,2,0))

# With Values
corrplot(correlations, method = "shade", shade.col = NA,
         tl.col = "black", tl.srt = 90, order = "AOE",
         mar=c(2,0,2,0), addCoef.col = "darkgrey")

## Second Data Set
data(ChickWeight)

ChickWeight %<>% as_data_frame() # newer data frame format
ChickWeight

colnames(ChickWeight) <- c("Weight", "Day", "Chick", "Diet")
ChickWeight

# Calculate Number of Chicks on Each Diet
DietCount <- ChickWeight %>%    # take starting df
    select(Diet, Chick) %>%     # keep 2 of the columns
    unique %>%                  # keep 1 copy of each combination
    count(Diet) %>%             # count number of chicks by diet
    rename(Count = n)           # rename the count column
DietCount

# Plot Number of Chicks on Each Diet
ggplot(DietCount, aes(x = Diet, y = Count, fill = Diet)) + geom_col() +
    labs(title = "Number of chicks on each diet") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"),
          legend.position = "none")

# With Diets as Integers - this is cheating!
ggplot(DietCount, aes(x = Diet, y = Count, fill = as.integer(Diet))) +
    geom_col() +
    labs(title = "Number of chicks on each diet") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"),
          legend.position = "none")

# Histogram of Chick Weights by Day
ggplot(ChickWeight, aes(x = Weight)) +
    geom_histogram(fill = "darkblue") +
    labs(title = "Distribution of Chick Weight by Day", y = "Count") +
    facet_wrap(~ Day, scales = "free") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1),
          legend.position = "none")

# Plot Individual Weight vs Day
ggplot(ChickWeight, aes(x = Day, y = Weight, colour = Chick)) +
    geom_point() +
    labs(title = "Chick Weights by Day") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"),
          legend.position = "none")

# Connect the Dots
ggplot(ChickWeight, aes(x = Day, y = Weight, colour = Chick)) +
    geom_line() +
    labs(title = "Chick Weights by Day") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"),
          legend.position = "none")

# Colour by Diet Instead of Chick
ggplot(ChickWeight, aes(x = Day, y = Weight, group = Chick, colour = Diet)) +
    geom_line() +
    labs(title = "Chick Weights by Day") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"),
          axis.text.x = element_text(angle = 0, hjust = 1))

## Summary Statistics for Weight by Diet
WeightSummary <- ChickWeight %>%
    group_by(Diet, Day) %>%                                                     # group by Diet & Day
    summarise(N = length(Weight) %>% as.integer(),                              # get counts in each group
              Mean = mean(Weight) %>% round(digits = 1),                        # get mean of each group
              SD = sd(Weight) %>% round(digits = 1)) %>%                        # get SD for each group
    mutate(CI95 = (qt(0.975,df = N-1)*SD/sqrt(N)) %>% round(digits = 1)) %>%    # get 95% CI for each group
    mutate(MeanSD = paste(Mean, SD, sep = " ± ")) %>%                           # get mean and SD as a string
    mutate(MeanCI95 = paste(Mean, CI95, sep = " ± "))                           # get mean and 95% CI as a string

WeightSummary

# Plot the Means of Weights for Each Diet
ggplot(WeightSummary, aes(x = Day, y = Mean, group = Diet, colour = Diet)) +
    geom_line() +
    labs(title = "Chick Weights over Day") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"), axis.text.x = element_text(angle = 45, hjust = 1))

## Reorder the Diets and Plot Again
WeightSummary$Diet
WeightSummary$Diet <- ordered(WeightSummary$Diet, levels = c("1", "2", "4", "3"))
WeightSummary$Diet

ggplot(WeightSummary, aes(x = Day, y = Mean, group = Diet, colour = Diet)) +
    geom_line() +
    labs(title = "Chick Weights over Day") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))

## Plot Means ± 95% CIs of Weights for Each Diet
ggplot(WeightSummary, aes(x = Day, y = Mean, colour = Diet)) +
    geom_ribbon(aes(ymin = Mean-CI95, ymax = Mean+CI95, color = Diet), alpha = 0) +
    labs(title = "Chick Weights over Time") +
    theme(plot.title = element_text(hjust = 0.5, face="bold"),
          axis.text.x = element_text(angle = 45, hjust = 1))

# Look at the Numbers!
# Convert the data from long to wide format
WeightSummary2 <- WeightSummary %>% dcast(Diet ~ Day, value.var = "MeanCI95")

WeightSummary2
WeightSummary2[,c(1,13)]

