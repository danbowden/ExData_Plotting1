## File recreates plot 1 from course project 1
# save to PNG 480 x 480 "plot1.png"
# Global Active Power (histogram of kilowatts)


# read in file
#################
input_df <- read.delim("household_power_consumption.txt",sep=";"
                       , colClasses = c(rep("character",2), rep("numeric",7)) 
                       , na.strings = c(""," ","?"))

# subset data to target dates
select_days_df <- subset(input_df, Date %in% c("1/2/2007","2/2/2007") )

# convert date time fields
select_days_df$datetime <- strptime( paste(select_days_df$Date, select_days_df$Time, sep=" "), "%d/%m/%Y %H:%M:%S" )

# Open the PNG device
png("plot1.png", width = 480, height = 480)

# plot histogram of kilowatts
hist(select_days_df$Global_active_power, col="red"
     ,main = "Global Active Power"
     ,xlab = "Global Active Power (kilowatts)" )

# save to PNG
dev.off()