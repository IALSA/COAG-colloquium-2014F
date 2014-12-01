# cat("\014")
#These first few lines run only when the file is run in RStudio, !!NOT when an Rmd/Rnw file calls it!!
# rm(list=ls(all=TRUE))  #Clear the variables from previous runs.

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


###################
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

###################
# Read in different RDS files 
pathDataDirectory <- file.path("./Reports/LCMsequence/models/datasets")
# filenamePattern <- ".+\\.rds" #All RDS files
filenamePattern <- "m.{1,}FERE\\.rds" #only FERE rds files
retrievedFilenames <- list.files(path=pathDataDirectory, pattern=filenamePattern)

# dsFERE <- readRDS(filePaths[1])

# requireFieldsEvenIfNA <- c("sdRE", "timec", "intVarRE", "timecVarRE", "timec2VarRE", "timec3VarRE")

lst_ds <- NULL
for( i in seq_along(retrievedFilenames) ) {
  filePath <- filePaths <- file.path(pathDataDirectory, retrievedFilenames[i])
  dsFERESingle <- readRDS(filePath)
  
  dsFERESingle <- plyr::rename(dsFERESingle, replace=c("Value"="Estimate"), warn_missing=FALSE)
  
  #TODO: convert this into a loop
  if( !("sdRE" %in% colnames(dsFERESingle)) ) dsFERESingle$sdRE <- NA
  if( !("timec" %in% colnames(dsFERESingle)) ) dsFERESingle$timec <- NA
  if( !("intVarRE" %in% colnames(dsFERESingle)) ) dsFERESingle$intVarRE <- NA
  if( !("timecVarRE" %in% colnames(dsFERESingle)) ) dsFERESingle$timecVarRE <- NA
  if( !("timec2VarRE" %in% colnames(dsFERESingle)) ) dsFERESingle$timec2VarRE <- NA
  if( !("timec3VarRE" %in% colnames(dsFERESingle)) ) dsFERESingle$timec3VarRE <- NA
  #   for( requiredField in requireFieldsEvenIfNA ) {
  #     if( !(requireField %in% colnames(dsFERESingle)) )
  #       dsFERESingle[[requireField]] <- NA
  #   }
  
  lst_ds[[i]] <- dsFERESingle
  
  rm(dsFERESingle)
}
# names(lst_ds) <- gsub(pattern="(.+)\\.rds", replacement="\\1", x=retrievedFilenames)
names(lst_ds) <- gsub(pattern="(.+)\\_FERE.rds", replacement="\\1", x=retrievedFilenames)

saveRDS(lst_ds, file="./Reports/LCMsequence/models/datasets/ListOfModelOutcomes.rds", compress="xz")
 
# lst_ds["m1_R1"]
# modelNames

