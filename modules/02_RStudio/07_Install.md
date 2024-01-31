# 07 Bonus Content - Installing Packages

## Reviewing the learning objectives for this module

  - [x] Let's **start fresh** with coding
  - [x] Students will learn about R: it's **history** and how it is **useful in biological research**
  - [x] Students will learn how to **interface** with R and RStudio
  - [x] Students will become familiar with a few basic **R objects** (or extend their knowledge into new objects)
  - [x] Students will execute a few basic **R functions** (or extend their knowledge into new functions)
    
## Maybe in this module or next ones:
  * [x] **Next:** Students will learn to **import and export** data
  * [ ] **Next:** Students will learn to extend functionality of R by loading **packages**
  * [ ] **Next:** Students will gain experience in basic **plotting**


When it comes to graphics, the base R plot is going to start to feel very limiting fairly quickly. For example, it is a real pain to change the numeric formatting of the population from scientific notation to plain ol' 100,000 notation. This gets frustrating. Packages specifically designed to make plotting easy, organized, and beautiful will keep you from going crazy. 

<img src="webContent/Screen Shot 2022-01-26 at 9.31.59 AM.png" width="300">

❓ **How do we install new packages?**

  * Step 1 - Install the package. This happens once. It will download the package from the internet and save it on your local computer. You can do from within R using the `install.packages()` function OR, you can do it in RStudio through the menu **Tools** and then **Install Packages...*
  * Step 2 - Each time you start RStudio, you'll need to load the package from the library. This makes it available for use. Think of this like checking out a book from the library. It uses the function `library()`.

**INSTALLING VIRIDIS - a color palette specifically designed to address colorblindness**

*just an example. You may have already done this. Or you should do it later. It may take some time.*

```r
# Do this once:
install.packages("viridis")


# Do this each time you want to use a viridis package:
library(viridis)
```

Let's check out what we got:

```r

x <- y <- seq(-8*pi, 8*pi, len = 40)
r <- sqrt(outer(x^2, y^2, "+"))
filled.contour(cos(r^2)*exp(-r/(2*pi)), 
               axes=FALSE,
               color.palette=viridis,
               asp=1)

```
<img src="webContent/Screen Shot 2024-01-31 at 9.35.23 AM.png" width="500">



[More info on viridis](https://cran.r-project.org/web/packages/viridis/vignettes/intro-to-viridis.html#gallery)

Continue on to [Advanced Plotting Demo](08_Plotting.md)