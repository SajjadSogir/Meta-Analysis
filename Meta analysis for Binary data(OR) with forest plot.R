#install.packages("meta")
#=======================Binary data=====================#
library(meta)
event.experiment=c(65,78,79,65,40,78,89,59,33,67)
number.experiment=c(747,765,631,357,484,807,470,646,640,701)
event.control=c(86,71,89,62,64,70,51,69,76,79)
nunmber.control=c(728,293,450,957,928,537,1036,593,448,573)
id=LETTERS[1:10]
data_binary<-data.frame(id,event.experiment,
                        number.experiment,
                        event.control,
                        nunmber.control)
meta_bin<-metabin(event.e = event.experiment,
                  n.e =number.experiment,
                  event.c =event.control,
                  n.c = nunmber.control,
                  studlab =id,
                  data=data_binary,
                  method ="MH",
                  sm="OR",
                  MH.exact =TRUE,
                  method.tau="PM",
                  hakn = TRUE,
                  title = "Meta analysis of Binary data based on OR"
)
summary(meta_bin)
forest.meta(meta_bin,layout = "RevMan5")
forest.meta(meta_bin,layout = "RevMan5",fontsize = 5, spacing = .7)