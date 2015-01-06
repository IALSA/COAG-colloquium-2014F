---
title: "What is statistical modeling? "
author: 
date: Jan 6, 2015
output: 
  ioslides_presentation:
    widescreen: true
    transition: faster
  includes:
    in_header: include/in_header.html
---

<!--  Set the working directory to the repository's base directory; this assumes the report is nested inside of only one directory.-->


<!-- Set the report-wide options, and point to the external script file. -->




## What is Statistical Modeling? {.smaller}
<div class="columns-2">
### What is a model?
 - simplifications of a complex reality   
 - "mechanism" for reproducing data
 - operationalization of substantive theory
 
### What does modeling involve?   
 - generating data points  
 - comparing observed and modeled data
 - describing properties and attribues of a model
 - comparing and contrasting models  

##### (Rodgers, 2010)
</br></br>  

#### Theoretical model of change  
  - Shape  of change
  - Scale  of change
  - Periodicity 

#### Temporal design  
 - Timing  
 - Frequency  
 - Spacing  

### Statistical model of change  
 - Operationalization of theoretical model of change  
 
##### (Collins, 2006) 
 
 
</div>
<div class="notes">
[Rodgers, 2010](http://psych.colorado.edu/~willcutt/pdfs/Rodgers_2010.pdf):  Rodgers, J. L. (2010). The epistemology of mathematical and statistical modeling: a quiet methodological revolution. American Psychologist, 65(1), 1.   
</br>
[Collins, 2006](http://www2.sep.ucr.ac.cr/GESTION/CursoUGES2010/416ec3a16c697369735f64655f6461746f735f6c6f6e6769747564696e616c735f496e74656772616369c3b26e5f64655f6d6f64656c6f735f7465c3b37269636f735f6461746f735f795f6d6f64656c6f735f6573746164c3ad737469636f73.pdf):Collins, L. M. (2006). Analysis of longitudinal data: The integration of theoretical model, temporal design, and statistical model. Annu. Rev. Psychol., 57, 505-528.
</div>
Press (P): Citation   
Next: Example of a modeling project


## Example of data workflow map:

<img src = 'images/ai/DataMap_full.png' width="100%"></img> 
```p
"./Scripts/Data/dsL.R"
```

Full example is at [COAG](http://www.coag.uvic.ca/)'s [lecture series](https://ialsa.github.io/COAG-colloquium-2014F) on reproducible research.

<div class="notes">
Last time we talked about the flow of data in a research project. The data flow map shows one possible scenario of data development, relevant to the data at hand. Stage <code>dsW</code>,  <code>dsLong</code>, might be optional, or narrate different transformations. The purpose of such a map is to organize our understanding of the script underlying this map. Thus, when results of the study are reported this map can be used to ease the deconstruction of the script and its further adaptation.
</div>


## Study in Focus

### NLSY97
  - [National Longitudinal Study of Youth 1997][NLS]
  - Household sample
  - ~ 9,000 respondents
  - 5 cohorts
  - ages from 13 to 31
  - started in 1997 
  - continues today
  -  outcome: <div class="red2">Church attendance</div>


## Focal outcome {.smaller}
<div class="columns-2">

```
Loading required package: markdown
Loading required package: testit
Loading required package: dplyr

Attaching package: 'dplyr'

The following objects are masked from 'package:stats':

    filter, lag

The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union

Loading required package: reshape2
Loading required package: stringr
Loading required package: ggplot2
```















