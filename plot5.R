## load and clean 
source("load_and_clean.R")

## create png in the workspace
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot5.png", 
    width = 480, height = 480, 
    units = "px")

## data preparation
subset <- summaryData[summaryData$fips == "24510", ]
motor <- grep("veh", sccData$Short.Name, ignore.case = T)  ## veh stand for vehicule in Short.Name
motor <- sccData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

## plot5
plot(motorEmissions, type = "l", xlab = "Year", 
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City", 
     ylab = expression('Total PM'[2.5]*" Emission"))

## close png
dev.off()