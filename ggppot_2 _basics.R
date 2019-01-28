g <- read.table("D:/R_tutorials/data/grassland_meteo_gf.csv", header=TRUE, sep=",")
View(g)

g$time <- as.POSIXct(g$time, format="%Y-%m-%d %H:%M:%S", tz="GMT") 

library(ggplot2)
str(g)
#subsetting g
g2 <- g[which(g$time >= as.POSIXct("2016-01-01 00:00:00", format="%Y-%m-%d %H:%M:%S", tz="GMT")),]
#x=Rg, y=Tair
plot1 <- ggplot(data=g2, aes(x=Tsoil_2cm, y=Tsoil_10cm))+
  geom_point(col=1, shape=16,size=1)+#here is where you put all the arguments of the points
  theme_classic() +
  theme(panel.background = element_rect(
    color = "black", 
    linetype = "solid"))+
  #theme(panel.grid = element_blank())+
  theme(legend.position="top",axis.title.y = element_text(colour = "black"),axis.text.y=element_text(colour="black"))


plot2 <- ggplot(data=g2, aes(x=Tair, y=Rg))+
  geom_point(col=1, shape=16,size=1)+#here is where you put all the arguments of the points
  theme_classic() +
  theme(panel.background = element_rect(
    color = "black", 
    linetype = "solid"))+
  #theme(panel.grid = element_blank())+
  theme(legend.position="top",axis.title.y = element_text(colour = "black"),axis.text.y=element_text(colour="black"))


library(ggpubr)
ggarrange(plot1,plot2, nrow = 2, align = "v", common.legend = TRUE)


plot3 <- ggplot(data=g2, aes(y=NEE, x=time))+
  geom_point(col=1, shape=16,size=1)+#here is where you put all the arguments of the points
  theme_classic() +
  theme(panel.background = element_rect(
    color = "black", 
    linetype = "solid"))+
  #theme(panel.grid = element_blank())+
  theme(legend.position="top",axis.title.y = element_text(colour = "black"),axis.text.y=element_text(colour="black"))

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


ggarrange(plot3,plot4,plot5,plot6, nrow = 4, align = "v", common.legend = TRUE)
