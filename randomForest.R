library(randomForest)
colnames(training_set)
#training_set <- training_set[,-which(colnames(training_set)%in%c("manuf","mac"))]


#Test wit all variables
#1. build model with cross validation 
library(caret)
ctrl <- trainControl(method="cv",10,savePredictions = "final")
#tunegrid <- expand.grid(.mtry=c(1:floor(sqrt(ncol(training_set)))))
tuned_model <- train(type~.,data = training_set,method="rf",trControl=ctrl)
rf_all <- tuned_model$finalModel

#Plot variable importance of model
varImpPlot(rf_all)


#Check variable importance in model
varrf <- varImp(rf_all)
varrf$VAR <- rownames(varrf)
library(dplyr)
varrf <- varrf %>% mutate(Percent_Imp = (Overall/sum(Overall))*100) %>% arrange(Overall)
varrf <- varrf[order(varrf$Percent_Imp,decreasing = T),]
varrf$Overall <- NULL
varrf <- varrf[which(varrf$Percent_Imp>0.5),]


#Test model built
test_set$pred <-  predict(rf_all,newdata = test_set,type="class")
accrf11 <- confusionMatrix(test_set$pred,test_set$type,mode="prec_recall")

data_test_set$pred <-  predict(rf_all,newdata = data_test_set,type="class")
accrf11_test <- confusionMatrix(data_test_set$pred,data_test_set$type,mode="prec_recall")


# test_set2$pred <- predicted_vals <- predict(rf_all,newdata = test_set2,type="class")
# accrf12 <- confusionMatrix(test_set2$pred,test_set2$type,mode="prec_recall")
# 
# test_set3$pred <- predicted_vals <- predict(rf_all,newdata = test_set3,type="class")
# accrf13 <- confusionMatrix(test_set3$pred,test_set3$type,mode="prec_recall")

#Test with VIF variables
training_set_vif <- training_set[,which(colnames(training_set)%in%c(variables_included,"type"))]

#1. build model with cross validation 
library(caret)
ctrl <- trainControl(method="cv",10,savePredictions = "final")
tuned_model <- train(type~.,data = training_set_vif,method="rf",trControl=ctrl)
rf_vif <- tuned_model$finalModel


#Check variable importance in model
varrf <- varImp(rf_vif)
varrf$VAR <- rownames(varrf)
library(dplyr)
varrf <- varrf %>% mutate(Percent_Imp = (Overall/sum(Overall))*100) %>% arrange(Overall)
varrf <- varrf[order(varrf$Percent_Imp,decreasing = T),]
varrf$Overall <- NULL
varrf <- varrf[which(varrf$Percent_Imp>0.5),]
#Var Importance Plot
varImpPlot(rf_vif)

#Test model built
test_set$pred <-  predict(rf_vif,newdata = test_set,type="class")
accrf21 <- confusionMatrix(test_set$pred,test_set$type,mode="prec_recall")

data_test_set$pred <-  predict(rf_vif,newdata = data_test_set,type="class")
accrf21_test <- confusionMatrix(data_test_set$pred,data_test_set$type,mode="prec_recall")


# test_set2$pred <- predicted_vals <- predict(rf_vif,newdata = test_set2,type="class")
# accrf22 <- confusionMatrix(test_set2$pred,test_set2$type,mode="prec_recall")
# 
# test_set3$pred <- predicted_vals <- predict(rf_vif,newdata = test_set3,type="class")
# accrf23 <- confusionMatrix(test_set3$pred,test_set3$type,mode="prec_recall")


#Test with rfFunc vars
training_set_rf <- training_set[,which(colnames(training_set)%in%c(vars_incl2,"type"))]

#1. build model with cross validation 
ctrl <- trainControl(method="cv",10,savePredictions = "final")
tuned_model <- train(type~.,data = training_set_rf,method="rf",trControl=ctrl)
rf_rf <- tuned_model$finalModel


#Check variable importance in model
varrf <- varImp(rf_rf)
varrf$VAR <- rownames(varrf)
library(dplyr)
varrf <- varrf %>% mutate(Percent_Imp = (Overall/sum(Overall))*100) %>% arrange(Overall)
varrf <- varrf[order(varrf$Percent_Imp,decreasing = T),]
varrf$Overall <- NULL
varrf <- varrf[which(varrf$Percent_Imp>0.5),]

#VarImp plot
varImpPlot(rf_rf)

#Test model built
test_set$pred <-  predict(rf_rf,newdata = test_set,type="class")
accrf31 <- confusionMatrix(test_set$pred,test_set$type,mode="prec_recall")

data_test_set$pred <-  predict(rf_rf,newdata = data_test_set,type="class")
accrf31_test <- confusionMatrix(data_test_set$pred,data_test_set$type,mode="prec_recall")


# test_set2$pred <- predicted_vals <- predict(rf_rf,newdata = test_set2,type="class")
# accrf32 <- confusionMatrix(test_set2$pred,test_set2$type,mode="prec_recall")
# 
# test_set3$pred <- predicted_vals <- predict(rf_rf,newdata = test_set3,type="class")
# accrf33 <- confusionMatrix(test_set3$pred,test_set3$type,mode="prec_recall")


#Test with VIF after rffunc

#Test with VIF variables
training_set_vif2 <- training_set[,which(colnames(training_set)%in%c(variables_included2,"type"))]

#1. build model with cross validation 
ctrl <- trainControl(method="cv",10,savePredictions = "final")
tuned_model <- train(type~.,data = training_set_vif2,method="rf",trControl=ctrl)
rf_vif2 <- tuned_model$finalModel

#rpart.plot(train_rpart,trace=-1)

#Check variable importance in model
varrf <- varImp(rf_vif2)
varrf$VAR <- rownames(varrf)
library(dplyr)
varrf <- varrf %>% mutate(Percent_Imp = (Overall/sum(Overall))*100) %>% arrange(Overall)
varrf <- varrf[order(varrf$Percent_Imp,decreasing = T),]
varrf$Overall <- NULL
varrf <- varrf[which(varrf$Percent_Imp>0.5),]

varImpPlot(rf_vif2)

#Test model built
test_set$pred <-  predict(rf_vif2,newdata = test_set,type="class")
accrf41 <- confusionMatrix(test_set$pred,test_set$type,mode="prec_recall")


data_test_set$pred <-  predict(rf_vif2,newdata = data_test_set,type="class")
accrf41_test <- confusionMatrix(data_test_set$pred,data_test_set$type,mode="prec_recall")

# test_set2$pred <- predicted_vals <- predict(rf_vif2,newdata = test_set2,type="class")
# accrf42 <- confusionMatrix(test_set2$pred,test_set2$type,mode="prec_recall")
# 
# test_set3$pred <- predicted_vals <- predict(rf_vif2,newdata = test_set3,type="class")
# accrf43 <- confusionMatrix(test_set3$pred,test_set3$type,mode="prec_recall")
