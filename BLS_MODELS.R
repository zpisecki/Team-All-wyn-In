library(tidyverse)
library (DataExplorer)
library(coefplot)
library(ggplot2)
library(GGally)
library(plyr)
library(ggplot2)
library(MASS)
library(rcompanion)
library (rstanarm)
library(bayestestR)
library (insight)
library(bayesplot)
library(tree)
library(lmtest)
library(rpart)
library(rpart.plot)
library(corrplot)
library(reshape2)
library(BAS)
library(rattle)
library('RColorBrewer')
library(randomForest) ##for random forests (and bagging)


#********************Data Preparation*************************************#

set.seed(4620)

mData <- read.csv("final.csv")
names(mData)
mData <- mData[ , c("Year", "AllwynTitle","Education","Years_Exp","Hourly_Rate")] 
mData$AllwynTitle <-as.factor( mData$AllwynTitle)
mData$Year <-as.factor( mData$Year)
 
sum(is.na(mData))
mData = na.omit(mData)

pdf('GGAlly1.pdf',width = 15, height = 25)
corr <- data.frame(lapply(mData, as.integer))
ggcorr(corr, method = c("pairwise", "spearman"),
       nbreaks = 6,
       hjust = 0.8,
       label = TRUE,
       label_size = 3,
       color = "grey50")
dev.off()

str(mData)

pch.list <- as.numeric(mData$AllwynTitle)
plot(mData$Years_Exp, mData$Hourly_Rate, 
     pch=c(pch.list))

samp_size <- floor(0.7 * nrow(mData))
train_ind <- sample(seq_len(nrow(mData)), size = samp_size)

train <- mData[train_ind,]
test <- mData[-train_ind,]


#************************Linear Regression *******************************#

#Initial Model
result <- lm(Hourly_Rate ~ ., data=train)
model_summ <- summary(result)
print(model_summ)

#Diagnostics
par(mfrow=c(2,2))
plot(result)

confint(result)
dwtest(result)

res <- resid(result)
plot(density(res))

MSE <- mean(model_summ$residuals^2) #train MSE
print(MSE)
RMSE <- sqrt(MSE)   # train RMSE
print(RMSE)
MSE_T <- mean((test$Hourly_Rate - predict.lm(result, test)) ^ 2) #test MSE
print(MSE_T)
RMSE_T <- sqrt(MSE_T)
print(RMSE_T)

mean(abs(test$Hourly_Rate - predict.lm(result, test))) #test MAE

#******************* Reduced Linear Regression ************************************#

#Second  Model
result_2 <- lm(Hourly_Rate ~ Years_Exp, data=train)
model_summ <- summary(result_2)

#Diagnostics
par(mfrow=c(2,2))
plot(result)

confint(result_2)
dwtest(result_2)

res <- resid(result_2)
plot(density(res))

MSE <- mean(model_summ$residuals^2) #train MSE
RMSE <- sqrt(MSE)   # train RMSE
MSE_T <- mean((test$Hourly_Rate - predict.lm(result, test)) ^ 2) #test MSE
RMSE_T <- sqrt(MSE_T)

mean(abs(test$Hourly_Rate - predict.lm(result, test)))


print(MSE)
print(RMSE)
print(MSE_T)
print(RMSE_T)

#******************* Regression Trees************************************#

################################
## Recursive Binary Splitting ##
################################


##fit to regression tree
tree.train <- train[]
tree.test <- test[]
tree.class.train<-tree(Hourly_Rate ~., data=tree.train)
summary(tree.class.train)


tree2<- rpart(tree(Hourly_Rate ~., data=tree.train))
prp(tree2, type=2, nn=TRUE, fallen.leaves=TRUE, faclen=4, varlen=8,  box.palette = "RdYlGn",shadow.col="gray") 

res <- resid(tree.class.train)
plot(density(res))

#########
## MSE ##
#########
y.test<-test[,"Hourly_Rate"]
yhat <- predict(tree.class.train, newdata=test)
mse.recursive <-mean((y.test-yhat)^2)
print (mse.recursive )
RMSE_Test <- sqrt(mse.recursive)
print (RMSE_Test)

mean(abs(test$Hourly_Rate - predict.lm(result, test)))


#******************* Reduced Regression Trees************************************#

################################
## Recursive Binary Splitting ##
################################


##fit to regression tree
tree.train <- train[]
tree.test <- test[]
#tree.class.train<-tree(Hourly_Rate ~ Years_Exp,Education_Bachelors,Education_Masters,Education_Doctorate, data=tree.train)
#summary(tree.class.train)


#rpart test
tree2<- rpart(tree(Hourly_Rate ~Years_Exp + Education, data=tree.train))
rpart.plot(tree2, box.palette="RdBu", shadow.col="gray", nn=TRUE)
summary(tree.class.train)

plot(tree.class.train)
text(tree.class.train, cex=0.75, pretty=0)

res <- resid(tree.class.train)
plot(density(res))

#########
## MSE ##
#########
y.test<-test[,"Hourly_Rate"]
yhat <- predict(tree.class.train, newdata=test)
mse.recursive <-mean((y.test-yhat)^2)
print (mse.recursive )
RMSE_Test <- sqrt(mse.recursive)
print (RMSE_Test)

#*****************Random Forest***************************
#Random Forest
rf.class<-randomForest(Hourly_Rate~., data=tree.train, mtry=3, importance=TRUE)
importance(rf.class)
varImpPlot(rf.class)
summary(rf.class)
