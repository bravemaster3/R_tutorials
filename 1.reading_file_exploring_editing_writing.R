#Reading a csv file and exploring its content
#read.table funtion (one alternative os read.csv)
air_temp <- read.table("path_to_my_file/air_temperature.csv", header=TRUE, sep=",")
#checking the datatype of the columns
str(air_temp)
#Convert the time column to an actual POSIXct (time) column
air_temp$time<-as.POSIXct(strptime(air_temp$time, "%Y-%m-%d %H:%M:%S", tz=""))
#Check if the new data type of air_temp$time
str(air_temp$time)
#getting date, year, hour, day, minute, second from POSIXct column

air_temp$date<-as.Date(air_temp$time)
air_temp$year <- as.numeric(format(air_temp$time, format="%Y"))
air_temp$month <- as.numeric(format(air_temp$time, format="%m"))
air_temp$day <- as.numeric(format(air_temp$time, format="%d"))
air_temp$hour <- as.numeric(format(air_temp$time, format="%H"))
air_temp$min <- as.numeric(format(air_temp$time, format="%M"))
air_temp$sec <- as.numeric(format(air_temp$time, format="%S"))



#Creating an empty column (NA values)
air_temp$name_column <- NA
#Renaming a column
names(air_temp)["name_column"] <- new_name
#Removing an existing column (new_name that we just renamed)
air_temp$new_name <- NULL

#Saving the final file to disk
write.table(air_temp,"path_to_folder/air_temp_edited.csv", sep=",", 
            append = FALSE, quote = TRUE, 
            eol = "\n", na = "NA", dec = ".", row.names = FALSE,
            col.names = TRUE, qmethod = c("escape", "double")) 

#######
#BONUS#
#######

#What is a function?
#You used many functions in the text
#example: str function
str()
#getting help on how to use the function
help(str)
#A function takes arguments and returns a result
#function(args...)
