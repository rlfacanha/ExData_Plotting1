library(data.table)
#Download dataset file and unzip it
dataset_url <-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(dataset_url, "exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip")
#Read dataset and load into data table object
#colnames_attrib <- fread(paste(homedir, "/UCI HAR Dataset/features.txt", sep = ""))
household_powercons <- read.table("household_power_consumption.txt", sep = ";",header = TRUE)
house_pwcons_interval <- subset(household_powercons, 
as.Date(Date,format = "%d/%m/%Y")  >= as.Date("01/02/2007", format = "%d/%m/%Y") 
& as.Date(Date,format = "%d/%m/%Y") < as.Date("03/02/2007", format = "%d/%m/%Y"))
with(house_pwcons_interval,plot(as.POSIXct(paste(house_pwcons_interval$Date,house_pwcons_interval$Time), 
                                           format = "%d/%m/%Y %H:%M:%S"),
                                as.double(house_pwcons_interval$Sub_metering_1),
                                type="l",
                                xlab="",
                                ylab="Energy sub metering"))
with(house_pwcons_interval,lines(as.POSIXct(paste(house_pwcons_interval$Date,house_pwcons_interval$Time), 
                                            format = "%d/%m/%Y %H:%M:%S"),
                                 as.double(house_pwcons_interval$Sub_metering_2),col="red"))
with(house_pwcons_interval,lines(as.POSIXct(paste(house_pwcons_interval$Date,house_pwcons_interval$Time), 
                                            format = "%d/%m/%Y %H:%M:%S"),
                                 as.double(house_pwcons_interval$Sub_metering_3),col="blue"))
legend("topright", lty =1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.7)
dev.copy(png, file = "plot3.png")
dev.off()
