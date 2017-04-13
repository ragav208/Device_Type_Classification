library(usdm)
set.seed(1234)

t1 <- Sys.time()
vif_train = vifcor(training_set[,-which(colnames(training_set)%in%c("type","mac","manuf"))],th=0.5)
t2 <- Sys.time()
t2-t1

variables_included <- vif_train@variables[-which(vif_train@variables %in% vif_train@excluded)]
variables_excluded <- vif_train@excluded

# vif_train2 = vifcor(training_set[,which(colnames(training_set)%in%c(vars_incl2))],th=0.5)
# variables_included2 <- vif_train2@variables[-which(vif_train2@variables %in% vif_train2@excluded)]



#Check correlation of features left
checkcorr <- vif_train@corMatrix
checkcorr[upper.tri(checkcorr,diag = T)]<-0
checkcorr[which(checkcorr<=0.5 & checkcorr >=-0.5  )] <- 0
checkcorr[which(is.na(checkcorr))] <- 0
library(corrplot)
corrplot(checkcorr, method="circle")



# variables_included <- read.csv("combined_vars.csv")
# variables_included <- as.character(variables_included$x)






