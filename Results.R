result_ALL <- data.frame(acc11_test$byClass)
result_ALL$class <- unlist(strsplit(rownames(result_ALL),":"))[2*(1:nrow(result_ALL))]


result_VIF <- data.frame(acc21_test$byClass)
result_VIF$class <- unlist(strsplit(rownames(result_VIF),":"))[2*(1:nrow(result_VIF))]


# result_RFE <- data.frame(acc31_test$byClass)
# result_RFE$class <- unlist(strsplit(rownames(result_RFE),":"))[2*(1:nrow(result_RFE))]


combined_result <- result_ALL %>% left_join(result_VIF,by=c("class"))#%>% left_join(result_RFE,by=c("class"))

precision_tab_10 <- data.frame(Class=combined_result$class,ALL=combined_result$Precision.x,VIF=combined_result$Precision.y)#,RFE=combined_result$Precision)
Recall_tab_10 <- data.frame(Class=combined_result$class,ALL=combined_result$Recall.x,VIF=combined_result$Recall.y)#,RFE=combined_result$Recall)
F1_tab_10 <- data.frame(Class=combined_result$class,ALL=combined_result$F1.x,VIF=combined_result$F1.y)#,RFE=combined_result$F1)
Accuracy_tab_10 <- data.frame(Class=combined_result$class,ALL=combined_result$Balanced.Accuracy.x,VIF=combined_result$Balanced.Accuracy.y)#,RFE=combined_result$Balanced.Accuracy)

write.csv(precision_tab_10,"C:/IOT2/CART/Precision50.csv")
write.csv(Recall_tab_10,"C:/IOT2/CART/Recall50.csv")
write.csv(F1_tab_10,"C:/IOT2/CART/F150.csv")
write.csv(Accuracy_tab_10,"C:/IOT2/CART/Accuracy50.csv")



allvars <- data.frame(acc11_test$overall)
vifvars<- data.frame(acc21_test$overall)
#RFEvars<- data.frame(acc31_test$overall)

result10_overall <- cbind(allvars,vifvars)#,RFEvars)

write.csv(result10_overall,"C:/IOT2/CART/Overall_Accuracy_50.csv")
