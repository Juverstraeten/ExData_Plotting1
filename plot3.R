# Loading the data
data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_subset <- data[(data$Date>="2007-02-01" & data$Date<="2007-02-02"),]

# Convert date and time 
datetime <- paste(data_subset$Date, data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

# Create plot on screen
with(data_subset, {
      plot(Sub_metering_1~Datetime,
           ylab = "Energy sub metering", xlab="", type="l")
      lines(Sub_metering_2~Datetime,col="Red")
      lines(Sub_metering_3~Datetime,col="Blue")
})

legend("topright", col=c("black","red","blue"),lty=1,lwd=3,legend = c("Sub_metering_1",
                                                          "Sub_metering_2",
                                                          "Sub_metering_3"))

# Create plot on png
dev.copy(png,file="plot3.png", width = 480, height = 480)
dev.off()