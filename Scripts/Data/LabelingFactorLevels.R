#  The following script declares the factor labels to be used with  **dsL**
#
###########################################################################

#### SCALES  ####

### Female ###################################################### sex ####
## Define the measurement scale 
# declare what numbers are used to represent categories (levels)
FemaleLevels<- c(0,1)
# declare what words (labels) are used to describe categories
FemaleLabels<- c("Male","Female")
# create a list variables' names to which the above measurement scale should be applied
varlist<-c("Female")
for(i in varlist){
  dsF[,paste0(i,"F")]<-factor(dsF[,i],
                              levels = FemaleLevels, # apply levels
                              labels = FemaleLabels) # apply labels
}

### TwinID  ###############################################################
TwinIDLevels <- c(1,2)
TwinIDLabels <- c("First-Born","Second-Born")
varlist<-c("TwinID")
for(i in varlist){
  dsF[,paste0(i,"F")]<-factor(dsF[,i],
                  levels = TwinIDLevels, # apply levels
                  labels = TwinIDLabels) # apply labels
}

### Zygosity  ###############################################################
ZigosityLevels <- c(1,2)
ZigosityLabels <- c("MZ","DZ")
varlist<-c("Zygosity")
for(i in varlist){
  dsF[,paste0(i,"F")]<-factor(dsF[,i],
                              levels = ZigosityLevels, # apply levels
                              labels = ZigosityLabels) # apply labels
}

### Ever diagnosed with dementia  ###########################################
DemEverLevels <- c(0,1)
DemEverLabels <- c("No dementia","Dementia")
varlist<-c("DemEver")
for(i in varlist){
  dsF[,paste0(i,"F")]<-factor(dsF[,i],
                              levels = DemEverLevels, # apply levels
                              labels = DemEverLabels) # apply labels
}


# ADD MORE VARIABLES HERE

# Now data set contains a set of ghost Factor variables that can be used in graphing and modeling