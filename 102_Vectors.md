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

### What issues might crop up when applying a function to a vector?


* Can we perform mathematical calculations on words?
* Can we use numbers with decimal points to indicate positions in a ranked list?

## Vectors | 6 atomic vectors

`R` has 6 atomic vector types

*  

