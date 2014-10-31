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
source("./Scripts/Data/dsL.R")
str(dsL)
head(dsL)


## @knitr graphFinalpreview
baseSize <- 12
plotTheme <- ggplot2::theme_bw() +
  ggplot2::theme_bw(base_size=baseSize)+
  ggplot2::theme(title=ggplot2::element_text(colour="gray20",size = 12)) +
  ggplot2::theme(axis.text=ggplot2::element_text(colour="gray40"))+
  ggplot2::theme(axis.title=ggplot2::element_text(colour="gray40"))+
  ggplot2::theme(panel.border = ggplot2::element_rect(colour="gray80"))+
  ggplot2::theme(axis.ticks.length = grid::unit(0, "cm"))

dsM <- dplyr::filter(dsL,row_number() <= 1000, race != 3 ) %>%
  mutate(yearc=year-2000)
p <- ggplot2::ggplot(dsM,aes(x=yearc,y=attend,group=id))
# geoms
p <- p + geom_line(alpha=.2, linetype="solid", size=.2, color="firebrick", 
                   position = position_jitter(w = 0.3, h = 0.3))
p <- p + geom_point(alpha=.2, shape=21, color=NA, fill="blue4", size=1.5,
                    position = position_jitter(w = 0.2, h = 0.2))
# scales
p <- p + scale_y_continuous("Church attendance",
                            limits=c(0, 8),
                            breaks=c(1:8))
p <- p + scale_x_continuous("Years since 2000",
                            limits=c(0,11),
                            breaks=c(0:11))
p <- p + facet_grid(sexF~raceF)
# annotations, themes
p <- p + labs(title=paste0("In the past year, how often have you attended a worship service?"))
# p <- p + ylab("Church Attendance")
p <- p + plotTheme
p




## @knitr graph01
dsM <- dplyr::filter(dsL, id==1)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_point()
p
dplyr::filter(dsL, id==1) %>% select(id,year, attend, attendF)

## @knitr graph02  
dsM <- dplyr::filter(dsL, id==1)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p
dplyr::filter(dsL, id==1) %>% select(id,year, attend, attendF)

## @knitr graph03
dsM <- dplyr::filter(dsL, id==1)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p
dplyr::filter(dsL, id==1) %>% select(id,year, attend, attendF)


## @knitr loadTheme
baseSize <- 12
plotTheme <- ggplot2::theme_bw() +
  ggplot2::theme_bw(base_size=baseSize)+
  ggplot2::theme(title=ggplot2::element_text(colour="gray20",size = 12)) +
  ggplot2::theme(axis.text=ggplot2::element_text(colour="gray40"))+
  ggplot2::theme(axis.title=ggplot2::element_text(colour="gray40"))+
  ggplot2::theme(panel.border = ggplot2::element_rect(colour="gray80"))+
  ggplot2::theme(axis.ticks.length = grid::unit(0, "cm"))

## @knitr graph04
dsM <- dplyr::filter(dsL, id==1)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + plotTheme
p
dplyr::filter(dsL, id==1) %>% select(id,year, attend, attendF)

## @knitr graph05
dsM <- dplyr::filter(dsL, id==1)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + scale_x_continuous("Year", limits=c(2000,2011), breaks=2000:2011)
p <- p + plotTheme
p
dplyr::filter(dsL, id==1) %>% select(id,year, attend, attendF)

## @knitr graph06
dsM <- dplyr::filter(dsL, id==1)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + scale_x_continuous("Year", limits=c(2000,2011), breaks=2000:2011)
p <- p + scale_y_continuous("Church attendance", limits=c(1,8), breaks=seq(1,8,by=1))
p <- p + plotTheme
p
dplyr::filter(dsL, id==1) %>% select(id,year, attend, attendF)

## @knitr graph07
dsM <- dplyr::filter(dsL, id==1)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + scale_x_continuous("Year", limits=c(2000,2011), breaks=2000:2011)
p <- p + scale_y_continuous("Church attendance", limits=c(1,8), breaks=seq(1,8,by=1))
p <- p + labs(title=paste0("In the past year, how often have you attended a worship service?"))
p <- p + plotTheme
p
dplyr::filter(dsL, id==1) %>% select(id,year, attend, attendF)


