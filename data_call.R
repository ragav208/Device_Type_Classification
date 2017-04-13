#Fetching Data
library(RSQLite)

driver <- dbDriver("SQLite")

conn_5April <- dbConnect(driver,dbname="classifier_day_train_test_th20k.db")
conn_6April <- dbConnect(driver,dbname="classifier_long_train_test_th20k.db")

sql_train <- "select * from dot11_mac_sign_train as train , devices as d where train.mac = d.mac"
# data_set1 <- dbGetQuery(connect,sql_train)
# data_set2 <- dbGetQuery(conn2,sql_train)
data_set <- dbGetQuery(conn_5April,sql_train)
data_set2 <- dbGetQuery(conn_6April,sql_train)
data_set <- rbind(data_set,data_set2)
#Test Set
sql_test <- "select * from dot11_mac_sign_test as test , devices as d where test.mac = d.mac"
data_test_set <- dbGetQuery(conn_5April,sql_test)
data_test_set2 <- dbGetQuery(conn_6April,sql_test)
data_test_set <- rbind(data_test_set,data_test_set2)

#See np_x_i

# np_x_10_ap <- mean(data_set$np_x_i[which(data_set$type=="AP")])
# 
# np_x_10 <- mean(data_set$np_x_i)
# np_x_20 <- mean(data_set$np_x_i)
# np_x_30 <- mean(data_set$np_x_i)
# np_x_40 <- mean(data_set$np_x_i)
# np_x_50 <- mean(data_set$np_x_i)
# window <- c(10,20,30,40,50)
# packs <- c(np_x_10,np_x_20,np_x_30,np_x_40,np_x_50)
# packetframe <- data.frame(window,packs)



#See Props
# tabprop2 <- (table(data_set$type))
# tabprop3 <- (table(data_set$type))
# tabprop4 <- (table(data_set$type))
# tabprop5 <- (table(data_set$type))
# tabprop_all <- data.frame(rbind(tabprop,tabprop2,tabprop3,tabprop4,tabprop5))
# WindowSIze =c(10,20,30,40,50)
# tabprop_all <- cbind(WindowSIze,tabprop_all)
# write.csv(tabprop_all,"table_proportion.csv")
table(data_set$type)
table(data_test_set$type)

#Get data_set
# data_set <- rbind(data_set1,data_set2)
# 
# #Remove Sq_ vars for now.
# data_set <- data_set[,-grep("sq_",colnames(data_set),ignore.case = T)]



#
#Get Cols with unique vals or cols with SD=0
uniquecols <- colnames(data_set[,sapply(data_set, function(col) length(unique(col))) == 1])

#Remove cols with sd=0
data_set <- data_set[, sapply(data_set, function(col) length(unique(col))) > 1]
#Remove col mac.1 as it's repetative
data_set$mac.1 <- NULL
data_set <- data_set[-which(data_set$type=="Adapter"),]

#Converting all cols to numeric data type (other than mac type and manuf)
mac <- data_set$mac
type <- data_set$type
manuf <- data_set$manuf
#Getting index of char cols
nums <- sapply(data_set, is.character)
#Converting all cols to numeric
data_set[nums] <- sapply(data_set[nums], as.numeric)


data_set$type <- as.factor(type)
data_set$manuf <- manuf
data_set$mac <- mac

#Check all cols in the right datatype
sapply(data_set,class)


#see distribution of type
table(data_set$type) 


#Form Training and Testing Set 
library(caret)
set.seed(1234)
#Create train set
training_set_indexes <- createDataPartition(type,times = 3,p=0.7)

training_set <- data_set[training_set_indexes$Resample1,]

#Create test set
test_set <- data_set[-training_set_indexes$Resample1,]


# training_set2 <- data_set[training_set_indexes$Resample2,]
# test_set2 <- data_set[-training_set_indexes$Resample2,]
# 
# 
# training_set3 <- data_set[training_set_indexes$Resample3,]
# test_set3 <- data_set[-training_set_indexes$Resample3,]
