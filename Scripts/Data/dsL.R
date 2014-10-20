# Clear memory from previous runs
base::rm(list=base::ls(all=TRUE))


## @knitr LoadPackages
# Load the necessary packages.
base::require(base)
base::require(knitr)
base::require(markdown)
base::require(testit)
base::require(plyr)
base::require(reshape2)
base::require(stringr)


## @knitr DeclareGlobals


## @knitr LoadData
# Links to the data source # for now keep the link non-dynamic
myExtract <- "./Data/Extract/NLSY97_Attend_20141021/NLSY97_Attend_20141021"

pathDataSource <- paste0(myExtract,".csv")
ds0<-read.csv(pathDataSource,header=TRUE, skip=0,sep=",")


## @knitr QueryData


## @knitr ImportVarLabels
### NLSY97 variable "id" is linked to the descriptive label in the header of the STATA formated data file.dtc" ###
pathDataSourceLabels <- paste0(myExtract,".dct")
ds0Labels<-read.csv(pathDataSourceLabels,header=TRUE, skip=0,nrow=17, sep="")
ds0Labels$X.<-NULL # remove extra column
ds0Labels
# rename columns to match NLS Web Investigator format
ds0Labels<-rename(ds0Labels,
                  replace=c("infile"="RNUM","dictionary"="VARIABLE_TITLE")
                  ) 
ds0Labels<-sort(ds0Labels) # sort by Variable Title
write.table(ds0Labels, "./Data/Extract/ds0Labels.csv", sep=",")


## @knitr RenameVariables
ds0<-rename(ds0, 
            c("R0000100"="id",
              "R0536300"="sex",
              "R1482600"="race",
              "R0536402"="byear",
              "R0536401"="bmonth",
              "R4893400"="attend_2000",
              "R6520100"="attend_2001",
              "S0919300"="attend_2002",
              "S2987800"="attend_2003",
              "S4681700"="attend_2004",
              "S6316700"="attend_2005",
              "S8331500"="attend_2006",
              "T0739400"="attend_2007",
              "T2781700"="attend_2008",
              "T4495000"="attend_2009",
              "T6143400"="attend_2010",
              "T7637300"="attend_2011"
              )
            )
# Manually create the vector that contains the names of the variables you would like to keep. 
attend_years <- paste0("attend_",c(2000:2011))
selectVars <- c("id", "sex", "race", "byear", "bmonth", attend_years)


## @knitr RecodeNegative
# recode negativale worded question so that :  1 - more religious, 0 - less religious
for (item in c("todo","values")){
  for (year in c(2002,2005,2008,2011)){
    itemyear<-(paste0(item , "_" , year))
    ds0[,itemyear]=ifelse( (ds0[,itemyear] %in% c(1)) , 0 ,ifelse((ds0[,itemyear] %in% c(0)),1,NA))
  }
}

## @knitr RemoveIllegal 
# Remove illegal values. See codebook for description of missingness
illegal<-as.integer(c(-5:-1,997,998,999))
SourceVariables<-names(ds0)
for( variable in SourceVariables ){
  ds0[,variable]=ifelse(ds0[,variable] %in% illegal,NA,ds0[,variable])
  
}

# Include only records with a valid birth year
ds0 <- ds0[ds0$byear %in% 1980:1984, ]

#Include only records with a valid ID
ds0 <- ds0[ds0$id != "V", ]
ds0$id <- as.integer(ds0$id)
dsW <- ds0 # At this point the data is in the wide format ( relative to time)
# remove all but one dataset
rm(list=setdiff(ls(), c("ds0","dsW")))
# note that at this pint ds0 = dsW



## @knitr MakeLong
# Variables, which values that DON'T change with time - time invariant (TI) variables 
TIvars<-c("sample", "id", "sex","race", "bmonth","byear",  'attendPR', "relprefPR", "relraisedPR")
## id.vars declares MEASURED variables (as opposed to RESPONSE variable)
dsLong <- reshape2::melt(dsW, id.vars=TIvars)
require(dplyr)
dsLong <- dsLong %>% dplyr::arrange(id)

# head(dsLong[dsLong$id==1,],20)