## @knitr graph08
dsM <- dplyr::filter(dsL,id <= 300)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + scale_x_continuous("Year", limits=c(2000,2011), breaks=2000:2011)
p <- p + scale_y_continuous("Church attendance", limits=c(1,8), breaks=seq(1,8,by=1))
p <- p + labs(title=paste0("In the past year, how often have you attended a worship service?"))
p <- p + plotTheme
p
dplyr::filter(dsL, id==1) %>% select(id,year, attend, attendF)

## @knitr graph09
dsM <- dplyr::filter(dsL,id <= 300)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend, group=id))
p <- p + geom_line()
p <- p + geom_point()
p <- p + scale_x_continuous("Year", limits=c(2000,2011), breaks=2000:2011)
p <- p + scale_y_continuous("Church attendance", limits=c(1,8), breaks=seq(1,8,by=1))
p <- p + labs(title=paste0("In the past year, how often have you attended a worship service?"))
p <- p + plotTheme
p
dplyr::filter(dsL, id==1) %>% select(id,year, attend, attendF)

## @knitr graph10
dsM <- dplyr::filter(dsL,id <= 300)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend, group=id))
p <- p + geom_line(alpha=.2, linetype="solid", size=.2, color="firebrick", 
                   position = position_jitter(w = 0.3, h = 0.3))
p <- p + geom_point(alpha=.2, shape=21, color=NA, fill="blue4", size=1.5,
                    position = position_jitter(w = 0.2, h = 0.2))
p <- p + scale_x_continuous("Year", limits=c(2000,2011), breaks=2000:2011)
p <- p + scale_y_continuous("Church attendance", limits=c(1,8), breaks=seq(1,8,by=1))
p <- p + labs(title=paste0("In the past year, how often have you attended a worship service?"))
p <- p + plotTheme
p
dplyr::filter(dsL, id==1) %>% select(id,year, attend, attendF)



## @knitr graph11
dsM <- dplyr::filter(dsL,id <= 300)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend, group=id))
p <- p + geom_line(alpha=.2, linetype="solid", size=.2, color="firebrick", 
                   position = position_jitter(w = 0.3, h = 0.3))
p <- p + geom_point(alpha=.2, shape=21, color=NA, fill="blue4", size=1.5,
                    position = position_jitter(w = 0.2, h = 0.2))
p <- p + scale_x_continuous("Year", limits=c(2000,2011), breaks=2000:2011)
p <- p + scale_y_continuous("Church attendance", limits=c(1,8), breaks=seq(1,8,by=1))
p <- p + labs(title=paste0("In the past year, how often have you attended a worship service?"))
p <- p + facet_grid(sexF~raceF)
p <- p + plotTheme
p
dplyr::filter(dsL, id==1) %>% select(id,year, attend, attendF)



## @knitr graphFinal
dsM <- dplyr::filter(dsL,row_number() <= 1000, race != 3 ) %>%
  mutate(yearc=year-2000)
p <- ggplot2::ggplot(dsM,aes(x=yearc,y=attend,group=id))
# geoms
p <- p + geom_line(alpha=.2, linetype="solid", size=.2, color="firebrick", 
                   position = position_jitter(w = 0.3, h = 0.3))
p <- p + geom_point(alpha=.2, shape=21, color=NA, fill="blue4", size=1.5,
                   position = position_jitter(w = 0.2, h = 0.2))
# scales
p <- p + scale_y_continuous("Church attendance",
                         limits=c(0, 8),
                         breaks=c(1:8))
p <- p + scale_x_continuous("Years since 2000",
                         limits=c(0,11),
                         breaks=c(0:11))
p <- p + facet_grid(sexF~raceF)
# annotations, themes
p <- p + labs(title=paste0("In the past year, how often have you attended a worship service?"))
# p <- p + ylab("Church Attendance")
p <- p + plotTheme
p

