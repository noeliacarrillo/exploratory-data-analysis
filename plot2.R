plot2 <- function(){
        
        filename_zip <- "exdata_data_household_power_consumption.zip"
        filename <- "household_power_consumption.txt"
        
        ## if the file doesn't existe, then download and unzip it
        if(!file.exists(filename)){
                unzip(filename_zip)
        }

        ## read file, set col names and generates png file
        data_subset$Date<-strptime(data_subset$Date, format = '%d/%m/%Y')
        data_subset <- read.table(text = grep("^[1,2]/2/2007",readLines(filename),
                                       value=TRUE), sep = ';', na.strings = '?')
        colnames(data_subset)=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                         "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        data_subset$Datetime <- as.POSIXct(date_time)
        date_time <- paste(as.Date(data_subset$Date), data_subset$Time)
        png(filename = "./plot2.png", width = 480, height = 480, units='px')
        with(data_subset, plot(Datetime, Global_active_power, xlab="", ylab = "Global Active Power (kilowatts)", type = "l"))
        dev.off()

}