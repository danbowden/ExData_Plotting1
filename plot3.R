## File recreates plot 3 from course project 1
# save to PNG 480 x 480 "plot3.png"
# line chart with 3 sub-meters shown

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
png("plot3.png", width = 480, height = 480)

# plot line chart of kilowatts
with(select_days_df, plot(datetime, Sub_metering_1, type="l", col="black"
                          , xlab ="", ylab="Energy sub metering") )
with(select_days_df, lines(datetime, Sub_metering_2, col="red") )
with(select_days_df, lines(datetime, Sub_metering_3, col="blue") )
legend("topright", lwd=1, col=c("black","red","blue")
       , legend = c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"))

# save to PNG
dev.off()
