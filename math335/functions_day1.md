---
title: ""
author: ""
params:
  day: 2
  ptitle: true
  pbackground: true
  dtype: "none"
---



# Functions: Day 1 {data-background=#f7d754}

Welcome to class!

##

Why do we care about working with strings? (text data?)



# Introduction to Functions {data-background=#f7d754}

## What is a function?

## How to write a function in R

1. Pick a **name** for the function that is intuitive and makes sense to other users
2. List the **arguments** to the function inside `function()`
3. Write the steps of your function in the **body**, a `{` block immediately following `function()`

## Example

```
my_function <- function(bob){
   is_three <- bob == 3
   mean(is_three)
}
```

## Practice:

Figure out what this function does, and think of a better name for it.

>- Left side of the room:

```
f1 <- function(string, prefix) {
  substr(string, 1, nchar(prefix)) == prefix
}
```

>- Right side of the room:

```
f2 <- function(x) {
  if (length(x) <= 1) return(NULL)
  x[-length(x)]
}
```

## Practice:

Write a function that:

- Takes a name (a character string) as input
- Returns "Hello [name]!"

## Practice:

Write a function that:

> - Takes a character string as input
> - Checks if the name "Bob" is in the string
> - If so, returns "Hello Bob!"
> - Otherwise, returns "Hello."

## Practice:

Write a function that:

> - Take two numerical vectors as inputs
> - Calculates the average of all numbers from both vectors combined

## Good Advice

> It's easier to start with working code and turn it into a function; it's harder to create a function and then try to make it work.

# So what? {data-background=#f7d754}

## Q: Why use functions?

Answer:

> One of the best ways to improve your reach as a data scientist is to write functions. Functions allow you to automate common tasks in a more powerful and general way than copy-and-pasting.

## Q: When to use a function?

Answer: 

> When you've copied and pasted a block of code more than twice.

## [Three Big Advantages](https://r4ds.had.co.nz/functions.html)

1. You can give a function an evocative name that makes your code easier to understand.
2. As requirements change, you only need to update code in one place, instead of many.
3. You eliminate the chance of making incidental mistakes when you copy and paste (i.e. updating a variable name in one place, but not in another)

## Remember:

> Writing good functions is a lifetime journey.

# Task 15 {data-background=#f7d754}

## You should read the assigned chapter.

Chapter 19: Functions

- More tips for how to write good functions (humans vs. computers)
- How to add constraints to your functions (check for input errors)
- Return values for functions
- Function environments
- Introduction to conditional statements (super cool! super useful!)
- Guidelines for having good coding style (aka, how to make sure other programmers don't hate you)

##

Let's make sure we understand the deliverables.