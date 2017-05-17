#### EXPLORATORY DATA ################
## WEEK 1 - COURSE PROJECT 1  


rm(list = ls()) # limpa as variáveis do ambiente


setwd("/home/madoro/Desktop/datascience/4.exploratory_data_analysis/week1")


library(data.table)  # allow fread function
#library(dplyr)       # allow usefull tbl/dataframe functions


# Reading files 
colum_name<-fread("./data_consumption/household_power_consumption.txt", nrows = 1) # name for the columns
# usa-los para nomer as colunas do ficheiro a importar numa variavel pwatt
# quando faço skip no proximo comando perco os nomes originais do ficheiro txt 
pwatt<-fread("./data_consumption/household_power_consumption.txt", skip = 66637, nrows = 2880, col.names = names(colum_name)) # subset specific rows for 01 and 02 Feb

library(lubridate)

pwatt$date_time <- paste(pwatt$Date, pwatt$Time) # add new column with date and time
pwatt$date_time<-dmy_hms(pwatt$date_time) # made the column a date class object

# Plotting to a PNG fild
## Open PNG device; create 'plot1.png' in the working directory
png(file = "plot2.png", width = 480, height = 480,units = "px", pointsize = 12, bg = "white")
## Create plot and send to a file (no plot appears on screen)
plot(pwatt$date_time, pwatt$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)")

dev.off()## Close the PDF file device


