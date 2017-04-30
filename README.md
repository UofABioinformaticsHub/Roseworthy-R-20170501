# Roseworthy-R-20170501

A more friendly version of the website can be found [here](https://uofabioinformaticshub.github.io/Roseworthy-R-20170501/)

## The two datasets for the session will be

- [toothData.csv](data/toothData.csv): 
    + A modified version of the inbuilt `ToothGrowth` dataset, so that dosage levels have been changed to `Low`, `Med` and `High`
- `InsectSprays`
    + An internal dataset which doesn't need downloading
    + This will be accessed by typing `data(InsectSprays)` when asked

## Session 1 - Steve

1. Introduction to R Studio: [Slides](101_IntroductionRStudio.html) or [Markdown](101_IntroductionRStudio.md)
2. Vectors: [Slides](102_Vectors.html) or [Markdown](102_Vectors.md)

  - Installing Packages
  - Writing Scripts
- Loading Data
  - Introduction to `data.frame` objects
- Data Types
  - Matrices

## Session 2 - Lloyd

1. Working with `dplyr` [Rmarkdown](Session2_dplyr_lloyd.Rmd)

- Logical Vectors
- Subsetting using square brackets
- `dplyr` functions: `filter()`, `mutate()`, `arrange()`, `select()`, `group_by()`, `summarise()` etc.
- Using the magrittr (`%>%`)

## Session 3 - Rick

- Boxplots using `base` and `ggplot2`
- Histograms using `base` and `ggplot2`
- Barplots with errorbars, combining `dplyr::group_by`, `dplyr::summarise` and `ggplot2`
- Scatterplots
- A few additional example plots
