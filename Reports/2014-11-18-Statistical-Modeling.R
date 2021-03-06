# Clear memory from previous runs
base::rm(list=base::ls(all=TRUE))


## @knitr LoadPackages
# Load the necessary packages.
base::require(base)
base::require(knitr)
base::require(markdown)
base::require(testit)
base::require(dplyr)
base::require(reshape2)
base::require(stringr)
base::require(stats)
base::require(ggplot2)

## @knitr DeclareGlobals


## @knitr LoadData
# loads basic NLSY97-religiosity data as defined in COAG-Colloquium-2014F repository
dsL <- readRDS("./Data/Derived/dsL.rds")



## @knitr loadTheme
baseSize <- 12
### <b>
plotTheme <- ggplot2::theme_bw() +
  ### </b>
  ggplot2::theme_bw(base_size=baseSize)+
  ggplot2::theme(title=ggplot2::element_text(colour="gray20",size = baseSize + 3)) +
  ggplot2::theme(axis.text=ggplot2::element_text(colour="gray40", size= baseSize - 2))+
  ggplot2::theme(axis.title.x=ggplot2::element_text(colour="gray40", size = baseSize + 2, vjust=-.3))+
  ggplot2::theme(axis.title.y=ggplot2::element_text(colour="gray40", size = baseSize + 2, vjust=1.3))+
  ggplot2::theme(panel.border = ggplot2::element_rect(colour="gray80"))+
  ggplot2::theme(axis.ticks.length = grid::unit(0, "cm"))

## @knitr dsM00
dsM <- dplyr::filter(dsL, id == 1) %>% 
  dplyr::select(id, year, attend, attendF)
dsM


## @knitr graphBasic
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line() + geom_point() + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(1,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p 


## @knitr graphFullPrevious
dsM <- dplyr::filter(dsL, id <=300, 
                     raceF != "Mixed (Non-H)") %>% 
  dplyr::select(id,sexF,raceF,year,attend,attendF) %>%
  dplyr::mutate(yearc = year - 2000)
#  
p <- ggplot2::ggplot(dsM,aes(x=yearc,y=attend))
p <- p + geom_line(aes(group=id), color='firebrick',
           alpha=.2,
           position=position_jitter(w=0.3, h=0.3))
p <- p + geom_point(shape=21, color=NA, fill="blue4",
           alpha=.4, size=1, 
           position=position_jitter(w=0.3, h=0.3))
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(0,11),
                            breaks=c(0:11))
p <- p + scale_y_continuous(limits=c(0,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
 title="How often did you attend worship last year?",
 x="Years since 2000", y="Church attendance"))
p <- p + facet_grid(sexF~raceF)
p



## @knitr dsM01
dsM <- dplyr::filter(dsL, id == 1) %>%
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend)
dsM
## @knitr graph01
source("./Scripts/Graphs/basicTrajectory.R")
p


## @knitr dsM02
dsM <- dplyr::filter(dsL, id == 2) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend)
dsM

## @knitr graph02
source("./Scripts/Graphs/basicTrajectory.R")
p


## @knitr dsM03
dsM <- dplyr::filter(dsL, id == 3) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend)
dsM

## @knitr graph03
source("./Scripts/Graphs/basicTrajectory.R")
p

## @knitr dsM04
dsM <- dplyr::filter(dsL, id == 4) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend)
dsM

## @knitr graph04
source("./Scripts/Graphs/basicTrajectory.R")
p


## @knitr dsM04a
dsM <- dplyr::filter(dsL, id <= 300) %>% 
  dplyr::filter(ave((!is.na(attend)), id, FUN = all)) %>%
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
dplyr::filter(dsM,row_number()<15)
## @knitr graph04a
source("./Scripts/Graphs/basicTrajectory300.R")
p

## @knitr graph08
source("./Scripts/Graphs/basicTrajectory.R")
p <- p + geom_point(aes(x=3,y=1), size=7, shape="O", color="red")
p


## @knitr graph11
source("./Scripts/Graphs/basicTrajectory.R")
p <- p + geom_point(aes(x=1,y=6), size=7, shape="O", color="red")
p





