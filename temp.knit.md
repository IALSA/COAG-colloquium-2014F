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





<!--
Photoshop image settings:
Use the following dimensions:
For slides WITH title and image at 100% 
1280 x 900  -  wide: cuts off         tall: bottom bleeds
1280 x 720  -  wide: bottom bleeds    tall: bottom 4 lines
1280 x 680  -  wide: bottom 1 line    tall: bottom 5 lines
1280 x 650  -  wide: bottom 2 lines   tall: bottom 6 lines
-->


## ...


## Modeling: manifestations {.smaller}
  1. Tabular  
  2. Algebraic  
  3. Syntactic  
  4. Numeric  
  5. Graphical
  6. Schematic  
  7. Semantic  
  
  
Press (P): Zoom  
Next: 

## 1280x900 {.smaller}
<img src = 'images/cc_Nov18/modelManifestations1280x900.png' width="100%"></img>  
Press (P): Zoom  
Next:



## Modeling: recreating patterns {.smaller}
<div class="columns-2">

```r
dsM <- dplyr::filter(dsL, id == 1) %>% 
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend)
# 
dsM
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
</br>






