library(dplyr)
Recall10 <- read.csv("C:/IOT2/CART/Recall10.csv")
Recall20 <- read.csv("C:/IOT2/CART/Recall20.csv")
Recall30 <- read.csv("C:/IOT2/CART/Recall30.csv")
Recall40 <- read.csv("C:/IOT2/CART/Recall40.csv")
Recall50 <- read.csv("C:/IOT2/CART/Recall50.csv")

Recall10$X <- NULL
Recall20$X <- NULL
Recall30$X <- NULL
Recall40$X <- NULL
Recall50$X <- NULL


Recall10 <- plyr::rename(Recall10, c("ALL"="ALL10", "VIF"="VIF10","RFE"="RFE10"))
Recall20<- plyr::rename(Recall20, c("ALL"="ALL20", "VIF"="VIF20","RFE"="RFE20"))
Recall30 <- plyr::rename(Recall30, c("ALL"="ALL30", "VIF"="VIF30","RFE"="RFE30"))
Recall40 <- plyr::rename(Recall40, c("ALL"="ALL40", "VIF"="VIF40","RFE"="RFE40"))
Recall50 <- plyr::rename(Recall50, c("ALL"="ALL50", "VIF"="VIF50","RFE"="RFE50"))

Recall_cart <- Recall10 %>% left_join(Recall20,by=c("Class")) %>% left_join(Recall30,by=c("Class"))%>% left_join(Recall40,by=c("Class"))%>% left_join(Recall50,by=c("Class"))

Recall_check <- as.data.frame(t(Recall_cart[,-1]))
colnames(Recall_check) <- trimws(unique(Recall_cart$Class),which = c("both"))

Recall_cart_all <- Recall_check[grep("All",rownames(Recall_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
Recall_cart_all <- cbind(windowSize,Recall_cart_all)
Recall_cart_all[is.na(Recall_cart_all)] <- 0

write.csv(Recall_cart_all,"C:/IOT2/Recall_overview_cart.csv")


Recall_cart_vif <- Recall_check[grep("vif",rownames(Recall_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
Recall_cart_vif <- cbind(windowSize,Recall_cart_vif)
Recall_cart_vif[is.na(Recall_cart_vif)] <- 0

write.csv(Recall_cart_vif,"C:/IOT2/Recall_overview_cart_vif.csv")



# cbbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# g <- ggplot(Recall_cart_all,aes(windowSize))
# g <- g+geom_col(position = "dodge",aes(y=AP),width = 1,fill=cbbPalette[1])+geom_col(position = "dodge",aes(y=Laptop),width = 1,fill=cbbPalette[2])+geom_col(position = "dodge",aes(y=PC),width = 1,fill=cbbPalette[3])
# g



#########RF
library(dplyr)
Recall10 <- read.csv("C:/IOT2/RF/Recall10.csv")
Recall20 <- read.csv("C:/IOT2/RF/Recall20.csv")
Recall30 <- read.csv("C:/IOT2/RF/Recall30.csv")
Recall40 <- read.csv("C:/IOT2/RF/Recall40.csv")
Recall50 <- read.csv("C:/IOT2/RF/Recall50.csv")

Recall10$X <- NULL
Recall20$X <- NULL
Recall30$X <- NULL
Recall40$X <- NULL
Recall50$X <- NULL


Recall10 <- plyr::rename(Recall10, c("ALL"="ALL10", "VIF"="VIF10","RFE"="RFE10"))
Recall20<- plyr::rename(Recall20, c("ALL"="ALL20", "VIF"="VIF20","RFE"="RFE20"))
Recall30 <- plyr::rename(Recall30, c("ALL"="ALL30", "VIF"="VIF30","RFE"="RFE30"))
Recall40 <- plyr::rename(Recall40, c("ALL"="ALL40", "VIF"="VIF40","RFE"="RFE40"))
Recall50 <- plyr::rename(Recall50, c("ALL"="ALL50", "VIF"="VIF50","RFE"="RFE50"))

Recall_cart <- Recall10 %>% left_join(Recall20,by=c("Class")) %>% left_join(Recall30,by=c("Class"))%>% left_join(Recall40,by=c("Class"))%>% left_join(Recall50,by=c("Class"))

Recall_check <- as.data.frame(t(Recall_cart[,-1]))
colnames(Recall_check) <- trimws(unique(Recall_cart$Class),which = c("both"))

Recall_cart_all <- Recall_check[grep("All",rownames(Recall_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
Recall_cart_all <- cbind(windowSize,Recall_cart_all)
Recall_cart_all[is.na(Recall_cart_all)] <- 0

write.csv(Recall_cart_all,"C:/IOT2/Recall_overview_rf.csv")

Recall_cart_vif <- Recall_check[grep("vif",rownames(Recall_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
Recall_cart_vif <- cbind(windowSize,Recall_cart_vif)
Recall_cart_vif[is.na(Recall_cart_vif)] <- 0

write.csv(Recall_cart_vif,"C:/IOT2/Recall_overview_rf_vif.csv")

