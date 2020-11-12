library(tidyverse)##Fct_rev ()
library(e1071)##traincontrol
library(glmnet)##logistic
library(caret)##confusion matrix

train<-read.csv("C:/Users/Tazeem/Documents/Notes/SEM 4/SM-1/train.csv")
test<-read.csv("C:/Users/Tazeem/Documents/Notes/SEM 4/SM-1/test.csv")
data<-rbind(train,test)
data<-data.frame(data)
colnames(data)[colSums(is.na(data)) > 0]
sum(is.na(data))
str(data)
#Cleaning 

data$Age[data$Age<18]<-0
data$Age[data$Age>=18]<-1
data$Age<-as.factor(data$Age)


data$Class<-factor(data$Class,levels=c("Business","Eco Plus","Eco"),labels=c("1","2","3"))
data$Class<-ordered(data$Class)
data$Class<-fct_rev(data$Class)

data$Flight.Distance[data$Flight.Distance<1500]<-1
data$Flight.Distance[data$Flight.Distance>=1500 & data$Flight.Distance<4800]<-2
data$Flight.Distance[data$Flight.Distance>=4800]<-3
data$Flight.Distance<-as.factor(data$Flight.Distance)

for(i in 9:22)
{
  data[,i]<-ordered(data[,i])
}

data$Departure.Delay.in.Minutes[data$Departure.Delay.in.Minutes!=0]<-1
data$Departure.Delay.in.Minutes[data$Departure.Delay.in.Minutes==0]<-0
data$Departure.Delay.in.Minutes<-ordered(data$Departure.Delay.in.Minutes)
data$Departure.Delay.in.Minutes<-fct_rev(data$Departure.Delay.in.Minutes)

data$Arrival.Delay.in.Minutes[data$Arrival.Delay.in.Minutes!=0]<-1
data$Arrival.Delay.in.Minutes[data$Arrival.Delay.in.Minutes==0]<-0
data$Arrival.Delay.in.Minutes<-ordered(data$Arrival.Delay.in.Minutes)
data$Arrival.Delay.in.Minutes<-fct_rev(data$Arrival.Delay.in.Minutes)

table(data$Arrival.Delay.in.Minutes)
data$Arrival.Delay.in.Minutes[is.na(data$Arrival.Delay.in.Minutes)]<-0


train<-data[1:103904,1:25]
test<-data[103905:129880,1:25]

#Logistic

lg.fit<-glm(satisfaction~.,data=train,family="binomial")
summary(lg.fit)

lg.fit1<-glm(satisfaction~Customer.Type+Age+Type.of.Travel+Class+Departure.Arrival.time.convenient+Ease.of.Online.booking+Online.boarding+Leg.room.service+Baggage.handling+Arrival.Delay.in.Minutes+Departure.Delay.in.Minutes,data=train,family="binomial")
summary(lg.fit1)

trc<-trainControl(method="repeatedcv",number=10,savePredictions = TRUE)
mod_fit<-train(satisfaction~Customer.Type+Age+Type.of.Travel+Class+Departure.Arrival.time.convenient+Ease.of.Online.booking+Online.boarding+Leg.room.service+Baggage.handling+Arrival.Delay.in.Minutes+Departure.Delay.in.Minutes,data=train,method="glm",family="binomial",trControl=trc)

y_pred<-predict(mod_fit,newdata=test)
y_pred
confusionMatrix(y_pred,test$satisfaction)


