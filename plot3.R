setwd("~/GitHub/ExData_Plotting1")

mydata <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt",sep=";", header=TRUE)
mydata$Dateconv <- as.Date(mydata$Date,"%d/%m/%Y")
#gooddata1 <- subset(mydata, Dateconv == as.Date("2007-02-01","%Y-%m-%d") )
#gooddata2 <- subset(mydata, Dateconv == as.Date("2007-02-02","%Y-%m-%d") )
gooddata1 <- subset(mydata, Dateconv == as.Date("2007-02-01") )
gooddata2 <- subset(mydata, Dateconv == as.Date("2007-02-02") )
gooddata <- rbind(gooddata1,gooddata2)
gooddata$DateTime <- strptime(paste(gooddata[,1],gooddata[,2]),"%d/%m/20%y %H:%M:%S")

gooddata$Global_active_power_kw <- (as.numeric(gooddata$Global_active_power)) / 500
gooddata$Sub_Metering_1 <- as.numeric(gooddata$Sub_metering_1)
gooddata$Sub_Metering_2 <- as.numeric(gooddata$Sub_metering_2)
gooddata$Sub_Metering_3 <- as.numeric(gooddata$Sub_metering_3)


png(filename="plot3.png", 
    units="px", 
    width=480, 
    height=480)

with (gooddata, {
  plot (x= DateTime, y= Sub_metering_1,type ="l",
        xlab ="",
        ylab = "Energy sub metering")  
  lines (x= DateTime, y= Sub_metering_2, col ="red")
  lines (x= DateTime, y= Sub_metering_3, col ="blue")    
  legend("topright" ,  
         c("Sub_metering_1 ","Sub_metering_2","Sub_metering_3"), 
         lty=c(1,1,1), 
         bty="o",
         lwd=c(2.5,2.5,2.5),col=c("black", "red","blue"))  
}
)

dev.off()