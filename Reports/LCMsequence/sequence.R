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
source("./Reports/LCMsequence/model-SPECIFY.R") # load models specification
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
#                         heights=unit(c(4,2,5), c("in", "in", "in"))
  )
  pushViewport(viewport(layout=layout))
  grid.raster(pEquations, vp=viewport(layout.pos.row=1))
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

## @knitr m2_F
BuildMosaic(modelName="m2_F") 

## @knitr m0a_F
BuildMosaic(modelName="m0a_F")

## @knitr m1a_F
BuildMosaic(modelName="m1a_F")   

## @knitr m2a_F
BuildMosaic(modelName="m2a_F")

## @knitr m1b_F
BuildMosaic(modelName="m1b_F")   

## @knitr m2b_F
BuildMosaic(modelName="m2b_F")

## @knitr m2c_F
BuildMosaic(modelName="m2c_F")



## @knitr m0_R1
BuildMosaic(modelName="m0_R1")

## @knitr m1_R1
BuildMosaic(modelName="m1_R1")   

## @knitr m2_R1
BuildMosaic(modelName="m2_R1") 

## @knitr m0a_R1
BuildMosaic(modelName="m0a_R1")

## @knitr m1a_R1
BuildMosaic(modelName="m1a_R1")   

## @knitr m2a_R1
BuildMosaic(modelName="m2a_R1")

## @knitr m1b_R1
BuildMosaic(modelName="m1b_R1")   

## @knitr m2b_R1
BuildMosaic(modelName="m2b_R1")

## @knitr m2c_R1
BuildMosaic(modelName="m2c_R1")





## @knitr m1_R2
BuildMosaic(modelName="m1_R2")   

## @knitr m2_R2
BuildMosaic(modelName="m2_R2") 

## @knitr m1a_R2
BuildMosaic(modelName="m1a_R2")   

## @knitr m2a_R2
BuildMosaic(modelName="m2a_R2")

## @knitr m1b_R2
BuildMosaic(modelName="m1b_R2")   

## @knitr m2b_R2
BuildMosaic(modelName="m2b_R2")

## @knitr m2c_R2
BuildMosaic(modelName="m2c_R2")



## @knitr m2_R3
BuildMosaic(modelName="m2_R3") 

## @knitr m2a_R3
BuildMosaic(modelName="m2a_R3")

## @knitr m2b_R3
BuildMosaic(modelName="m2b_R3")

## @knitr m2c_R3
BuildMosaic(modelName="m2c_R3")



## @knitr @loadRDS
# Read in different RDS files and join them all together
pathDataDirectory <- file.path("./Reports/LCMsequence/models/datasets")
# filenamePattern <- ".+\\.rds" #All RDS files
filenamePattern <- "m.{1,}Info\\.rds" #All RDS files

retrievedFilenames <- list.files(path=pathDataDirectory, pattern=filenamePattern)
filePaths <- file.path(pathDataDirectory, retrievedFilenames)

dsInfo <- readRDS(filePaths[1])
for( i in 1:length(filePaths) ) {
  # To debug, change the '6' to some number to isolate the problem: for( i in 2:6 ) {
  # message("About to read", filePaths[i], "\\")
  dsInfoSingle <- readRDS(filePaths[i])
  dsInfo <- plyr::join(x=dsInfo, y=dsInfoSingle, by="Coefficient", type="left", match="all")
  rm(dsInfoSingle)
}


## @knitr allModels
BuildBar()

## @knitr F_row
selectModels <- F_row
axisModels  <- selectModels
source("./Reports/LCMsequence/graph-FIT-CUSTOM.R")
g

## @knitr F_col
selectModels <- F_col
axisModels  <- selectModels
source("./Reports/LCMsequence/graph-FIT-CUSTOM.R")
g


## @knitr R1_row
selectModels <- R1_row
axisModels  <- selectModels
source("./Reports/LCMsequence/graph-FIT-CUSTOM.R")
g

## @knitr R1_col
selectModels <- R1_col
axisModels  <- selectModels
source("./Reports/LCMsequence/graph-FIT-CUSTOM.R")
g

## @knitr R2_row
selectModels <- R2_row
axisModels  <- selectModels
source("./Reports/LCMsequence/graph-FIT-CUSTOM.R")
g

## @knitr R2_col
selectModels <- R2_col
axisModels  <- selectModels
source("./Reports/LCMsequence/graph-FIT-CUSTOM.R")
g

## @knitr R3_row
selectModels <- R3_row
axisModels  <- selectModels
source("./Reports/LCMsequence/graph-FIT-CUSTOM.R")
g

## @knitr R3_col
selectModels <- R3_col
axisModels  <- selectModels
source("./Reports/LCMsequence/graph-FIT-CUSTOM.R")
g



