## load and clean 
source("load_and_clean.R")

## create png in the workspace
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot1.png", 
    width = 480, height = 480, 
    units = "px")

## data preparation
totalEmissions <- aggregate(summaryData$Emissions, list(summaryData$year), FUN = "sum")

## plot1
plot(totalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in the United States from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

## close png
dev.off()