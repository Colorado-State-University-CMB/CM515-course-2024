# 5. Let's talk about R functions

## Reviewing the learning objectives for this module

  - [x] Let's **start fresh** with coding
  - [x] Students will learn about R: it's **history** and how it is **useful in biological research**
  - [x] Students will learn how to **interface** with R and RStudio
  - [x] Students will become familiar with a few basic **R objects** (or extend their knowledge into new objects)
  - [ ] Students will execute a few basic **R functions** (or extend their knowledge into new functions)
    
## Maybe in this module or next ones:
  * **Next:** Students will learn to **import and export** data
  * **Next:** Students will learn to extend functionality of R by loading **packages**
  * **Next:** Students will gain experience in basic **plotting**


## Useful references

 * [Base R cheat sheet](https://iqss.github.io/dss-workshops/R/Rintro/base-r-cheat-sheet.pdf)



## Functions are the verbs of the R language

If you don't have the data frame `model_systems` in your environment, let's load it up: 

```r
organism <- c("human", "mouse", "worm", "yeast", "maize")
kingdom <- c("animalia", "animalia", "animalia", "fungi", "plantae")
kingdom <- as.factor(kingdom)
chromosomes <- c(23, 20, 5, 16, 10)
haploid <- c(FALSE, FALSE, FALSE, TRUE, FALSE)
model_systems <- data.frame(organism, chromosomes, kingdom, haploid)
str(model_systems)
```

By now, you are actually already experienced in calling R functions. Here are some examples:

```r

date()

dim(model_systems)

mean(chromosomes)

```

In R, the functions typically involve parentheses. Sometimes they are empty and sometimes we type something in them. Think of this similar to how some verbs take direct objects (I threw the ball) and some don't (I run). 

Two different types of information can go in the parentheses: **arguments** and **options**.

  * **ARGUMENTS**: These are object names that are added inside the parentheses. They are what the function will operate on. They are analogous to direct objects in English. 
  * **OPTIONS**: Think of these as adverbs. These are optional content you can add that changes **how** the function will operate.

The `help()` function gives us information about how a function operates. The help page will tell us
   * What a function does
   * Whether it requires an argument
   * what object classes are allowed as arguments
   * The potential list of options
   * The default values associated with each option

➡️ Try the help function

```r
help(dim)
```

  * The `x` in the example tells you that this function takes an argument. If we read under **ARGUMENTS** we can learn which object classes are allowed.

➡️ Let's look at the help menu for `mean`.

```r
help(mean)
```

This help menu also specifies the **options** that the mean function takes and their **default** values. As a default, **trim** is set to 0 and **na.rm** is set to **FALSE**. In other words, all the values are used to calculate the mean. However, this value can be changed to 0.2, in which case, the most extreme 20 % of all datapoints will be removed before the mean is calculated. 


⚠️ **GRAPHICAL SUMMARY** 

<img src="webContent/WebContent_Powerpoint_functionGrammar.jpg" width="600">


➡️ Give it a try:

```r
# Take the average # of chromosomes
mean(chromosomes)

# Take the average # of chromosomes of 80 % of the data
mean(chromosomes, trim = 0.2)
```

### What does na.rm mean?

When we look up the help page for **mean**, one thing we encounter is...

<img src="webContent/Screen Shot 2024-01-30 at 7.11.00 PM.png" width="800">

  * **NA**, or Not Available, should be written in place of any **missing values**
  * **NaN**, or Not a Number, should be written in place of any **impossible numbers**. For example, a number divided by 0.

What happens if we try to take the mean of a vector that has an NA in the list? 

➡️ Let's try it:

```
# create a vector with an NA in it:
incompleteVector <- c(2, 5, 8, 9, 10, 200, NA, 3)
mean(incompleteVector)
[1] NA

```

hmmm... Looks like it won't let me. This is where **na.rm** comes in. It mean **NA Remove** and by setting it to TRUE, you can override the behavior by removing all the NAs first, and then taking the mean on the remaining values second.

➡️ Try na.rm

```
mean(incompleteVector, na.rm = TRUE)
[1] 33.85714

```

**REVIEW**

  * R functions have parentheses
  * Sometimes nothing goes in them: `function()`
  * **Arguments:** `function(argument)` - your function will take an argument as input
  * **Options:** `function(argument, option1 = TRUE, option2 = 100)` -  You can customize how the function operates by adding optional information. 


Continue on to [Importing and Exporting Data](06_ImportExport.md)

