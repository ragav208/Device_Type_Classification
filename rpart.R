library(rpart)
colnames(training_set)
training_set <- training_set[,-which(colnames(training_set)%in%c("manuf","mac"))]


#Test wit all variables
#1. build model with cross validation 
library(caret)
ctrl <- trainControl(method="cv",10,savePredictions = "final")
tuned_model <- train(type~.,data = training_set,method="rpart",trControl=ctrl)
rpart_all <- tuned_model$finalModel

#Plot model
library(rattle)
library(rpart.plot)
library(RColorBrewer)

fancyRpartPlot(rpart_all)
#rpart.plot(train_rpart,trace=-1)

#Check variable importance in model
varrpart <- varImp(rpart_all)
varrpart$VAR <- rownames(varrpart)
library(dplyr)
varrpart <- varrpart %>% mutate(Percent_Imp = (Overall/sum(Overall))*100) %>% arrange(Overall)
varrpart <- varrpart[order(varrpart$Percent_Imp,decreasing = T),]
varrpart$Overall <- NULL
varrpart <- varrpart[which(varrpart$Percent_Imp>0.5),]


#Test model built
test_set$pred <-  predict(rpart_all,newdata = test_set,type="class")
acc11 <- confusionMatrix(test_set$pred,test_set$type,mode="prec_recall")

test_set2$pred <- predicted_vals <- predict(rpart_all,newdata = test_set2,type="class")
acc12 <- confusionMatrix(test_set2$pred,test_set2$type,mode="prec_recall")

test_set3$pred <- predicted_vals <- predict(rpart_all,newdata = test_set3,type="class")
acc13 <- confusionMatrix(test_set3$pred,test_set3$type,mode="prec_recall")

#Test with VIF variables
training_set_vif <- training_set[,which(colnames(training_set)%in%c(variables_included,"type"))]

#1. build model with cross validation 
library(caret)
ctrl <- trainControl(method="cv",10,savePredictions = "final")
tuned_model <- train(type~.,data = training_set_vif,method="rpart",trControl=ctrl)
rpart_vif <- tuned_model$finalModel

fancyRpartPlot(rpart_vif)
#rpart.plot(train_rpart,trace=-1)

#Check variable importance in model
varrpart <- varImp(rpart_vif)
varrpart$VAR <- rownames(varrpart)
library(dplyr)
varrpart <- varrpart %>% mutate(Percent_Imp = (Overall/sum(Overall))*100) %>% arrange(Overall)
varrpart <- varrpart[order(varrpart$Percent_Imp,decreasing = T),]
varrpart$Overall <- NULL
varrpart <- varrpart[which(varrpart$Percent_Imp>0.5),]


#Test model built
test_set$pred <-  predict(rpart_vif,newdata = test_set,type="class")
acc21 <- confusionMatrix(test_set$pred,test_set$type,mode="prec_recall")

test_set2$pred <- predicted_vals <- predict(rpart_vif,newdata = test_set2,type="class")
acc22 <- confusionMatrix(test_set2$pred,test_set2$type,mode="prec_recall")

test_set3$pred <- predicted_vals <- predict(rpart_vif,newdata = test_set3,type="class")
acc23 <- confusionMatrix(test_set3$pred,test_set3$type,mode="prec_recall")


#Test with rfFunc vars
training_set_rf <- training_set[,which(colnames(training_set)%in%c(vars_incl2,"type"))]

#1. build model with cross validation 
ctrl <- trainControl(method="cv",10,savePredictions = "final")
tuned_model <- train(type~.,data = training_set_rf,method="rpart",trControl=ctrl)
rpart_rf <- tuned_model$finalModel

fancyRpartPlot(rpart_rf)
#rpart.plot(train_rpart,trace=-1)

#Check variable importance in model
varrpart <- varImp(rpart_rf)
varrpart$VAR <- rownames(varrpart)
library(dplyr)
varrpart <- varrpart %>% mutate(Percent_Imp = (Overall/sum(Overall))*100) %>% arrange(Overall)
varrpart <- varrpart[order(varrpart$Percent_Imp,decreasing = T),]
varrpart$Overall <- NULL
varrpart <- varrpart[which(varrpart$Percent_Imp>0.5),]


#Test model built
test_set$pred <-  predict(rpart_rf,newdata = test_set,type="class")
acc31 <- confusionMatrix(test_set$pred,test_set$type,mode="prec_recall")

test_set2$pred <- predicted_vals <- predict(rpart_rf,newdata = test_set2,type="class")
acc32 <- confusionMatrix(test_set2$pred,test_set2$type,mode="prec_recall")

test_set3$pred <- predicted_vals <- predict(rpart_rf,newdata = test_set3,type="class")
acc33 <- confusionMatrix(test_set3$pred,test_set3$type,mode="prec_recall")


#Test with VIF after rffunc

#Test with VIF variables
training_set_vif2 <- training_set[,which(colnames(training_set)%in%c(variables_included2,"type"))]

#1. build model with cross validation 
library(caret)
ctrl <- trainControl(method="cv",10,savePredictions = "final")
tuned_model <- train(type~.,data = training_set_vif2,method="rpart",trControl=ctrl)
rpart_vif2 <- tuned_model$finalModel

fancyRpartPlot(rpart_vif2)
#rpart.plot(train_rpart,trace=-1)

#Check variable importance in model
varrpart <- varImp(rpart_vif2)
varrpart$VAR <- rownames(varrpart)
library(dplyr)
varrpart <- varrpart %>% mutate(Percent_Imp = (Overall/sum(Overall))*100) %>% arrange(Overall)
varrpart <- varrpart[order(varrpart$Percent_Imp,decreasing = T),]
varrpart$Overall <- NULL
varrpart <- varrpart[which(varrpart$Percent_Imp>0.5),]


#Test model built
test_set$pred <-  predict(rpart_vif2,newdata = test_set,type="class")
acc41 <- confusionMatrix(test_set$pred,test_set$type,mode="prec_recall")

test_set2$pred <- predicted_vals <- predict(rpart_vif2,newdata = test_set2,type="class")
acc42 <- confusionMatrix(test_set2$pred,test_set2$type,mode="prec_recall")

test_set3$pred <- predicted_vals <- predict(rpart_vif2,newdata = test_set3,type="class")
acc43 <- confusionMatrix(test_set3$pred,test_set3$type,mode="prec_recall")
