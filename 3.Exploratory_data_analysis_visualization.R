# An important step in statistics or data analysis in general is the visualization of data.
# Import air_temp_edited to a variable you will name air_temp (output of section 1.reading_file_exploring_editing_writing.R) and do all the necessary (i.e convert factor to time object if necessary)

#Let's make our first graph
plot(Tair~time, data=air_temp) #pretty easy right?
#Let's plot again, specifying the title of the X and Y axis (xlab and ylab)
plot(Tair~time, data=air_temp, xlab="Time", ylab="Air Temperature")
#Changing the color (col), symbol(pch) and size of the points
plot(Tair~time, data=air_temp, xlab="Time", ylab="Air Temperature",col="red")
plot(Tair~time, data=air_temp, xlab="Time", ylab="Air Temperature",col="red", pch=16)
plot(Tair~time, data=air_temp, xlab="Time", ylab="Air Temperature",col="red", pch=16, cex=0.02)

#Let's create a new dataframe in order to try to plot a histogram