dplyr::filter(dsLong,id==1) %>% dplyr::select(dsLong,id,year,attend)
# create varaible "year" by stripping the automatic ending in TV variables' names
dsLong$year<-str_sub(dsLong$variable,-4,-1) 
# the automatic ending in TV variables' names
timepattern<-c("_1997", "_1998", "_1999", "_2000", "_2001", "_2002", "_2003", "_2004", "_2005", "_2006","_2007", "_2008", "_2009", "_2010", "_2011")
# Strip off the automatic ending
for (i in timepattern){
  dsLong$variable <- gsub(pattern=i, replacement="", x=dsLong$variable) 
}
# Convert to a number.
dsLong$year <- as.integer(dsLong$year) 


# reorder for easier inspection
dsLong<-dsLong[with(dsLong, order(id,variable)), ] # alternative sorting to plyr
# view the long data for one person
# print(dsLong[dsLong$id==1,]) 

dsL <- dcast(data=dsLong,sample + id + sex + race + bmonth + byear + attendPR + relprefPR + relraisedPR + year ~ variable, value.var = "value")






##############################
## Create individual long datasets, one per TV variable
## NOTE: for development: loop over the dataset

## Time invariant (TI) variables are :
# print (TIvars)
## Time variant (TV) variables are :
TVvars<-unique(dsLong$variable)
# TVvars<-c("attend","tv") # to test on a few variables
# Create a long (L) dataset (ds) with time invariant (TI) variables 
dsLTI<-subset(dsLong,subset=(dsLong$variable=="agemon")) # agemon because it has 1997:2011
dsLTI<-rename(dsLTI,replace=c("value"="agemon"))
dsLTI<-dsLTI[c(TIvars,"year")] # select only TI variables

## Strip off each  TV (Time Invariant covariate) from dsLong to merge later
for ( i in TVvars){
  dstemp<-subset(dsLong,subset=(dsLong$variable==i))
  dstemp<-rename(dstemp,replace=c("value"=i))
  dstemp<-dstemp[c("id","year",i)]
  dsLTI<-merge(x=dsLTI,y=dstemp,by=c("id","year"),all.x=TRUE)
}
## Merging datasets
# Outer join: merge(x = df1, y = df2, by = "CustomerId", all = TRUE)
# Left outer: merge(x = df1, y = df2, by = "CustomerId", all.x=TRUE)
# Right outer: merge(x = df1, y = df2, by = "CustomerId", all.y=TRUE)
# Cross join: merge(x = df1, y = df2, by = NULL)

# OPTIONAL. Order variables in dsL to match the order in "NLSY97_Religiosity_20042012.xlsx"
dsL_order<-c("sample"  ,"id"  ,"sex"	,"race"	,"bmonth"	,"byear"	,"attendPR"	,"relprefPR"	,"relraisedPR"	,"year","agemon"	,"ageyear"	,"famrel"	,"attend"	,"values"	,"todo"	,"obeyed"	,"pray"	,"decisions"	,"relpref"	,"bornagain"	,"faith"	,"calm"	,"blue"	,"happy"	,"depressed"	,"nervous"	,"tv"	,"computer"	,"internet")
dsL<-dsLTI[dsL_order]

# NOTE: repsondent id=467 has an abberation in age data (agemon for 2000)
print ( dsL[dsL$id==467, c("id","year", "byear","bmonth","agemon", "ageyear")])
# the observation for this subject is removed
dsL <- dsL[!(dsL$id %in% c(467)), ]

## @knitr LabelFactors
source(file.path(pathDir,"Scripts/Data/LabelingFactorLevels.R"))

## @knitr SaveDerivedData

pathdsLcvs <- file.path(getwd(),"Data/Derived/dsL.csv")
write.csv(dsL,pathdsLcvs,  row.names=FALSE)

pathdsLrds <- file.path(pathDir,"Data/Derived/dsL.rds")
saveRDS(object=dsL, file=pathdsLrds, compress="xz")

## @knitr CleanUp
# # remove all but specified dataset
rm(list=setdiff(ls(), c("TIvars","TVvars","dsL")))
