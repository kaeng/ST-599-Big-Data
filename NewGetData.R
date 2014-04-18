# Ben's Get datasets

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

qplot(YEAR,avg,data=fdatasum,group=EDUC,geom="line",color=EDUC)
table(fdata7_12$YEAR)


#Katie's # === OR 2001 personal ===#

#download
download.file("http://www2.census.gov/acs/downloads/pums/2001/csv_por.zip",
              destfile = "csv_por_2001.zip")
unzip("csv_por_2001.zip", list = TRUE)
por_2001 <- read.csv(unz("csv_por_2001.zip", "ss01por.csv"),
                     stringsAsFactors = FALSE)[,c(3,7,50,56,57,58,78)]

por_2001 <- tbl_df(por_2001)

#year variable
por_2001$YEAR <- 2001

# getting working age people, HOURLY variable
por_2001 <- por_2001 %.% filter(AGEP>15) %.% mutate(HOURLY=PINCP/(WKW*WKHP))

# education variable
EDUC_code <- c("1"="Less than HS",
               "2"="Less than HS",
               "3"="Less than HS",
               "4"="Less than HS",
               "5"="Less than HS",
               "6"="Less than HS",
               "7"="Less than HS",
               "8"="Less than HS",
               "9"="HS Diploma",
               "10"="Some College",
               "11"="Associates",
               "12"="Associates",
               "13"="Bachelors",
               "14"="Advanced Degree",
               "15"="Advanced Degree",
               "16"="Advanced Degree"
               )

por_2001 <- mutate(por_2001,EDUC=EDUC_code[SCHL])

#=== OR 2002 personal ===#

#download
download.file("http://www2.census.gov/acs/downloads/pums/2002/csv_por.zip", destfile = "csv_por_2002.zip")
unzip("csv_por_2002.zip", list = TRUE)
por_2002 <- read.csv(unz("csv_por_2002.zip", "ss02por.csv"),
                     stringsAsFactors = FALSE)[,c(3,7,50,56,57,58,78)]

por_2002 <- tbl_df(por_2002)

#year variable
por_2002$YEAR <- 2002

# filtered, hourly variable
por_2002 <- por_2002 %.% filter(AGEP>15) %.% mutate(HOURLY=PINCP/(WKW*WKHP))

# education
por_2002 <- mutate(por_2002,EDUC=EDUC_code[SCHL])



# === concatonate data === #

por_0102 <- rbind(por_2001,por_2002)


# === statistics === #

# summary statistics

grouped <- group_by(por_0102,EDUC,YEAR)

workingprop <- sum(por_0102$WKL==1)/dim(grouped)[1]

working <- filter(grouped,WKL==1)

workingstats <- summarise(working,
                   meanHourly = mean(HOURLY,na.rm=T),
                   medHourly = median(HOURLY,na.rm=T),
                   q1Hourly = quantile(HOURLY,.25,na.rm=T),
                   q3Hourly = quantile(HOURLY,.75,na.rm=T),
                   top1Hourly = quantile(HOURLY,.99,na.rm=T))


# === converting summary stats to 2012 dollars, using CPI === #
# http://www.bls.gov/data/inflation_calculator.htm

workingstats01 <- mutate(workingstats[workingstats$YEAR==2001,],
                           meanHourly12 = meanHourly*1.29641,
                           medHourly12 = medHourly*1.29641,
                           q1Hourly12 = q1Hourly*1.29641,
                           q3Hourly12 = q3Hourly*1.29641,
                           top1Hourly12 = top1Hourly*1.29641)

workingstats02 <- mutate(workingstats[workingstats$YEAR==2002,],
                         meanHourly12 = meanHourly*1.27623,
                         medHourly12 = medHourly*1.27623,
                         q1Hourly12 = q1Hourly*1.27623,
                         q3Hourly12 = q3Hourly*1.27623,
                         top1Hourly12 = top1Hourly*1.27623)

workingstatsadj <- join()

workingstats <- merge()

library(ggplot2)

# reorder levels from highest to lowest

qplot(x=YEAR,y=meanHourly,data=workingstats,colour=EDUC,geom="line")




fdata7_12 %.% group_by(YEAR) %.% summarise(aver=mean(WKW,na.rm=TRUE))
table(por_twelve$EDUC)



### Lu's Get Data ###

download.file("http://www2.census.gov/acs/downloads/pums/2004/csv_por.zip",destfile = "csv_por_2004.zip")
unzip("csv_por_2004.zip", list = TRUE)
por_2004 <- read.csv(unz("csv_por_2004.zip", "ss04por.csv"),stringsAsFactors = FALSE)[,c(4,6,8,53,59,60,61,81)]


download.file("http://www2.census.gov/acs/downloads/pums/2003/csv_por.zip",destfile = "csv_por_2003.zip")
unzip("csv_por_2003.zip", list = TRUE)
por_2003 <- read.csv(unz("csv_por_2003.zip", "ss03por.csv"),stringsAsFactors = FALSE)[,c(4,5,7,52,58,59,60,80)]


por_2004_1 <- filter(por_2004,AGEP>15,WKL=="1")
data_2004 <- mutate(por_2004_1,HOURLY=PINCP/(WKHP*WKW))

por_2003_1 <- filter(por_2003,AGEP>15,WKL=="1")
data_2003 <- mutate(por_2003_1,HOURLY=PINCP/(WKHP*WKW))


Edu_codes <- c("bb"="Less than HS",
               "1"="Less than HS",
               "2"="Less than HS",
               "3"="Less than HS",
               "4"="Less than HS",
               "5"="Less than HS",
               "6"="Less than HS",
               "7"="Less than HS",
               "8"="Less than HS",
               "9"="HS Diploma",
               "10"="Some College",
               "11"="Associates",
               "12"="Associates",
               "13"="Bachelors",
               "14"="Advanced Degree",
               "15"="Advanced Degree",
               "16"="Advanced Degree")

data_2004 <- mutate(data_2004, EDUC = Edu_codes[as.character(SCHL)])
edu_group_2004 <- group_by(data_2004,EDUC)
result_2004 <- summarise(edu_group_2004,avg=mean(HOURLY,na.rm=TRUE))
result_2004 <- mutate(Year=2004,result_2004)

data_2003 <- mutate(data_2003, EDUC = Edu_codes[as.character(SCHL)])
edu_group_2003 <- group_by(data_2003,EDUC)
result_2003 <- summarise(edu_group_2003,avg=mean(HOURLY,na.rm=TRUE))
result_2003 <- mutate(Year=2003,result_2003)

rbind(result_2003,result_2004)


