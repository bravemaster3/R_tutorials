# Previously, we learnt how to read a timeseries of air temperature, explore it and write the edited version to a file.
# Complete this file before:
#1: Read air_temp_edited from disk to a variable named air_temp2


#2: Check the data type of the "time" column


#3: If the time column is not a POSIXct object, then convert it


#Addressing a column of the dataframe
air_temp2[,"year"] #OR
air_temp2$year #both the previous and this line mean all rows, column year
    #You can do the same by replacing "year" by its numer (1 is the first column, time in our case) in the dataframe columns order
#Addressing a row of the dataframe
air_temp2[1,] #This means first row, all columns # If rows had names, 1 could be replaced by the name of the first row. In our case rows don't have names

#From what we've seen previously, addressing rows and columns, we could guess that addressing a cell would be as follows
air_temp2[1,2] #or
air_temp2[1,"Tair"] #means cell at first row and column "Tair"

#subsetting our dataframe
air_temp_2016 <- air_temp2[which(air_temp2$year==2016),] # would return all columns and rows where the column year=2016

#Based on our previous exercise (1.1.reading_file_exploring_editing_writing.R), write air_temp_2016 to a new file on disk, with the name air_temp_sub_2016


