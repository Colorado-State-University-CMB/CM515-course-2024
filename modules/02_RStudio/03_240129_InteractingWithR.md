-----

# 3. Let's learn how to interface with R and RStudio

<img src="webContent/Screen Shot RStudio.png" width="700">

RStudio is an **Integrated Development Environment** or **IDE**. An IDE is a software application that allows programmerss to develop software within an organized user space. In it, we can interact with R, write code, and preview output. 

:white_check_mark: **GRAPHICAL SUMMARY:**

<img src="webContent/WebContent_Powerpoint_interface.jpg" width="1200">



  * **Text editor** - The text editor is a panel that allows you to write a script of R commands into a document that can be saved for later, executed one line at a time, or executed all at once.
  * **Console panel** - this is where R is loaded and ready to go. It shows you the version of R you are running. A prompt, which is denoted by the ">" character shows you that R is ready for your input. This is where we will **interact** with R. More on that later.
  * **Environment panel** - this is a list that will populate with **objects** as we create them in R. More on objects later. 
  * **Files panel** - This gives you the ability to browse and interact with the file structure on your own local computer.
  * **Help panel** - This will pop up with useful help information when you execute the help command. More on that later.
  * **Plots panel** - this is where plots and graphics will appear when we generate them.
  * We can toggle through panels behind the Console, Environment, and Plot panels using the tabs at the top of the window.

-----

:warning: **BEST PRACTICES: Closing RStudio**

When RStudio closes, by default, it will prompt you whether you want to "Save workspace image to ~/.Rdata". I recommend selecting **Don't Save**. Otherwise, the next time R starts up, your old objects will already be there waiting for you. It's better form to start from scratch with each new session. However, when working on very long projects, I will admit, this is a useful feature.

  * What to do? 
  * :arrow_right: Either remember to select **Don't Save** each time. 
  * :arrow_right: OR, you can change this setting by going to **RStudio** on the top menu, then **Preferences ...**, then changing **"Save workshopspace to .RData on exit"** from **Ask** to **Never**. It'll look like so:

<img src="webContent/WebContent_Powerpoint_RData.jpg" width="900">


-----

# Interacting with R within RStudio

_OK, now we know what R is and we know what RStudio is. But how do they work together? R is the algorithm, the actual program. We can think of R like the engine of a car. RStudio is the interface. We can think of it like the driver's seat of the car. So, we'll make ourselves comfortable within RStudio where we will instruct R what to do._

_How do we tell R what to do?_

_Remember how I said R is an **interpreted language**? This means that it is a language that executes its programs line-by-line. This is useful because it makes it much easier for us to interact with R in a line-by-line way. It's going to feel more like a conversation or dialogue than a **compiled language** would feel. In a compiled language, the whole script or program is written, then it is converted (or compiled) into another language that the computer can more readily understand and more quickly execute. So (warning more metaphores) think of an interpreted language more like direct messaging and a compiled language more like composing an e-mail._

## Interacting with R on the Console

:heavy_exclamation_mark: **EXERCISE: Your first conversation with R**

:arrow_right: We can interact with R through the **console**. Just type in some random characters and push return like so...

```
> sdfjksl
Error: object 'sdfjksl' not found
```

:confused: Hmm, that didn't work. Each line we write is called an **expression**. Turns out R doesn't know what the expression sdfjksl means. That's fair.

:arrow_right: Let's write an expression that R should recognize. Look in the welcome message. R invites us to use the command `citation()` to learn how to cite R.

```
> citation()

To cite R in publications use:

  R Core Team (2021). R: A language and environment for statistical computing. R
  Foundation for Statistical Computing, Vienna, Austria. URL
  https://www.R-project.org/.

A BibTeX entry for LaTeX users is

  @Manual{,
    title = {R: A Language and Environment for Statistical Computing},
    author = {{R Core Team}},
    organization = {R Foundation for Statistical Computing},
    address = {Vienna, Austria},
    year = {2021},
    url = {https://www.R-project.org/},
  }

We have invested a lot of time and effort in creating R, please cite it when using it
for data analysis. See also ‘citation("pkgname")’ for citing R packages.
```
  * Yay! That worked!

