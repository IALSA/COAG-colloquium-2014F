---
title: "RR Skills (4): Dynamic Reporting "
author: Andrey Koval
date: December 2 , 2014
output: 
  ioslides_presentation:
    widescreen: true
    transition: faster
  includes:
    in_header: include/in_header.html
---

<!--  Set the working directory to the repository's base directory; this assumes the report is nested inside of only one directory.-->


<!-- Set the report-wide options, and point to the external script file. -->


## Information

You can forward your questions to   
Ann Greenwood (ann.greenwood at popdata.bc.ca) or Vincenza Gruppuso (vincenza at uvic.ca).  
Q&A will begin immediately after the presentation.   

You can follow the presentation and review previous lectures at [ialsa.github.io/COAG-colloquium-2014F/](http://ialsa.github.io/COAG-colloquium-2014F/)


## Overview of the Series

- Oct 14  -- Intro to Reproducible Research  
- Oct 21  -- RR Basic Skills (1): Data Manipulation
- Nov  4  -- RR Basic Skills (2): Graph Production  
- Nov 18  -- RR Basic Skills (3): Statistical Modeling     
- Dec 2  -- **RR Basic Skills (4): Dynamic Reporting**     

<div class="notes">
</div>

## Data Origin

<img src = 'images/ai/DataMap_full.png' width="100%"></img> 
```p
"./Scripts/Data/dsL.R"
```

download the files to work along at [GitHub](https://github.com/IALSA/COAG-colloquium-2014F)

<div class="notes">
This data flow map shows one possible scenario of data development, relevant to the data at hand. Stage <code>dsW</code>,  <code>dsLong</code>, might be optional, or narrate different transformations. The purpose of such a map is to organize our understanding of the script underlying this map. Thus, when results of the study are reported this map can be used to ease the deconstruction of the script and its further adaptation.
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
'data.frame':	134745 obs. of  60 variables:
 $ sample      : int  1 1 1 1 1 1 1 1 1 1 ...
 $ id          : int  1 1 1 1 1 1 1 1 1 1 ...
 $ sex         : int  2 2 2 2 2 2 2 2 2 2 ...
 $ race        : int  4 4 4 4 4 4 4 4 4 4 ...
 $ bmonth      : int  9 9 9 9 9 9 9 9 9 9 ...
 $ byear       : int  1981 1981 1981 1981 1981 1981 1981 1981 1981 1981 ...
 $ attendPR    : int  7 7 7 7 7 7 7 7 7 7 ...
 $ relprefPR   : int  21 21 21 21 21 21 21 21 21 21 ...
 $ relraisedPR : int  21 21 21 21 21 21 21 21 21 21 ...
 $ year        : int  1997 1998 1999 2000 2001 2002 2003 2004 2005 2006 ...
 $ agemon      : num  190 206 219 231 243 256 266 279 290 302 ...
 $ ageyear     : num  15 17 18 19 20 21 22 23 24 25 ...
 $ famrel      : num  NA NA NA NA NA NA NA NA NA NA ...
 $ attend      : num  NA NA NA 1 6 2 1 1 1 1 ...
 $ values      : num  NA NA NA NA NA 1 NA NA 0 NA ...
 $ todo        : num  NA NA NA NA NA 1 NA NA 1 NA ...
 $ obeyed      : num  NA NA NA NA NA 1 NA NA 0 NA ...
 $ pray        : num  NA NA NA NA NA 0 NA NA 0 NA ...
 $ decisions   : num  NA NA NA NA NA 1 NA NA 1 NA ...
 $ relpref     : num  NA NA NA NA NA NA NA NA 21 NA ...
 $ bornagain   : num  NA NA NA NA NA NA NA NA NA NA ...
 $ faith       : num  NA NA NA NA NA NA NA NA NA NA ...
 $ calm        : num  NA NA NA 3 NA 4 NA 4 NA 4 ...
 $ blue        : num  NA NA NA 3 NA 2 NA 1 NA 1 ...
 $ happy       : num  NA NA NA 3 NA 3 NA 4 NA 4 ...
 $ depressed   : num  NA NA NA 3 NA 2 NA 1 NA 1 ...
 $ nervous     : num  NA NA NA 3 NA 1 NA 1 NA 1 ...
 $ tv          : num  NA NA NA NA NA 2 NA NA NA NA ...
 $ computer    : num  NA NA NA NA NA 5 NA NA NA NA ...
 $ internet    : num  NA NA NA NA NA NA 1 0 1 1 ...
 $ sampleF     : Ord.factor w/ 2 levels "Cross-Sectional"<..: 1 1 1 1 1 1 1 1 1 1 ...
 $ idF         : Factor w/ 8983 levels "1","2","3","4",..: 1 1 1 1 1 1 1 1 1 1 ...
 $ sexF        : Ord.factor w/ 3 levels "Male"<"Female"<..: 2 2 2 2 2 2 2 2 2 2 ...
 $ raceF       : Ord.factor w/ 4 levels "Black"<"Hispanic"<..: 4 4 4 4 4 4 4 4 4 4 ...
 $ bmonthF     : Ord.factor w/ 12 levels "Jan"<"Feb"<"Mar"<..: 9 9 9 9 9 9 9 9 9 9 ...
 $ byearF      : Factor w/ 5 levels "1980","1981",..: 2 2 2 2 2 2 2 2 2 2 ...
 $ attendPRF   : Ord.factor w/ 8 levels "Never"<"Once or Twice"<..: 7 7 7 7 7 7 7 7 7 7 ...
 $ relprefPRF  : Ord.factor w/ 33 levels "Catholic"<"Baptist"<..: 21 21 21 21 21 21 21 21 21 21 ...
 $ relraisedPRF: Ord.factor w/ 33 levels "Catholic"<"Baptist"<..: 21 21 21 21 21 21 21 21 21 21 ...
 $ yearF       : Factor w/ 15 levels "1997","1998",..: 1 2 3 4 5 6 7 8 9 10 ...
 $ agemonF     : Factor w/ 244 levels "146","147","148",..: 45 61 74 86 98 111 121 134 145 157 ...
 $ ageyearF    : Factor w/ 21 levels "12","13","14",..: 4 6 7 8 9 10 11 12 13 14 ...
 $ famrelF     : Factor w/ 8 levels "0","1","2","3",..: NA NA NA NA NA NA NA NA NA NA ...
 $ attendF     : Ord.factor w/ 8 levels "Never"<"Once or Twice"<..: NA NA NA 1 6 2 1 1 1 1 ...
 $ valuesF     : Ord.factor w/ 2 levels "FALSE/less Religious"<..: NA NA NA NA NA 2 NA NA 1 NA ...
 $ todoF       : Ord.factor w/ 2 levels "FALSE/less Religious"<..: NA NA NA NA NA 2 NA NA 2 NA ...
 $ obeyedF     : Ord.factor w/ 2 levels "FALSE/less Religious"<..: NA NA NA NA NA 2 NA NA 1 NA ...
 $ prayF       : Ord.factor w/ 2 levels "FALSE/less Religious"<..: NA NA NA NA NA 1 NA NA 1 NA ...
 $ decisionsF  : Ord.factor w/ 2 levels "FALSE/less Religious"<..: NA NA NA NA NA 2 NA NA 2 NA ...
 $ relprefF    : Ord.factor w/ 33 levels "Catholic"<"Baptist"<..: NA NA NA NA NA NA NA NA 21 NA ...
 $ bornagainF  : Ord.factor w/ 2 levels "NO"<"YES": NA NA NA NA NA NA NA NA NA NA ...
 $ faithF      : Ord.factor w/ 5 levels "Exrtemely"<"Very"<..: NA NA NA NA NA NA NA NA NA NA ...
 $ calmF       : Ord.factor w/ 4 levels "All of the time"<..: NA NA NA NA NA NA NA NA NA NA ...
 $ blueF       : Ord.factor w/ 4 levels "All of the time"<..: NA NA NA NA NA NA NA NA NA NA ...
 $ happyF      : Ord.factor w/ 4 levels "All of the time"<..: NA NA NA NA NA NA NA NA NA NA ...
 $ depressedF  : Ord.factor w/ 4 levels "All of the time"<..: NA NA NA NA NA NA NA NA NA NA ...
 $ nervousF    : Ord.factor w/ 4 levels "All of the time"<..: NA NA NA NA NA NA NA NA NA NA ...
 $ tvF         : Ord.factor w/ 6 levels "less than 2"<..: NA NA NA NA NA 2 NA NA NA NA ...
 $ computerF   : Ord.factor w/ 6 levels "None"<"less than 1"<..: NA NA NA NA NA 5 NA NA NA NA ...
 $ internetF   : Ord.factor w/ 2 levels "No"<"Yes": NA NA NA NA NA NA 2 1 2 2 ...
```

<div class="notes">
first we load the data set that we have annotated in the previous lectures
</div>






## Focal outcome {.smaller}
<div class="columns-2">

```r
dsM <- dplyr::filter(dsL, id == 1) %>% 
  dplyr::select(id, year, attend, attendF)
dsM
```

```
   id year attend         attendF
1   1 1997     NA            <NA>
2   1 1998     NA            <NA>
3   1 1999     NA            <NA>
4   1 2000      1           Never
5   1 2001      6 About once/week
6   1 2002      2   Once or Twice
7   1 2003      1           Never
8   1 2004      1           Never
9   1 2005      1           Never
10  1 2006      1           Never
11  1 2007      1           Never
12  1 2008      1           Never
13  1 2009      1           Never
14  1 2010      1           Never
15  1 2011      1           Never
```
</br> </br>
How often did you **attend** a worhsip service during the last year?

```
  attendLevels         attendLabels
1            8             Everyday
2            7   Several times/week
3            6      About once/week
4            5    About twice/month
5            4     About once/month
6            3 Less than once/month
7            2        Once or Twice
8            1                Never
```
</div>
</br> </br>



## Comparing models of the outcome {.smaller} 
<div class="columns-2">
 
 - what criteria should used?
  - should not used?
  - preferences in fit/parsimony
  - complex judgments

### Comparison relies on tasks:
  1. Collecting results 
    - _What pieces of information do we need?_  
    - _How do we pull them out from model results? (S3/S4 objects)_
  2. Organizing comparisons 
    - _How should each model look to optimize comparison?_  
    - _How do we  overcome information overload?_    

</br> </br> </br> </br> </br> </br>

Model A: ${y_{it}} = {\beta _0} + {\varepsilon _{it}}$    





































