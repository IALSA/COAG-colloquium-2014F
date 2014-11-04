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
source("./Scripts/Data/dsL.R")



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

## @knitr dsM01
dsM <- dplyr::filter(dsL, id == 1) %>% 
  dplyr::select(id, year, attend, attendF)
dsM

## @knitr dsM02
dsM <- dplyr::filter(dsL, id %in% c(1,23)) %>% 
  dplyr::select(id, year, attend, attendF)
dsM


## @knitr graph01
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
### <b>
p <- p + geom_point()
### </b>

p


## @knitr graph02
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
### <b>
p <- p + geom_line()

### </b>
p

## @knitr graph03
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
### <b>
p <- p + geom_line()
p <- p + geom_point()
### </b>
p

## @knitr graph04
p <- ggplot2::ggplot(dsM,aes(x=year))
### <b>
p <- p + geom_line(aes(y=attend))
p <- p + geom_point(aes(y=attend))
### </b>
p


## @knitr graph04a
p <- ggplot2::ggplot(dsM,aes(x=year))
### <b>
p <- p + geom_line(aes(y=attend))
p <- p + geom_point(aes(y=attend))
### </b>

p

## @knitr graph05
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
### <b>
p <- p + plotTheme
### </b>
p


## @knitr graph05a
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + plotTheme

p


## @knitr graph06
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + plotTheme
### <b>
p <- p + scale_x_continuous(limits=c(1995,2015))
### </b>
p


## @knitr graph06a
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(1995,2015))

p



## @knitr graph07
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + plotTheme
### <b>
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
### </b>
p


## @knitr graph08
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + plotTheme
### <b>
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000,2005,2010))
### </b>
p

## @knitr graph09
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
### <b>
p <- p + scale_y_continuous(limits=c(1,8),
                            breaks=seq(1,8, by=1))
### </b>
p


## @knitr graph09a
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
### <b>
p <- p + scale_y_continuous(limits=c(1,8),
                            breaks=seq(2,8, by=2))
### </b>
p


## @knitr graph10
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011),
                            ### <b>
                            "Year of observation")
### </b>
p <- p + scale_y_continuous(limits=c(1,8),
                            breaks=seq(1,8, by=1),
                            ### <b>
                            "Church attendance")
### </b>
p



## @knitr graph11
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011),
                            "Year of observation")
p <- p + scale_y_continuous(limits=c(1,8),
                            breaks=seq(1,8, by=1),
                            "Church attendance")
### <b>
p <- p + ggtitle(
  "How frequently did you attend worship last year?")
### </b>
p


## @knitr graph11a
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line() + geom_point() + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(1,8), breaks=seq(1,8, by=1))
p <- p + labs(list(title="How frequently did you attend worship last year?",
               x="Year of observation", y="Church attendance"))
p



## @knitr graph12
### <b>
dsM <- dplyr::filter(dsL, id %in% c(1,23)) %>% 
  dplyr::select(id, year, attend, attendF)
