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
par(mfrow = c(2, 2))
with(house_pwcons_interval, {
        plot(as.POSIXct(paste(house_pwcons_interval$Date,house_pwcons_interval$Time), 
                        format = "%d/%m/%Y %H:%M:%S"),
             #strptime(house_pwcons_interval$Time, format = "%H:%M:%S"),  
             as.double(house_pwcons_interval$Global_active_power), 
             type = "l",
             main = "",
             xlab = " ",
             ylab = "Global Active Power(kilowatts)")
        plot(as.POSIXct(paste(house_pwcons_interval$Date,house_pwcons_interval$Time), 
                        format = "%d/%m/%Y %H:%M:%S"),
             as.double(house_pwcons_interval$Voltage), 
             type = "l",
             main = "",
             xlab = "datetime",
             ylab = "Voltage")
        plot(as.POSIXct(paste(house_pwcons_interval$Date,house_pwcons_interval$Time), 
                        format = "%d/%m/%Y %H:%M:%S"),
             as.double(house_pwcons_interval$Sub_metering_1),
             type="l",
             xlab="",
             ylab="Energy sub metering") 
        lines(as.POSIXct(paste(house_pwcons_interval$Date,house_pwcons_interval$Time), 
                         format = "%d/%m/%Y %H:%M:%S"),
              as.double(house_pwcons_interval$Sub_metering_2),col="red")
        lines(as.POSIXct(paste(house_pwcons_interval$Date,house_pwcons_interval$Time), 
                         format = "%d/%m/%Y %H:%M:%S"),
              as.double(house_pwcons_interval$Sub_metering_3),col="blue")
        legend("topright", lty =1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.25)
        plot(as.POSIXct(paste(house_pwcons_interval$Date,house_pwcons_interval$Time), 
                     format = "%d/%m/%Y %H:%M:%S"),
            as.double(house_pwcons_interval$Global_active_power)/10, 
            type = "l",
            main = "",
            xlab = "datetime",
            ylab = "Global_active_power")
        })
dev.copy(png, file = "plot4.png")
dev.off()