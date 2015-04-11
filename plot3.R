# Reads the data and creates the third plot.
source("read_data.R")
hpc <- read_data()
png(filename = "plot3.png", width = 480, height = 480, units = "px", bg = "white")
with(hpc, plot(Time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(hpc, lines(Time, Sub_metering_2, col = "red"))
with(hpc, lines(Time, Sub_metering_3, col = "blue"))
legend("topright", 
       lty = c(1, 1, 1),
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
