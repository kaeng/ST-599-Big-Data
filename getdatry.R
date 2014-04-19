# Get datasets

download.file("http://www2.census.gov/acs2012_5yr/pums/csv_por.zip", 
              destfile = "csv_por.zip")
por_twelve <- read.csv(unz("csv_por.zip", "ss12por.csv"),
                       stringsAsFactors = FALSE)[,c(2,7,9,70,76,77,78,112)]
inc_codes12 = c("1086024"="2008",
                "1069920"="2009",
                "1061121"="2010",
                "1039508"="2011",
                "1010207"="2012")
educ_codes7 = c("1" = "Less than HS",
                "2" = "Less than HS",
                "3" = "Less than HS",
                "4" = "Less than HS",
                "5" = "Less than HS",
                "6" = "Less than HS",
                "7" = "Less than HS",
                "8" = "Less than HS",
                "9" = "HS Diploma",
                "10" = "Some College",
                "11" = "Some College",
                "12" = "Associates",
                "13" = "Bachelors",
                "14" = "Advanced Degree",
                "15" = "Advanced Degree",
                "16" = "Advanced Degree")
educ_codes12 = c("01" = "Less than HS",
                 "02" = "Less than HS",
                 "03" = "Less than HS",
                 "04" = "Less than HS",
                 "05" = "Less than HS",
                 "06" = "Less than HS",
                 "07" = "Less than HS",
                 "08" = "Less than HS",
                 "09" = "Less than HS",
                 "10" = "Less than HS",
                 "11" = "Less than HS",
                 "12" = "Less than HS",
                 "13" = "Less than HS",
                 "14" = "Less than HS",
                 "15" = "Less than HS",
                 "16" = "HS Diploma",
                 "17" = "HS Diploma",
                 "18" = "Some College",
                 "19" = "Some College",
                 "20" = "Associates",
                 "21" = "Bachelors",
                 "22" = "Advanced Degree",
                 "23" = "Advanced Degree",
                 "24" = "Advanced Degree")
inc_WKW = c("1"= 51,
            "2"= 48.5,
            "3"=43.5,
            "4"=33,
            "5"=20,
            "6"=6.5)
por_twelve <- mutate(por_twelve, YEAR = inc_codes12[as.character(ADJINC)], EDUC = educ_codes12[as.character(SCHL)],WKW=(inc_WKW[(WKW)]))

download.file("http://www2.census.gov/acs2007_3yr/pums/csv_por.zip", 
              destfile = "csv_porsev.zip")
por_seven <- read.csv(unz("csv_porsev.zip", "ss07por.csv"),stringsAsFactors = FALSE)[,c(2,6,8,53,59,60,61,86)]

inc_codes7 = c("1082467"="2005",
               "1044488"="2006",
               "1016787"="2007")
por_seven <- mutate(por_seven, YEAR = inc_codes7[as.character(ADJINC)], EDUC = educ_codes7[as.character(SCHL)])

data7_12 = rbind(por_twelve,por_seven)
fdata7_12 = data7_12 %.% filter(AGEP>15,WKL==1) %.% mutate(HOURLY=PINCP/(WKW*WKHP))
fdatasum = fdata7_12 %.% group_by(YEAR,EDUC) %.% summarise(avg=mean(HOURLY,na.rm=TRUE))

fdatasum = fdatasum %.% filter(EDUC != "NA" )
d0=fdatasum
head(d0)
head(d1)
head(d2)
head(d3)
final = data.frame(YEAR=c(d0$YEAR,d1$YEAR,d2$YEAR,d3$YEAR),EDUC=c(d0$EDUC,as.character(d1$EDUC),as.character(d2$EDUC),as.character(d3$EDUC)), HOURLY=c(d0$avg,d1$meanHourly,d2$HOURLY,d3$HOURLY))
final=final[-(79:88),]
qplot(YEAR,HOURLY,data=final,group=EDUC,geom="line",color=EDUC)
table(fdata7_12$YEAR)


fdata7_12 %.% group_by(YEAR) %.% summarise(aver=mean(WKW,na.rm=TRUE))
table(por_twelve$EDUC)