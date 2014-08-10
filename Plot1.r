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
plot1=extract

#Now we have our dataframe formated we can create our PNG file with a 
#width of 480 pixels and a height of 480 pixels and transparent background:
#Plot1
png("Plot1.png",width=480,height=480,bg="transparent")
hist(plot1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()