ts <- fread("to5_3.csv",encoding = "UTF-8" )
names(ts)
head(ts)

View(ts)


ysl <- ts[PD_C==737746]%>%select(date, LPOI)
time_index<-seq(from = as.POSIXct("2018-04-01"), 
                to = as.POSIXct("2018-09-30"), by = "day")
tint<- xts(ysl$LPOI, order.by = time_index)
plot.xts(tint,col="navy") # plot of call


library(forecast)
Acf(tint,lag=50);Pacf(tint,lag=50) #

fit <- auto.arima(tint)

tint.ts <- ts(tint)
pred <- forecast(tint, h = 10)
plot(pred)
