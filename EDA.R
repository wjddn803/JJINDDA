library(data.table)

setwd("C:/Users/Annie/Desktop/제5회 Big Data Competition-Digital Trend Analyzer")
Product <- fread("제5회 Big Data Competition-분석용데이터-01.Pruduct.csv",
                encoding = "UTF-8")
Search1 <- fread("제5회 Big Data Competition-분석용데이터-02.Search1.csv",
                 encoding = "UTF-8")
Search2 <- fread("제5회 Big Data Competition-분석용데이터-03.Search2.csv",
                 encoding = "UTF-8")
Master <- fread("제5회 Big Data Competition-분석용데이터-06.Master.csv",
                encoding = "UTF-8")
Custom <- fread("제5회 Big Data Competition-분석용데이터-04.Custom.csv",
                 encoding = "UTF-8")
Session <- fread("제5회 Big Data Competition-분석용데이터-05.Session.csv",
                 encoding = "UTF-8")

table(Custom$CLNT_AGE)
hist(Custom$CLNT_AGE, breaks = c(10,20,30,40,50,60,70,80))
