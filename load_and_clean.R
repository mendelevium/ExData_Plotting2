## setwd("~/R")

## variables
unzipPath <- "./data/exdata-data-NEI_data"
filePath <- "./data/exdata-data-NEI_data/"
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"

## create data folder
if (!file.exists("data/exdata-data-NEI_data/")) {
  dir.create("data/exdata-data-NEI_data/")
}

## download and unzip data
if (!file.exists(filePath)) {
  temp <- tempfile()
  download.file(url, temp)
  unzip(temp, exdir = unzipPath)
  unlink(temp)
}

# check if datasets exist in R. If not, load them.
if (!"summaryData" %in% ls()) {
  summaryData <- readRDS("./data/exdata-data-NEI_data/summarySCC_PM25.rds")
}
if (!"sccData" %in% ls()) {
  sccData <- readRDS("./data/exdata-data-NEI_data/Source_Classification_Code.rds")
}
