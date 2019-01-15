# An important step in statistics or data analysis in general is the visualization of data.
# Import air_temp_edited to a variable you will name air_temp (output of section 1.reading_file_exploring_editing_writing.R) and do all the necessary (i.e convert factor to time object if necessary)

#Let's make our first graph (a scatter plot)
plot(Tair~time, data=air_temp) #pretty easy right?
#Let's plot again, specifying the title of the X and Y axis (xlab and ylab)
plot(Tair~time, data=air_temp, xlab="Time", ylab="Air Temperature")
#Changing the color (col), symbol(pch) and size of the points
plot(Tair~time, data=air_temp, xlab="Time", ylab="Air Temperature",col="red")
plot(Tair~time, data=air_temp, xlab="Time", ylab="Air Temperature",col="red", pch=16)
plot(Tair~time, data=air_temp, xlab="Time", ylab="Air Temperature",col="red", pch=16, cex=0.02)

#Let's create a new dataframe in order to try to plot a histogram
#Try to understand what we did here:
air_temp2 <- unique(air_temp$month[which(!is.na(air_temp$month))])

#convert air_temp2 to a dataframe
air_temp2 <- as.data.frame(air_temp2)
#Check the names of the columns of the dataframe air_temp2
names(air_temp2) #You will notice there is only one column
#Rename the first and only column to "month"
names(air_temp2)[1] <- "month"

#Let's get the mean of air temperature, from dataframe air_temp by month and add it as new column to air_temp2
  #Creating an empty column
air_temp2$mean_temp <- NA
  #Computing the mean into mean_temp
for (i in air_temp2$month){
air_temp2$mean_temp[which(air_temp2$month == i)] <- mean(air_temp$Tair[which(air_temp$month == i)], na.rm=T)
}

#This could have been done simply using the function aggregate:
air_temp3 <- aggregate(Tair~month, data=air_temp,mean)
names(air_temp3)[names(air_temp3)=="Tair"] <- "mean_temp" #Remember this from first module
#Now, lets plot the histograme of mean air temp per month
plot(mean_temp~month, data=air_temp3, type ="h")
#Plot the previous graph, renaming the Y axis to "Mean Temperature", changing the width
#of the bars using the ltw parameter


#################################################################
###Now let's do some more advanced plotting using ggplot2########
#################################################################
#Install the ggplot2 library if you don't have it yet
install.packages("ggplot2")
#Import the library
library(ggplot2)
#First, let's define the ploting area #notice that ggplot works like layers, the first one will define the plotting area
ggplot(data=air_temp, aes(time,Tair))
#Let's add a second layer, that of the points we want to plot
ggplot(data=air_temp, aes(time,Tair))+
  geom_point()


