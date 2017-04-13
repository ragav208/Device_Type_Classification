library(dplyr)
precision10 <- read.csv("C:/IOT2/CART/Precision10.csv")
precision20 <- read.csv("C:/IOT2/CART/Precision20.csv")
precision30 <- read.csv("C:/IOT2/CART/Precision30.csv")
precision40 <- read.csv("C:/IOT2/CART/Precision40.csv")
precision50 <- read.csv("C:/IOT2/CART/Precision50.csv")

precision10$X <- NULL
precision20$X <- NULL
precision30$X <- NULL
precision40$X <- NULL
precision50$X <- NULL


precision10 <- plyr::rename(precision10, c("ALL"="ALL10", "VIF"="VIF10","RFE"="RFE10"))
precision20<- plyr::rename(precision20, c("ALL"="ALL20", "VIF"="VIF20","RFE"="RFE20"))
precision30 <- plyr::rename(precision30, c("ALL"="ALL30", "VIF"="VIF30","RFE"="RFE30"))
precision40 <- plyr::rename(precision40, c("ALL"="ALL40", "VIF"="VIF40","RFE"="RFE40"))
precision50 <- plyr::rename(precision50, c("ALL"="ALL50", "VIF"="VIF50","RFE"="RFE50"))

precision_cart <- precision10 %>% left_join(precision20,by=c("Class")) %>% left_join(precision30,by=c("Class"))%>% left_join(precision40,by=c("Class"))%>% left_join(precision50,by=c("Class"))

precision_check <- as.data.frame(t(precision_cart[,-1]))
colnames(precision_check) <- trimws(unique(precision_cart$Class),which = c("both"))
  
precision_cart_all <- precision_check[grep("All",rownames(precision_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
precision_cart_all <- cbind(windowSize,precision_cart_all)
precision_cart_all[is.na(precision_cart_all)] <- 0

write.csv(precision_cart_all,"C:/IOT2/precision_overview_cart.csv")

precision_cart_vif <- precision_check[grep("vif",rownames(precision_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
precision_cart_vif <- cbind(windowSize,precision_cart_vif)
precision_cart_vif[is.na(precision_cart_vif)] <- 0

write.csv(precision_cart_vif,"C:/IOT2/precision_overview_cart_vif.csv")



# cbbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# g <- ggplot(precision_cart_all,aes(windowSize))
# g <- g+geom_col(position = "dodge",aes(y=AP),width = 1,fill=cbbPalette[1])+geom_col(position = "dodge",aes(y=Laptop),width = 1,fill=cbbPalette[2])+geom_col(position = "dodge",aes(y=PC),width = 1,fill=cbbPalette[3])
# g



#########RF
library(dplyr)
precision10 <- read.csv("C:/IOT2/RF/Precision10.csv")
precision20 <- read.csv("C:/IOT2/RF/Precision20.csv")
precision30 <- read.csv("C:/IOT2/RF/Precision30.csv")
precision40 <- read.csv("C:/IOT2/RF/Precision40.csv")
precision50 <- read.csv("C:/IOT2/RF/Precision50.csv")

precision10$X <- NULL
precision20$X <- NULL
precision30$X <- NULL
precision40$X <- NULL
precision50$X <- NULL


precision10 <- plyr::rename(precision10, c("ALL"="ALL10", "VIF"="VIF10","RFE"="RFE10"))
precision20<- plyr::rename(precision20, c("ALL"="ALL20", "VIF"="VIF20","RFE"="RFE20"))
precision30 <- plyr::rename(precision30, c("ALL"="ALL30", "VIF"="VIF30","RFE"="RFE30"))
precision40 <- plyr::rename(precision40, c("ALL"="ALL40", "VIF"="VIF40","RFE"="RFE40"))
precision50 <- plyr::rename(precision50, c("ALL"="ALL50", "VIF"="VIF50","RFE"="RFE50"))

precision_cart <- precision10 %>% left_join(precision20,by=c("Class")) %>% left_join(precision30,by=c("Class"))%>% left_join(precision40,by=c("Class"))%>% left_join(precision50,by=c("Class"))

precision_check <- as.data.frame(t(precision_cart[,-1]))
colnames(precision_check) <- trimws(unique(precision_cart$Class),which = c("both"))

precision_cart_all <- precision_check[grep("All",rownames(precision_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
precision_cart_all <- cbind(windowSize,precision_cart_all)
precision_cart_all[is.na(precision_cart_all)] <- 0

write.csv(precision_cart_all,"C:/IOT2/precision_overview_rf.csv")

precision_cart_vif <- precision_check[grep("vif",rownames(precision_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
precision_cart_vif <- cbind(windowSize,precision_cart_vif)
precision_cart_vif[is.na(precision_cart_vif)] <- 0

write.csv(precision_cart_vif,"C:/IOT2/precision_overview_rf_vif.csv")

