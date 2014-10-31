---
title: "RR Skills (2): Graph Production "
author: Andrey Koval
date: October 21, 2014
output: 
  ioslides_presentation:
    widescreen: true
    transition: faster
---

<!--  Set the working directory to the repository's base directory; this assumes the report is nested inside of only one directory.-->


<!-- Set the report-wide options, and point to the external script file. -->



## Overview of the Series

- Oct 14  -- Intro to Reproducible Research  
- Oct 21  -- RR Basic Skills (1): Data Manipulation
- Oct 28  -- Intro to Latent Class and Latent Transition Models  
- Nov 4  -- **RR Basic Skills (2): Graph Production**  
- Nov 11      
- Nov 18  -- RR Basic Skills (3): Statistical Modeling   
- Nov 25  -- RR Basic Skills (4): Dynamic Reporting   
- Dec 2 -- Migrating into R from other Statistical Software   


## Previously:
  
<img src = 'images/ai/DataMap_today.png' width="100%"></img>  

### Tidy data

1. Each variable forms a column
2. Each observation forms a row
3. Each type of observational unit forms a table

See [Hadley Wickham's](http://had.co.nz/) paper on [tidy data](http://www.jstatsoft.org/v59/i10/paper)

  

## Previously:

<img src = 'images/ai/DataMap_full.png' width="100%"></img> 
```
"./Scripts/Data/dsL.R"
```

download the files to work along at [GitHub](https://github.com/IALSA/COAG-colloquium-2014F)

## Previously:

### NLSY97
  - [National Longitudinal Study of Youth 1997][NLS]
  - Household sample
  - ~ 9,000 respondents
  - 5 cohorts
  - ages from 13 to 31
  - started in 1997 
  - continues today
  -  outcome: <div class="red2">Church attendance</div>





[NLSWeb]:https://www.nlsinfo.org/investigator/pages/login.jsp
[NLS]:http://www.bls.gov/nls/




## Previously:

```
"./Scripts/Data/dsL.R"
```
imported the raw data files
```
myExtract <- "./Data/Extract/NLSY97_Attend_20141021/NLSY97_Attend_20141021"
pathSourceData <- paste0(myExtract,".csv") 
SourceData <- read.csv(pathSourceData,header=TRUE, skip=0,sep=",")
ds0 <- SourceData
```
cleaned, transformed , and at the end, exported it. 
```
pathdsLrds <- "./Data/Derived/dsL.rds"
saveRDS(object=dsL, file=pathdsLrds, compress="xz")
```
we pick up right were we left off, by executing the script <code>./Scripts/Data/dsL.R</code>  

## Load Data

```r
source("./Scripts/Data/dsL.R")
str(dsL)
head(dsL)
```

## Load Data

```r
dplyr::filter(dsL, id==1)
```

```
   id sex race bmonth byear year attend age   sexF       raceF bmonthF         attendF
1   1   2    4      9  1981 2000      1  19 Female Non-B/Non-H     Sep           Never
2   1   2    4      9  1981 2001      6  20 Female Non-B/Non-H     Sep About once/week
3   1   2    4      9  1981 2002      2  21 Female Non-B/Non-H     Sep   Once or Twice
4   1   2    4      9  1981 2003      1  22 Female Non-B/Non-H     Sep           Never
5   1   2    4      9  1981 2004      1  23 Female Non-B/Non-H     Sep           Never
6   1   2    4      9  1981 2005      1  24 Female Non-B/Non-H     Sep           Never
7   1   2    4      9  1981 2006      1  25 Female Non-B/Non-H     Sep           Never
8   1   2    4      9  1981 2007      1  26 Female Non-B/Non-H     Sep           Never
9   1   2    4      9  1981 2008      1  27 Female Non-B/Non-H     Sep           Never
10  1   2    4      9  1981 2009      1  28 Female Non-B/Non-H     Sep           Never
11  1   2    4      9  1981 2010      1  29 Female Non-B/Non-H     Sep           Never
12  1   2    4      9  1981 2011      1  30 Female Non-B/Non-H     Sep           Never
```

## Load Data

```r
dplyr::filter(dsL, id==1) %>% select(id, year, attend, attendF)
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

## The anatomy of a ggplot
![sape](http://sape.inf.usi.ch/sites/default/files/imagecache/width600/ggplot2-anatomy-all-annotated.png)

see [ggplot quick reference](http://sape.inf.usi.ch/quick-reference/ggplot2) by SAPE research group

## Preview




























