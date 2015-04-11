# Reads the data and creates the first plot.
source("read_data.R")
hpc <- read_data()
png(filename = "plot1.png", width = 480, height = 480, units = "px", bg = "white")
hist(hpc$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)",
     col = "red")
dev.off()
