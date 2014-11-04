---
title: "RR Skills (2): Graph Production "
author: Andrey Koval
date: November 4, 2014
output: 
  ioslides_presentation:
    widescreen: true
    transition: faster
    css: custom.css
---

<!--  Set the working directory to the repository's base directory; this assumes the report is nested inside of only one directory.-->


<!-- Set the report-wide options, and point to the external script file. -->


<!--
## Load Data {.smaller}

```r
# loads basic NLSY97-religiosity data as defined in COAG-Colloquium-2014F repository
source("./Scripts/Data/dsL.R")
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


## Graph 0 {.smaller}
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


```r
p <- ggplot2::ggplot(dsM,aes(x=year,y=attend))
p
```
</br> </br> </br> </br> </br> </br> </br> </br> </br> </br>
```
# Error: No layers in plot
```
</div>


## Define theme {.smaller}

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

see more options for [themes in ggplot2](http://docs.ggplot2.org/dev/vignettes/themes.html)
-->   







## Load Data {.smaller}

```r
# loads basic NLSY97-religiosity data as defined in COAG-Colloquium-2014F repository
source("./Scripts/Data/dsL.R")
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
dplyr::filter(dsL, id==1) %>% select(id, year, attend, attendF, sexF, raceF)
```

```
   id year attend         attendF   sexF       raceF
1   1 2000      1           Never Female Non-B/Non-H
2   1 2001      6 About once/week Female Non-B/Non-H
3   1 2002      2   Once or Twice Female Non-B/Non-H
4   1 2003      1           Never Female Non-B/Non-H
5   1 2004      1           Never Female Non-B/Non-H
6   1 2005      1           Never Female Non-B/Non-H
7   1 2006      1           Never Female Non-B/Non-H
8   1 2007      1           Never Female Non-B/Non-H
9   1 2008      1           Never Female Non-B/Non-H
10  1 2009      1           Never Female Non-B/Non-H
11  1 2010      1           Never Female Non-B/Non-H
12  1 2011      1           Never Female Non-B/Non-H
```

## Today's objective 




<img src="figure_rmd_try/graph25.png" title="plot of chunk graph25" alt="plot of chunk graph25" width="90%" />



## Minimalistic start




