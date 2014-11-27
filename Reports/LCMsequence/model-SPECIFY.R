
modelNamesLabels<- c(
  "m0_F", "m1_F", "m0_R1", "m1_R1", "m2_R2")


### No random effects ###
### m0_F ###
call_m0_F <- "attend ~ 1 " 
### m1_F ###
call_m1_F <- "attend ~ 1 + timec "


### Random Effect (RE) of the intercept                 ###
### m0_R1 ###
call_m0_R1 <- "attend ~ 1 + (1 | id) " 
              
### m1_R1 ###
call_m1_R1 <- "attend ~ 1 + timec + (1 | id) "


### Random Effect (RE) of the  intercept + linear slope ###
### m2_R2 ###
call_m2_R2 <- "attend ~ 1 + timec + (1 + timec | id)"



modelNames<- c(
  call_m0_F, call_m1_F, call_m0_R1, call_m1_R1, call_m2_R2)
names(modelNames)<- modelNamesLabels

# Groups of modelsL
modelsFE <- c("m0_F",  "m1_F")
modelsR1 <- c("m0_R1", "m1_R1")
modelsR2 <- c(        "R2_0")

# Two alternative ways to specify model lists
modelList1 <- c(modelsFE, modelsR1, modelsR2)
modelList2 <- c("m0_F", "m1_F", 
                "m0_R1", "m1_R1", "R2_0")  
