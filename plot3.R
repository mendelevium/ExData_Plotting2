## load and clean 
source("load_and_clean.R")

## install.packages("ggplot2")
library(ggplot2)

## create png in the workspace
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot3.png", 
    width = 480, height = 480, 
    units = "px")

## data preparation
subset <- summaryData[summaryData$fips == "24510", ] 

## plot3
g <- ggplot(subset, aes(year, Emissions, color = type))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")

## close png
dev.off()