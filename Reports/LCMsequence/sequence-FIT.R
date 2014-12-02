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


## @knitr LoadSources
source("./Reports/LCMsequence/model-SPECIFY.R") # load models specification
source("./Reports/LCMsequence/graph-FERE.R") #Load the `BuildFERE()` function
source("./Reports/LCMsequence/graph-FIT.R") #Load the `BuildBar()` function
source("./Reports/LCMsequence/graph-PREDICT.R") #Load the `BuildLine()` function

############################
## @knitr @loadRDS
modelName<- "m1_R1"  
# Read in different REDS files and join them all together
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

