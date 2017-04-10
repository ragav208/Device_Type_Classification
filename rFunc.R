
rfeControl_test = rfeControl(functions = rfFuncs, method = "cv",
                             #seeds = seeds,
                             number = 10)

set.seed(1)
training_set_check <- training_set[,which(colnames(training_set)%in%c(variables_included,"type","mac","manuf"))]
rfMod <- rfe(training_set_check[,-which(colnames(training_set_check)%in%c("type","manuf","mac"))],training_set_check$type, 
             sizes = c(10,25,50,75,100,125,150,175,200,225,250,275,300,325,350,370),
             rfeControl = rfeControl_test)



vars_incl <- rfMod$optVariables



rfeControl_test = rfeControl(functions = rfFuncs, method = "cv",
                             #seeds = seeds,
                             number = 10)

set.seed(1)
training_set_check <- training_set
rfMod <- rfe(training_set_check[,-which(colnames(training_set_check)%in%c("type","manuf","mac"))],training_set_check$type, 
             sizes = c(10,25,50,75,100,125,150,175,200,225,250,275,300,325,350,370),
             rfeControl = rfeControl_test)



vars_incl2 <- rfMod$optVariables



training_set_corr <- training_set[,which(colnames(training_set)%in% vars_incl)] 
checkcorr <- cor(training_set_corr)
checkcorr[upper.tri(checkcorr,diag = T)]<-0
checkcorr[which(checkcorr<=0.5 & checkcorr >=-0.5  )] <- 0
checkcorr[which(is.na(checkcorr))] <- 0
library(corrplot)
corrplot(checkcorr, method="circle")



