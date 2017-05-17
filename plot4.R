#### EXPLORATORY DATA ################
## WEEK 1 - COURSE PROJECT 1  


rm(list = ls()) # limpa as variáveis do ambiente


setwd("/home/madoro/Desktop/datascience/4.exploratory_data_analysis/week1")


library(data.table)  # allow fread function

# Reading files 
colum_name<-fread("./data_consumption/household_power_consumption.txt", nrows = 1) # li uma coluna para poder ter os nomes das colunas e
# usa-los para nomer as colunas do ficheiro a importar numa variavel pwatt
# quando faço skip no proximo comando perco os nomes originais do ficheiro txt 
pwatt<-fread("./data_consumption/household_power_consumption.txt", skip = 66637, nrows = 2880, col.names = names(colum_name)) # seleciono linhas que me interessam

library(lubridate)

pwatt$date_time <- paste(pwatt$Date, pwatt$Time) # new column with date and time
pwatt$date_time<-dmy_hms(pwatt$date_time) # made the column a date class object


# Plotting to a PNG fild
## Open PNG device; create 'plot1.png' in the working directory
png(file = "plot4.png", width = 480, height = 480,units = "px", pointsize = 10, bg = "white")

## Create 4 plots and send to a file (no plot appears on screen)
par(mfrow = c(2, 2)) 

#1st plot
plot(pwatt$date_time, pwatt$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")

#2nd plot
plot(pwatt$date_time, pwatt$Voltage, type="l", xlab="datetime", ylab = "Voltage")

#3rd plot
plot(pwatt$date_time, pwatt$Sub_metering_1, type="l", xlab="", ylab = "Energy sub metering")
points(pwatt$date_time, pwatt$Sub_metering_2, type="l", col = "red") # add another points 
points(pwatt$date_time, pwatt$Sub_metering_3, type="l", col = "blue") # add another points
legend("topright", pch = "_", col = c("black", "blue", "red"), box.lwd="", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#4th plot
plot(pwatt$date_time, pwatt$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power")

dev.off() # close the file


