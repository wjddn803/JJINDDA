library(data.table)

setwd("C:/Users/김민구/Desktop/제5회 Big Data Competition-Digital Trend Analyzer")
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


# ,를 !로 바꾸고 실행해보았다.
test = fread("제5회 Big Data Competition-분석용데이터-06.Master1.csv",
             encoding = "UTF-8")

str(test)
head(test)
# 아주 잘 되지만, 아래의 row number에서 엑셀상의 =이 함수로 표기되는 오류로인해
# 엑셀상에서 바꿔주어야 할 것 같다.
test[test$PD_C==450758]

#
