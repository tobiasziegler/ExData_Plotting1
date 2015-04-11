# Reads the data, downloading it if required.
# Returns only the subset of data to be used in the plotting exercises.
read_data <- function() {
  lclData <- "data/Household_power_consumption.txt"
  if(!file.exists(lclData)) {
    download_data()
  }
  hpc_data <- read.table(lclData, header = TRUE, sep = ";", na.strings = "?")
  hpc_data$Date <- as.Date(hpc_data$Date, "%d/%m/%Y")
  hpc_data <- hpc_data[hpc_data$Date >= "2007-02-01" & hpc_data$Date <= "2007-02-02", ]
  hpc_data$Time <- paste(hpc_data$Date, hpc_data$Time, sep=" ")
  hpc_data$Time <- strptime(hpc_data$Time, "%Y-%m-%d %H:%M:%S")
  
  return(hpc_data)
}

# Downloads and unzips the data file ready for use.
download_data <- function() {
  dataUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  lclZip <- "data/exdata-data-household_power_consumption.zip"
  if(!file.exists("data")) {
    dir.create("data")
  }
  if(!file.exists(lclZip)) {
    download.file(dataUrl, lclZip, method = "curl")
  }
  unzip(lclZip, exdir = "data")
}
