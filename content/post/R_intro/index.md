
---
title: "Intro to R (part 1): The basics"
summary: "A tutorial for base R usage and functions"
author: 
- Jeffery Mintz
- admin
date: 2022-08-12
slug: R intro
categories: ["r tutorials"]
tags: ["introduction", "functions", "getting help", "vectors", "data frames"]
image:
  caption: ""
  focal_point: ""
  preview_only: true
---

# Welcome to R!  

## In this tutorial, we will learn the basics of R coding, including:
- Using functions
- Help functions
- Vectors
- Sequences
- Data frames


 R is a nice calculator.  Kind of like a fancy graphing calculator.
 An advantage of using R over a calculator:   
  1. Can save our steps and use them later or share them.
  2. Can use other peoples code.
  3. Has a keyboard!  Faster!  Stronger!

Similar to pressing "enter" on a calculator to compute something, you can press "ctrl+enter" on a line in your script (or terminal) to execute a function, inspect an object, or simply calculate a formula. 

# Keyboard controls: 

## Arithmetic operators

    5
    
    5 / 2

### +, /, -, * are arithmetic operators.  There are some others, %%, %/% and ^.

    5 %/% 2  # The integer part.
    5 %% 2   # The remainder part, aka the modulus.
    5 ^ 2    # How you take powers of numbers.  


# Variables:
    x <- 5 # alternatively, use "=" instead of arrows; e.g., x = 5
    y <- 2
    3 * x + y
    3 * (x + y)   # use parentheses to avoid excusing your dear aunt Sally.

## Parenthesis nesting can get out of hand quickly, so it can be helpful
## to turn on 'rainbow parenthesis' in RStudio:
### Tools > Global Options > Code > Display > Rainbow Parenthesis

    z <- (x * (x + y)) ^ y
    z

## Variable contents are in the "environment" pane in RStudio.


# Functions
## The exponential function, e to the power of x.
###  The inputs 'x' is called an 'argument' of the function.
    exp(x = 1)

## The help functions!  
###  Definitely one of the best parts of R.  Don't try this in Python!
    help(exp)
### Important: Check out the examples at the bottom of the page, or try
    example(exp)
    
    ?exp
    ?weibull   # General help, for things that are currently in use.
    ??weibull  # Global help. Does partial matching. 


## Help on tricky stuff:
    ?%%        # Help what's a modulus!
### Try putting the thing you can't search for help on in backticks, ``. 

    ?`%%`
    ?`??`      

## When you run across something you don't recognize, try to ? it.  
### It's faster than searching online and has less ads. 👍


# Vectors
## c() concatenates these together to make a vector.
    v1 <- c(5, 8, 0)
    v1

## The parts of a vector are called 'elements'.  You extract them with brackets.
### R starts numbering the elements with 1.
    v1[1]

## We can get more than one element at a time.
    v1[c(1, 2)]

## We can call them in any order, and any number of times.
    v1[c(2, 1, 1)]

## R works well with vectors: if you put a vector into most functions, you get a vector back.  (This is called vectorization.)
    exp(x = v1)
    round(x = exp(x = v1), digits = 2)

# Sequences:  
    seq(from = 1, to = 10, by = 1)
## the fast way:
    1:10
    5:10
    count2 <- seq(from = 2, to = 10, by = 2)  # To count by twos we need seq.
    count2

## How many elements are in the vector?
    length(count2)

## Letter vectors
    letters
    LETTERS
    20:22
    letters[20:22]


# Data frames
## Data frames can hold different data types in different columns.
- Each column is a vector, possibly with its own data type.
- The columns are bound together to make an object called a data frame. 
- One restriction is that all the columns need to be of equal length.
- You also can only store the basic data types in a data frame, like logical, character and numeric, but still there are many possibilities.

    yowza <- data.frame(nums = 1:3, lets = letters[1:3])
    yowza

## We can access the elements in the dataframe, by row and/or column numbers, or by column names.
    yowza[1, 1]   # Elements of a dataframe are indexed from the top left.  
    yowza[1, ]    # The whole first row
    yowza[ , 1]   # The whole first column
    
    yowza[ , "lets"]
    yowza$lets
    yowza$nums

### Notice that the lets and nums maintain their own data types. 
###  The "lets" are still characters.
    class(yowza$lets)
    class(yowza$nums)

### special thing about dataframes is... it holds more than one type of data,
### Constraint: all columns are the same length.



## Matrices and Recycling rule

    mat = matrix(data = 1:100, nrow = 10)
    mat
    mat[10, ]
    mat[ , c(9, 10)]
    
    matrix(data = 0, nrow = 10, ncol = 10)        # A matrix of zeroes.  
    matrix(data = c(1, 2), nrow = 10, ncol = 10)  # Recycling rule!
    matrix(data = c(1, 2), nrow = 10, ncol = 10, byrow = T)
    matrix(data = c(1, 2, 3), nrow = 10, ncol = 10, byrow = T)
### 100 not divisible by 3!


## Another handy thing, which you might want to do someday.
### Suppose we want to create a dataframe with every combination of several variables.
    expando <- expand.grid(nums = 1:3, lets = letters[1:5])
    expando

### Three level expando:
    fruit <- expand.grid(nums = 1:3, lets = letters[1:2], fruit = c("pear", "orange"))
    fruit
    fruit$fruit
    fruit$lets

 See [R intro part 2](https://www.alexbaecher.com//post/r-intro-pt2/) for a tutorial of more advanced R features using data from "GapMinder"
