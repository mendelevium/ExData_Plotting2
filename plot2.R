## load and clean 
source("load_and_clean.R")

## create png in the workspace
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot2.png", 
    width = 480, height = 480, 
    units = "px")

## data preparation
subset <- summaryData[summaryData$fips == "24510", ]
totalEmissions <- aggregate(subset$Emissions, list(subset$year), FUN = "sum")

## plot2
plot(totalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions in Baltimore City from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

## close png
dev.off()