## @knitr dsM12
dsM <- dplyr::filter(dsL, id == 1) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend)
dsM$model <- 4
dsM
## @knitr graph12
source("./Scripts/Graphs/basicTrajectory.R")
p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.5, alpha=.3)
p
## @knitr graph12error
source("./Scripts/Graphs/basicTrajectory.R")
p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.5, alpha=.3)
p <- p + annotate("segment", x=0, xend=0, y=1, yend=4, color="red", size=1.5, alpha=.4)
p <- p + annotate("segment", x=1, xend=1, y=6, yend=4, color="red", size=1.5, alpha=.4)
p <- p + annotate("segment", x=2, xend=2, y=2, yend=4, color="red", size=1.5, alpha=.4)
p <- p + annotate("segment", x=3, xend=3, y=1, yend=4, color="red", size=1.5, alpha=.4)
p <- p + annotate("segment", x=4, xend=4, y=1, yend=4, color="red", size=1.5, alpha=.4)
p <- p + annotate("segment", x=5, xend=5, y=1, yend=4, color="red", size=1.5, alpha=.4)
p <- p + annotate("segment", x=6, xend=6, y=1, yend=4, color="red", size=1.5, alpha=.4)
p <- p + annotate("segment", x=7, xend=7, y=1, yend=4, color="red", size=1.5, alpha=.4)
p <- p + annotate("segment", x=8, xend=8, y=1, yend=4, color="red", size=1.5, alpha=.4)
p <- p + annotate("segment", x=9, xend=9, y=1, yend=4, color="red", size=1.5, alpha=.4)
p <- p + annotate("segment", x=10, xend=10, y=1, yend=4, color="red", size=1.5, alpha=.4)
p <- p + annotate("segment", x=11, xend=11, y=1, yend=4, color="red", size=1.5, alpha=.4)
p

## @knitr dsM13
dsM <- dplyr::filter(dsL, id == 1) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
dsM$model <- 4 - dsM$time
dsM
## @knitr graph13
source("./Scripts/Graphs/basicTrajectory.R")
p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.5, alpha=.3)
p


## @knitr dsM14
dsM <- dplyr::filter(dsL, id == 1) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
dsM$model <- 4 - (.2)*dsM$time
dsM
## @knitr graph14
source("./Scripts/Graphs/basicTrajectory.R")
p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.5, alpha=.3)
p



## @knitr dsM15
dsM <- dplyr::filter(dsL, id == 2) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
dsM$model <- 1.8 + (.05)*dsM$time
dsM
## @knitr graph15
source("./Scripts/Graphs/basicTrajectory.R")
p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.5, alpha=.3)
p



## @knitr dsM16
dsM <- dplyr::filter(dsL, id == 3) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
dsM$model <- 2 + (.17)*dsM$time
dsM
## @knitr graph16
source("./Scripts/Graphs/basicTrajectory.R")
p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.5, alpha=.3)
p



## @knitr dsM17
dsM <- dplyr::filter(dsL, id == 4) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
dsM$model <- 1.5 + (.22)*dsM$time
dsM
## @knitr graph17
source("./Scripts/Graphs/basicTrajectory.R")
p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.5, alpha=.3)
p


## @knitr dsM18
dsM <- dplyr::filter(dsL, id <= 4) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
dsM$model <- 3 - (.14)*dsM$time
dplyr::filter(dsM,id==1)
## @knitr dsM18a
dsM <- dplyr::filter(dsL, id <= 4) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
# 
dplyr::filter(dsM,id==1)
## @knitr graph18
p <- ggplot2::ggplot(dsM,aes(x=time,y=attend))
p <- p + geom_line(aes(group=id), color='firebrick',
                   alpha=.2,
                   position=position_jitter(w=0.1, h=0.1))
p <- p + geom_point(shape=1, color="black", fill=NA,                 
                    alpha=.4, size=2, 
                    position=position_jitter(w=0.1, h=0.1))
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(-.5,11),
                            breaks=c(0:11))
p <- p + scale_y_continuous(limits=c(-.5,8.5), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Time scale: years since 2000", y="Church attendance"))
#
p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.5, alpha=.3)
p
## @knitr graph18a
p <- ggplot2::ggplot(dsM,aes(x=time,y=attend))
p <- p + geom_line(aes(group=id), color='firebrick',
                   alpha=.2,
                   position=position_jitter(w=0.1, h=0.1))
p <- p + geom_point(shape=1, color="black", fill=NA,                 
                    alpha=.4, size=2, 
                    position=position_jitter(w=0.1, h=0.1))
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(-.5,11),
                            breaks=c(0:11))
