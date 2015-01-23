## load and clean 
source("load_and_clean.R")

## create png in the workspace
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot4.png", 
    width = 480, height = 480, 
    units = "px")

## data preparation
coal <- grep("coal", sccData$Short.Name, ignore.case = T)
coal <- sccData[coal, ]
coal <- summaryData[summaryData$SCC %in% coal$SCC, ]
coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")

## plot4
plot(coalEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Coal Combustion-related\n Sources from 1999 to 2008", 
     ylab = expression('Total PM'[2.5]*" Emission"))

## close png
dev.off()