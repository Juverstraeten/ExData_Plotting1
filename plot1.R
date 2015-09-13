# Loading the data
data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE, stringsAsFactors = FALSE)
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_subset <- data[(data$Date>="2007-02-01" & data$Date<="2007-02-02"),]

# Creating histogram on the screen
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)
hist(data_subset$Global_active_power, main = "Global Active Power", 
     col ="red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Creating histogram on png
dev.copy(png,file="plot1.png", width = 480, height = 480)
dev.off()
