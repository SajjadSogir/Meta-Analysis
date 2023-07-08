
#install.packages(c("meta","metafor","MAd"))
library(meta)
library(metafor)
library(MAd)
Author<-c("Moinr","Kabir","Pranto","Limon","Fazle","Miraz","Ahnaf","Sakib")
n1<-c(131,116,82,87,110,95,79,122)
m1<-c(83.2,75.5,108.5,76.9,83,85.7,79,85.8)
sd1<-c(15.7,14.4,26.7,16.3,12.7,19.9,27.7,24) 
n2<-c(90,118,95,98,116,121,112,86)
m2<-c(82.7,89.9,76.6,102.9,69.3,93.2,101.4,100.1)
sd2<-c(23.7,28.7,27.9,18.7,19,23,16.9,31.1)
Df<-data.frame(Author,n1,m1,sd1,n2,m2,sd2)
Df
#Computes Vector of Standardized Mean Differences(d),Hedges g
CSMD<-compute_dgs(n.1=n1,m.1=m1,sd.1=sd1,n.2=n2,m.2=m2,sd.2=sd2,data=Df)
CSMD
MG<-metagen(TE=CSMD$g,
            seTE =CSMD$se.g,
            studlab =Author,
            data=Df,
            sm = "SMD",
            method.tau ="REML",
            hakn=TRUE,
            title ="Meta analysis for Standardized Mean difference ")
summary(MG)
forest.meta(MG,layout="RevMan5")
