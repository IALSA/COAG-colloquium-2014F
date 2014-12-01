#These first few lines run only when the file is run in RStudio, !!NOT when an Rmd/Rnw file calls it!!
rm(list=ls(all=TRUE))  #Clear the variables from previous runs.

############################
## @knitr LoadPackages
require(RODBC)
require(grid)
require(lattice)
require(dplyr)
require(ggplot2)
require(gridExtra)
require(lme4)
require(reshape2)
require(testit)
require(png)

############################
## @knitr LoadSources
source("./Reports/LCMsequence/graph-FERE.R") #Load the `BuildFERE()` function
source("./Reports/LCMsequence/graph-FIT.R") #Load the `BuildBar()` function
source("./Reports/LCMsequence/graph-PREDICT.R") #Load the `BuildLine()` function

############################
## @knitr DeclareGlobals
source("./Scripts/Graphs/AesDefine.R")
pathImageDirectory <- "./Reports/LCMsequence/models/formulas"


vpLayout <- function(rowIndex, columnIndex) { return( viewport(layout.pos.row=rowIndex, layout.pos.col=columnIndex) ) }

PullAppropriatePng <- function( modelName ) {
  pathImage <- file.path(pathImageDirectory, paste0(modelName, ".png"))
  p <- png::readPNG(pathImage)
  return( p )
}


BuildMosaic <- function( modelName ) {
  testit::assert(fact="The FERE object should be found in the appropriate list", modelName %in% names(lstModelOutcomes))
  dsFERE <- lstModelOutcomes[modelName][[1]]
  
#     pEquations <- png::readPNG(pathImage) #Replace this line with the one below it (toggle the comments).
    pEquations <- PullAppropriatePng(modelName=modelName)
  
  gTile <- BuildFERE(modelName=modelName, dsWide=dsFERE)
  gLine <- BuildLine(modelName=modelName)
  gBar <- BuildBar(modelName=modelName)
  
  grid.newpage()    
  #Defnie the relative proportions among the panels in the mosaic.
  layout <- grid.layout(nrow=3, ncol=2,
                        widths=unit(c(.4, .6) ,c("null", "null")),
                        heights=unit(c(.3,.2,.5), c("null", "null", "null"))
  )
  pushViewport(viewport(layout=layout))
  #   grid.raster(pEquations, vp=viewport(layout.pos.row=1))
  print(gTile, vp=viewport(layout.pos.row=2))
  print(gLine, vp=vpLayout(3, 1))
  print(gBar, vp=vpLayout(3, 2))
  
  popViewport(0)
}



## @knitr LoadData
dsL<-readRDS("./Data/Derived/dsL.rds")
source("./Reports/LCMsequence/model-SPECIFY.R")
# source("./Reports/LCMsequence/model-ESTIMATE.R") # run only first time
# source("./Reports/LCMsequence/model-COLLECT.SOLUTIONS.R") # run only first time
lstModelOutcomes <- readRDS("./Reports/LCMsequence/models/datasets/ListOfModelOutcomes.rds")
# names(lstModelOutcomes)

columnNamesWidePretty <- c("Estimate", "Std.Error", "t.value", "SD", "tau0", "tau1", "tau2", "tau3", "sigma")


## @knitr m0_F
BuildMosaic(modelName="m0_F")

## @knitr m1_F
BuildMosaic(modelName="m1_F")             

## @knitr m0_R1
BuildMosaic(modelName="m0_R1")

## @knitr m1_R1
BuildMosaic(modelName="m1_R1")

### @knitr m1_R2
BuildMosaic(modelName="m1_R2")



