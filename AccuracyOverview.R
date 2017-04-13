library(dplyr)
Accuracy10 <- read.csv("C:/IOT2/CART/Accuracy10.csv")
Accuracy20 <- read.csv("C:/IOT2/CART/Accuracy20.csv")
Accuracy30 <- read.csv("C:/IOT2/CART/Accuracy30.csv")
Accuracy40 <- read.csv("C:/IOT2/CART/Accuracy40.csv")
Accuracy50 <- read.csv("C:/IOT2/CART/Accuracy50.csv")

Accuracy10$X <- NULL
Accuracy20$X <- NULL
Accuracy30$X <- NULL
Accuracy40$X <- NULL
Accuracy50$X <- NULL


Accuracy10 <- plyr::rename(Accuracy10, c("ALL"="ALL10", "VIF"="VIF10","RFE"="RFE10"))
Accuracy20<- plyr::rename(Accuracy20, c("ALL"="ALL20", "VIF"="VIF20","RFE"="RFE20"))
Accuracy30 <- plyr::rename(Accuracy30, c("ALL"="ALL30", "VIF"="VIF30","RFE"="RFE30"))
Accuracy40 <- plyr::rename(Accuracy40, c("ALL"="ALL40", "VIF"="VIF40","RFE"="RFE40"))
Accuracy50 <- plyr::rename(Accuracy50, c("ALL"="ALL50", "VIF"="VIF50","RFE"="RFE50"))

Accuracy_cart <- Accuracy10 %>% left_join(Accuracy20,by=c("Class")) %>% left_join(Accuracy30,by=c("Class"))%>% left_join(Accuracy40,by=c("Class"))%>% left_join(Accuracy50,by=c("Class"))

Accuracy_check <- as.data.frame(t(Accuracy_cart[,-1]))
colnames(Accuracy_check) <- trimws(unique(Accuracy_cart$Class),which = c("both"))

Accuracy_cart_all <- Accuracy_check[grep("All",rownames(Accuracy_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
Accuracy_cart_all <- cbind(windowSize,Accuracy_cart_all)
Accuracy_cart_all[is.na(Accuracy_cart_all)] <- 0

write.csv(Accuracy_cart_all,"C:/IOT2/Accuracy_overview_cart.csv")

Accuracy_cart_vif <- Accuracy_check[grep("VIF",rownames(Accuracy_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
Accuracy_cart_vif <- cbind(windowSize,Accuracy_cart_vif)
Accuracy_cart_vif[is.na(Accuracy_cart_vif)] <- 0

write.csv(Accuracy_cart_vif,"C:/IOT2/Accuracy_overview_vif.csv")



# cbbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# g <- ggplot(Accuracy_cart_all,aes(windowSize))
# g <- g+geom_col(position = "dodge",aes(y=AP),width = 1,fill=cbbPalette[1])+geom_col(position = "dodge",aes(y=Laptop),width = 1,fill=cbbPalette[2])+geom_col(position = "dodge",aes(y=PC),width = 1,fill=cbbPalette[3])
# g



#########RF
library(dplyr)
Accuracy10 <- read.csv("C:/IOT2/RF/Accuracy10.csv")
Accuracy20 <- read.csv("C:/IOT2/RF/Accuracy20.csv")
Accuracy30 <- read.csv("C:/IOT2/RF/Accuracy30.csv")
Accuracy40 <- read.csv("C:/IOT2/RF/Accuracy40.csv")
Accuracy50 <- read.csv("C:/IOT2/RF/Accuracy50.csv")

Accuracy10$X <- NULL
Accuracy20$X <- NULL
Accuracy30$X <- NULL
Accuracy40$X <- NULL
Accuracy50$X <- NULL


Accuracy10 <- plyr::rename(Accuracy10, c("ALL"="ALL10", "VIF"="VIF10","RFE"="RFE10"))
Accuracy20<- plyr::rename(Accuracy20, c("ALL"="ALL20", "VIF"="VIF20","RFE"="RFE20"))
Accuracy30 <- plyr::rename(Accuracy30, c("ALL"="ALL30", "VIF"="VIF30","RFE"="RFE30"))
Accuracy40 <- plyr::rename(Accuracy40, c("ALL"="ALL40", "VIF"="VIF40","RFE"="RFE40"))
Accuracy50 <- plyr::rename(Accuracy50, c("ALL"="ALL50", "VIF"="VIF50","RFE"="RFE50"))

Accuracy_cart <- Accuracy10 %>% left_join(Accuracy20,by=c("Class")) %>% left_join(Accuracy30,by=c("Class"))%>% left_join(Accuracy40,by=c("Class"))%>% left_join(Accuracy50,by=c("Class"))

Accuracy_check <- as.data.frame(t(Accuracy_cart[,-1]))
colnames(Accuracy_check) <- trimws(unique(Accuracy_cart$Class),which = c("both"))

Accuracy_cart_all <- Accuracy_check[grep("All",rownames(Accuracy_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
Accuracy_cart_all <- cbind(windowSize,Accuracy_cart_all)
Accuracy_cart_all[is.na(Accuracy_cart_all)] <- 0

write.csv(Accuracy_cart_all,"C:/IOT2/Accuracy_overview_rf.csv")

Accuracy_cart_vif <- Accuracy_check[grep("VIF",rownames(Accuracy_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
Accuracy_cart_vif <- cbind(windowSize,Accuracy_cart_vif)
Accuracy_cart_vif[is.na(Accuracy_cart_vif)] <- 0

write.csv(Accuracy_cart_vif,"C:/IOT2/Accuracy_overview_rf_vif.csv")
