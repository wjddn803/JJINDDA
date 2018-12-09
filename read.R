library(data.table)

setwd("C:/Users/김민구/Desktop/제5회 Big Data Competition-Digital Trend Analyzer")
Product <- fread("제5회 Big Data Competition-분석용데이터-01.Pruduct.csv",
                 encoding = "UTF-8")
Search1 <- fread("제5회 Big Data Competition-분석용데이터-02.Search1.csv",
                 encoding = "UTF-8")
Search2 <- fread("제5회 Big Data Competition-분석용데이터-03.Search2.csv",
                 encoding = "UTF-8")
Custom <- fread("제5회 Big Data Competition-분석용데이터-04.Custom.csv",
                encoding = "UTF-8")
Session <- fread("제5회 Big Data Competition-분석용데이터-05.Session.csv",
                 encoding = "UTF-8")


# ,를 !로 바꾸고 실행해보았다.(Ctrl+F -> 바꾸기) file명뒤에 수정버전을 붙였다.
test = fread("제5회 Big Data Competition-분석용데이터-06.Master1.csv",
             encoding = "UTF-8")

str(test)
head(test)


test[test$PD_C==450758]

## 아주 잘 되지만, 아래의 row number에서 엑셀상의 =이 함수로 표기되는 오류로인해
# 엑셀상에서 바꿔주어야 할 것 같다.
# =-추천 셀카봉- 삼각대 블루투스 셀카봉-화이트!블랙     -가성비 인기상품- - 블루투스 셀카봉 / 셀카봉 블랙
# 앞의 =- 제거.
test2= fread("제5회 Big Data Competition-분석용데이터-06.Master2.csv",
             encoding = "UTF-8")
test2[test2$PD_C==450758]
Master=test2; test2=NULL


library(dplyr)
# 상품코드 기준 Left join
test=left_join(Product,Master,by=c('PD_C'='PD_C'))

#View(test)
sum(is.na(test)==TRUE)

# 대분류
# 여성의류 구매비중이 엄청 높다. 그 외에는 화장품 등....
sort(as.factor(round(table(test$CLAC1_NM)/nrow(test),digits=4)),decreasing = T)
colnames(test)

# 중분류 구매수 -> 남자의류가 더 많다
sort(as.factor(table(test$CLAC2_NM)),decreasing=T)

# 소분류 구매수 -> 남성티셔츠가 제일 많음  ---> 여성 의류 가짓수가 더 많아서 대분류에서 여자가 더 많은듯?
head(sort(as.factor(table(test$CLAC3_NM)),decreasing=T),10)

# 대분류 여성의류 중 중분류 비율
female.clothes=test[test$CLAC1_NM=='여성의류',]
table(female.clothes$CLAC2_NM)/nrow(female.clothes)



###########################

str(Search2)

# SEACH_CNT를 INT로 변환해야하므로, gsub로 , 제거.

idx=which(is.na(as.numeric(Search2$SEARCH_CNT))) # NA생성 후 index 확인 606개
Search2$SEARCH_CNT=as.numeric(gsub(',','',Search2[c(1:nrow(Search2)),SEARCH_CNT]))
str(Search2)

str(Search1)

head(Search1,3)


max(Search1$SEARCH_CNT)


sum(Search1$KWD_NM %in% Search2$KWD_NM)





