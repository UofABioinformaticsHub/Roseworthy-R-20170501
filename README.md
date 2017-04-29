# Roseworthy-R-20170501

A more friendly version of the website can be found [here](https://uofabioinformaticshub.github.io/Roseworthy-R-20170501/)

The two datasets of interest will be:

- [toothData.csv](data/toothData.csv): A modified version of the inbuilt `ToothGrowth` dataset, so that dosage levels have been changed to `Low`, `Med` and `High`
- `InsectSprays`: The internal dataset accessed by typing `data(InsectSprays)`

## Session 1 - Steve

1. Introduction to R Studio  
<tab> [Slides](101_IntroductionRStudio.html) or [Markdown](101_IntroductionRStudio.md)

  - Installing Packages
  - Using R Projects
  - Writing Scripts
- Loading Data
  - Introduction to `data.frame` objects
- Data Types
  - Vectors
  - Matrices

## Session 2 - Lloyd

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
