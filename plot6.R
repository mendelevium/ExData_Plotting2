## load and clean 
source("load_and_clean.R")

## install.packages("ggplot2")
library(ggplot2)

## create png in the workspace
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot6.png", 
    width = 480, height = 480, 
    units = "px", bg = "transparent")

## data preparation
subset <- summaryData[summaryData$fips == "24510"|summaryData$fips == "06037", ]
motor <- grep("motor", sccData$Short.Name, ignore.case = T)
motor <- sccData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]

## plot6
g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
  scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))

## close png
dev.off()