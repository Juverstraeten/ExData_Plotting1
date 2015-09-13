# Loading the data
data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_subset <- data[(data$Date>="2007-02-01" & data$Date<="2007-02-02"),]

# Convert date and time 
datetime <- paste(data_subset$Date, data_subset$Time)
data_subset$Datetime <- as.POSIXct(datetime)

# Convert to numeric
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)
data_subset$Global_reactive_power <- as.numeric(data_subset$Global_reactive_power)
data_subset$Voltage <- as.numeric(data_subset$Voltage)

# Create plot on screen
plot(data_subset$Global_active_power~data_subset$Datetime,
     ylab = "Global Active Power (kilowatts)", xlab="", type="l")

# Create plot on png
dev.copy(png,file="plot2.png", width = 480, height = 480)
dev.off()