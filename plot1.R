plot1 <- function(){
        
        filename_zip <- "exdata_data_household_power_consumption.zip"
        filename <- "household_power_consumption.txt"
        
        ## if the file doesn't existe, then download and unzip it
        if(!file.exists(filename)){
                unzip(filename_zip)
        }
        
        ## read file, set col names and generates png file
        data_subset <- read.table(text = grep("^[1,2]/2/2007",readLines(filename),
                value=TRUE), sep = ';', na.strings = '?')
        colnames(data_subset)=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                         "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        png(filename = "./plot1.png", width = 480, height = 480, units='px')
        with(data_subset, hist(Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
        dev.off()
}