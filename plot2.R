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



png(filename="plot2.png", 
    units="px", 
    width=480, 
    height=480)

plot(gooddata$DateTime,gooddata$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="", type="l" )


dev.off()