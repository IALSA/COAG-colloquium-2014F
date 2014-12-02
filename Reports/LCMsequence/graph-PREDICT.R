# rm(list=ls(all=TRUE)) #Clear the memory of variables from previous run. This is not called by knitr, because it's above the first chunk.

require(ggplot2)
require(dplyr)
require(reshape2)

BuildLine <- function( modelName, baseSize=11 ) {
#   modelName<- "m1_R1"
  # Traditional reading in the files
  pathdsp  <- file.path("./Reports/LCMsequence/models/datasets", paste0(modelName,"_dsp.rds"))
  dsp <- readRDS(pathdsp)
  
  ###############################################
  ### graph of prediction
  
  # bgColour<-gray(.95)   # background color
  indLineSz <-.08        # individual line size
  #   indLineSz <-.5        # individual line size
  indLineAl <-.06        # individual line alpha
  #   indLineAl <-1        # individual line alpha
  source("./Scripts/Graphs/AesDefine.R")
  source("./Scripts/Graphs/graphThemes.R")
  
  ds<- dsp %>% dplyr::filter(id %in% c(1:9022))
  # ds<- dsp
  # head(ds)
  
  p<- ggplot2::ggplot(ds, aes(x=timec, y=attend, group=id))
  # geoms
  p <- p + geom_line(aes(x=timec,y=yHat),color=colorRandom,alpha=indLineAl,size=indLineSz, na.rm=T)
  p <- p + geom_line(aes(y=yFE), fill=NA, color=colorFixed, na.rm=T)
  # scales & coordinates
  p <- p + scale_x_continuous(breaks=c(0:11)) 
  p <- p + scale_y_continuous(breaks=seq(0, 8, 1)) 
  p <- p + coord_cartesian(xlim=c(-.5, 11.5), ylim=c(.5, 8.5))
  # themes, guide, and annotations
  p <- p + theme1 
  p <- p + labs(title="How often have you attended a worship service?", x="Years Since 2000", y="Church Attendance")
  #   ggsave(filename="./Models/LCM/graphs/text/m7F_2.png", plot=p, width =5 , height =4) # uncomment to produce graph in lines below the function
  return( p )
  
}
# BuildLine("m0a_F")
# BuildLine("m1_R1")
# BuildLine("m0_R1")
# BuildLine("m1_F")
# BuildLine("m0_F")