#
### </b>
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line()
p <- p + geom_point()
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(1,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p


## @knitr graph13
dsM <- dplyr::filter(dsL, id %in% c(1,23)) %>% 
  dplyr::select(id, year, attend, attendF)
#
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
### <b>
p <- p + geom_line(aes(group=id))
### </b>
p <- p + geom_point()
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(1,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p


## @knitr graph14
### <b>
dsM <- dplyr::filter(dsL, id <=300) %>% 
  dplyr::select(id, year, attend, attendF)
### </b>
#  
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line(aes(group=id))
p <- p + geom_point()
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(1,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p


## @knitr graph15
dsM <- dplyr::filter(dsL, id <=300) %>% 
  dplyr::select(id, year, attend, attendF)
#  
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
### <b>
p <- p + geom_line(aes(group=id), 
           position=position_jitter(w=0.3,h=0.3))
### </b>
p <- p + geom_point()
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(0,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p


## @knitr graph16
dsM <- dplyr::filter(dsL, id <=300) %>% 
  dplyr::select(id, year, attend, attendF)
#  
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line(aes(group=id), 
           position=position_jitter(w=0.3, h=0.3))
### <b>
p <- p + geom_point(
           position=position_jitter(w=0.3, h=0.3))
### </b>
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(0,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p

## @knitr graph17
dsM <- dplyr::filter(dsL, id <=300) %>% 
  dplyr::select(id, year, attend, attendF)
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
#  
### <b>
p <- p + geom_line(aes(group=id), color='firebrick',
           position=position_jitter(w=0.3, h=0.3))
### </b>
p <- p + geom_point(
           position=position_jitter(w=0.3, h=0.3))
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(0,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p


## @knitr graph18
dsM <- dplyr::filter(dsL, id <=300) %>% 
  dplyr::select(id, year, attend, attendF)
#  
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line(aes(group=id), color='firebrick',
           position=position_jitter(w=0.3, h=0.3))
### <b>
p <- p + geom_point(shape=21, color=NA, fill="blue4",
### </b>
           position=position_jitter(w=0.3, h=0.3))
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(0,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p

## @knitr graph19
dsM <- dplyr::filter(dsL, id <=300) %>% 
  dplyr::select(id, year, attend, attendF)
#  
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line(aes(group=id), color='firebrick',
### <b>
           alpha=.3,
### </b>
           position=position_jitter(w=0.3, h=0.3))
p <- p + geom_point(shape=21, color=NA, fill="blue4",
### <b>                    
           alpha=.3, 
### </b>
           position=position_jitter(w=0.3, h=0.3))
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(0,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p

## @knitr graph20
dsM <- dplyr::filter(dsL, id <=300) %>% 
  dplyr::select(id, year, attend, attendF)
#  
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line(aes(group=id), color='firebrick',
                   ### <b>
           alpha=.1,
                   ### </b>
           position=position_jitter(w=0.3, h=0.3))
p <- p + geom_point(shape=21, color=NA, fill="blue4",
                    ### <b>                    
           alpha=.2, size=2.2, 
                    ### </b>
           position=position_jitter(w=0.3, h=0.3))
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(0,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p


## @knitr graph21
dsM <- dplyr::filter(dsL, id <=300) %>% 
  dplyr::select(id, year, attend, attendF)
#  
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line(aes(group=id), color='firebrick',
                   ### <b>
           alpha=.1,
                   ### </b>
           position=position_jitter(w=0.3, h=0.3))
p <- p + geom_point(shape=21, color=NA, fill="blue4",
                    ### <b>                    
           alpha=.5, size=.8, 
                    ### </b>
           position=position_jitter(w=0.3, h=0.3))
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(0,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p


## @knitr graph22
dsM <- dplyr::filter(dsL, id <=300) %>% 
  dplyr::select(id, sexF, raceF, year, attend, attendF)
#  
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line(aes(group=id), color='firebrick',
                   ### <b>
           alpha=.1,
                   ### </b>
           position=position_jitter(w=0.3, h=0.3))
p <- p + geom_point(shape=21, color=NA, fill="blue4",
                    ### <b>                    
           alpha=.3, size=1.2, 
                    ### </b>
           position=position_jitter(w=0.3, h=0.3))
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(0,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p <- p + facet_grid(sexF~raceF)
p

## @knitr graph23
dsM <- dplyr::filter(dsL, id <=300, 
                     raceF != "Mixed (Non-H)") %>% 
  dplyr::select(id, sexF, raceF, year, attend, attendF)
#  
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p <- p + geom_line(aes(group=id), color='firebrick',
                   ### <b>
           alpha=.1,
                   ### </b>
           position=position_jitter(w=0.3, h=0.3))
p <- p + geom_point(shape=21, color=NA, fill="blue4",
                    ### <b>                    
                    alpha=.5, size=.8, 
                    ### </b>
                    position=position_jitter(w=0.3, h=0.3))
p <- p + plotTheme
p <- p + scale_x_continuous(limits=c(2000,2011),
                            breaks=c(2000:2011))
p <- p + scale_y_continuous(limits=c(0,8), 
                            breaks=seq(1,8, by=1))
p <- p + labs(list(
  title="How often did you attend worship last year?",
  x="Year of observation", y="Church attendance"))
p <- p + facet_grid(sexF~raceF)
p

## @knitr graph24
dsM <- dplyr::filter(dsL, id <=300, 
                     raceF != "Mixed (Non-H)") %>% 
  dplyr::select(id, sexF, raceF, year, attend, attendF) %>%
### <b>
  dplyr::mutate(yearc = year - 2000)
### </b>
#  
p <- ggplot2::ggplot(dsM,aes(x=yearc,y=attend))
p <- p + geom_line(aes(group=id), color='firebrick',
           alpha=.1,
           position=position_jitter(w=0.3, h=0.3))
p <- p + geom_point(shape=21, color=NA, fill="blue4",
           alpha=.5, size=.8, 
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



## @knitr graph25
dsM <- dplyr::filter(dsL, id <=300, 
                     raceF != "Mixed (Non-H)") %>% 
  dplyr::select(id, sexF, raceF, year, attend, attendF) %>%
  dplyr::mutate(yearc = year - 2000)
#  
p <- ggplot2::ggplot(dsM,aes(x=yearc,y=attend))
p <- p + geom_line(aes(group=id), color='firebrick',
                   ### <b>
           alpha=.2,
                   ### </b>
           position=position_jitter(w=0.3, h=0.3))
p <- p + geom_point(shape=21, color=NA, fill="blue4",
                    ### <b>                    
           alpha=.4, size=1, 
                    ### </b>
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




## @knitr graphFinal
# dsM <- dplyr::filter(dsL,row_number() <= 1000, race != 3 ) %>%
#   mutate(yearc=year-2000)
# p <- ggplot2::ggplot(dsM,aes(x=yearc,y=attend,group=id))
# # geoms
# p <- p + geom_line(alpha=.2, linetype="solid", size=.2, color="firebrick", 
#                    position = position_jitter(w = 0.3, h = 0.3))
# p <- p + geom_point(alpha=.2, shape=21, color=NA, fill="blue4", size=1.5,
#                    position = position_jitter(w = 0.2, h = 0.2))
# # scales
# p <- p + scale_y_continuous("Church attendance",
#                          limits=c(0, 8),
#                          breaks=c(1:8))
# p <- p + scale_x_continuous("Years since 2000",
#                          limits=c(0,11),
#                          breaks=c(0:11))
# p <- p + facet_grid(sexF~raceF)
# # annotations, themes
# p <- p + labs(title=paste0("In the past year, how often have you attended a worship service?"))
# # p <- p + ylab("Church Attendance")
# p <- p + plotTheme
# p