p <- p + scale_y_continuous(limits=c(-.5,8.5), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Time scale: years since 2000", y="Church attendance"))
#
# p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.5, alpha=.3)
p



## @knitr dsM19
dsM <- dplyr::filter(dsL, id <= 300) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
dsM$model <- 3.5 - (.25)*dsM$time
dplyr::filter(dsM,id==1)
## @knitr dsM19a
dsM <- dplyr::filter(dsL, id <= 300) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
#
dplyr::filter(dsM,id==1)
## @knitr graph19a
source("./Scripts/Graphs/basicTrajectory300.R")
# p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.7, alpha=.5)
p
## @knitr graph19
source("./Scripts/Graphs/basicTrajectory300.R")
p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.7, alpha=.5)
p


## @knitr dsM20
dsM <- dplyr::filter(dsL, id <= 300) %>% 
  dplyr::filter(ave((!is.na(attend)), id, FUN = all)) %>%
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
### <b>
model <- nlme::gls(attend ~ 1, data=dsM)
dsM$model <- predict(model)
### </b>
dplyr::filter(dsM,id==1)
## @knitr graph20
source("./Scripts/Graphs/basicTrajectory300.R")
p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.7, alpha=.5)
p







## @knitr dsM21
dsM <- dplyr::filter(dsL, id <= 300) %>% 
  dplyr::filter(ave((!is.na(attend)), id, FUN = all)) %>%
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend) 
### <b>
model <- nlme::gls(attend ~ 1 + time, data=dsM)
dsM$model <- predict(model)
### </b>
dplyr::filter(dsM,id==1)
## @knitr graph21
source("./Scripts/Graphs/basicTrajectory300.R")
p <- p + geom_line(aes(y=model), color="blue4", linetype="solid", size=1.7, alpha=.5)
p


## @knitr dsM22a
dsM <- dplyr::filter(dsL, id <= 300) %>% 
  dplyr::filter(ave((!is.na(attend)), id, FUN = all)) %>%
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend)
### <b>
modelA <- nlme::gls(attend ~ 1       , data=dsM)
### </b>
modelB <- nlme::gls(attend ~ 1 + time, data=dsM)
### <b>
dsM$modelA <- predict(modelA)
### </b>
dsM$modelB <- predict(modelB)
dplyr::filter(dsM,id==1)


## @knitr dsM22b
dsM <- dplyr::filter(dsL, id <= 300) %>% 
  dplyr::filter(ave((!is.na(attend)), id, FUN = all)) %>%
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend)
modelA <- nlme::gls(attend ~ 1       , data=dsM)
### <b>
modelB <- nlme::gls(attend ~ 1 + time, data=dsM)
### </b>
dsM$modelA <- predict(modelA)
### <b>
dsM$modelB <- predict(modelB)
### </b>
dplyr::filter(dsM,id==1)


## @knitr modelApost
model <- modelA
logLik<- summary(model)$logLik
deviance<- -2*logLik
AIC<- AIC(model)
BIC<- BIC(model)
df.resid<- NA
N<- summary(model)$dims$N
p<- summary(model)$dims$p
ids<- length(unique(dsM$id))
df.resid<- N-p
mInfo<- data.frame("logLik" = logLik, 
                   "deviance"= deviance, 
                   "AIC" = AIC, "BIC" = BIC,
                   "df.resid" = df.resid, "N" = N, 
                   "p" = p, "ids" = ids)
t<- t(mInfo)
rownames(t)<-colnames(mInfo)
dsmInfo<- data.frame(new=t)
colnames(dsmInfo) <- c("modelA")
mA <- dsmInfo

## @knitr modelApostPrint
print(mA)

## @knitr modelBpost
model <- modelB 
logLik<- summary(model)$logLik
deviance<- -2*logLik
AIC<- AIC(model)
BIC<- BIC(model)
df.resid<- NA
N<- summary(model)$dims$N
p<- summary(model)$dims$p
ids<- length(unique(dsM$id))
df.resid<- N-p
mInfo<- data.frame("logLik" = logLik, 
                   "deviance"= deviance, 
                   "AIC" = AIC, "BIC" = BIC,
                   "df.resid" = df.resid, "N" = N, 
                   "p" = p, "ids" = ids)
t<- t(mInfo)
rownames(t)<-colnames(mInfo)
dsmInfo<- data.frame(new=t)
colnames(dsmInfo) <- c("modelB")
mB <- dsmInfo


## @knitr modelBpostPrint
print(mB)


## @knitr modelsABpost
models <- data.frame(cbind(mA,mB))
models <- dplyr::mutate(models, 
  dif = round(modelB - modelA,2), 
Index = rownames(dsmInfo))



