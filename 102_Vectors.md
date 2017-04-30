# Introduction to R & RStudio
Steve Pederson  
1 May, 2017  






# Vectors

## The R Environment | `c()`

* One of the most useful functions is `c()`
    + Stands for `combine` or `concatenate`
    + We can join two (or more) objects into one object
    

```r
z <- c(x, y)
z
```

```
## [1] 2 3
```

## Vectors

* The ability for an `R` object to hold more than one value:
    + Vectors are the fundamental unit in `R`
    + Are a 1-dimensional set of values
    + We can apply functions to an entire vector


```r
sqrt(z)
2^z
length(z)
```

## Vectors

### What issues might crop up when applying a function to a vector?

Hint: What types of values exist?

## Vectors

* **What issues might crop up when applying a function to a vector?**
    + Can we perform mathematical calculations on words?
    + Can we use numbers with decimal points to indicate positions in a ranked list?
    
* All values in a vector must be the **same type** of value

## Vectors | 6 atomic vectors

1. `logical` (`TRUE` or `FALSE`)
2. `integer`
3. `numeric` (or `double`): Numbers with decimal points
4. `character`

* Two other types we'll ignore:
    + `raw` (bytes) and `complex` ($i =\sqrt{-1}$)

## Vectors | 6 atomic vectors



```r
z > 0
```

```
## [1] TRUE TRUE
```

```r
z == 2
```

```
## [1]  TRUE FALSE
```

* Lloyd will spend more time on these later

## Vectors | 6 atomic vectors

We can coerce some types of values into another type


```r
typeof(z)
as.logical(z)
as.integer(z)
as.character(z)
```

## Vectors | Working with `character` vectors


```r
homeR <- c(742, "Evergreen", "Terrace")
length(homeR)
```

```
## [1] 3
```

```r
typeof(homeR)
```

```
## [1] "character"
```

* Is my street number saved as an: `integer`, `double` or `character`?

## Vectors | Working with `character` vectors

Can we convert this to any of the other vector types?


```r
as.numeric(homeR)
as.logical(homeR)
```

Try it and see...

## Vectors | Working with `character` vectors

Can we convert this to any of the other vector types?


```r
as.numeric(homeR)
as.logical(homeR)
```


* **Welcome to your first official error message!**
    + Does <code style="color:red">Warning message: NAs introduced by coercion</code> make any sense?
    + `R` was *able to coerce* `"742"` to a *numeric* value
    + `R` was *unable to coerce* the other words (for obvious reasons)
    
# Factors    
    
## Introducing factors

**There is a trap for young players...**

* When loading external data, `R` would traditionally convert text to categorical variables (`factors`)
* Each value is changed to an `integer` specifying which category the value is from
		+ The category name is given as an additional attribute (i.e. a `level`)  
    + More memory efficient for true categorical variables
    + **Very** common in statistical analysis

Automatic conversion is not as common now, but important to know about!

## Introducing factors


```r
groups <- c("A", "A", "B")
groups <- as.factor(groups)
groups
```

```
## [1] A A B
## Levels: A B
```

## Introducing factors

Now prepare to be amazed...


```r
typeof(groups)
levels(groups)
as.integer(groups)
as.logical(groups)
```

