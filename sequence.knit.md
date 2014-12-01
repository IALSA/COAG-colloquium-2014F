---
title: "Model sequence report"
output:
  html_document:
    css: ~/GitHub/COAG-Colloquium-2014F/Reports/LCMsequence/libs/sidebar.css
    fig.retina: 2
    fig_width: 8
    toc: yes
    keep_md: false
  md_document:
    toc: yes
    toc_depth: 3
  pdf_document:
    fig_crop: no
    fig_width: 8
    highlight: haddock
    latex_engine: xelatex
    number_sections: yes
    toc: yes
    toc_depth: 3
mainfont: Calibri
---

<!--  Set the working directory to the repository's base directory; this assumes the report is nested inside of only one directory.-->












## m0_F 
<img src = 'models/formulas/GeneralSmall.png' width="70%"></img>
$\begin{array}{l}
{y_{ti}} = {\beta _{0i}} + {\varepsilon _{ti}}\\
{\beta _{0i}} = {\gamma _{00}}\\
{}\\
\end{array}$


<img src="sequence/m0_F.png" title="plot of chunk m0_F" alt="plot of chunk m0_F" width="980" />


## m1_F 
<img src = 'models/formulas/GeneralSmall.png' width="70%"></img>
$\begin{array}{l}
{y_{ti}} = {\beta _{0i}} + {\beta _{1i}}time{c_{ti}} + {\varepsilon _{ti}}\\
{\beta _{0i}} = {\gamma _{00}}\\
{\beta _{1i}} = {\gamma _{10}}
\end{array}$ 


<img src="sequence/m1_F.png" title="plot of chunk m1_F" alt="plot of chunk m1_F" width="980" />

## m0_R1 
<img src = 'models/formulas/GeneralSmall.png' width="70%"></img>
$\begin{array}{l}
{y_{ti}} = {\beta _{0i}} + {\varepsilon _{ti}}\\
{\beta _{0i}} = {\gamma _{00}} + {u_{0i}}\\
{}\\
\end{array}$ 

<img src="sequence/m0_R1.png" title="plot of chunk m0_R1" alt="plot of chunk m0_R1" width="980" />

## m1_R1 
<img src = 'models/formulas/GeneralSmall.png' width="70%"></img>
$\begin{array}{l}
{y_{ti}} = {\beta _{0i}} + {\beta _{1i}}time{c_{ti}} + {\varepsilon _{ti}}\\
{\beta _{0i}} = {\gamma _{00}} + {u_{0i}}\\
{\beta _{1i}} = {\gamma _{10}}
\end{array}$ 


<img src="sequence/m1_R1.png" title="plot of chunk m1_R1" alt="plot of chunk m1_R1" width="980" />


## m1_R2 
<img src = 'models/formulas/GeneralSmall.png' width="70%"></img>
$\begin{array}{l}
{y_{ti}} = {\beta _{0i}} + {\beta _{1i}}time{c_{ti}} + {\varepsilon _{ti}}\\
{\beta _{0i}} = {\gamma _{00}} + {u_{0i}}\\
{\beta _{1i}} = {\gamma _{10}} + {u_{1i}}
\end{array}$




