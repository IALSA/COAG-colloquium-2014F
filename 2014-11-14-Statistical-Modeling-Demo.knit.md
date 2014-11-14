---
title: "RR Skills (3): Statistical Modeling "
author: Andrey Koval
date: November 18, 2014
output: 
  ioslides_presentation:
    widescreen: true
    transition: faster
  includes:
    in_header: include/in_header.html
---

<!--  Set the working directory to the repository's base directory; this assumes the report is nested inside of only one directory.-->


<!-- Set the report-wide options, and point to the external script file. -->



## Overview of the Series

- Oct 14  -- Intro to Reproducible Research  
- Oct 21  -- RR Basic Skills (1): Data Manipulation
- Oct 28  -- Intro to Latent Class and Latent Transition Models  
- Nov  4  -- RR Basic Skills (2): Graph Production  
- Nov 18  -- **RR Basic Skills (3): Statistical Modeling**   
- Nov 25  -- RR Basic Skills (4): Dynamic Reporting   
- Dec 2 -- Migrating into R from other Statistical Software  

<div class="notes">
</div>

## Previously:

<img src = 'images/ai/DataMap_full.png' width="100%"></img> 
```p
"./Scripts/Data/dsL.R"
```

download the files to work along at [GitHub](https://github.com/IALSA/COAG-colloquium-2014F)

<div class="notes">
Last time we talked about the flow of data in a research project. The data flow map shows one possible scenario of data development, relevant to the data at hand. Stage <code>dsW</code>,  <code>dsLong</code>, might be optional, or narrate different transformations. The purpose of such a map is to organize our understanding of the script underlying this map. Thus, when results of the study are reported this map can be used to ease the deconstruction of the script and its further adaptation.
</div>

## Load Data {.smaller}



```r
# loads basic NLSY97-religiosity data as defined in COAG-Colloquium-2014F repository
dsL <- readRDS("./Data/Derived/dsL.rds")
```

```r
str(dsL)
```

```
'data.frame':	107772 obs. of  12 variables:
 $ id     : int  1 1 1 1 1 1 1 1 1 1 ...
 $ sex    : int  2 2 2 2 2 2 2 2 2 2 ...
 $ race   : int  4 4 4 4 4 4 4 4 4 4 ...
 $ bmonth : int  9 9 9 9 9 9 9 9 9 9 ...
 $ byear  : int  1981 1981 1981 1981 1981 1981 1981 1981 1981 1981 ...
 $ year   : int  2000 2001 2002 2003 2004 2005 2006 2007 2008 2009 ...
 $ attend : int  1 6 2 1 1 1 1 1 1 1 ...
 $ age    : int  19 20 21 22 23 24 25 26 27 28 ...
 $ sexF   : Ord.factor w/ 3 levels "Male"<"Female"<..: 2 2 2 2 2 2 2 2 2 2 ...
 $ raceF  : Ord.factor w/ 4 levels "Black"<"Hispanic"<..: 4 4 4 4 4 4 4 4 4 4 ...
 $ bmonthF: Ord.factor w/ 12 levels "Jan"<"Feb"<"Mar"<..: 9 9 9 9 9 9 9 9 9 9 ...
 $ attendF: Ord.factor w/ 8 levels "Never"<"Once or Twice"<..: 1 6 2 1 1 1 1 1 1 1 ...
```

<div class="notes">

</div>

## Load graphical theme {.smaller}

```r
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
```

<div class="notes">

</div>

## Mapping data to graphics {.smaller}
<div class="columns-2">

```r
dsM <- dplyr::filter(dsL, id == 1) %>% 
  dplyr::select(id, year, attend, attendF)
dsM
```

```
   id year attend         attendF
1   1 2000      1           Never
2   1 2001      6 About once/week
3   1 2002      2   Once or Twice
4   1 2003      1           Never
5   1 2004      1           Never
6   1 2005      1           Never
7   1 2006      1           Never
8   1 2007      1           Never
9   1 2008      1           Never
10  1 2009      1           Never
11  1 2010      1           Never
12  1 2011      1           Never
```
</br>
<img src="figure_rmd_try/graphBasic.png" title="plot of chunk graphBasic" alt="plot of chunk graphBasic" width="95%" />
</div>
Press(P): Note  
Next: final graph from last time 

<div class="notes">

</div>

## Mapping data to graphics {.smaller}
<div class="columns-2">

```r
dsM <- dplyr::filter(dsL, id == 1) %>%
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, year, attend)
dsM
```

```
   id year attend
1   1 2000      1
2   1 2001      6
3   1 2002      2
4   1 2003      1
5   1 2004      1
6   1 2005      1
7   1 2006      1
8   1 2007      1
9   1 2008      1
10  1 2009      1
11  1 2010      1
12  1 2011      1
```
</br>














































