:warning: **BEST PRACTICES: Citing R**

  * _Please cite R and RStudio in your published works. Please cite all packages you use in published works. When reviewing manuscripts for publication, please check for these citation. This helps the community._


:heavy_exclamation_mark: **EXERCISE: More practice with R expressions**

  * :arrow_right: Try the following expressions on your own. What happens?

```r
> print("Hello World")
> date()
> getwd()
> Sys.info()[["user"]]
> 5 + 7
> 5+7
> x <- 5 + 7
> x
```

:smiley: Cool, huh! 

:warning: **WARNING** What if something doesn't work right?

  * If you don't complete your expression, R will give you a chance to finish it. 
  * :arrow_right: Try leaving R hanging...
```r
> 5 +
```
  * You can add `7` after and push return again. It should work.

:warning: **WARNING** What if that doesn't work?

  * You can push your **ESC** key to return to the prompt at any time.
  * :arrow_right: Try it
```r
> 5+
```
  * :arrow_right: Push **ESC**
  


## Interacting with R through a script


_In addition to interacting with R directly on the console, we can also write each of our expressions into a document called a **script**. Doing this will save each line for future use, for posterity. As we write this script, we can send each line to R interactively, one-by-one. Once we are happy with each expression, we can save the script. Or, we can execute the script all at once._


:heavy_exclamation_mark: **EXERCISE: Start a script**

  * :arrow_right: Go to **File** on the top menu bar
  * :arrow_right: Go to **New File**
  * :arrow_right: Select **R Script**
  * :arrow_right: To save yoru script, select **File** in the top menu bar. Select **Save**. 
  * :arrow_right: Navigate or create an appropriate location for your script. Save your script as **240129_Module2_demo.R**.
  
_Write lines of code in your script._

  * :arrow_right: Write the following in your script. Any lines that start with **#** are **comments**. Those will be lines that are for humans to read. R will ignore them. This is how you will write copious notes. Get used to this!

```r
# My first script

print("Hello World")
date()
getwd()

```
  * :arrow_right: **You can execute your code in a few ways:**
    * **Line-by-Line:** Place your cursor somewhere within the line `print("Hello World")`
      * Either click the **Run** icon that contains a right-pointed arrow.
      * OR use short cut keys: **COMMAND** + **RETURN** (Mac) or **ALT** + **ENTER** (PC) 
  * **Multiple Lines:** Highlight multiples lines.
      * Either click **Run** OR use the short cut keys to execute.

---- 

:warning: **SUPER COOL TIPS:**

  * You can use **TAB** to autocomplete both in the text editor and on the console. Toggle through with **TAB** or **ARROW KEYS** to find what you want
  * You can use the **UP ARROW** in the **CONSOLE** to navigate through the last expressions you executed.
  * For more info about R-Studio: [RStudio Cheatsheet](https://posit.co/wp-content/uploads/2022/10/rstudio-ide-1.pdf) 


----

## HOMEWORK QUESTION 2 (5 pts)

:white_check_mark: Students will learn how to interface with R and RStudio

*Let's explore R-studio a little bit by learning about shortcut keys. Try the following and report what happens: (answers in words, phrases, or short sentences)**

A. What happens when you press **Alt+Shift+K** on a PC/Linux or **Option+Shift+K** on a Mac?

B. What happens when you are working on the "Console" and you press the **up arrow**?

C. What happens when you are working on the "Console" and you press **CTRL+L**?

D. What shortcut key helps you escape out of an executed command on the "Console"? For example, try executing a sleep function. This puts R to sleep for 5 minutes. (in other words - What would you press to return to the prompt before 5 minutes is complete?)

```r
Sys.sleep(5)
```


[Module 2 Homework](Module2_homework.md)

Continue on to [R Objects](04_RObjects.md)



----