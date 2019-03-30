library(ggplot2)
library(data.table)
library(dplyr)
Lpoi <- fread("final_by_PD_C_cluster.csv")
over30 <- fread("final.csv", encoding = "UTF-8")
nm <- over30 %>% select(PD_NM, PD_C)
nm <- nm[!duplicated(nm)]
Lpoi <- left_join(Lpoi, nm) %>% as.data.table() 

div_ppl=function(data){
  
  a <- data %>% group_by(PD_C) %>% summarise(div.ppl=length(unique(CLNT_ID)))
  
  return(a)
}

dp <- div_ppl(over30)

Lpoi <- full_join(Lpoi, dp)

#====================================
# 1. 비회원 비율
dat <- Lpoi %>% select(non.member)
summary(dat)
ggplot(dat,aes(x=non.member))+
  geom_histogram(binwidth=0.05,color="skyblue4", fill = "steelblue2")+
  scale_fill_manual(values = c("steelblue2", "lemonchiffon2"))+
  theme(panel.background=element_rect(fill="grey98",color="black"))

Lpoi %>% filter(non.member == 0.967) %>% select(PD_NM) %>% unique()


# 2. 여성 회원 비율
dat <- Lpoi %>% select(female.ratio)
summary(dat)
ggplot(dat,aes(x=female.ratio))+
  geom_histogram(binwidth=0.05,color="skyblue4", fill = "steelblue2")+
  theme(panel.background=element_rect(fill="grey98",color="black"))

Lpoi %>% filter(female.ratio==0 & div.ppl > 1) %>% select(PD_NM) %>% unique()


# 3. 연령대 
Lpoi %>% select(age10, PD_NM) %>% summarise(max = max(age10))
Lpoi %>% filter(age10 == 0.8235) %>% select(PD_NM) %>% unique()

Lpoi %>% select(age20, PD_NM) %>% summarise(max = max(age20))
Lpoi %>% filter(age20 == 1) %>% select(PD_NM) %>% unique()

Lpoi %>% select(age30, PD_NM) %>% summarise(max = max(age30))
Lpoi %>% filter(age30 == 1& div.ppl > 5) %>% select(PD_NM) %>% View()

Lpoi %>% select(age40, PD_NM) %>% summarise(max = max(age40))
Lpoi %>% filter(age40 == 1& div.ppl > 5) %>% select(PD_NM)

Lpoi %>% select(age50, PD_NM) %>% summarise(max = max(age50))
Lpoi %>% filter(age50 == 0.75) %>% select(PD_NM)

Lpoi %>% select(age.over60, PD_NM) %>% summarise(max = max(age.over60))
Lpoi %>% filter(age.over60 == 1) %>% select(PD_NM)


# 4. 월별 판매량

Lpoi %>% filter(april == max(april) & div.ppl > 20) %>% select(PD_NM) %>% unique()
Lpoi %>% filter(may == max(may) & div.ppl > 20) %>% select(PD_NM) %>% unique()
Lpoi %>% filter(june == max(june) & div.ppl > 20) %>% select(PD_NM) %>% unique()
Lpoi %>% filter(july == max(july) & div.ppl > 20) %>% select(PD_NM) %>% unique()
Lpoi %>% filter(august == max(august) & div.ppl > 20) %>% select(PD_NM) %>% unique()
Lpoi %>% filter(september == max(september) & div.ppl > 20) %>% select(PD_NM) %>% unique()


# 5. 단가의 가중 평균
dat <- Lpoi %>% select(wtmean.BUY_AM)
summary(dat)
ggplot(dat,aes(x=wtmean.BUY_AM))+
  geom_histogram(binwidth=30000,color="skyblue4", fill = "steelblue2")+
  theme(panel.background=element_rect(fill="grey98",color="black"))

Lpoi %>% filter(wtmean.BUY_AM == min(wtmean.BUY_AM)) %>% select(PD_NM) %>% unique()
Lpoi %>% filter(wtmean.BUY_AM == max(wtmean.BUY_AM)) %>% select(PD_NM) %>% unique()


# 6. 평균 구매 개수
dat <- Lpoi %>% select(mean.ct)
summary(dat)
ggplot(dat,aes(x=mean.ct))+
  geom_histogram(binwidth=1,color="skyblue4", fill = "steelblue2")+
  theme(panel.background=element_rect(fill="grey98",color="black"))

Lpoi %>% filter(mean.ct == max(mean.ct)) %>% select(PD_NM) %>% unique()


# 7. 단일 페이지 당 탐색 시간
dat <- Lpoi %>% select(time.per.pag)
summary(dat)
ggplot(dat,aes(x=time.per.pag))+
  geom_histogram(binwidth=3,color="skyblue4", fill = "steelblue2")+
  theme(panel.background=element_rect(fill="grey98",color="black"))

