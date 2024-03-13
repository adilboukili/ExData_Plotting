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
# Save the line chart as a PNG file
png("plot2.png", width = 1200, height = 800)

# Plot the line chart with days on the x-axis
plot(filtered_data$Global_active_power, 
     type = "l",
     main = "Line Chart of Global Active Power",
     xlab = "Day of the Week",
     ylab = "Global Active Power (kilowatts)",
     col = "red",
     xaxt = "n")  # Suppress default x-axis

# Add custom x-axis with day names
axis(side = 1, at = seq_along(day_names), labels = day_names)

# Close the PNG device
dev.off()