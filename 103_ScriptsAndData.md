# Introduction to R & RStudio
Steve Pederson  
1 May, 2017  






# Writing Scripts

## Writing Scripts

* So far we have entered everything directly in the `Console`  
$\implies$ This is a bad idea in the real world
    + We have no record of what we've done
    + How do we remember anything 6 months later?
    + How do we submit our methods to our patent lawyer?
    + How do you explain your analysis to a collaborator
* We usually record everything as a *script*
    + Not just **best practice** $\implies$ near **essential practice**

## Writing Scripts

* `File` > `New File` > `R Script`
    + A new text file will now be in the top left quarter
    + Save this as `loadingData.R`
* Giving it the suffix `.R`:
    + Helps RStudio with auto completion
    + Helps us find our R scripts in a messy folder
* We enter text and `R` commands in this file
    + They are **not** executed until we send them to the `Console`
    
## Structure Of A Script

* No formal requirements (unlike `bash`)
* Usually have a mix of `R` commands, and comments
    + Comments explain what you're intending to 'future' you and others
    + Comments in an `R` script start with `#`
    + Anything following `#` are ignored by the `Console`
* I usually start mine by loading packages

## Loading Packages

* Similar functions are collected into `packages` (e.g. `base`)
    + `R` always loads _stats_, _graphics_, _grDevices_, _utils_, _datasets_, _methods_ and _base_ at startup
    + **NEVER** use the `Packages` Tab to load packages 
    + Remember, we **want a record** of literally everything we do
        + `Tools > Global Options > Packages >` **Uncheck** `Enable Packages Pane`
* Let's start by loading some packages

## Loading Packages

Lloyd will take you through the `dplyr` package later

* Contains functions for working with the data we're about to load


```r
library(dplyr)
```

**We have not yet set this command to the `Console`**

1. Go to this line in the script
2. Linux/Windows: `Ctrl + Enter` or Mac `Command + Enter`
    + Ignore the friendly and helpful message
3. We have now loaded our first package...

# Loading Data

## Loading Data
    