Lpoi %>% filter(time.per.pag == min(time.per.pag) & div.ppl > 1) %>% select(PD_NM) %>% unique()
Lpoi %>% filter(time.per.pag == max(time.per.pag)& div.ppl > 5) %>% select(PD_NM) %>% unique()


# 8. 평균 HIT
dat <- Lpoi %>% select(mean.hits)
summary(dat)
ggplot(dat,aes(x=mean.hits))+
  geom_histogram(binwidth=10,color="skyblue4", fill = "steelblue2")+
  theme(panel.background=element_rect(fill="grey98",color="black"))

Lpoi %>% filter(mean.hits == min(mean.hits) & div.ppl > 1) %>% select(mean.ct) %>% unique()
Lpoi %>% filter(mean.hits == max(mean.hits)& div.ppl > 1) %>% select(PD_NM) %>% unique()


# 9. RECENCY
dat <- Lpoi %>% select(mean.date.diff)
summary(dat)
ggplot(dat,aes(x=mean.date.diff))+
  geom_histogram(binwidth=10,color="skyblue4", fill = "steelblue2")+
  theme(panel.background=element_rect(fill="grey98",color="black"))

Lpoi %>% filter(mean.date.diff == min(mean.date.diff) & div.ppl > 1) %>% select(PD_NM) %>% unique()
Lpoi %>% filter(mean.date.diff == max(mean.date.diff)& div.ppl > 1) %>% select(PD_NM) %>% unique()

# 10. FREQUENCY
dat <- Lpoi %>% select(frequency) %>% as.data.table()
summary(dat)
ggplot(dat[frequency<=100],aes(x=frequency))+
  geom_histogram(binwidth=5,color="skyblue4", fill = "steelblue2")+
  theme(panel.background=element_rect(fill="grey98",color="black"))

Lpoi %>% filter(frequency == min(frequency) & div.ppl > 1) %>% select(PD_NM) %>% unique()
Lpoi %>% filter(frequency == max(frequency)& div.ppl > 1) %>% select(PD_NM) %>% unique()

# 11. MONETARY
dat <- Lpoi %>% select(monetary) %>% as.data.table()
summary(dat)
ggplot(dat[monetary<=5000000],aes(x=monetary))+
  geom_histogram(binwidth=150000,color="skyblue4", fill = "steelblue2")+
  theme(panel.background=element_rect(fill="grey98",color="black"))

Lpoi %>% filter(monetary == max(monetary)& div.ppl > 1) %>% select(PD_NM) %>% unique()

# 12. 평균 재구매 횟수 
dat <- Lpoi %>% select(mean.repurchase)
summary(dat)
ggplot(dat,aes(x=frequency))+
  geom_histogram(binwidth=5,color="skyblue4", fill = "steelblue2")+
  theme(panel.background=element_rect(fill="grey98",color="black")) +
  ggtitle("Frequency")

Lpoi %>% filter(mean.repurchase == max(mean.repurchase)) %>% select(PD_NM) %>% unique()


dat$fac<-factor(ifelse(dat$mean.hits<=mean(dat$mean.hits),"low","high"),levels=c("low","high"))
ggplot(dat,aes(x=mean.hits,fill=fac))+
  geom_histogram(binwidth=10,color="skyblue4")+
  scale_fill_manual(values = c("lemonchiffon2", "steelblue2"))+
  theme(panel.background=element_rect(fill="grey98",color="black"))


group1 <- filter(Lpoi, mean.ct >= median(mean.ct) & time.per.pag >= median(time.per.pag))
group2 <- filter(Lpoi, mean.ct >= median(mean.ct) & time.per.pag <= median(time.per.pag)) 
group3 <- filter(Lpoi, mean.ct <= median(mean.ct) & time.per.pag >= median(time.per.pag)) 
group4 <- filter(Lpoi, mean.ct <= median(mean.ct) & time.per.pag <= median(time.per.pag)) 

Lpoi <- Lpoi %>% mutate(
  group = case_when(
    mean.ct >= median(mean.ct) & time.per.pag >= median(time.per.pag) ~ 1, 
    mean.ct >= median(mean.ct) & time.per.pag <= median(time.per.pag) ~ 2,
    mean.ct <= median(mean.ct) & time.per.pag >= median(time.per.pag) ~ 3,
    TRUE ~ 4
  ))

library(ggplot2)
Lpoi$group <- factor(Lpoi$group)
# 제품단가
ggplot(Lpoi, aes(x = group, y = wtmean.BUY_AM)) + geom_boxplot() + theme_bw()
# frequency
ggplot(Lpoi, aes(x = group, y = frequency)) + geom_boxplot() + theme_bw()



       