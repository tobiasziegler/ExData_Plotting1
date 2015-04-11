# Reads the data and creates the second plot.
source("read_data.R")
hpc <- read_data()
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
plot(hpc$Time,
     hpc$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()
