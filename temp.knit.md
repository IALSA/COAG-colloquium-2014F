---
title: "RR Skills (3): Statistical Modeling "
author: Andrey Koval
date: November 18, 2014
output: 
  ioslides_presentation:
    widescreen: true
    transition: faster

---

<!--  Set the working directory to the repository's base directory; this assumes the report is nested inside of only one directory.-->


<!-- Set the report-wide options, and point to the external script file. -->


## Load Data {.smaller}



```r
# loads basic NLSY97-religiosity data as defined in COAG-Colloquium-2014F repository
dsL <- readRDS("./Data/Derived/dsL.rds")
```






## ...



## Modeling: post processing {.smaller}
<div class="columns-2">

```r
dsM <- dplyr::filter(dsL, id <= 300) %>% 
  dplyr::filter(ave((!is.na(attend)), id, FUN = all)) %>%
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend)
modelA <- lm(attend ~ 1, data=dsM)
modelB <- lm(attend ~ 1 + time, data=dsM)
dplyr::filter(dsM,id==1)
```

```
   id time attend
1   1    0      1
2   1    1      6
3   1    2      2
4   1    3      1
5   1    4      1
6   1    5      1
7   1    6      1
8   1    7      1
9   1    8      1
10  1    9      1
11  1   10      1
12  1   11      1
```
</div>

Press (P): Zoom  
Next: 


## Modeling: post processing {.smaller}
<div class="columns-2">


