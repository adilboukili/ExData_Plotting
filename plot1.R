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

# Create a histogram of Global_active_power for selected dates
# Save the histogram as a PNG file
png("plot1.png", width = 1200, height = 800)
hist(filtered_data$Global_active_power, 
     main = "Histogram of Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     col = "red", border = "white")
dev.off()  # Close PNG device