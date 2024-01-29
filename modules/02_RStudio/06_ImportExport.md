# Importing & Exporting Data in R

So far, we've created objects by assignment expressions that directly specify their values. Next, we'll learn how to **import** data into R. There are many ways to do this, but we'll just go over one main approach. 

After that, we'll talk about getting plots and tables **out** of R, also called **exporting**. 

These process are sometimes referred to as **IO**, for "Input and Output". 

First, let's download a dataset to import.

## Importing Data 

❗**EXERCISE** Download a data file

  * Go to [US_COVID_Vacc_by_StateTerr.csv](https://drive.google.com/file/d/1_0z0Bi3cg5GjWpz6FV23NMFw8V0kzQm_/view?usp=sharing)
  * ➡️ Download the file by clicking the down arrow in the top right set of icons.
  * ➡️ Save the file somewhere in your Documents directory/folder that makes sense. Consider adding it to your folder called "CM515" that contains this code. 
  * ➡️ Ensure the file name saved is "US_COVID_Vacc_by_StateTerr.csv" by viewing it in Finder or explorer.

### Importing Data - Setting the working directory

To import the file into R, we first need to sync up where R **thinks** it is working on your computer with the folder that contains a document you want to import. This is a bit tricky and will require some knowledge of **paths**.

**Paths** - a path describes the location of a folder or file on your computer. Because folders are nested on a computer, the path will start on the left with the "topmost" or "outer most" directory, and then progressively list different sub-directories. 

In R, folder names are separated by a "/" character.

To determine where R "thinks it is" on your computer, use the command `getwd()` for **get working directory**. **directory** is a more computer science-y term for "folder".

```r
getwd()
```

The output is listed as a path. Notice how the output to getwd() matches with the folder names at the bottom of the "Finder" window and with the different folder icons.

<img src="webContent/Screen Shot 2023-01-23 at 9.06.12 AM.png" width="600">

:heavy_exclamation_mark: MAC tip: If you don't see you path in the Finder, pull down the View menu and select Show Path Bar.

:heavy_exclamation_mark: PC tip: If you don't see your path in the Explorer, follow [these directions](https://pureinfotech.com/show-full-path-file-explorer-windows-10/)



❗**EXERCISE** Setting the working directory

To import a file, we need to set R's working directory to match the directory where our file lives.

  * ➡️ Go to the **Files** Panel of RStudio.
  * ➡️ Navigate to the location containing the downloaded dataset (may take some sleuthing)
  * ➡️ Change the working directory by going to the **Files Menu Banner**, selecting **More**, and selecting **Set As Working Directory**
  * ➡️ For posterity, copy and paste the command line that appears on the console that looks like `setwd(/directory/directory/)` into your .R script for next time

## Importing Data - Reading in the data

❗**EXERCISE** Together, let's write the code to read the data file into R.

We will use the command `read.table()` to import the dataset

```r
# Check we're in the right place
getwd() 

# Check how read.table is used
help(read.table)

# Look at the data using read.table
read.table("US_COVID_Vacc_by_StateTerr.csv", sep = ",", header = TRUE)

# Actually, I don't like those number row names
read.table("US_COVID_Vacc_by_StateTerr.csv", sep = ",", header = TRUE, row.names = "location")

# That only printed out the data from the file, it didn't capture it.
# To capture the data, use an assignment expression:
VaxByState <- read.table("US_COVID_Vacc_by_StateTerr.csv", sep = ",", header = TRUE, row.names = "location")

:+1: Use help(read.table) to learn how you can also use read.csv or read.csv2 to upload comma separated content, also! There are many ways to do the same thing in R.


```

## Importing Data - EDA (Exploratory Data Analysis)

⚠️ **BEST PRACTICES** It is a wise idea to inspect your data once you have read it into R.

➡️ Look at what you have acquired and make sure everything looks good!

```r
dim(VaxByState)
str(VaxByState)
class(VaxByState)
```

## Obtaining, Cleaning, Wrangling, & Munging

I obtained the data from [Our World In Data](https://ourworldindata.org/). This is a great resource for worldwide statistics. I use this site because their data is **clean**. What do I mean by that?

  * headers don't contain spaces
  * no blank fields. Missing fields are labeled "NA"
  * no weird characters

One thing you will discover is that most datasets are NOT clean. It takes A LOT of ground work to make your data nice and neat and tidy. This ground work is called either **cleaning**, **wrangling**, or **munging** data, depending on your frustration level. 

I had to clean up this data quite a bit to make the neat and tidy file you just imported.
 
  * filtered for the most recent dates
  * removed superfluous columns
  * re-arranged the columns
  * removed data for US federal prisons, Defense Dept., and Veteran's hospitals because some of their data was missing.

# Exporting Data out of R


