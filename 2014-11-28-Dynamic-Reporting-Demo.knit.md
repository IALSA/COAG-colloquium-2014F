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
first we load the data set that we have annotated in the previous lectures
</div>






## Focal outcome {.smaller}
<div class="columns-2">

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



## Which model is "better"? {.smaller} 
<div class="columns-2">
 
 - what criteria used?
  - not used?
  - preferences in fit/parsimony
  - complex judgments

### Challenges:
  1. Collecting results 
    - _What pieces of information do we need?_    
  2. Organizing comparisons      
    - _How do we  overcome information overload?_  

</br> </br> </br> </br> </br> </br> </br> </br> </br> </br> 

Model A: ${y_{it}} = {\beta _0} + {\varepsilon _{it}}$    



<img src="figure_rmd/graph20.png" title="plot of chunk graph20" alt="plot of chunk graph20" width="60%" />

Model B: ${y_{it}} = {\beta _0} + {\beta _1}tim{e_t} + {\varepsilon _{it}}$   



<img src="figure_rmd/graph21.png" title="plot of chunk graph21" alt="plot of chunk graph21" width="60%" />

</div>


## Collecting results: post-processing{.smaller}
<div class="columns-2">





```r
print(mA)
```

```
         modelA
logLik    -3727
deviance   7453
AIC        7457
BIC        7468
df.resid   1859
N          1860
p             1
ids         155
```
</br> </br> </br> </br> </br>   </br> </br> </br> </br> </br> 

```r
modelA
```

```
Generalized least squares fit by REML
  Model: attend ~ 1 
  Data: dsM 
  Log-restricted-likelihood: -3727

Coefficients:
(Intercept) 
      2.477 

Degrees of freedom: 1860 total; 1859 residual
Residual standard error: 1.793 
```

 ${y_{it}} = {\beta _0} + {\varepsilon _{it}}$ 



<img src="figure_rmd/graph20.png" title="plot of chunk graph20" alt="plot of chunk graph20" width="45%" />
</div>
<div class="notes">

```r
summary(modelA)
```

```
Generalized least squares fit by REML
  Model: attend ~ 1 
  Data: dsM 
   AIC  BIC logLik
  7457 7468  -3727

Coefficients:
            Value Std.Error t-value p-value
(Intercept) 2.477   0.04157   59.59       0

Standardized residuals:
    Min      Q1     Med      Q3     Max 
-0.8239 -0.8239 -0.2660  0.2918  3.0810 

Residual standard error: 1.793 
Degrees of freedom: 1860 total; 1859 residual
```
</div>



## Collecting results: post-processing{.smaller}
<div class="columns-2">












