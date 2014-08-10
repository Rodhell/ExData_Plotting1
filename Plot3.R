#setwd("put here the directory where you sabed the txt file") than run this code whith no #

#Read the file into HPC (Household Power Consumption) dataframe:
hpc=read.table("household_power_consumption.txt", header = T , sep = ";")

#First we will extract data from the only 2-day period we want to look at into 
#a subset of HPC dataframe adn then convert the  Date Variable by using as.Date and :
extract <- subset(hpc, Date == '1/2/2007' | Date == '2/2/2007')
extract$Date=as.Date(extract$Date, format = "%d/%m/%Y")

#Now we have to format Time variable to a Date-Time format using strptime funcition
#and make the others numeric:
datetime=paste(as.character(extract$Date), as.character(extract$Time))
extract$Time = strptime(datetime,format="%Y-%m-%d %H:%M")
#Factor-numeric
for (i in 3:9)
{extract[ , i] = as.character(extract[ , i])}
plot3 = extract
for (i in 3:9)
{extract[ , i] = as.numeric(extract[ , i])}
plot3 = extract

#Now we have our dataframe formated we can create our PNG file with a 
#width of 480 pixels and a height of 480 pixels and transparent background:
#Plot 3
png("Plot3.png", width = 480, height = 480, bg = "transparent")
plot(plot3$Time, plot3$Sub_metering_1, ylab = "Energy sub metering", type = "l", xlab = "")
lines(plot3$Time, plot3$Sub_metering_2, type = "l", col = "red")
lines(plot3$Time, plot3$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lty = c(1,1,1), col = c("black","red","blue"))
dev.off()

# i'm from Brasil, so you will see "qui", "sex", "sab" instead of "thu", "fri", "Sat", but that's right! 
# the fact is, i dont know how to change to english, but if you run this code on your machine everything
# will be all right
