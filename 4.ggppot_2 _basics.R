
#YDownload and open the file at the folowing address
#https://github.com/bravemaster3/R_tutorials/blob/time_series/data/grassland_meteo_gf.csv

#Read the table (replace the path by your own)
g <- read.table("D:/R_tutorials/data/grassland_meteo_gf.csv", header=TRUE, sep=",")
View(g)

#Converting the time column to actual POSIXct object
g$time <- as.POSIXct(g$time, format="%Y-%m-%d %H:%M:%S", tz="GMT") 

#Loading the ggplot2 library
library(ggplot2)
str(g)
#subsetting g
g2 <- g[which(g$time >= as.POSIXct("2016-01-01 00:00:00", format="%Y-%m-%d %H:%M:%S", tz="GMT")),]

###################################STEP BY STEP#####################################################
#Making the frame for plotting:
plot = ggplot(data=g2, aes(x=Tsoil_2cm, y=Tsoil_10cm))
plot
#Adding points:
plot = plot+geom_point(col=1, shape=16,size=1)
plot
#Removing the background (classic theme)
plot = plot + theme_classic()
plot
#Making a complete box around the plot
plot = plot +theme(panel.background = element_rect(color = "black", linetype = "solid"))
plot

###################################END#############################################################

#######################Now ploting many graphs and arranging them using ggpubr libary######################
plot1 <- ggplot(data=g2, aes(x=Tsoil_2cm, y=Tsoil_10cm))+
  geom_point(col=1, shape=16,size=1)+#here is where you put all the arguments of the points
  theme_classic() +
  theme(panel.background = element_rect(
    color = "black"))


plot2 <- ggplot(data=g2, aes(x=Tair, y=Rg))+
  geom_point(col=1, shape=16,size=1)+#here is where you put all the arguments of the points
  theme_classic() +
  theme(panel.background = element_rect(
    color = "black", 
    linetype = "solid"))

#Arranging only the 2 previous horizontaly or verticallt
library(ggpubr)
ggarrange(plot1,plot2, nrow = 2, align = "v", common.legend = TRUE)
ggarrange(plot1,plot2, nrow=1, ncol = 2, align = "h", common.legend = TRUE)


#Let's add some more plots and use vertical and horizontal alignments
plot3 <- ggplot(data=g2, aes(y=NEE, x=time))+
  geom_point(col=1, shape=16,size=1)+#here is where you put all the arguments of the points
  theme_classic() +
  theme(panel.background = element_rect(
    color = "black", 
    linetype = "solid"))

plot4 <- ggplot(data=g2, aes(y=Tair, x=time))+
  geom_point(col=1, shape=16,size=1)+#here is where you put all the arguments of the points
  theme_classic() +
  theme(panel.background = element_rect(
    color = "black", 
    linetype = "solid"))+
  #theme(panel.grid = element_blank())+
  theme(legend.position="top",axis.title.y = element_text(colour = "black"),axis.text.y=element_text(colour="black"))

plot5 <- ggplot(data=g2, aes(y=Rg, x=time))+
  geom_point(col=1, shape=16,size=1)+#here is where you put all the arguments of the points
  theme_classic() +
  theme(panel.background = element_rect(
    color = "black", 
    linetype = "solid"))+
  #theme(panel.grid = element_blank())+
  theme(legend.position="top",axis.title.y = element_text(colour = "black"),axis.text.y=element_text(colour="black"))


plot6 <- ggplot(data=g2, aes(x=time, y=Tsoil_20cm))+
  geom_point(col=1, shape=16,size=1)+#here is where you put all the arguments of the points
  theme_classic() +
  theme(panel.background = element_rect(
    color = "black", 
    linetype = "solid"))+
  #theme(panel.grid = element_blank())+
  theme(legend.position="top",axis.title.y = element_text(colour = "black"),axis.text.y=element_text(colour="black"))


ggarrange(plot3,plot4,plot5,plot6, nrow = 2, ncol=2, align = "hv", common.legend = TRUE)
ggarrange(plot3,plot4,plot5,plot6, nrow = 4, align = "v", common.legend = TRUE)

###########################################################END###############################################

#Let's add another graph with both air temerature and soil temperature with different colors
plot7 <- ggplot(data=g2, aes(x=time, y=Tair))+
  geom_point(col=1, shape=16,size=1)+#here is where you put all the arguments of the points
  geom_point(aes(x=time, y=Tsoil_20cm),col=2, shape=16,size=1)+
  theme_classic() +
  theme(panel.background = element_rect(
    color = "black", 
    linetype = "solid"))+
  scale_color_continuous(name = "ltitle") +
  scale_fill_manual(values = c("black", "red"))+
  #theme(panel.grid = element_blank())+
  theme(legend.position=c(0, 1), legend.justification = c(0,1), axis.title.y = element_text(colour = "black"),axis.text.y=element_text(colour="black"))

plot7

plot8 <- ggplot(data=g2, aes(x=time, y=Tair))+
  geom_point(col=1, shape=16,size=1)+#here is where you put all the arguments of the points
  geom_line(aes(x=time, y=Tsoil_20cm),col=2,size=1)+
  theme_classic() +
  theme(panel.background = element_rect(
    color = "black", 
    linetype = "solid"))+
  scale_color_continuous(name = "ltitle") +
  scale_fill_manual(values = c("black", "red"))+
  #theme(panel.grid = element_blank())+
  theme(legend.position=c(0, 1), legend.justification = c(0,1), axis.title.y = element_text(colour = "black"),axis.text.y=element_text(colour="black"))

plot8
