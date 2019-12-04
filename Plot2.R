#reading data
household_power_consumption <- read.csv("C:/Users/alk16/OneDrive/Desktop/datasciencecoursera/datasciencecoursera/household_power_consumption.txt", sep=";", stringsAsFactors=FALSE)

#convert date from string to date format
household_power_consumption$Date <- as.Date(household_power_consumption$Date,"%d/%m/%Y")

#subset data to only 2/1/07 and 2/2/07 dates
subset <- subset(household_power_consumption,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))

#combine date and time
subset$DateTime <- paste(subset$Date,subset$Time)
subset$DateTime <- strptime(subset$DateTime,"%Y-%m-%d %H:%M:%S")

#pull out data to be plotted 
x <- subset$DateTime
y <- as.numeric(subset$Global_active_power)

#open graphics device
png(filename="plot2.png", width = 480, height = 480, units = "px")

#develop graph
plot(x,y,xlab="",ylab="Global Active Power (kilowatts)",type="l")

#close graphics device
dev.off()
