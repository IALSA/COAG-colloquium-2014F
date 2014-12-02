



# modelName<- "m0_F"  
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

## Composite lists of models
source("./Reports/LCMsequence/model-SPECIFY.R")
mOrderRow <- c(F_row, R1_row, R2_row, R3_row)
mOrderCol <- c(F_col, R1_col, R2_col, R3_col)
# selectModels <- mOrderRow
# axisModels  <- c(mOrderRow)


# take data produced by model estimation
dsWide <- dsInfo  
ds <- reshape2::melt(dsWide, id.vars=c('Coefficient'))
ds <- plyr::rename(ds, replace=c( variable = "model"))
str(ds)
ds<- ds %>% 
  dplyr::filter(Coefficient %in% c( "BIC","AIC","deviance")) 
# ds<- ds[!(ds$model %in% excludeModels),] # exclude models from dataset
ds<- ds[ (ds$model %in%  selectModels),] # include models into dataset
# ds$Highlight <- (ds$model==modelName)  
ds$Coefficient <- factor(x=ds$Coefficient, levels=c("BIC","AIC","deviance"))
ds$pretty<- format(round(ds$value,0), nsmall = 0,big.mark = ",")


# possible pallets

# colorFit <- c("BIC"="blue", "AIC"="red", "deviance"="grey")
colorFit <- c("BIC"="#8da0cb", "AIC"="#fc8d62", "deviance"="#66c2a5") # Colorbrewer, 3 cat, qualit, colorblind and print friendly


# floor <- 1000 #Watchout when AIC is negative
floor <- min(ds$value, na.rm=T)  
longestBar <- max(ds$value, na.rm=T)  
barHeight <- abs(longestBar - floor)
ceiling <- longestBar + barHeight * .2 * sign(longestBar)  #Account for cases when AIC is negative

source("./Scripts/Graphs/AesDefine.R") # load custom theme (barFitTheme)

# g <- ggplot2::ggplot(ds, aes(x= reorder(model, value), y=value, fill= Coefficient, group=model)) +
#   geom_bar(stat="identity", position="identity", alpha=.3) + #Draws the distant skyscrapers
# #   geom_bar(data=ds[ds$Highlight, ], stat="identity", position="identity", alpha=.2) + #Draws the skyskraper that pops out.
#   scale_fill_manual(values=colorFit) +
#   scale_x_discrete(limits=axisModels) +
#   scale_y_continuous(label=scales::comma) +
#   coord_cartesian(ylim=c(floor, ceiling)) + 
#   guides(fill=guide_legend(title=NULL)) + 
#   barFitTheme +
#   labs(x=NULL, y="Misfit")

g <- ggplot2::ggplot(ds, aes(x= reorder(model, value), y=value, color= Coefficient, fill=Coefficient)) +
  geom_bar(aes(fill=Coefficient),stat="identity", position="identity", alpha=.4) + #This line draw the distant skyscrapers
  geom_bar(data=ds[ds$Highlight, ], stat="identity", position="identity", alpha=.8) + #This line draw the skyskraper that pops out.
  
  scale_fill_manual(values=colorFit) +
  scale_color_manual(values=colorFit) +  
  scale_x_discrete(limits=axisModels) +
  scale_y_continuous(label=scales::comma) +
  geom_text(aes(label=pretty), hjust=-.6, vjust=0, angle=90, position=position_dodge(width=.65)) +
  coord_cartesian(ylim=c(floor, ceiling)) + 
  guides(fill=guide_legend(title=NULL), color=FALSE) + 
  barFitTheme2 +
  labs(x=NULL, y="Misfit")


# g
