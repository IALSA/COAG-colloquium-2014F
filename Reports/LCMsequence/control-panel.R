rm(list=ls(all=TRUE))  #Clear the variables from previous runs.

# This file collects instructions for implementing model sequencing with R and R studio


# Install the packages that will be used
# some interaction may be required, click to continue
# source ("./Scripts/Utility/InstallPackages.R") 

# Load the model specification
source("./Reports/LCMsequence/model-SPECIFY.R")

# Estimate each model
# Process and organize model results
# Save results as a series of .Rds data objects
# source("./Reports/LCMsequence/model-ESTIMATE.R")

# a <- readRDS('./Reports/LCMsequence/models/datasets/m2_F_FERE.rds')

# Input all objects with model solutions
# combine into a single dataset ListOfModelOutcomes.rds
source("./Reports/LCMsequence/model-COLLECT-SOLUTIONS.R")

# modelNames
# lst_ds["m0_F"]
# lst_ds["m1_F"]
# lst_ds["m0a_F"]

# Load functions that produce individual graphs
source("./Reports/LCMsequence/graph-FERE.R") #Load the `BuildFERE()` function
source("./Reports/LCMsequence/graph-FIT.R") #Load the `BuildBar()` function
source("./Reports/LCMsequence/graph-PREDICT.R") #Load the `BuildLine()` function

# BuildFERE("m2a_F",lst_ds["m2c_R3"][[1]])
BuildLine(modelName="m0a_F")

# Generates sequence report
rmarkdown::render(input = "./Reports/LCMsequence/sequence.Rmd", 
          output_format = "html_document", clean=TRUE)


# Generate sequence FIT report
rmarkdown::render(input = "./Reports/LCMsequence/sequence.Rmd", 
                  output_format = "html_document", clean=TRUE)


