library(data.table)
library(dplyr)
setwd("C:/Users/Annie/Desktop/제5회 Big Data Competition-Digital Trend Analyzer")
brand.nm <- fread("PSCM_brand_complete2.csv", encoding = "UTF-8")
Search2 <- fread("제5회 Big Data Competition-분석용데이터-03.Search2.csv", 
                 encoding = "UTF-8")
Search2$KWD_NM <- toupper(Search2$KWD_NM)

Search2$KWD_NM <- gsub("\\[","",Search2$KWD_NM,perl = T)
Search2$KWD_NM <- gsub("\\]","",Search2$KWD_NM,perl = T)
Search2$KWD_NM <- gsub(" ","",Search2$KWD_NM,perl = T)

Search2$KWD_NM <- gsub("여성|남성|여자|남자|여아|남아", "", Search2$KWD_NM,perl=T)

obj <- sub("ADIDAS", "아디다스", Search2$KWD_NM, fixed = T)
obj <- sub("스텔라맥카트니아디다스|슬리퍼아디다스|아동아디다스|아쿠아슈즈아디다스|운동화아디다스|
           유아아디다스|주니어아디다스|축구화아디다스|키즈아디다스|키즈아디다스레깅스|
           키즈아디다스운동화|풋살화아디다스", "아디다스", obj, perl = T)
obj <- sub("AESOP", "이솝", obj, fixed = T)
obj <- sub("4CUS", "4커스", obj, fixed = T)
obj <- sub("ALDO", "알도", obj, fixed = T)
obj <- sub("AGE20|AGE20'S|AGE20S", "에이지투웨니스", obj, perl = T)
obj <- sub("ARENA", "아레나", obj, fixed = T)
obj <- sub("ASUS", "아수스", obj, fixed = T)
obj <- sub("AVENE", "아벤느", obj, fixed = T)
obj <- sub("AVEDA", "아베다", obj, fixed = T)
obj <- sub("BALLY", "발리", obj, fixed = T)
obj <- sub("BALMUDA", "발뮤다", obj, fixed = T)
obj <- sub("BARREL", "배럴", obj, fixed = T)
obj <- sub("BBQ", "비비큐", obj, fixed = T)
obj <- sub("BCBG", "비씨비지", obj, fixed = T)
obj <- sub("BEANPOLE", "빈폴", obj, fixed = T)
obj <- sub("BELIF", "빌리프", obj, fixed = T)
obj <- sub("BENEFIT", "베네피트", obj, fixed = T)
obj <- sub("BIODERMA", "바이오더마", obj, fixed = T)
obj <- sub("BIOTHERM", "비오템", obj, fixed = T)
obj <- sub("BIRKENSTOCK", "버켄스탁", obj, fixed = T)
obj <- sub("BLACKYAK", "블랙야크", obj, fixed = T)
obj <- sub("BLUEDOG", "블루독", obj, fixed = T)
obj <- sub("BOBBIBROWN", "바비브라운", obj, fixed = T)
obj <- sub("BUCKAROO", "버커루", obj, fixed = T)
obj <- sub("BURBERRY", "버버리", obj, fixed = T)
obj <- sub("BVLGARI", "불가리", obj, fixed = T)
obj <- sub("BYC", "비와이씨", obj, fixed = T)
obj <- sub("BYREDO", "바이레도", obj, fixed = T)
obj <- sub("CALVINKLEINJEANS|CKJ|CKONE|CKONE향수|CALVINKLEIN", "캘빈클라인", 
           obj, perl = T)
obj <- sub("CANMAKE", "캔메이크", obj, fixed = T)
obj <- sub("CANON", "캐논", obj, fixed = T)
obj <- sub("CARHARTT", "칼하트", obj, fixed = T)
obj <- sub("CARRIER", "캐리어", obj, fixed = T)
obj <- sub("CASIO", "카시오", obj, fixed = T)
obj <- sub("CAUDALIE", "꼬달리", obj, fixed = T)
obj <- sub("CCCOLLECT", "씨씨콜렉트", obj, fixed = T)
obj <- sub("CC컬렉트|CC콜렉트", "씨씨콜렉트", obj, perl = T)
obj <- sub("CELLFUSION", "셀퓨전씨", obj, fixed = T)
obj <- sub("CHAMPION", "챔피언", obj, fixed = T)
obj <- sub("CHANEL|CHANNEL", "샤넬", obj, fixed = T)
obj <- sub("CHERRYKOKO", "체리코코", obj, fixed = T)
obj <- sub("CHLOE", "끌로에", obj, fixed = T)
obj <- sub("CJ|CJ냉면|CJ맛밤|CJ식품|CJ유산균|CJ제일제당|CJ피부유산균|CJ햇반",
           "씨제이", obj, perl = T)
obj <- sub("CLARINS", "클라란스", obj, fixed = T)
obj <- sub("CLEDEPEAU", "끌레드뽀보떼", obj, fixed = T)
obj <- sub("CLINIQUE|클리니크|클리니크로션|클리니크마스카라|클리니크수분크림|
           클리니크치크팝|클리니크토너|치크팝", "크리니크", obj, perl = T)
obj <- sub("CLIO", "클리오", obj, fixed = T)
obj <- sub("클립샌들|클립스니커즈|클립슬립온", "CLLIB", obj, perl = T)
obj <- sub("CLRIDE.N", "클라이드", obj, fixed = T)
obj <- sub("CNP|CNPRX", "차앤박", obj, perl = T)
obj <- sub("COACH", "코치", obj, fixed = T)
obj <- sub("CODESCOMBINE", "코데즈컴바인", obj, fixed = T)
obj <- sub("COIINCOS", "코인코즈", obj, fixed = T)
obj <- sub("COLUMBIA", "컬럼버스", obj, fixed = T)
obj <- sub("CONVERSE", "컨버스", obj, fixed = T)
obj <- sub("COSMEDECORTE", "데코르테", obj, fixed = T)
obj <- sub("COUPS", "꾸즈", obj, fixed = T)
obj <- sub("COURONNE|COURONNE가방", "쿠론", obj, perl = T)
obj <- sub("CROCS|CROCS키즈", "크록스", obj, perl = T)
obj <- sub("CUCKOO|IH압력밥솥|IH후라이팬", "쿠쿠", obj, perl = T)
obj <- sub("CU기프티콘|CU모바일|CU모바일상품권|CU상품권", "씨유", obj, perl = T)
obj <- sub("DAB|DAB속옷|DAB잠옷", "댑", obj, perl = T)
obj <- sub("DAKS|DAKSKIDS", "닥스", obj, perl = T)
obj <- sub("DANIELWELLINGTON|DW시계|DW", "다니엘웰링턴", obj, perl = T)
obj <- sub("DARPHIN", "달팡", obj, fixed = T)
obj <- sub("DELLASTELLA", "델라스텔라", obj, fixed = T)
obj <- sub("DESCENTE", "데상트", obj, fixed = T)
obj <- sub("DESIGNUNITED", "디자인유나이티드", obj, fixed = T)
obj <- sub("DEWL|DEWL코트|DWEL", "듀엘", obj, perl = T)
obj <- sub("DHC클렌징오일", "DHC", obj, fixed = T)
obj <- sub("DICKIES", "디키즈", obj, fixed = T)
obj <- sub("DIESEL", "디젤", obj, fixed = T)
obj <- sub("DIOR|DIOR999|DIOR립|DIOR틴트|DIOR향수|DIOR화장품","디올", obj, perl = T)
obj <- sub("DISCOVERY", "디스커버리", obj, fixed = T)
obj <- sub("DJI|DJI스파크","디제이아이", obj, perl = T)
obj <- sub("DKNY|DKNY가방|DKNY시계|DKNY신발|DKNY시계|DKNY원피스|DKNY크로스백",
           "디케이엔와이", obj, perl = T)
obj <- sub("DLA", "디엘에이", obj, fixed = T)
obj <- sub("DOMBA", "돔바슈즈", obj, fixed = T)
obj <- sub("DR.G", "닥터지", obj, fixed = T)
obj <- sub("DR.JART|DRJART", "닥터자르트", obj, perl = T)
obj <- sub("DR.MARTENS", "닥터마틴", obj, fixed = T)
obj <- sub("DYNAFIT", "다이나핏", obj, fixed = T)
obj <- sub("DYSON", "다이슨", obj, fixed = T)
obj <- sub("EBLIN", "에블린", obj, fixed = T)
obj <- sub("EGO|EGOIST", "에고이스트", obj, perl = T)
obj <- sub("EIDER", "아이더", obj, fixed = T)
obj <- sub("ELIZABETHARDEN", "엘리자베스아덴", obj, fixed = T)
obj <- sub("ELLE", "엘르", obj, fixed = T)
obj <- sub("EME", "이엠이", obj, fixed = T)
obj <- sub("EMK|EMK선풍기", "이엠이", obj, perl = T)
obj <- sub("EMPOLHAM", "엠폴햄", obj, fixed = T)
obj <- sub("ENC|ENC가디건|ENC니트|ENC바지|ENC블라우스|ENC셔츠|ENC스커트|ENC원피스|ENC자켓|
           ENC점퍼|ENC청바지|ENC코트|ENC티셔츠|ENC팬츠",  "이엔씨", obj, perl = T)
obj <- sub("COMMENCER", "꼬망스", obj, fixed = T)
obj <- sub("^발렌시아가", "BALENCIAGA", obj, perl = T)
obj <- sub("ENOR", "인블리스", obj, fixed = T)
obj <- sub("ESPOIR", "에스쁘아", obj, fixed = T)
obj <- sub("ESTEELAUDER", "에스티로더", obj, fixed = T)
obj <- sub("ETTOI", "에뜨와", obj, fixed = T)
obj <- sub("ETUDEHOUSE", "에뛰드하우스", obj, fixed = T)
obj <- sub("EVISU|EVISU티셔츠", "에비수", obj, perl = T)
obj <- sub("EXCELSIOR", "왓코", obj, fixed = T)
obj <- sub("FCMM|FCMM라인트랙팬츠|FCMM롱패딩|FCMM반바지|FCMM크롭트랙팬츠|FCMM후드집업|
           FCMM후리스", "에프씨엠엠", obj, perl = T)
obj <- sub("FELTICS", "펠틱스", obj, fixed = T)
obj <- sub("FILA|FILABAG|FILAKIDS|FILASHOES|FILA가방|FILA롱패딩|FILA맨투맨|FILA반팔티|
           FILA슬리퍼|FILA운동화|FILA티셔츠", "휠라", obj, perl = T)
obj <- sub("FLUKE", "플루크", obj, fixed = T)
obj <- sub("FOREVER21|FOREVER21원피스", "포에버21", obj, perl = T)
obj <- sub("FREEPLUS", "FREEPLUS", obj, fixed = T)
obj <- sub("FRESH|FRESH향수|FRESH화장품","프레쉬", obj, perl = T)
obj <- sub("FRJ|FRJ남성|FRJ남성청바지|FRJ맨투맨|FRJ반바지|FRJ여성|FRJ여성청바지|FRJ점퍼|
           FRJ청바지|FRJ청바지남성|FRJ청바지여성|FRJ티셔츠", "에프알제이", obj, perl = T)
obj <- sub("GAP|GAPBABY|GAP여성|GAP원피스|GAP키즈|GAP티셔츠|GAP후드|GAPKIDS", 
           "갭", obj, perl = T)
obj <- sub("베이비갭|베이비갭바디수트|베이비갭우주복", "갭", obj, perl = T)
obj <- sub("GCUT", "지컷", obj, fixed = T)
obj <- sub("GGPX|GGPX가디건|GGPX니트|GGPX바지|GGPX블라우스|GGPX셔츠|GGPX스커트|GGPX야상|
           GGPX원피스|GGPX자켓|GGPX점퍼|GGPX코트|GGPX티셔츠|GGPX팬츠", "지지피엑스", 
           obj, perl = T)
obj <- sub("GIORDANO", "지오다노", obj, fixed = T)
obj <- sub("GIORGIOARMANI", "조르지오아르마니", obj, fixed = T)
obj <- sub("^아르마니", "조르지오아르마니", obj, perl = T)
obj <- sub("GIVENCHY", "지방시", obj, fixed = T)
obj <- sub("GIVY", "기비", obj, fixed = T)
obj <- sub("JEEP|JEEP래쉬가드|JEEP맨투맨|JEEP모자|JEEP바지|JEEP반바지|JEEP반팔|
           JEEP반팔티|JEEP옷|JEEP의류|JEEP점퍼|JEEP키즈|JEEP티셔츠|JEEP티셔츠반팔|
           JEEP후드집업", "지프", obj, perl = T)
obj <- sub("GNM|GNM자연의품격", "자연의품격", obj, perl = T)
obj <- sub("GOLDENGOOSE|대전골든구스", "골든구스", obj, perl = T)
obj <- sub("GROSMIMI", "그로미미", obj, fixed = T)
obj <- sub("GS25|GS25기프티콘|GS25상품권|GS유어스|GS편의점|GS편의점모바일|GS편의점쿠폰", 
           "지에스25", obj, perl = T)
obj <- sub("GUCCI|GUCCIBAG|GUCCI가방|GUCCI지갑|구찌롯데|2018구찌선글라스|
           아이폰구찌케이스", "구찌", obj, perl = T)
obj <- sub("GUERLAIN", "겔랑", obj, fixed = T)
obj <- sub("GUESS|GUESSJEAN|GUESSSHOES|GUESSWATCH|GUESS가방|GUESS구두|지바이게스|
           GUESS반팔티|GUESS슈즈|GUESS시계|GUESS청바지|GUESS티셔츠|키즈게스", 
           "게스", obj, perl = T)
obj <- sub("GV2", "지브이투", obj, fixed = T)
obj <- sub("H:CONNECT|H:CONNECT여성|HCONNECT|HCONNECT남성|HCONNECT여성|
           HCONNECT원피스|H커넥트|H커넥트남성|H커넥트블라우스| H커넥트셔츠|
           H커넥트여성|H커넥트여성바지|H커넥트원피스|H커넥트티셔츠|H커넥트팬츠",
           "에이치커넥트", obj, perl = T)
obj <- sub("HANSKIN", "한스킨", obj, fixed = T)
obj <- sub("^3CE", "쓰리씨이", obj, perl = T)
obj <- sub("HANYUL", "한율", obj, fixed = T)
obj <- sub("HAPPYCALL", "해피콜", obj, fixed = T)
obj <- sub("HAS|HAS레인부츠|HAS레인코트|HAS우산|HAS장화", "헤즈", obj, fixed = T)
obj <- sub("HAZZYS|HAZZYS여성", "헤지스", obj, perl = T)
obj <- sub("HEAD", "헤드", obj, fixed = T)
obj <- sub("HENUS", "헨어스", obj, fixed = T)
obj <- sub("HERA", "헤라", obj, fixed = T)
obj <- sub("HUM|HUM여성|HUM티셔츠", "흄", obj, perl = T)
obj <- sub("HUROM", "휴롬", obj, fixed = T)
obj <- sub("HUXLEY", "헉슬리", obj, fixed = T)
obj <- sub("IKEA", "이케아", obj, fixed = T)
obj <- sub("IMVELY", "임블리", obj, fixed = T)
obj <- sub("^3M","쓰리엠", obj, perl = T)
obj <- sub("IMZ|IMZ프리미엄", "아이엠지프리미엄", obj, perl = T)
obj <- sub("INNISFREE", "이니스프리", obj, fixed = T)
obj <- sub("IOPE|쿠션팩트아이오페", "아이오페", obj, perl = T)
obj <- sub("IPTIME|IPTIME공유기", "아이피타임", obj, perl = T)
obj <- sub("ISOI", "아이소이", obj, fixed = T)
obj <- sub("IZZAT|THEIZZAT", "더아이잗", obj, perl = T)
obj <- sub("J.ESTINA|JESTINA", "제이에스티나", obj, perl = T)
obj <- sub("JAJU", "바바라", obj, fixed = T)
obj <- sub("JANSPORT|JANSPORT백팩", "잔스포츠", obj, perl = T)
obj <- sub("JDX|JDX골프|JDX골프남성|JDX골프여성|JDX골프웨어|JDX남성|
           JDX남성골프바지|JDX남성골프웨어|JDX남성골프웨어남성바지|JDX남성바지|
           JDX바지|JDX여성|JDX여성골프웨어", "제이디엑스", obj, perl = T)
obj <- sub("JELISPOON", "젤리스푼", obj, fixed = T)
obj <- sub("JILLSTUART", "질스튜어트", obj, fixed = T) 
obj <- sub("^질바이", "질스튜어트", obj, perl = T) 
obj <- sub("JIMMYCHOO", "지미추", obj, fixed = T) 
obj <- sub("JJ지고트|JJ지고트니트|JJ지고트바지|JJ지고트블라우스|JJ지고트스커트|
           JJ지고트원피스|JJ지고트자켓|JJ지고트코트|JJ지고트티셔츠|JJ지고트팬츠|
           JJ지코트|JJ지코트블라우스|JJ지코트스커트|JJ지코트원피스|JJ지코트자켓|
           JJ지코트자켓|JJ지코트팬츠","제이제이지고트", obj, perl = T)
obj <- sub("JMW|JMWM5001A|JMW고데기|JMW드라이기|JMW드라이기팬텀|JMW팬텀", 
           "제이엠더블유", obj, perl = T)
obj <- sub("JOCKEY|JOCKEY브라|JOCKEY속옷", "쟈키", obj, perl = T)
obj <- sub("JOMALONE", "조말론", obj, fixed = T)
obj <- sub("JUCYJUDY", "쥬시쥬디", obj, fixed = T)
obj <- sub("JUSTMYSIZE", "저스트마이사이즈", obj, fixed = T)
obj <- sub("K-SWISS|KSWISS|KSWISS롱패딩|KSWISS샌들|KSWISS운동화|K스위스",
           "케이스위스", obj, perl = T)
obj <- sub("K2", "케이투", obj, fixed = T)
obj <- sub("K2[가-힣]","케이투", obj, perl = T)
obj <- sub("KAKAO", "카카오프렌즈", obj, fixed = T)
obj <- sub("KANGOL", "캉골", obj, fixed = T)
obj <- sub("KAPPA", "카파", obj, fixed = T)
#obj <- sub("KATE", "케이트", obj, fixed = T)
obj <- sub("KAWS", "유니클로", obj, fixed = T)
obj <- sub("KEDS|KEDS운동화", "케즈", obj, perl = T)
obj <- sub("킨유니크|킨샌들|킨등산화", "KEEN", obj, perl = T)
obj <- sub("KENNETHLADY", "케네스레이디", obj, fixed = T)
obj <- sub("KHOS", "코스", obj, fixed = T)
obj <- sub("KIEHL'S|KIEHLS", "키엘", obj, perl = T)
obj <- sub("KIPLING", "키플링", obj, fixed = T)
obj <- sub("KTKT기기변경|KT데이터쿠폰|KT클립카드", "케이티", obj, perl = T)
obj <- sub("LAB|LABSERIES|LAB화장품", "랩시리즈", obj, perl = T)
obj <- sub("LACOSTE|LACOSTE여성", "라코스테", obj, perl = T)
obj <- sub("LANCOME", "랑콤", obj, fixed = T)
obj <- sub("LANEIGE", "라네즈", obj, fixed = T)
obj <- sub("LAB원피스", "LAP", obj, fixed = T)
obj <- sub("랩버킷백|랩티셔츠|랩크로스백|랩지갑|랩티|랩코트|랩팬츠|랩바지|랩반바지|
           랩자켓|랩점퍼|랩트렌치코트|랩가디건|랩원피스|랩스커트|랩가방|랩스카프|랩반팔|
           랩로브|랩모자|랩와이드팬츠|랩청바지|랩린넨자켓|랩셔츠|랩롱원피스|랩에코백|
           랩롱스커트|랩강다니엘|랩신발|랩데님|랩청자켓|랩니트|랩드레스|랩린넨|랩쇼퍼백|
           랩미키|랩야상|랩숄더백|랩맨투맨|랩가방크로스백|랩점프수트|랩린넨원피스|랩패딩|
           랩점프슈트|랩반팔티|랩트렌치|랩티셔츠반팔", "LAP", obj, perl = T)
obj <- sub("LBL|LBL니트|LBL린넨|LBL바지|LBL스포츠|LBL코트", "엘비엘", obj, perl = T)
obj <- sub("LEGO", "레고", obj, fixed = T)
obj <- sub("LESHOP", "르샵", obj, fixed = T)
obj <- sub("LEVIS", "리바이스", obj, fixed = T)
obj <- sub("^LG[A-Zㄱ-히]", "LG전자", obj, perl = T)
obj <- sub("^엘지[A-Zㄱ-히]", "LG전자", obj, perl = T)
obj <- sub("놀이방매트LG하우시스|LG하우시스매트|LG창호|엘지창호|지인창호|엘지하우시스|
           엘지하우시스매트|엘지창호|엘지하우시스아소방", "LG하우시스", obj, perl = T)
obj <- sub("LG생활건강|LG생활건강화장품|엘지화장품|리엔샴푸|리엔염색약|리엔흑모비책|
           리엔", "LG생활건강", obj, perl = T)
obj <- sub("LINE|LINE블라우스|LINE스커트|LINE원피스|LINE자켓|LINE팬츠","라인", 
           obj, perl = T)
obj <- sub("LINEFRIENDS", "라인프렌즈", obj, perl = T)
obj <- sub("^LIST", "리스트", obj, perl = T)
obj <- sub("LOVCAT|LOVCAT가방", "러브캣", obj, perl = T)
#obj <- sub("LUNA", "루나", obj, fixed = T)
obj <- sub("LUSH", "러쉬", obj, fixed = T)
obj <- sub("MAGJAY", "매그제이", obj, fixed = T)
obj <- sub("MAKEUPFOREVER", "메이크업포에버", obj, fixed = T)
obj <- sub("MAMONDE", "마몽드", obj, fixed = T)
obj <- sub("^MANGO", "망고", obj, perl = T)
obj <- sub("MARCJACOBS", "마크제이콥스", obj, fixed = T)
obj <- sub("MARMOT", "마모트", obj, fixed = T)
obj <- sub("MEDICUBE", "메디큐브", obj, fixed = T)
obj <- sub("MEDIHEAL", "메디힐", obj, fixed = T)
obj <- sub("MELISSA", "멜리사", obj, fixed = T)
obj <- sub("METROCITY|METROCITY가방", "멜리사", obj, perl = T)
obj <- sub("MICHAA", "잇미샤", obj, fixed = T)
obj <- sub("MINIMUM", "미니멈", obj, fixed = T)
obj <- sub("MINDBRIDGE", "마인드브릿지", obj, fixed = T)
obj <- sub("MILLET", "밀레", obj, fixed = T)
obj <- sub("MISOPE", "미소페", obj, fixed = T)
obj <- sub("MISSHA", "미샤", obj, fixed = T)
obj <- sub("MIXXO|MIXXO블라우스|MIXXO스커트|MIXXO원피스", "미쏘", obj, fixed = T)
obj <- sub("MLBB", "엠엘BB", obj, fixed = T)
obj <- sub("^MLB", "엠엘비", obj, perl = T)
obj <- sub("NARS|NARS쿠션", "나스", obj, perl = T)
obj <- sub("^네셔널", "내셔널지오그래픽", obj, perl = T)
obj <- sub("NATIONAL|NATIONALGEOGRAPHIC|지오그래픽|지오그래픽티셔츠|
           지오내셔널그래픽반팔|내셔널", "내셔널지오그래픽", obj, perl = T)
obj <- sub("NATUREREPUBLIC", "네이처리퍼블릭", obj, fixed = T)
obj <- sub("NEWBALANCE|NEWBALANCEKIDS|NEWBALANCESHOES|운동화NEWBALANCE|
           트레이닝바지뉴발란스|키즈뉴발란스|아동뉴발란스|슬리퍼뉴발란스", 
           "뉴발란스", obj, perl = T)
obj <- sub("힙색나이키|플레이키즈프로나이키모자|플레이키즈프로나이키|플레이키즈나이키|
           키즈나이키운동화|키즈나이키|주니어나이키|유아나이키운동화|유아나이키|웨이스트백나이키|
           우먼스나이키에어맥스엑시스|아쿠아슈즈나이키|아동나이키운동화|아동나이키|수영복나이키|
           롯데백화점나이키|롯데닷컴나이키", "나이키", obj, perl = T)
obj <- sub("^NIKE", "나이키", obj, perl = T)
obj <- sub("OHUI", "오휘", obj, fixed = T)
obj <- sub("OPI|OPI네일|OPI손톱영양제", "오피아이", obj, perl = T)
obj <- sub("ORGANICMOM", "오가닉맘", obj, fixed = T)
obj <- sub("ORIGINS", "오리진스", obj, fixed = T)
obj <- sub("ORYANY", "오야니", obj, fixed = T)
obj <- sub("OSLO", "오슬로", obj, fixed = T)
obj <- sub("OXO|OXO조리도구", "옥소", obj, perl = T)
obj <- sub("OZOC|OZOC원피스", "오조크", obj, perl = T)
obj <- sub("PACORABANNE", "파코라반", obj, fixed = T)
obj <- sub("PANCOAT", "팬콧", obj, fixed = T)
obj <- sub("PATAGONIA", "파타고니아", obj, fixed = T)
obj <- sub("PAT|PAT티셔츠|PAT바지", "피에이티", obj, perl = T)
obj <- sub("PAULSBOUTIQUE", "폴스부띠끄", obj, fixed = T)
obj <- sub("PRADA|PRADA가방|PRADA지갑", "프라다", obj, perl = T)
obj <- sub("PRIMERA", "프리메라", obj, fixed = T)
obj <- sub("PUMA|PUMA슬리퍼|PUMA신발|PUMA운동화", "푸마", obj, perl = T)
obj <- sub("R.ROBOT", "알로봇", obj, fixed = T)
obj <- sub("REEBOK", "리복", obj, fixed = T)
obj <- sub("RENOMA", "레노마", obj, fixed = T)
obj <- sub("^RMK", "알엠케이", obj, perl = T)
obj <- sub("ROCKPORT", "락포트", obj, fixed = T)
obj <- sub("ROEM", "로엠", obj, fixed = T)
obj <- sub("ROSEMONT", "로즈몽", obj, fixed = T)
obj <- sub("SAMANTHA|SAMANTHATHAVASA", "사만사타바사", obj, perl = T)
obj <- sub("SAMSUNG", "삼성", obj, fixed = T)
obj <- sub("SANDISK|USB샌디스크", "샌디스크", obj, fixed = T)
obj <- sub("SAPPUN", "사뿐", obj, fixed = T)
obj <- sub("SERIES|SERIES셔츠|SERIES;|SERIES시리즈|SERIES티셔츠", 
           "시리즈", obj, perl = T)
obj <- sub("SHESMISS", "쉬즈미스", obj, fixed = T)
obj <- sub("SHISEIDO", "시세이도", obj, fixed = T)
obj <- sub("SHUUEMURA", "슈에무라", obj, fixed = T)
obj <- sub("SIEG|SIEG정장", "지이크", obj, fixed = T)
obj <- sub("SIERO", "시에로", obj, fixed = T)
obj <- sub("SISLEY", "시슬리", obj, fixed = T)
obj <- sub("SK-2|SKII|에스케이투|에스케이투230|에스케이투에센스|에스케이투크림|
           에스케이투파운데이션|에스케이투피테라에센스", "SK-II", obj, fixed = T)
obj <- sub("^SK2", "SK-II", obj, perl = T)
obj <- sub("SKINFOOD", "스킨푸드", obj, fixed = T)
obj <- sub("SKONO|SKONO신발", "스코노", obj, perl = T)
obj <- sub("SKT|SKT기기변경|SKT기기변경|SKT스마트홈|SK기기변경", "에스케이텔레콤", 
           obj, perl = T)
obj <- sub("SK매직식기세척기|SK매직전기레인지|SK매직정수기|SK매직정수기렌탈|
           SK식기세척기|SK정수기|SK정수기렌탈", 
           "SK매직", obj, perl = T)
obj <- sub("SODA|SODA남성", "소다", obj, perl = T)
obj <- sub("SOUP|SWEETSOUP", "숲", obj, perl = T)
obj <- sub("^SOUP", "숲", obj, perl = T)
obj <- sub("SPAO", "스파오", obj, fixed = T)
obj <- sub("SPUR|SPUR샌들|SPUR플랫", "스퍼", obj, perl = T)
obj <- sub("SPYDER", "스파이더", obj, fixed = T)
obj <- sub("STILA", "스틸라", obj, fixed = T)
obj <- sub("^STL", "에스티엘", obj, perl = T)
obj <- sub("STONEHENGE", "스톤헨지", obj, fixed = T)
obj <- sub("STUDIOTOMBOY|TOMBOY", "톰보이", obj, perl = T)
obj <- sub("^스튜디오톰보이", "톰보이", obj, perl = T)
obj <- sub("SULWHASOO", "설화수", obj, fixed = T)
obj <- sub("STARBUCKS", "스타벅스", obj, fixed = T)
obj <- sub("SUM|SUM:37|SUM37", "숨37", obj, perl = T)
obj <- sub("SUPERGA", "수페르가", obj, fixed = T)
obj <- sub("SWAROVSKI|SWAROVSKI목걸이", "스와로브스키", obj, perl = T)
obj <- sub("TATE|TATE남성|TATE여성|TATE티셔츠", "테이트", obj, perl = T)
obj <- sub("^TBJ", "티비제이", obj, perl = T)
obj <- sub("TEVA", "테바", obj, fixed = T)
obj <- sub("THEBODYSHOP", "더바디샵", obj, fixed = T)
obj <- sub("THEHISTORYOFWHOO", "WHOO", obj, fixed = T)
obj <- sub("THENORTHFACE|더노스페이스|더노스페이스키즈|아쿠아슈즈노스페이스|
           키즈노스페이스|힙색노스페이스", "노스페이스", obj, perl = T)
obj <- sub("THERMOS", "써모스", obj, fixed = T)
obj <- sub("THURSDAY|THURSDAYISLAND|THURSDAYISLAND블라우스|THURSDAYISLAND원피스|
           THURSDAYISLAND티셔츠", "써스데이아일랜드",obj, perl = T)
obj <- sub("THYREN", "티렌", obj, fixed = T)
obj <- sub("TIFFANY", "티파니", obj, fixed = T)
obj <- sub("TOMFORD|TOMFORD/TF", "톰포드",obj, perl = T)
obj <- sub("TOMMYHILFIGER|TOMMYHILFIGER여성/TF", "타미힐피거",obj, perl = T)
obj <- sub("TOMMYJEANS", "타미진", obj, fixed = T)
obj <- sub("TOMS", "탐스", obj, fixed = T)
obj <- sub("TOOCOOLFORSCHOOL", "투쿨포스쿨", obj, fixed = T)
obj <- sub("TOPTEN", "탑텐", obj, fixed = T)
obj <- sub("TOPGIRL", "탑걸", obj, fixed = T)
obj <- sub("TS미라클쿠션|TS샴푸|TS염색약|TS화장품", "TS",obj, perl = T)
obj <- sub("URBANDECAY", "어반디케이", obj, fixed = T)
obj <- sub("VALENTINO|롯데백화점발렌티노", "발렌티노", obj, perl = T)
obj <- sub("VANAKE", "반에이크", obj, fixed = T)
obj <- sub("VANS|VANSSHOES|VANS신발", "반스",obj, perl = T)
obj <- sub("VBC까사|VBC까사인칸토", "브이비씨까사",obj, perl = T)
obj <- sub("^VDL", "브이디엘", obj, perl = T)
obj <- sub("VIDIVICI", "비디비치", obj, fixed = T)
obj <- sub("VINCIS", "빈치스벤치", obj, fixed = T)
obj <- sub("VISITINNEWYORK", "비지트인뉴욕", obj, fixed = T)
obj <- sub("^VOV", "보브", obj, perl = T)
obj <- sub("VT|VT코스메틱|VT쿠션|VT팩트", "VT코스메틱",obj, perl = T)
obj <- sub("W.ANGLE골프웨어|WANGLE", "와이드앵글", obj, perl = T)
obj <- sub("XOXO|XOXO가방|XOXO래쉬가드", "엑소엑소", obj, perl = T)
obj <- sub("YESSE", "예쎄", obj, fixed = T)
obj <- sub("^YES", "예스", obj, perl = T)
obj <- sub("YSL립|YSL립스틱|YSL쿠션|YSL향수|YSL화장품", "입생로랑", obj, perl = T)
obj <- sub("ZIOZIA", "지오지아", obj, fixed = T)
obj <- sub("^ZOOC", "쥬크", obj, perl = T)
obj <- sub("대상트", "데상트", obj, fixed = T)
obj <- sub("남자몽블랑지갑|남자지갑몽블랑|롯데백화점몽블랑", "몽블랑", obj, perl = T)
obj <- sub("롯데백화점폴로", "폴로", obj, fixed = T)
obj <- sub("뷰선글라스", "VIEU", obj, perl = T) # |뷰
obj <- sub("블랙박스파인뷰", "파인뷰", obj, fixed = T)
obj <- sub("빈가디건|빈구두|빈남아|빈남아바지|빈남아반바지|빈남아점퍼|
           빈남아티셔츠|빈남아팬츠|빈래쉬가드|빈레깅스|빈바람막이|빈바지|
           빈반바지", "BEEN", obj, perl = T) 
#obj <- sub("빔", "BVEAM", obj, fixed = T)         
obj <- sub("순수더살롱컬러|순수살롱|순수염색약|순수염색약밀크브라운",
           "순수더살롱", obj, perl = T)
obj <- sub("신우팜", "신우팜라텍스", obj, fixed = T)  
obj <- sub("^샘소나이트[ㄱ-히]", "쌤소나이트", obj, perl = T)
obj <- sub("SI바지|SI블라우스|SI스커트|SI원피스|SI자켓|SI티셔츠|SI팬츠|
           씨SI블라우스|씨SI티셔츠|씨바지|씨브라우스|씨블라우스|씨스커트",
           "씨SI", obj, perl = T)
obj <- sub("아모스녹차실감|아모스녹차실감샴푸|아모스샴푸|아모스에센스|
           아모스컬링에센스|아모스트리트먼트|아모스헤어|아모스헤어에센스",
           "아모스프로페셔널", obj, perl = T)
obj <- sub("애플|애플노트북|애플마우스|애플에어팟|애플와치|애플와치3|애플워치|
           애플워치3|애플워치밴드|애플워치케이스|애플이어팟|애플이어폰|
           애플정품케이스|애플케어|애플케이블|애플케이스|애플키보드|애플팬슬|
           애플펜슬|애플펜슬2|에어팟애플", "APPLE", obj, perl = T)
obj <- sub("MN선풍기|엠엔|엠엔선풍기", "엠엔MN", obj, perl = T)  
obj <- sub("엠씨|엠씨가디건|엠씨니트|엠씨마자켓|엠씨셔츠|엠씨바지|
           엠씨베스트|엠씨브라우스|엠씨블라우스", "EMCEE", obj, perl = T)
obj <- sub("^MCM", "엠씨엠", obj, perl = T)
obj <- sub("지갑MCM", "엠씨엠", obj, fixed = T)
obj <- sub("윈UNE|윈바지|윈블라우스|윈스커트|윈원피스|윈원피스77|
           윈자켓|윈정장|윈팬츠", "UNE", obj, perl = T) # 윈
obj <- sub("제트스트림|제트스트림0.38|제트스트림0.5|제트스트림0.7|
           제트스트림3색|제트스트림리필|시그노", "유니펜", obj, perl = T)
obj <- sub("유니프렌드|유니프렌드내의", "유니프랜드", obj, perl = T)
obj <- sub("이종임", "이종임김치", obj, fixed = T)   
obj <- sub("입생로랑가방|입생로랑가방크로스백|입생로랑가방클러치|입생로랑반지갑|
           입생로랑백|입생로랑선글라스|입생로랑숄더백|입생로랑스니커즈|입생로랑지갑|
           입생로랑지갑반지갑|입생로랑지갑카드지갑|입생로랑카드지갑|입생로랑크로스백|
           입생로랑클러치|입생로랑클러치백|입생카드지갑", "생로랑", obj, perl = T)
obj <- sub("입생쿠션|입생틴트|쿠션팩트입생로랑", "입생로랑", obj, perl = T)
obj <- sub("제스", "XESS", obj, fixed = T)
obj <- sub("귀걸이제이에스티나", "제이에스티나", obj, fixed = T)
obj <- sub("존슨즈", "존슨즈베이비", obj, fixed = T)
obj <- sub("유산균종근당", "종근당", obj, fixed = T)
obj <- sub("속초중앙닭강정", "중앙닭강정", obj, fixed = T)
obj <- sub("쥬시주디|쥬시주디원피스|쥬디쥬시", "쥬시쥬디", obj, perl = T)
obj <- sub("버드바이쥬시꾸띄르", "쥬시꾸띄르", obj, fixed = T)
obj <- sub("정관장지니펫", "지니펫", obj, fixed = T)
obj <- sub("남자지방시클러치백", "지방시", obj, fixed = T)
obj <- sub("여성청결제질경이", "질경이", obj, fixed = T)
obj <- sub("카드지갑질스튜어트", "질스튜어트", obj, fixed = T)
obj <- sub("동원천지인", "천지인", obj, fixed = T)
obj <- sub("최경주|최경주바지", "최경주골프", obj, perl = T)
obj <- sub("천호", "천호엔케어", obj, fixed = T)
obj <- sub("^천호[ㄱ-히]", "천호엔케어", obj, perl = T)
obj <- sub("캐리어냉난방기|캐리어냉장고|캐리어벽걸이|캐리어벽걸이에어컨|캐리어에어컨|
           캐리어에어컨2IN1|캐리어에어컨렌탈|캐리어에어컨벽걸이|캐리어에어컨벽걸이형|
           캐리어이동식에어컨|캐리어제습기", "CARRIER", obj, perl = T)
obj <- sub("남자속옷캘빈클라인|캘빈클라인", obj, perl = T)
obj <- sub("캔버스운동화컨버스", "컨버스", obj, fixed = T)
obj <- sub("케이트아이라이너|케이트아이브로우|케이트파운데이션", "KATE", obj, perl = T)
obj <- sub("제주켄싱턴라올레", "켄싱턴", obj, fixed = T)
obj <- sub("코디화장지", "CODI", obj, fixed = T)
obj <- sub("롱패딩코오롱스포츠", "코오롱", obj, fixed = T)
obj <- sub("여성크로스백코치|코치", "코치", obj, perl = T)
obj <- sub("코카콜라티셔츠", "폴햄코카콜라티셔츠", obj, fixed = T)
obj <- sub("캠핑의자콜맨", "콜맨", obj, fixed = T)
obj <- sub("콤비|콤비보행기", "COBMI", obj, perl = T)
obj <- sub("카드지갑쿠론", "쿠론", obj, fixed = T)
obj <- sub("전동칫솔쿨샤", "쿨샤", obj, fixed = T)
obj <- sub("여성크로커다일|여성크로커다일바지", "크로커다일", obj, perl = T)
obj <- sub("크록스^", "크록스", obj, perl = T)
obj <- sub("크라란스", "클라란스", obj, fixed = T)
obj <- sub("크린랲", "크린랩", obj, fixed = T)
obj <- sub("키즈타미힐피거", "타미힐피거", obj, fixed = T)
obj <- sub("꼬마버스타요", "타요", obj, fixed = T)
#obj <- sub("탄", "THANN", obj, fixed = T)
obj <- sub("여성탐스", "탐스", obj, fixed = T)
obj <- sub("래쉬가드탑텐", "탑텐", obj, fixed = T)
obj <- sub("구두탠디|미셸BY탠디|미셸바이탠디", "탠디", obj, perl = T)
obj <- sub("턴래쉬가드|턴수영복|턴여성수영복", "TURN", obj, perl = T) # 턴
#obj <- sub("테|TE", "테TE", obj, perl = T)
obj <- sub("테일러|테일러프룬", "테일러팜스", obj, perl = T)
obj <- sub("테크세제|테크액체세제", "LG생활건강", obj, perl = T)
obj <- sub("후라이팬테팔", "테팔", obj, fixed = T)
obj <- sub("템포메트리스", "까사미아까사온", obj, fixed = T)
obj <- sub("여성쇼퍼백토리버치", "토리버치", obj, fixed = T)
obj <- sub("투썸기프티콘", "투썸플레이스", obj, fixed = T)
obj <- sub("트라이|트라이남성팬티|트라이드로즈트라이런닝|트라이여성|트라이여성잠옷|
           트라이여성파자마|트라이여성팬티", "TRY", obj, perl = T)
obj <- sub("트루바이타민", "덴프스", obj, fixed = T)
obj <- sub("시계티쏘|TISSOT", "티쏘", obj, perl = T)
obj <- sub("TISS|티스|티스오일", "티스TISS", obj, perl = T)
obj <- sub("파리바게트|파리바게트기프티콘|파리바게트케이크|파리바게트케익",
           "파리바게뜨", obj, perl = T)
obj <- sub("파슬가방|파슬스마트워치|파슬시계|파슬시계|파슬남성시계|파슬백|파슬시계|
           파슬여성가방|파슬여성시계|파슬지갑|파슬코리아|파슬코리아시계|파슬크로스백", 
           "FOSSIL", obj, perl = T)
obj <- sub("페이셜피트니스파오", "파오", obj, fixed = T)
obj <- sub("블랙박스파인뷰", "파인뷰", obj, fixed = T)
obj <- sub("^판도라", "PANDORA", obj, perl = T)
obj <- sub("판도라브라|판도라바이비비안|판도라팬티|비비안로즈버드|남영비비안|
           노와이어브라팬티세트비비안|속옷세트비비안|위생팬티비비안",
           "VIVIEN", obj, perl = T)
obj <- sub("^로즈버드", "VIVIEN", obj, perl = T)
obj <- sub("^비비안웨스트우드", "비비안웨스트우드", obj, perl = T)
obj <- sub("비비안웨스트", "비비안웨스트우드", obj, fixed = T)
obj <- sub("판도라다이어트|판도라핑거루트", "판도라다이어트", obj, perl = T)
obj <- sub("살바토레페라가모", "페라가모", obj, fixed = T)
obj <- sub("포그네넘버5|포그네아기띠|포그네힙시트", "포그내", obj, perl = T)
obj <- sub("^폴로", "폴로", obj, perl = T)
obj <- sub("폴앤폴리", "PAULPOLLEY", obj, fixed = T)
obj <- sub("압력솥풍년", "풍년", obj, fixed = T)
obj <- sub("풍년제과", "POONGNYUN", obj, fixed = T)
obj <- sub("고양이사료퓨리나", "퓨리나", obj, fixed = T)
obj <- sub("여아원피스프랜치캣", "프랜치캣", obj, fixed = T)
obj <- sub("유아원피스프리미에쥬르", "프리미에쥬르", obj, fixed = T)
obj <- sub("금강제화프리웨이", "프리웨이", obj, fixed = T)
obj <- sub("플레이키즈", "플레이키즈프로", obj, fixed = T)
obj <- sub("PRGR", "피알지알", obj, fixed = T)
obj <- sub("피지워터", "FIGI", obj, fixed = T)
obj <- sub("써모스푸고", "푸고", obj, fixed = T)
obj <- sub("에어프라이어필립스|믹서기필립스", "필립스", obj, perl = T)
obj <- sub("FITFLOP", "핏플랍", obj, fixed = T)
obj <- sub("LPGA|LPGA골프웨어", "엘피지에이", obj, fixed = T)
obj <- sub("핑|핑G400|핑G400MAX|핑드라이버|핑모자|핑유틸리티|핑캐디백|PING|PING골프웨어",
           "핑골프", obj, perl = T)
obj <- sub("한일믹서|한일믹서기|한일선풍기|한일선풍기리모콘|한일아기바람|
           한일아기바람선풍기|한일식기건조기|한일짤순이", "HANIL", obj, perl = T)
obj <- sub("한일대나무돗자리|한일대자리|한일면카페트", "한일카페트", obj, perl = T)
obj <- sub("해비치섬모라", "해비치호텔앤드리조트", obj, fixed = T)
obj <- sub("유아모자햇츠온키즈", "햇츠온", obj, fixed = T)
obj <- sub("헤드|헤드EGO|헤드래쉬가드|헤드런닝화|헤드바지|헤드레깅스|헤드레쉬가드|
           헤드롱패딩|헤드반바지|헤드모자|헤드반팔|헤드반팔티|헤드스포츠브라|헤드브라탑|
           헤드샌들|헤드수영복|헤드슈즈|헤드스니커즈|헤드슬리퍼|헤드슬립온|헤드신발|
           헤드아동샌들|헤드아동운동화|헤드아동화|헤드아쿠아슈즈|헤드에고|헤드운동화|
           헤드쿨라이트|헤드키즈|헤드키즈샌들|헤드키즈운동화|헤드테니스|헤드트레이닝|
           헤드트레이닝바지|헤드티셔츠|헤드패딩|헤드팬츠", "HEAD", obj, perl = T)
obj <- sub("7헤드스파|헤드스파|헤드스파7|헤드스파7트리트먼트|헤드스파트리트먼트",
           "파란눈헤드스파", obj, perl = T)
obj <- sub("블랙헤라쿠션", "헤라", obj, fixed = T)
obj <- sub("^해지스", "헤지스", obj, perl = T)
obj <- sub("반팔티셔츠헤지스|크로스백헤지스|키즈헤지스", "한일카페트", obj, perl = T)
obj <- sub("^퍼실", "헨켈", obj, perl = T)
obj <- sub("홍쌍리|홍쌍리매실", "홍쌍리매실장아찌", obj, perl = T)
obj <- sub("홍진경|홍진경김치|홍진경다시팩|홍진경더김치|홍진경더만두", 
           "홍진경의더김치", obj, perl = T)
obj <- sub("블랙헤라쿠션", "헤라", obj, fixed = T)
obj <- sub("화이트오버나이트", "WHITE", obj, fixed = T)
obj <- sub("후화장품|후팩트|후클렌징|후크림|후쿠션|후에센스|후아이크림|후썬크림|
           후세트|후선크림|후비첩|후비비|후립스틱|후립밤|후공진향|
           후공진향세트|더후|더후공진향|더후선크림|더후세트|더후쿠션|더후화장품|
           더히스토리오브후", "WHOO", obj, perl = T)
obj <- sub("힐링노니", "보뚜", obj, fixed = T)
obj <- sub("얼라이브|얼라이브멀티비타민|얼라이브종합비타민|얼라이브포우먼", "ALIVE", 
           obj, perl = T)
obj <- sub("디에이치씨", "DHC", obj, perl = T)
obj <- sub("룩168|룩크러쉬틴트|룩크러쉬","LUK", obj, perl = T)
obj <- sub("발레리|발레리라이크라","VALERY", obj, perl = T)
obj <- sub("전자레인지삼성전자","삼성", obj, fixed = T)
obj <- sub("KENZO|플라워바이겐조","겐조", obj, perl = T)
obj <- sub("비타민C고려은단","고려은단", obj, fixed = T)
obj <- sub("정관장굿베이스","굿베이스", obj, fixed = T)
obj <- sub("글로리룩","GLORYLOOK", obj, fixed = T)
obj <- sub("김정문","김정문알로에", obj, fixed = T)
obj <- sub("김정배","김정배젓갈", obj, fixed = T)
obj <- sub("끌레드뽀","끌레드뽀보떼", obj, fixed = T)
obj <- sub("씨바이끌로에|씨바이끌로에가방","끌로에", obj, perl = T)
obj <- sub("나이스필","좋은느낌", obj, fixed = T)
obj <- sub("96NY|96NY나인식스뉴욕","나인식스뉴욕", obj, perl = T)
obj <- sub("내추럴코어|내츄럴코어|네츄럴코어|네츄럴코어간식|네츄럴코어사료",
           "네추럴코어", obj, perl = T)
obj <- sub("키즈네파","네파", obj, fixed = T)
obj <- sub("정선농협|진안농협|풍산농협김치","농협", obj, perl = T)
obj <- sub("누비빨대컵","NUBY", obj, fixed = T)
obj <- sub("니반바지|니반팔|니셔츠|니아동","NII", obj, perl = T)
obj <- sub("니콜|니콜가방|니콜선글라스","NICOLE", obj, perl = T)
obj <- sub("미국산다우니","다우니", obj, fixed = T)
obj <- sub("무선청소기다이슨","다이슨", obj, fixed = T)
obj <- sub("김남주닥스가방|골프티셔츠반팔닥스골프","NICOLE", obj, perl = T)
obj <- sub("대림|대림비데","대림바스", obj, perl = T)
obj <- sub("거제대명리조트|대명쏠비치삼척|대명워터파크|대명천안리조트|
           변산대명리조트아쿠아|변산대명아쿠아|천안대명리조트","대명리조트", 
           obj, perl = T)
obj <- sub("동부대우전자|동부대우세탁기","대우", obj, perl = T)
obj <- sub("댑코리아잠옷","댑", obj, fixed = T)
obj <- sub("하림더리얼","더리얼", obj, fixed = T)
obj <- sub("플랙진더블린","더블린", obj, fixed = T)
obj <- sub("틸버리|틸버리블라우스|틸버리원피스|틸버리티셔츠","더틸버리", obj, perl = T)
obj <- sub("코스메데코르테|코스메데코르테리포솜|코스메데코르테세트","데코르테", obj, 
           perl = T)
obj <- sub("동원피스","동 원피스", obj, fixed = T)
obj <- sub("래쉬가드디스커버리","디스커버리", obj, fixed = T)
obj <- sub("크리스찬루부탱|크리스찬루부탱지갑|크리스찬라크르와","크리스천", 
           obj, perl = T)
obj <- sub("^크리스찬","디올", obj, perl = T)
obj <- sub("네스카페돌체구스토","돌체구스토", obj, fixed = T)
obj <- sub("스니커즈라코스테","라코스테", obj, fixed = T)
obj <- sub("ROCKPORT","락포트", obj, fixed = T)
obj <- sub("등산양말라푸마","라푸마", obj, fixed = T)
obj <- sub("레노마레이디스|레노마캐주얼|레노마키즈","레노마", obj, perl = T)
obj <- sub("레쁘띠뜨-","레쁘띠뜨", obj, fixed = T)
obj <- sub("로레알파리","로레알", obj, fixed = T)
obj <- sub("래쉬가드록시","록시", obj, fixed = T)
obj <- sub("깔라만시롯데식품관","롯데식품관", obj, fixed = T)
obj <- sub("루나|루나컨실러|루나파우더|루나파운데이션|루나팩트|루나프로포토피니셔|
           루나프로포토피니셔2호|루나피니셔|루나화장품","LUNA", obj, perl = T)
obj <- sub("트레이닝복세트르꼬끄","르꼬끄", obj, fixed = T)
obj <- sub("르샤트라","르샤트라1802", obj, fixed = T)
obj <- sub("덕산리솜스파캐슬|리솜","리솜스파캐슬", obj, fixed = T)
obj <- sub("LIST|LIST바지|LIST블라우스|LIST원피스|LIST자켓","리스트", obj, perl = T)
obj <- sub("엄마옷마담|4060마담|쉬즈마담4060","마담4060", obj, perl = T)
obj <- sub("마크선글라스|마크", "MARK", obj, perl = T)
obj <- sub("제이콥스", "마크제이콥스", obj, fixed = T)
obj <- sub("맥191|맥195|맥217|맥MLBB|맥공용기|맥니키미나즈|맥대즐|맥대즐섀도우|
           맥라이너|맥라이트풀|맥런웨이히트|맥레트로|맥레트로매트리퀴드|맥루비우|
           맥룩인어박스|맥화장품|맥하이라이트|맥룩인어박스베이직브러쉬|맥리퀴드|
           맥리틀맥|맥리필|맥립|맥립글라스|맥립글로스|맥립밤|맥립글로즈|맥립라이너|
           맥립스틱|맥립텐시티|맥립펜슬|맥립프라이머|맥마라케쉬|맥마스카라|맥매트|
           맥맹그로브|맥멜바|맥모란지|맥미네랄라이즈|맥허니러스트|
           맥미네랄라이즈스킨피니쉬|맥미스트|맥바니쉬|맥버시컬러|맥버시컬러바니쉬|
           맥베가스볼트|맥뷰러|맥브러쉬|맥브러쉬세트|맥브러시|맥브로우|맥블러셔|맥블러쉬|맥비밍|맥섀도우|맥하이라이터|
           맥섀도우브러쉬|맥섀도우팔레트|맥소바|맥쇼골드|맥쉐도우|
           맥쉐딩|맥스킨피니쉬|맥스튜디오|맥스튜디오퍼팩트|맥허거블|
           맥스튜디오퍼펙트|맥스튜디오퍼펙트쿠션|맥스트롭|맥스트롭쿠션|
           맥스트롭크림|맥스틱|맥씨쉬어|맥아이|맥아이라이너|맥아이브로우|
           맥아이섀도우|맥엑스트라|맥엑스트라디멘션|맥오로라|맥오일|맥치크|
           맥웜소울|맥칠리|맥쿠션|맥쿠션리필|맥크림|맥크림블러셔|맥크림쉰|
           맥톤업|맥틴트|맥파우더키스|맥파우더팩트|맥파우치|맥파운데이션|
           맥팔레트|맥팩트|맥퍼프|맥페인트팟|맥펜슬|맥프라이머|맥프렙|
           맥프렙프라임|맥프로롱웨어|맥플렌티|맥피치스|맥픽서|맥픽스",
           "MAC", obj, perl = T)
obj <- sub("잠옷무냐무냐", "무냐무냐", obj, fixed = T)
obj <- sub("발렌시아바지|발렌시아블라우스|발렌시아선글라스|
           발렌시아스커트|발렌시아신발|발렌시아옷발렌시아원피스|
           발렌시아의류원피스|발렌시아자켓|발렌시아코트|발렌시아티셔츠|
           발렌시아팬츠|영캐주얼발렌시아", "VALENCIA", obj, perl = T)
obj <- sub("보그|보그3단자동|보그우산|보그장우산", "VOGUE", obj, perl = T)
obj <- sub("본바지|본셔츠|본여름정장|본자켓|본정장", "BON", obj, perl = T)
obj <- sub("이경제|이경제녹용|이경제녹용진액|이경제더힘찬녹용|
           이경제선식|이경제홍삼|이경제홍삼|왕혜문|왕혜문보이차|
           왕혜문보이차100|왕혜문퓨어보이차", 
           "보의당", obj, perl = T)
obj <- sub("브라운6030|브라운6520|브라운면도기|브라운면도기9|
           브라운믹서기|브라운블렌더|브라운전기면도기브라운제모기|
           브라운체온계|브라운체온계6030|브라운체온계6510|브라운체온계6520|
           브라운체온계필터|브라운핸드블랜더|브라운핸드블렌더", "BROWN", obj, perl = T)
obj <- sub("블레스|블레스냉풍기", "BLES", obj, perl = T)
obj <- sub("비버리힐즈폴로클럽", "비버리힐스폴로클럽", obj, fixed = T)
obj <- sub("블레스|블레스냉풍기", "BLES", obj, perl = T)
obj <- sub("세이어스|세이어스위치하젤|세이어스위치하젤토너", "THAYERS", obj, perl = T)
obj <- sub("센티멘탈디퓨저", "센티멘탈디퓨져", obj, fixed = T)
obj <- sub("스케쳐스USA|스케쳐스키즈", "스케쳐스", obj, perl = T)
obj <- sub("시크", "SEEC", obj, fixed = T)
obj <- sub("씨제이제일제당|씨제이프레시웨이", "씨제이", obj, perl = T)
obj <- sub("^에스크", "애스크", obj, perl = T)
obj <- sub("쏠레지아|S쏠레지아|쏠레지아원피스|에쓰쏠레지아원피스|에쓰쏠레지아", 
           "에스쏠레지아", obj, perl = T)
obj <- sub("에스티듀퐁|에스티듀퐁넥타이|에스티듀퐁셔츠", "듀퐁", obj, perl = T)
obj <- sub("장길영", "장길영사과", obj, fixed = T)
obj <- sub("에브리타임정관장", "정관장", obj, fixed = T)
obj <- sub("제주신라더파크뷰", "제주신라호텔", obj, fixed = T)
obj <- sub("존슨즈|존슨즈공주샴푸", "존슨즈베이비", obj, perl = T)
obj <- sub("유산균종근당", "종근당", obj, fixed = T)
obj <- sub("속초중앙닭강정", "중앙닭강정", obj, fixed = T)
obj <- sub("카카오도시락|카카오라이언|카카오리틀프렌즈폰|카카오보조배터리|카카오샵|
           카카오선풍기|카카오셀카봉|카카오스피커|카카오슬리퍼|카카오실내화|카카오양말|
           카카오우산|카카오장우산|카카오캐리어|카카오케이스|카카오키즈탭|카카오파우치|
           카카오프랜즈", "카카오프렌즈", obj, perl = T)
obj <- sub("클리오칫솔", "크리오", obj, fixed = T)
obj <- sub("크리오란", "KRYORAN", obj, fixed = T)
obj <- sub("프레시", "프레쉬", obj, fixed = T)

Search2$KWD_NM2 <- obj

# ============================
final.brand <- brand.nm$PD_BRA_NM2
change.brand <- function(input, output){
  input1 <- paste("^",input,sep = ""); input2 <- paste("^",input,"[가-힣A-Z]",sep="")
  a <- grep(input1,brand.nm$PD_BRA_NM2, value = T, perl = T) 
  b <- grep(input2,brand.nm$PD_BRA_NM2, value = T, perl = T)
  c <- setdiff(a,b)
  idx <- which(brand.nm$PD_BRA_NM2 == c)
  return(final.brand[idx] <<- output)
}
change.brand("옥소토트","옥소")
change.brand("파코라반베이비","파코라반")
change.brand("에스케이티","에스케이텔레콤")
change.brand("#텐텐","ALIVE")
change.brand("108433","쓰리엠")
change.brand("140299","유니펜")
change.brand("277598","유니펜")
change.brand("331834","알파문구")
change.brand("알파","알파문구")
change.brand("AGE20's","에이지투웨니스")
change.brand("ALDO","알도")
change.brand("APRILSKIN","에이프릴스킨")
change.brand("BORGHESE","보르게세")
change.brand("BRUUNSBAZAAR","브룬스바자")
change.brand("DASHINGDIVA","데싱디바")
change.brand("DERMACLASSEN","더마클라센")
change.brand("HONGSHOT","홍샷")
change.brand("JW중외제약","중외제약")
change.brand("KDToys","인피니펀")
change.brand("KLORANE","클로란")
change.brand("L","리스테린")
change.brand("LOSSOMSTUDIO","로썸")
change.brand("momm","맘샵")
change.brand("SECRETMuse","시크릿뮤즈")
change.brand("StyleFit","스타일핏")
change.brand("TATE","테이트")
change.brand("VDL","브이디엘")
change.brand("감동","감동몰")
change.brand("갤럭시탭4101","삼성")
change.brand("삼성전자","삼성")
change.brand("갭키즈","갭")
change.brand("고려인삼유통","고려인삼")
change.brand("골든벨금속","골든벨")
change.brand("글라스텐","에버홈글라스텐")
change.brand("김나운의더키친","김나운")
change.brand("김재식헬스푸드","김재식")
change.brand("까르뜨블랑슈남성","까르뜨블랑슈")
change.brand("까스텔바작골프","까스텔바작")
change.brand("나무","나무그림")
change.brand("나이스클랍","나이스")
change.brand("나이키골프","나이키")
change.brand("나이키수영복","나이키")
change.brand("나이키키즈","나이키")
change.brand("남양유업","남양")
change.brand("내츄라오가닉","네츄럴오가닉")
change.brand("내추럴코어","네추럴코어")
change.brand("네파키즈","네파")
change.brand("넬리세제","넬리")
change.brand("노스페이스영","노스페이스")
change.brand("노스페이스영화이트라벨","노스페이스")
change.brand("노스페이스키즈","노스페이스")
change.brand("노스페이스화이트라벨","노스페이스")
change.brand("녹십자웰빙","녹십자")
change.brand("농협홍삼한삼인","농협")
change.brand("누비","NUBY")
change.brand("뉴발란스키즈","뉴발란스")
change.brand("니","NII")
change.brand("니콜선글라스","NICOLE")
change.brand("닌텐도스위치","닌텐도")
change.brand("닥스ACC","닥스")
change.brand("닥스키즈","닥스")
change.brand("닥스스카프","닥스")
change.brand("닥스타올","닥스")
change.brand("닥터","닥터락토바이오우먼")
change.brand("대림","대림바스")
change.brand("대우전자","대우")
change.brand("댑코리아","댑")
change.brand("더마픽스리얼콜라겐100","더마픽스")
change.brand("더퍼스트이어","퍼스트이어")
change.brand("데상트골프","데상트")
change.brand("데상트스포츠","데상트")
change.brand("돔바슈즈","돔바")
change.brand("동원에프앤비","동원")
change.brand("동원참치","동원")
change.brand("라마즈클래식","라마즈")
change.brand("라바","LARVA")
change.brand("라이프365","중외제약")
change.brand("라코스테라이브","라코스테")
change.brand("라코스테스포츠","라코스테")
change.brand("라푸마브이아이피","라푸마")
change.brand("락","Rock")
change.brand("랩","LAP")
change.brand("러브캣비쥬","러브캣")
change.brand("롯데닷컴","센트룸")
change.brand("롯데칠성몰","롯데칠성")
change.brand("루나","LUNA")
change.brand("루이까또즈스카프","루이까또즈")
change.brand("르꼬끄골프","르꼬끄")
change.brand("르젠옴므","르젠")
change.brand("리리코스마린에너지","리리코스")
change.brand("리바이스키즈","리바이스")
change.brand("리빙스타","벨라쿠진")
change.brand("리스트레드라벨","리스트")
change.brand("리엔","LG생활건강")
change.brand("엘지생활건강","LG생활건강")
change.brand("마크","MARK")
change.brand("망고맘","망고")
change.brand("망고키즈","망고")
change.brand("메트로시티우양산","메트로시티")
change.brand("발렌시아","VALENCIA")
change.brand("버커루브이아이피","버커루")
change.brand("베네통키즈","베네통")
change.brand("베베쥬샵","베베쥬")
change.brand("베이비","BAY-B")
change.brand("보국전자","보국")
change.brand("보뚜슈퍼푸드","보뚜")
change.brand("본","BON")
change.brand("볼빅브이닷","볼빅")
change.brand("부건킹스베리","부건")
change.brand("뷰","VIEU")
change.brand("맥","MAC")
change.brand("브라운","BROWN")
change.brand("블레스냉풍기","BLES")
change.brand("블루독베이비","블루독")
change.brand("비너스솔브","비너스")
change.brand("비너스아네타","비너스")
change.brand("비너스아르보","비너스")
change.brand("비너스자스민","비너스")
change.brand("비비씨바이비비안","VIVIEN")
change.brand("로즈버드바이비비안","VIVIEN")
change.brand("비비안로즈버드","VIVIEN")
change.brand("비비안블루비비","VIVIEN")
change.brand("비비안판도라","VIVIEN")
change.brand("판도라바이비비안","VIVIEN")
change.brand("빈","BEEN")
change.brand("빈폴ACC","빈폴")
change.brand("빈폴레이디스","빈폴")
change.brand("빈폴아웃도어","빈폴")
change.brand("빈폴키즈","빈폴")
change.brand("빔","BVEAM")
change.brand("삼성전자","삼성")
change.brand("삼천리자전거","삼천리")
change.brand("세이어스","THAYERS")
change.brand("송월타올","송월")
change.brand("송월타월","송월")
change.brand("순수","순수더살롱")
change.brand("숨37˚","숨37")
change.brand("숲","SOUP")
change.brand("쉬즈미블루라벨스","쉬즈미스")
change.brand("시그마네트웍스","시그마")
change.brand("시크","SEEC")
change.brand("신우","SINWOO")
change.brand("신우팜라텍스","신우팜")
change.brand("쌈지스포츠","쌈지")
change.brand("쌤소나이트레드","쌤소나이트")
change.brand("써스데이아일랜드VIP","써스데이아일랜드")
change.brand("쏘헤어모로코아르간오일","쏘헤어")
change.brand("씨","씨SI")
change.brand("아디다스골프","아디다스")
change.brand("아디다스오리지널","아디다스")
change.brand("아디다스키즈","아디다스")
change.brand("아라","ARA")
change.brand("아식스타이거","아식스")
change.brand("안국건강","안국")
change.brand("애스크주니어","애스크")
change.brand("에르고파우치","에르고")
change.brand("에르고베이비","에르고")
change.brand("에스케이티","에스케이텔레콤")
change.brand("에스티듀퐁","듀퐁")
change.brand("엘르골프","엘르")
change.brand("엘르수영복","엘르")
change.brand("엘르이너웨어","엘르")
change.brand("엘르파리","엘르")
change.brand("엘비엘스포츠","엘비엘")
change.brand("엘지프라엘","LG전자")
change.brand("엠엔엑스15","엠엔엑스")
change.brand("엠엘비키즈","엠엘비")
change.brand("연세두유","연세우유")
change.brand("윈","UNE")
change.brand("유니","유니펜")
change.brand("이공팔공","2080")
change.brand("이누스바스","이누스")
change.brand("제스","XESS")
change.brand("제이에스티나핸드백","제이에스티나")
change.brand("제이키드주니어","제이키드")
change.brand("조말론런던","조말론")
change.brand("조성아티엠","조성아")
change.brand("조은","J&BL")
change.brand("종근당건강","종근당")
change.brand("주영","고고다이노")
change.brand("지프|잡화브이아이피","지프")
change.brand("천호식품","천호엔케어")
change.brand("캐스B","캐스비")
change.brand("캘러웨이골프","캘러웨이")
change.brand("캘빈클라인언더웨어","캘빈클라인")
change.brand("캘빈클라인진","캘빈클라인")
change.brand("케네스콜COLE\\)","케네스콜")
change.brand("켄싱턴제주호텔","켄싱턴")
change.brand("켄싱턴호텔여의도","켄싱턴")
change.brand("코데즈컴바인이너웨어","코데즈컴바인")
change.brand("코디","CODI")
change.brand("코디갤러리바이에스티코","코디갤러리")
change.brand("코렐코디네이츠","코렐")
change.brand("코코몽녹색놀이터","코코몽")
change.brand("크로커다일레이디","크로커다일")
change.brand("크로커다일언더웨어","크로커다일")
change.brand("크록스키즈","크록스")
change.brand("크리스크리스티리얼맨","크리스크리스티")
change.brand("지이크파렌하이트","지이크")
change.brand("클린","클린웜코튼")
change.brand("킨","KEEN")
change.brand("타미힐피거슈즈","타미힐피거")
change.brand("타미힐피거여성","타미힐피거")
change.brand("brand_obj","타미힐피거")
change.brand("타미힐피거칠드런","타미힐피거")
change.brand("탄","THANN")
change.brand("타요더리틀버스","타요")
change.brand("탑텐키즈","탑텐")
change.brand("태창언더웨어","태창")
change.brand("턴","TURN")
change.brand("테","테TE")
change.brand("케이트","KATE")
change.brand("캐리어","CARRIER")
change.brand("코오롱스포츠","코오롱")
change.brand("테일러","테일러팜스")
change.brand("테크","LG생활건강")
change.brand("트라이","TRY")
change.brand("트루바이비타민","덴프스")
change.brand("티스","티스TISS")
change.brand("파란눈헤드스파7","파란눈헤드스파")
change.brand("파슬","FOSSIL")
change.brand("페이퍼플레인키즈","페이퍼플레인")
change.brand("폴로랄프로렌","폴로")
change.brand("폴햄키즈","폴햄")
change.brand("푸마바디웨어","푸마")
change.brand("푸마골프","푸마")
change.brand("퓨토시크릿","퓨토")
change.brand("퓨토테라피","퓨토")
change.brand("플라스틱아일랜드스토리","플라스틱아일랜드")
change.brand("플라잉타이거코펜하겐","플라잉타이거")
change.brand("피지","FIGI")
change.brand("피지에이","엘피지에이")
change.brand("피카소메이크업브러쉬","피카소")
change.brand("핑","핑골프")
change.brand("한일","HANIL")
change.brand("행텐주니어","행텐")
change.brand("헌트이너웨어","헌트")
change.brand("헌트키즈","헌트")
change.brand("헤드","HEAD")
change.brand("헤드슈즈SHOES\\)","HEAD")
change.brand("헤지스ACC","헤지스")
change.brand("헤지스골프","헤지스")
change.brand("헤지스남성","헤지스")
change.brand("헤지스레이디스","헤지스")
change.brand("헤지스키즈","헤지스")
change.brand("화이트","WHITE")
change.brand("후","WHOO")
change.brand("휠라슈즈","휠라")
change.brand("휠라키즈","휠라")
change.brand("휠라티바","휠라")
change.brand("콤비","COMBI")
change.brand("엠엔","엠엔MN")
change.brand("레쁘띠뜨-","레쁘띠뜨")
change.brand("질바이질스튜어트","질스튜어트")
change.brand("레노마레이디스","레노마")
change.brand("레노마수영복","레노마")
change.brand("레노마캐주얼","레노마")
change.brand("레노마키즈","레노마")
change.brand("4CUS","4커스")
change.brand("보스","BOSS")

brand.nm$PD_BRA_FIN <- final.brand
brand.nm[PD_C==829580]$PD_BRA_FIN <- "꼬망세"
View(unique(brand.nm$PD_BRA_FIN))
final.brand <- unique(brand.nm$PD_BRA_FIN)
rm(brand.nm)


# 검색수
Search2$SEARCH_CNT <- as.numeric(gsub(",","",Search2$SEARCH_CNT, perl = T))
Search2$BRN_NM <- 0
for (i in final.brand){
  idx <- grep(paste("^",i,sep=""),Search2$KWD_NM2, value = F)
  #n <- sum(Search2[idx]$SEARCH_CNT)
  n <- match(i, final.brand)
  print(paste(n,i))
  Search2$BRN_NM[idx] <- i 
}

write.csv(Search2, "Search2_BRN.csv", fileEncoding = "UTF-8")

length(SEARCH_PER_BRAND)
final <- data.frame(final.brand, SEARCH_PER_BRAND)
View(final)
write.csv(final, "brand_search_cnt.csv",fileEncoding = "UTF-8")


###
library(tidyr)
Search2 <- fread("Search2_BRN.csv", encoding = "UTF-8")
Search_brd <- Search2[BRN_NM != 0]
#Search_brd %>% group_by(BRN_NM, SESS_DT) %>% head(10)
Search_brd <- Search_brd %>% select(SESS_DT, SEARCH_CNT, BRN_NM)
Search_brd <- Search_brd %>% group_by(BRN_NM, SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
length(unique(Search_brd$BRN_NM)) # 1997

wide <- spread(Search_brd, key = BRN_NM, value = n)
brd.nm <- unique(Search_brd$BRN_NM)
long <- gather(wide, brd, value, brd.nm)
long[is.na(long)] <- 0

long <- as.data.table(long)

pd <- brand.nm %>% select(PD_C,PD_BRA_FIN)
pd1 <- pd[!duplicated(pd)]
pd2 <- pd[!duplicated(PD_C)]
pd_brd_sch <- full_join(pd, long, by = c("PD_BRA_FIN"="brd"))

long <- subset(long, brd!="미디어")
long[brd == "올젠"]$value <- long[brd == "올젠"]$value -300
long[brd == "베이비반즈"]$value <- long[brd == "베이비반즈"]$value + long[brd == "썬글레이드"]$value
long[brd == "로썸스튜디오"]$value <- long[brd == "로썸스튜디오"]$value + long[brd == "로썸"]$value
long[brd == "파워풀엑스"]$value <- long[brd == "파워풀엑스"]$value + long[brd == "플렉스파워"]$value
long[brd == "릿첼"]$value <- long[brd == "릿첼"]$value + long[brd == "리첼"]$value
long[brd == "금강"]$value <- long[brd == "금강"]$value + long[brd == "프리웨이"]$value+
  long[brd == "와키앤타키"]$value + long[brd == "리차드"]$value

long <- rbind(long, eliza.sum); long <- rbind(long, w)

pd1[duplicated(PD_C)]%>%View()
pd[PD_C %in% c(1318,4338,812428)]$PD_BRA_FIN <- "김재식"
pd[PD_C==187331]$PD_BRA_FIN <- "캐리어"
pd[PD_C %in% c(199150,206998,207396)]$PD_BRA_FIN <- "ALIVE"
pd[PD_C %in% c(210460,210462,210468)]$PD_BRA_FIN <- "에티튜드"
pd[PD_C==218155]$PD_BRA_FIN <- "TRY"
pd[PD_C %in% c(244980,244998,245000,245119,245135)]$PD_BRA_FIN <- "올젠"
pd[PD_C==303313]$PD_BRA_FIN <- "스케쳐스"
pd[PD_C==319823]$PD_BRA_FIN <- "챔피언"
pd[PD_C==319828]$PD_BRA_FIN <- "챔피언"
pd[PD_C %in% c(491220,324877,522483,522747)]$PD_BRA_FIN <- "이고르"
pd[PD_C==334003]$PD_BRA_FIN <- "푸마"
pd[PD_C %in% 
           c(372317,540547,676106,693703,729609,740603,837174,837246)]$PD_BRA_FIN <- "베이비반즈"
pd[PD_C%in%c(338267,381573,485134,529747,529749,338155,529949,683543,695153)]$PD_BRA_FIN <- "금강"
pd[PD_C %in% c(701937,390022)]$PD_BRA_FIN <- "소다"
pd[PD_C %in% 
           c(411791,411814,411969,412004,412027,412039,412065,412152,412201)]$PD_BRA_FIN <- "로썸스튜디오"
pd[PD_C==461921]$PD_BRA_FIN <- "VALERY"
pd[PD_C==511177]$PD_BRA_FIN <- "이지바이"
pd[PD_C%in%c(538084,538088,538097,538097)]$PD_BRA_FIN <- "벨라홈"
pd[PD_C%in%
           c(323818,477338,612391,612457,711832,740405,741364,741402,742856)]$PD_BRA_FIN <- "파워풀엑스"
pd[PD_C%in%
           c(613327,612888,613328,613329,613330,613331,613334,613336,
             632214,650506,650522)]$PD_BRA_FIN <- "센카"
pd[PD_C%in%c(612902,612903)]$PD_BRA_FIN <- "시세이도"
pd[PD_C==612969]$PD_BRA_FIN <- "츠바키"
pd[PD_C%in%
           c(628515,628534,628547,628668,701540,835672)]$PD_BRA_FIN <- "보의당"
pd[PD_C%in%
           c(671066,797021)]$PD_BRA_FIN <- "릿첼"
pd[PD_C%in%
           c(685272,685279,685283,685295)]$PD_BRA_FIN <- "아넷사"
pd[PD_C%in%
           c(725066,725068,725073,725074,725076,725077,725079,725080,725081,529949,338155)]$PD_BRA_FIN <- "헨켈"
pd[PD_C==612969]$PD_BRA_FIN <- "츠바키"
pd[PD_C%in%c(761752,761751,761756,761753,761754,761755)]$PD_BRA_FIN <- "티스TISS"

pd[PD_C==785261]$PD_BRA_FIN <- "유니펜"
pd[PD_C==790753]$PD_BRA_FIN <- "알파문구"
pd[PD_C==798434]$PD_BRA_FIN <- "닥터크리너"
pd[PD_C==806363]$PD_BRA_FIN <- "올리버하우스"
pd[PD_C==770607]$PD_BRA_FIN <- "아자케이스"
pd[PD_C==751383]$PD_BRA_FIN <- "엘리자베스"

#와키앤타키, 리차드, 프리웨이
brand.nm[PD_C==538097] %>% select(PD_NM, PD_BRA_FIN, PD_BRA_NM2) %>% unique()

brand.nm[PD_BRA_NM2=="엘리자베스아덴"] %>% select(PD_NM, PD_BRA_FIN, PD_BRA_NM2) %>% unique()
long[brd == "리차드"]
brand.nm[PD_BRA_FIN=="와키앤타키"]%>%select(PD_C)%>%unique()

#---------

idx <- grep("^바비브라운",Search2$KWD_NM2, value = F)
bobbi <- Search2[idx]
bobbi.sum <- soup %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
bobbi.sum <- data.table(SESS_DT=bobbi.sum$SESS_DT, brd=rep('바비브라운',183),value = bobbi.sum$n)
long <- rbind(long, bobbi.sum)

idx <- grep("^래핑골프차일드",Search2$KWD_NM2, value = F)
rap <- Search2[idx]
rap.sum <- rap %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
rap.sum <- data.table(SESS_DT=rap.sum$SESS_DT, brd=rep('래핑차일드',183),value = rap.sum$n)
long <- rbind(long, rap.sum)

idx <- grep("^지프",Search2$KWD_NM2, value = F)
jeep <- Search2[idx]
jeep.sum <- jeep %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
jeep.sum <- data.table(SESS_DT=jeep.sum$SESS_DT, brd=rep('지프',183),value = jeep.sum$n)
long <- rbind(long, jeep.sum)

idx <- grep("^APPLE",Search2$KWD_NM2, value = F)
apple <- Search2[idx]
apple.sum <- apple %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
apple.sum <- data.table(SESS_DT=apple.sum$SESS_DT, brd=rep('APPLE',183),value = apple.sum$n)
long <- rbind(long, apple.sum)

idx <- grep("^숲",Search2$KWD_NM2, value = F)
soup <- Search2[idx]
soup.sum <- soup %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
soup.sum <- data.table(SESS_DT=soup.sum$SESS_DT, brd=rep('숲',183),value = soup.sum$n)
long <- rbind(long, soup.sum)

idx <- grep("^록시땅",Search2$KWD_NM2, value = F)
lox <- Search2[idx]
lox.sum <- lox %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
lox.sum <- data.table(SESS_DT=lox.sum$SESS_DT, brd=rep('록시땅',183),value = lox.sum$n)
long <- rbind(long, lox.sum)

idx <- grep("^핑골프크시슬리",Search2$KWD_NM2, value = F)
pink <- Search2[idx]
pink.sum <- pink %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
pink.sum <- data.table(SESS_DT=pink.sum$SESS_DT, brd=rep('핑크시슬리',183),value = pink.sum$n)
long <- rbind(long, pink.sum)

idx <- grep("^로엠걸즈",Search2$KWD_NM2, value = F)
roem <- Search2[idx]
roem.sum <- roem %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
roem.sum <- data.table(SESS_DT=roem.sum$SESS_DT, brd=rep('로엠걸즈',183),value = roem.sum$n)
long <- rbind(long, roem.sum)

idx <- grep("^TRY엄프",Search2$KWD_NM2, value = F)
tri <- Search2[idx]
tri.sum <- tri %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
tri.sum <- data.table(SESS_DT=tri.sum$SESS_DT, brd=rep('트라이엄프',183),value = tri.sum$n)
long <- rbind(long, tri.sum)

idx <- grep("^그린핑골프거",Search2$KWD_NM2, value = F)
green <- Search2[idx]
green.sum <- green %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
green.sum <- data.table(SESS_DT=green.sum$SESS_DT, brd=rep('그린핑거',183),value = green.sum$n)
long <- rbind(long, green.sum)

idx <- grep("^엘라모",Search2$KWD_NM2, value = F)
mo <- Search2[idx]
mo.sum <- mo %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
mo.sum <- data.table(SESS_DT=mo.sum$SESS_DT, brd=rep('엘라모',174),value = mo.sum$n)
long <- rbind(long, green.sum)

idx <- grep("^엘리자베스아덴",Search2$KWD_NM2, value = F)
elizaarden <- Search2[idx]
eliza.sum <- elizaarden %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
eliza.sum <- data.table(SESS_DT=eliza.sum$SESS_DT, brd=rep('엘리자베스아덴',183),value = eliza.sum$n)

idx <- grep("^엘라스틴",Search2$KWD_NM2, value = F)
ela <- Search2[idx]
ela.sum <- ela %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
ela.sum <- rbind(ela.sum, data.frame(SESS_DT=20180924, n = 0)) %>% arrange(SESS_DT)
ela.sum <- data.table(SESS_DT=ela.sum$SESS_DT, brd=rep('엘라스틴',183),value = ela.sum$n)
long <- rbind(long, ela.sum)

pd[PD_BRA_FIN=="SKII"]$PD_BRA_FIN <- "SK-II"
pd[PD_BRA_FIN=="SOUP"]$PD_BRA_FIN <- "숲"
pd[PD_BRA_FIN=="스케쳐스USA"]$PD_BRA_FIN <- "스케쳐스"


#-------

idx2 <- grep("엘리자베스코팩",Search2$KWD_NM2, value = F)
eliza <- Search2[idx2]
eliza.sum2 <- eliza %>% group_by(SESS_DT)%>% summarise(n = sum(SEARCH_CNT)) %>% as.data.table()
eliza.sum2 <- data.table(SESS_DT=eliza.sum2$SESS_DT, brd=rep('엘리자베스',97),value = eliza.sum2$n)

SESS_DT <- seq(as.Date("2018-04-01"), by = "day", length.out = 183)
true.dt <- as.data.frame(SESS_DT)
true.dt$SESS_DT <- as.character(true.dt$SESS_DT)

eliza.sum2$SESS_DT <- as.Date(ymd(eliza.sum2$SESS_DT))
eliza.sum2$SESS_DT <- as.character(eliza.sum2$SESS_DT)

w <- left_join(true.dt, eliza.sum)

w <- left_join(true.dt, eliza.sum2, by = "SESS_DT")
w$SESS_DT <- as.numeric(gsub("-","",w$SESS_DT))
w$brd <- rep("엘리자베스",183)
w$value[is.na(w$value)] <- 0
long <- rbind(long, w)

#--------

long[brd=="애플"]
pd.uni[PD_BRA_FIN=="애플"]$PD_BRA_FIN <- "APPLE"
pd.uni[PD_BRA_FIN=="스케쳐스USA"]$PD_BRA_FIN <- "스케쳐스"
pd.uni[PD_BRA_FIN=="씨제이제일제당"]$PD_BRA_FIN <- "씨제이"
pd.uni[PD_BRA_FIN=="로레알파리"]$PD_BRA_FIN <- "로레알"
pd.uni[PD_BRA_FIN=="퍼실"]$PD_BRA_FIN <- "헨켈"
pd.uni[PD_BRA_FIN=="이경제"]$PD_BRA_FIN <- "보의당"


pd.uni <- pd[!duplicated(pd)]
brd_power <- left_join(pd.uni, long, by = c("PD_BRA_FIN" = "brd")) %>% as.data.table()

nas <- filter(brd_power,is.na(brd_power$SESS_DT))
unique(nas$PD_BRA_FIN)
View(table(nas$PD_BRA_FIN))

brd_power <- filter(brd_power, is.na(brd_power$SESS_DT)==F)

SESS_DT <- seq(as.Date("2018-04-01"), by = "day", length.out = 183)
true.dt <- as.data.frame(SESS_DT)
true.dt$SESS_DT <- as.character(true.dt$SESS_DT)
true.dt$SESS_DT <- as.numeric(gsub("-","",w$SESS_DT))
true.dt$value <- 0

nas.pd <- nas %>% select(PD_C, PD_BRA_FIN)

reped <- nas.pd %>% slice(rep(1:n(), each = 183))
date <- true.dt %>% slice(rep(1:n(), times = 651))

zeros <- cbind(reped, date)
brd_power <- rbind(brd_power, zeros)

View(brd_power %>% group_by(PD_C) %>% summarise(n = n()))

over <- brd_power%>%filter(PD_C==751383)
over <- over[,-4]
over <- over[!duplicated(over),]
over$value <- w$value

brd_power <- subset(brd_power,PD_BRA_FIN!="엘리자베스")
brd_power <- rbind(brd_power, over)

write.csv(brd_power, "brd_power.csv", fileEncoding = "UTF-8")

#-------

save.image(file = "all.RData")

