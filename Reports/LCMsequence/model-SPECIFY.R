modelsFE <- c("m0_F", "m1_F", "m2_F",
              "m0a_F","m1a_F","m2a_F",
                      "m1b_F","m2b_F",
                              "m2c_F")

modelsR1 <- c("m0_R1", "m1_R1", "m2_R1",
              "m0a_R1","m1a_R1","m2a_R1",
                       "m1b_R1","m2b_R1",
                                "m2c_R1")

modelsR2 <- c(         "m1_R2", "m2_R2",
                       "m1a_R2","m2a_R2",
                       "m1b_R2","m2b_R2",
                                "m2c_R2")

modelsR3 <- c(                  "m2_R3",
                                "m2a_R3",
                                "m2b_R3",
                                "m2c_R3")





modelNamesLabels<- c( modelsFE, modelsR1, modelsR2, modelsR3)
  
### No random effects ###
### m0_F ###                                                                   # F
call_m0_F <- "attend ~ 1 " 
### m0a_F ###
call_m0a_F <- "attend ~ 1 + attendPR"

### m1_F ###
call_m1_F <-  "attend ~ 1 + timec "
### m1a_F ###
call_m1a_F <- "attend ~ 1 + timec + attendPR"
### m1b_F ###
call_m1b_F <- "attend ~ 1 + timec + attendPR + timec:attendPR"

### m2_F ###
call_m2_F <-  "attend ~ 1 + timec + timec2"
### m2a_F ###
call_m2a_F <- "attend ~ 1 + timec + timec2 + attendPR "
### m2b_F ###
call_m2b_F <- "attend ~ 1 + timec + timec2 + attendPR + timec:attendPR "
### m2c_F ###
call_m2c_F <- "attend ~ 1 + timec + timec2 + attendPR + timec:attendPR + timec2:attendPR"



### Random Effects (RE): intercept (1)                                         # R1
### m0_R1 ###                                                                   
call_m0_R1 <- "attend ~ 1 + (1|id)" 
### m0a_R1 ###
call_m0a_R1 <- "attend ~ 1 + attendPR + (1|id)"

### m1_R1 ###
call_m1_R1 <-  "attend ~ 1 + timec + (1|id)"
### m1a_R1 ###
call_m1a_R1 <- "attend ~ 1 + timec + attendPR + (1|id)"
### m1b_R1 ###
call_m1b_R1 <- "attend ~ 1 + timec + attendPR + timec:attendPR + (1|id)"

### m2_R1 ###
call_m2_R1 <-  "attend ~ 1 + timec + timec2 + (1 |id)"
### m2a_R1 ###
call_m2a_R1 <- "attend ~ 1 + timec + timec2 + attendPR + (1 |id)"
### m2b_R1 ###
call_m2b_R1 <- "attend ~ 1 + timec + timec2 + attendPR + timec:attendPR + (1 |id)"
### m2c_R1 ###
call_m2c_R1 <- "attend ~ 1 + timec + timec2 + attendPR + timec:attendPR + timec2:attendPR + (1 |id)"



### Random Effects (RE): intercept (1) , linear slope (2)                      # R2
### m1_R2 ###
call_m1_R2 <-  "attend ~ 1 + timec + (1 + timec |id)"
### m1a_R2 ###
call_m1a_R2 <- "attend ~ 1 + timec + attendPR + (1 + timec |id)"
### m1b_R2 ###
call_m1b_R2 <- "attend ~ 1 + timec + attendPR + timec:attendPR + (1 + timec |id)"

### m2_R2 ###
call_m2_R2 <-  "attend ~ 1 + timec + timec2 + (1 + timec |id)"
### m2a_R2 ###
call_m2a_R2 <- "attend ~ 1 + timec + timec2 + attendPR + (1 + timec |id)"
### m2b_R2 ###
call_m2b_R2 <- "attend ~ 1 + timec + timec2 + attendPR + timec:attendPR + (1 + timec |id)"
### m2c_R2 ###
call_m2c_R2 <- "attend ~ 1 + timec + timec2 + attendPR + timec:attendPR + timec2:attendPR + (1 + timec |id)"



### Random Effects (RE): intercept (1) , linear slope (2) , quadradic term (3) # R3
### m2_R3 ###
call_m2_R3 <-  "attend ~ 1 + timec + timec2 + (1 + timec + timec2 |id)"
### m2a_R3 ###
call_m2a_R3 <- "attend ~ 1 + timec + timec2 + attendPR + (1 + timec + timec2 |id)"
### m2b_R3 ###
call_m2b_R3 <- "attend ~ 1 + timec + timec2 + attendPR + timec:attendPR + (1 + timec + timec2 |id)"
### m2c_R3 ###
call_m2c_R3 <- "attend ~ 1 + timec + timec2 + attendPR + timec:attendPR + timec2:attendPR + (1 + timec + timec2 |id)"




### Connecting model names and model formulas
modelNames<- c(
              call_m0_F,  call_m1_F,  call_m2_F,
              call_m0a_F, call_m1a_F, call_m2a_F,
                          call_m2b_F, call_m1b_F,
                                      call_m2c_F,

              call_m0_R1,  call_m1_R1,  call_m2_R1, 
              call_m0a_R1, call_m1a_R1, call_m2a_R1, 
                           call_m2b_R1, call_m1b_R1, 
                                        call_m2c_R1, 

                          call_m1_R2,  call_m2_R2, 
                          call_m1a_R2, call_m2a_R2, 
                          call_m2b_R2, call_m2b_R2, 
                                       call_m2c_R2, 

                                       call_m2_R3, 
                                       call_m2a_R3, 
                                       call_m2b_R3, 
                                       call_m2c_R3)


names(modelNames)<- modelNamesLabels


# defines the order of items in FIT graphs
F_row <- modelsFE
R1_row <- modelsR1
R2_row <- modelsR2
R3_row <- modelsR3

F_col <- c("m0_F", "m0a_F",
           "m1_F", "m1a_F", "m1b_F",
           "m2_F", "m2a_F", "m2b_F","m2c_F")

R1_col <- c("m0_R1", "m0a_R1",
            "m1_R1", "m1a_R1", "m1b_R1",
            "m2_R1", "m2a_R1", "m2b_R1","m2c_R1")

R2_col <- c(
  "m1_R2", "m1a_R2", "m1b_R2",
  "m2_R2", "m2a_R2", "m2b_R2","m2c_R2")

R3_col <- c(
  
  "m2_R3", "m2a_R3", "m2b_R3","m2c_R3")
