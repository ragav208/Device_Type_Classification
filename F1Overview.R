library(dplyr)
F110 <- read.csv("C:/IOT2/CART/F110.csv")
F120 <- read.csv("C:/IOT2/CART/F120.csv")
F130 <- read.csv("C:/IOT2/CART/F130.csv")
F140 <- read.csv("C:/IOT2/CART/F140.csv")
F150 <- read.csv("C:/IOT2/CART/F150.csv")

F110$X <- NULL
F120$X <- NULL
F130$X <- NULL
F140$X <- NULL
F150$X <- NULL


F110 <- plyr::rename(F110, c("ALL"="ALL10", "VIF"="VIF10","RFE"="RFE10"))
F120<- plyr::rename(F120, c("ALL"="ALL20", "VIF"="VIF20","RFE"="RFE20"))
F130 <- plyr::rename(F130, c("ALL"="ALL30", "VIF"="VIF30","RFE"="RFE30"))
F140 <- plyr::rename(F140, c("ALL"="ALL40", "VIF"="VIF40","RFE"="RFE40"))
F150 <- plyr::rename(F150, c("ALL"="ALL50", "VIF"="VIF50","RFE"="RFE50"))

F1_cart <- F110 %>% left_join(F120,by=c("Class")) %>% left_join(F130,by=c("Class"))%>% left_join(F140,by=c("Class"))%>% left_join(F150,by=c("Class"))

F1_check <- as.data.frame(t(F1_cart[,-1]))
colnames(F1_check) <- trimws(unique(F1_cart$Class),which = c("both"))

F1_cart_all <- F1_check[grep("All",rownames(F1_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
F1_cart_all <- cbind(windowSize,F1_cart_all)
F1_cart_all[is.na(F1_cart_all)] <- 0

write.csv(F1_cart_all,"C:/IOT2/F1_overview_cart.csv")

F1_cart_vif <- F1_check[grep("vif",rownames(F1_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
F1_cart_vif <- cbind(windowSize,F1_cart_vif)
F1_cart_vif[is.na(F1_cart_vif)] <- 0

write.csv(F1_cart_vif,"C:/IOT2/F1_overview_cart_vif.csv")

# cbbPalette <- c("#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")
# g <- ggplot(F1_cart_all,aes(windowSize))
# g <- g+geom_col(position = "dodge",aes(y=AP),width = 1,fill=cbbPalette[1])+geom_col(position = "dodge",aes(y=Laptop),width = 1,fill=cbbPalette[2])+geom_col(position = "dodge",aes(y=PC),width = 1,fill=cbbPalette[3])
# g



#########RF
library(dplyr)
F110 <- read.csv("C:/IOT2/RF/F110.csv")
F120 <- read.csv("C:/IOT2/RF/F120.csv")
F130 <- read.csv("C:/IOT2/RF/F130.csv")
F140 <- read.csv("C:/IOT2/RF/F140.csv")
F150 <- read.csv("C:/IOT2/RF/F150.csv")

F110$X <- NULL
F120$X <- NULL
F130$X <- NULL
F140$X <- NULL
F150$X <- NULL


F110 <- plyr::rename(F110, c("ALL"="ALL10", "VIF"="VIF10","RFE"="RFE10"))
F120<- plyr::rename(F120, c("ALL"="ALL20", "VIF"="VIF20","RFE"="RFE20"))
F130 <- plyr::rename(F130, c("ALL"="ALL30", "VIF"="VIF30","RFE"="RFE30"))
F140 <- plyr::rename(F140, c("ALL"="ALL40", "VIF"="VIF40","RFE"="RFE40"))
F150 <- plyr::rename(F150, c("ALL"="ALL50", "VIF"="VIF50","RFE"="RFE50"))

F1_cart <- F110 %>% left_join(F120,by=c("Class")) %>% left_join(F130,by=c("Class"))%>% left_join(F140,by=c("Class"))%>% left_join(F150,by=c("Class"))

F1_check <- as.data.frame(t(F1_cart[,-1]))
colnames(F1_check) <- trimws(unique(F1_cart$Class),which = c("both"))

F1_cart_all <- F1_check[grep("All",rownames(F1_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
F1_cart_all <- cbind(windowSize,F1_cart_all)
F1_cart_all[is.na(F1_cart_all)] <- 0

write.csv(F1_cart_all,"C:/IOT2/F1_overview_rf.csv")

F1_cart_vif <- F1_check[grep("vif",rownames(F1_check),ignore.case = T),]
windowSize=c(10,20,30,40,50)
F1_cart_vif <- cbind(windowSize,F1_cart_vif)
F1_cart_vif[is.na(F1_cart_vif)] <- 0

write.csv(F1_cart_vif,"C:/IOT2/F1_overview_rf_vif.csv")

