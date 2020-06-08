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
with(house_pwcons_interval, hist(as.double(house_pwcons_interval$Global_active_power), xlab = "Global Active Power", col = "red", main = "Global Active Power"))
dev.copy(png, file = "plot1.png")
dev.off()
