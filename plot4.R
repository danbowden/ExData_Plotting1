## File recreates plot 4 from course project 1
# save to PNG 480 x 480 "plot4.png"
# multi-plot 2x2 matrix (global active power, voltage, sub metering, reactive power)


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
png("plot4.png", width = 480, height = 480)

# plot matrix of plots
par(mfrow = c(2,2))  #set 2x2

with(select_days_df, {
    plot(datetime, Global_active_power, type = "l"
         , xlab = "", ylab = "Global Active Power (kilowatts)")
    
    plot(datetime, Voltage, type="l")
    
    plot(datetime, Sub_metering_1, type="l", col="black"
         , xlab ="", ylab="Energy sub metering") 
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", lwd=1, col=c("black","red","blue")
           , legend = c("Sub-metering 1", "Sub-metering 2", "Sub-metering 3"))
    
    plot(datetime, Global_reactive_power, type="l")
     })


# save to PNG
dev.off()
