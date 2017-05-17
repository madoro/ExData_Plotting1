#### EXPLORATORY DATA ################
## WEEK 1 - COURSE PROJECT 1  


rm(list = ls()) # limpa as variáveis do ambiente


setwd("/home/madoro/Desktop/datascience/4.exploratory_data_analysis/week1")


library(data.table)  # allow fread function
#library(dplyr)       # allow usefull tbl/dataframe functions
#library(plyr)        #  allow revalue function

# Reading files
colum_name<-fread("./data_consumption/household_power_consumption.txt", nrows = 1) # name for the columns
# usa-los para nomer as colunas do ficheiro a importar numa variavel pwatt
# quando faço skip no proximo comando perco os nomes originais do ficheiro txt 
pwatt<-fread("./data_consumption/household_power_consumption.txt", skip = 66637, nrows = 2880, col.names = names(colum_name)) # subset specific rows for 01 and 02 Feb
# Plotting to a PNG file
## Open PNG device; create 'plot1.png' in the working directory
png(file = "plot1.png", width = 480, height = 480, units = "px" )
## Create plot and send to a file (no plot appears on screen)
hist(pwatt$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")

dev.off()## Close the PNG file device



