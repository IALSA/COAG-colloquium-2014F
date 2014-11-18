# Clear memory from previous runs
base::rm(list=base::ls(all=TRUE))


## @knitr LoadPackages
# Load the necessary packages.
base::require(base)
base::require(knitr)
base::require(markdown)
base::require(testit)
base::require(dplyr)
base::require(reshape2)
base::require(stringr)
base::require(stats)
base::require(ggplot2)

## @knitr DeclareGlobals


## @knitr LoadData
# loads basic NLSY97-religiosity data as defined in COAG-Colloquium-2014F repository
dsL <- readRDS("./Data/Derived/dsL.rds")



## @knitr loadTheme
baseSize <- 12
### <b>
plotTheme <- ggplot2::theme_bw() +
  ### </b>
  ggplot2::theme_bw(base_size=baseSize)+
  ggplot2::theme(title=ggplot2::element_text(colour="gray20",size = baseSize + 3)) +
  ggplot2::theme(axis.text=ggplot2::element_text(colour="gray40", size= baseSize - 2))+
  ggplot2::theme(axis.title.x=ggplot2::element_text(colour="gray40", size = baseSize + 2, vjust=-.3))+
  ggplot2::theme(axis.title.y=ggplot2::element_text(colour="gray40", size = baseSize + 2, vjust=1.3))+
  ggplot2::theme(panel.border = ggplot2::element_rect(colour="gray80"))+
  ggplot2::theme(axis.ticks.length = grid::unit(0, "cm"))


## @knitr dsM22
dsM <- dplyr::filter(dsL, id <= 300) %>% 
  dplyr::filter(ave((!is.na(attend)), id, FUN = all)) %>%
  dplyr::mutate(time=year-2000) %>%
  dplyr::select(id, time, attend)
lmA <- lm(attend ~ 1, data=dsM)
lmB <- lm(attend ~ 1 + time, data=dsM)
glsA <- nlme::gls(attend ~ 1, data=dsM, method = "ML" )
glsB <- nlme::gls(attend ~ 1 + time, data=dsM, method = "ML" )

## 
model <- glsA
logLik<- summary(model)$logLik
deviance<- -2*logLik
AIC<- AIC(model)
BIC<- BIC(model)
df.resid<- NA
N<- summary(model)$dims$N
p<- summary(model)$dims$p
ids<- length(unique(dsM$id))
df.resid<- N-p
mInfo<- data.frame("logLik" = logLik, 
                   "deviance"= deviance, 
                   "AIC" = AIC, "BIC" = BIC,
                   "df.resid" = df.resid, "N" = N, 
                   "p" = p, "ids" = ids)
t<- t(mInfo)
rownames(t)<-colnames(mInfo)
dsmInfo<- data.frame(new=t)
colnames(dsmInfo) <- c("modelA")
# dsmInfo$Coefficient <- rownames(dsmInfo)
mA <- dsmInfo
print(mA)

## 
model <- glsB
logLik<- summary(model)$logLik
deviance<- -2*logLik
AIC<- AIC(model)
BIC<- BIC(model)
df.resid<- NA
N<- summary(model)$dims$N
p<- summary(model)$dims$p
ids<- length(unique(dsM$id))
df.resid<- N-p
mInfo<- data.frame("logLik" = logLik, 
                   "deviance"= deviance, 
                   "AIC" = AIC, "BIC" = BIC,
                   "df.resid" = df.resid, "N" = N, 
                   "p" = p, "ids" = ids)
t<- t(mInfo)
rownames(t)<-colnames(mInfo)
dsmInfo<- data.frame(new=t)
colnames(dsmInfo) <- c("modelB")
# dsmInfo$Coefficient <- rownames(dsmInfo)
mB <- dsmInfo
print(mB)

models <- data.frame(cbind(mA,mB))
dplyr::mutate(models, dif = round(modelB - modelA,2), Index = rownames(dsmInfo)) %>%
  dplyr::select(Index, modelA, modelB, dif)

