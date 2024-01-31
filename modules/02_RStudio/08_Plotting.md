# Ready to get fancy? 


The following is just a demonstration of what you can do to add some details to the plot function. To be honest, you will quickly graduate out of the base R plotting tools as they become rather clunky quickly. Instead, you'll work with more advanced plotting tools like **ggplot2** and those from the **R Graphics Gallery**.


```r
# this is just a demonstration
plot(xVacc,
     yBoost,
     col = "lightblue",
     pch = 19,
     xlim = c(20,130),
     ylim = c(20,130),
     main = "Vaccination rates and boost rates per state or territory",
     ylab = "Boosters administered per hundred people",
     xlab = "Vaccinations administered per hundred people",
     )

# Label the states and territories
text(xVacc, yBoost, rownames(VaxByState),col='darkblue', pos = 4, cex = 0.8)

# Add a linear regression trendline
lm(yBoost ~ xVacc)
abline(lm(yBoost ~ xVacc ), col = "pink")
text(120,95, "linear regression", col = "pink")


# Fit the data using local smoothed fit (Lowess)
lowess(yBoost ~ xVacc)
lines(lowess(yBoost ~ xVacc), col = "purple")
text(115,78, "local fit", col = "purple")
```
<img src="webContent/Screen Shot 2023-01-25 at 8.45.09 AM.png" width="600">

