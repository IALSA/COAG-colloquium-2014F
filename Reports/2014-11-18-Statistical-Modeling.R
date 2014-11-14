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

## @knitr dsM01
dsM <- dplyr::filter(dsL, id == 1) %>% 
  dplyr::select(id, year, attend, attendF)
dsM

## @knitr dsM02
dsM <- dplyr::filter(dsL, id %in% c(1,23)) %>% 
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

