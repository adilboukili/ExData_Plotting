# Read the text file
data <- read.table("household.txt", header = TRUE, sep = ";", dec = ".", strip.white = TRUE)

# Remove rows containing "?"
data <- data[data$Global_active_power != "?", ]

# Convert the column to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# Convert Date to Date class
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Filter data for dates 2007-02-01 and 2007-02-02
filtered_data <- subset(data, Date %in% as.Date(c("2007-02-01", "2007-02-02")))

# Convert the dates to abbreviated day names
day_names <- format(filtered_data$Date, "%a")

# Create a line chart of Global_active_power for selected dates
# Create a line chart of Sub_metering_1, Sub_metering_2, and Sub_metering_3 for selected dates
# Create a line chart of Voltage for selected dates
# Create a line chart of Global_reactive_power for selected dates
# Save the line charts as a PNG file
png("plot4.png", width = 1200, height = 800)

# Set up the layout for multiple plots
par(mfrow = c(2, 2))

# Plot the line charts with days on the x-axis
plot(filtered_data$Global_active_power, 
     type = "l",
     main = "Global Active Power",
     xlab = "Day of the Week",
     ylab = "Global Active Power (kilowatts)",
     col = "red",
     xaxt = "n")  # Suppress default x-axis
axis(side = 1, at = seq_along(day_names), labels = day_names)

plot(filtered_data$Sub_metering_1, 
     type = "l",
     main = "Sub Meterings",
     xlab = "Day of the Week",
     ylab = "Sub Metering (kilowatts)",
     col = "red",
     xaxt = "n")  # Suppress default x-axis
lines(filtered_data$Sub_metering_2, col = "blue")
lines(filtered_data$Sub_metering_3, col = "green")
axis(side = 1, at = seq_along(day_names), labels = day_names)

plot(filtered_data$Voltage, 
     type = "l",
     main = "Voltage",
     xlab = "Day of the Week",
     ylab = "Voltage",
     col = "red",
     xaxt = "n")  # Suppress default x-axis
axis(side = 1, at = seq_along(day_names), labels = day_names)

plot(filtered_data$Global_reactive_power, 
     type = "l",
     main = "Global Reactive Power",
     xlab = "Day of the Week",
     ylab = "Global Reactive Power",
     col = "red",
     xaxt = "n")  # Suppress default x-axis
axis(side = 1, at = seq_along(day_names), labels = day_names)

# Close the PNG device
dev.off()
