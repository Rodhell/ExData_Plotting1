#setwd("put here the directory where you sabed the txt file") than run this code whith no #

#Read the file into HPC (Household Power Consumption) dataframe:
hpc=read.table("household_power_consumption.txt",sep=";",header=T)

#First we will convert the Date Variable by using as.Date and extract data 
#from the only 2-day period we want to look at into a subset of HPC dataframe:

hpc$Date=as.Date(hpc$Date,format="%d/%m/%Y")

extract=subset(hpc, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))

#Now we have to format Time variable to POSIXlt and make the others numeric:

newdate=paste(as.character(extract$Date),as.character(extract$Time),sep=" ")
newtime=strptime(newdate,format="%Y-%m-%d %H:%M")
extract$Time=newtime

#factor-numeric
for (i in 3:9)
{extract[,i]=as.numeric(as.character(extract[,i]))}
plot4=extract

#Now we have our dataframe formated we can create our PNG file with a 
#width of 480 pixels and a height of 480 pixels and transparent background:
#Plot 4
png("Plot4.png",width=480,height=480,bg="transparent")
par(mfrow=c(2,2))
plot(plot4$Time,plot4$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
plot(plot4$Time,plot4$Voltage,ylab="Voltage",type="l",xlab="datetime")
plot(plot4$Time,plot4$Sub_metering_1,ylab="Energy sub metering",type="l",xlab="")
lines(plot4$Time,plot4$Sub_metering_2,type="l",col="red")
lines(plot4$Time,plot4$Sub_metering_3,type="l",col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
plot(plot4$Time,plot4$Global_reactive_power,ylab="Global_reactive_power",type="l",xlab="datetime")
dev.off()

# i'm from Brasil, so you will see "qui", "sex", "sab" instead of "thu", "fri", "Sat", but that's right! 
# the fact is, i dont know how to change to english, but if you run this code on your machine everything
# will be all right
