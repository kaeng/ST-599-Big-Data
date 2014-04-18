# Code to download Oregon housing data 2000-2012.

# ==== Setwd to the location where you would like data saved  ==== #

# === download file === #
# download OR 2012_5yr
download.file("http://www2.census.gov/acs2012_5yr/pums/csv_hor.zip", 
              destfile = "csv_hor12.zip")


# === unzip and get file === #
# look into others function: unz, unzip, system('unzip ...'), 
# check files in the zip archive without extracting
unzip("csv_hor.zip", list = TRUE)


# extract and read in one go
hor_twelve <- read.csv(unz("csv_hor12.zip", "ss12hor.csv"),stringsAsFactors = FALSE)[,c(2,9,54)]


## BEN
# 2008-2012 Transform:
download.file("http://www2.census.gov/acs2012_5yr/pums/csv_por.zip", 
              destfile = "csv_por.zip")
por_twelve <- read.csv(unz("csv_por.zip", "ss12por.csv"),stringsAsFactors = FALSE)[,c(2,76,77)]
avgpor_twelve=por_twelve %.%
  group_by(SERIALNO) %.%
  filter(WKL=="1") %.%
  summarise(avgWKHP=mean(WKHP,na.rm=TRUE),n=n())
merge_twelve <- hor_twelve[hor_twelve$SERIALNO %in% avgpor_twelve$SERIALNO,]
) 
inc_codes = c("1086024"="2008",
"1069920"="2009",
"1061121"="2010",
"1039508"="2011",
"1010207"="2012")
twelve_yr <- mutate(merge_twelve, Year = inc_codes[as.character(ADJINC)])
data_2012 <- cbind(twelve_yr,avgpor_twelve)
  results12=data_2012 %.%
  group_by(Year) %.%
  summarise(avginc=mean(HINCP,na.rm=TRUE),avgwork=mean(avgWKHP))

# 2005-2007 Transform: 
download.file("http://www2.census.gov/acs2007_3yr/pums/csv_hor.zip", 
              destfile = "csv_horsev.zip")
hor_seven <- read.csv(unz("csv_horsev.zip", "ss07hor.csv"),stringsAsFactors = FALSE)[,c(2,8,49)]

download.file("http://www2.census.gov/acs2007_3yr/pums/csv_por.zip", 
              destfile = "csv_porsev.zip")
por_seven <- read.csv(unz("csv_porsev.zip", "ss07por.csv"),stringsAsFactors = FALSE)[,c(2,59,60)]

avgpor_seven=por_seven %.%
  group_by(SERIALNO) %.%
  filter(WKL=="1") %.%
  summarise(avgWKHP=mean(WKHP,na.rm=TRUE),n=n())
merge_seven <- hor_seven[hor_seven$SERIALNO %in% avgpor_seven$SERIALNO,]
 
inc_codes = c("1082467"="2005",
              "1044488"="2006",
              "1016787"="2007")
seven_yr <- mutate(merge_seven, Year = inc_codes[as.character(ADJINC)])
data_2007 <- cbind(seven_yr,avgpor_seven)
results07=data_2007 %.%
  group_by(Year) %.%
  summarise(avginc=mean(HINCP,na.rm=TRUE),avgwork=mean(avgWKHP))
x=rbind(results07,results12)
qplot(avginc,avgwork,data=x,color=Year)


## LU
# download OR 2004 housing #
download.file("http://www2.census.gov/acs/downloads/pums/2004/csv_hor.zip", destfile = "csv_hor_2004.zip")
unzip("csv_hor_2004.zip", list = TRUE)
hor_2004 <- read.csv(unz("csv_hor_2004.zip", "ss04hor.csv"),stringsAsFactors = FALSE)[,c(2,9,54)]



# download OR 2004 personal #

# download OR 2003 housing #
download.file("http://www2.census.gov/acs/downloads/pums/2003/csv_hor.zip", destfile = "csv_hor_2003.zip")
unzip("csv_hor_2003.zip", list = TRUE)
hor_2003 <- read.csv(unz("csv_hor_2003.zip", "ss03hor.csv"),stringsAsFactors = FALSE)[,c(2,9,54)]




# download OR 2003 personal #

# download OR 2004 housing #
download.file("http://www2.census.gov/acs/downloads/pums/2004/csv_hor.zip",
              destfile = "csv_hor_2004.zip")
unzip("csv_hor_2004.zip", list = TRUE)
hor_2004 <- read.csv(unz("csv_hor_2004.zip", "ss04hor.csv"),stringsAsFactors = FALSE)[,c(2,9,50)]


# download OR 2004 personal #
download.file("http://www2.census.gov/acs/downloads/pums/2004/csv_por.zip",
              destfile = "csv_por_2004.zip")
unzip("csv_por_2004.zip", list = TRUE)
por_2004 <- read.csv(unz("csv_por_2004.zip", "ss04por.csv"),stringsAsFactors = FALSE)[,c(4,59,60)]


# download OR 2003 housing #
download.file("http://www2.census.gov/acs/downloads/pums/2003/csv_hor.zip",
              destfile = "csv_hor_2003.zip")
unzip("csv_hor_2003.zip", list = TRUE)
hor_2003 <- read.csv(unz("csv_hor_2003.zip", "ss03hor.csv"),stringsAsFactors = FALSE)[,c(2,9,50)]


# download OR 2003 personal #
download.file("http://www2.census.gov/acs/downloads/pums/2003/csv_por.zip",
              destfile = "csv_por_2003.zip")
unzip("csv_por_2003.zip", list = TRUE)
por_2003 <- read.csv(unz("csv_por_2003.zip", "ss03por.csv"),stringsAsFactors = FALSE)[,c(4,58,59)]


# merge hor_2004 and por_2004 #

library(dplyr)
por_2004_1 <- filter(por_2004,WKL=="1")
household <- group_by(por_2004_1,SERIALNO)
house_avghours <- summarise(household,avg_hours=mean(WKHP,na.rm=TRUE),n=n())
hor_2004_1 <- hor_2004[hor_2004$SERIALNO %in% house_avghours$SERIALNO,]
data_2004 <- cbind(hor_2004_1,avg_hours=house_avghours$avg_hours,n=house_avghours$n)
data_2004 <- mutate(data_2004,avg_income=HINCP/n)

#SERIALNO ## ADJUST # HINCP # avg_hours # n # avg_income#

# merge hor_2003 and por_2003 #
por_2003_1 <- filter(por_2003,WKL=="1")
household <- group_by(por_2003_1,SERIALNO)
house_avghours <- summarise(household,avg_hours=mean(WKHP,na.rm=TRUE),n=n())
hor_2003_1 <- hor_2003[hor_2003$SERIALNO %in% house_avghours$SERIALNO,]
data_2003 <- cbind(hor_2003_1,avg_hours=house_avghours$avg_hours,n=house_avghours$n)
data_2003 <- mutate(data_2003,avg_income=HINCP/n)

#SERIALNO # ADJUST # HINCP # avg_hours # n # avg_income#


result_2004 <- summarise(data_2004,avg_inc=mean(avg_income),avg_h=mean(avg_hours))
result_2003 <- summarise(data_2003,avg_inc=mean(avg_income),avg_h=mean(avg_hours))

## KATIE

# download OR 2002 housing #
download.file("http://www2.census.gov/acs/downloads/pums/2002/csv_hor.zip", destfile = "csv_hor_2002.zip")
unzip("csv_hor_2002.zip", list = TRUE)
hor_2002 <- read.csv(unz("csv_hor_2002.zip", "ss02hor.csv"),stringsAsFactors = FALSE)[,c(2,9,56)]
#e.g., match("SERIALNO",colnames(hor_2002))
# COULD USE: which(names(hor_2002) %in% c(SERIALNO","ADJUST","HINCP"))
# "SERIALNO" "ADJUST"   "HINCP"

# download OR 2002 personal #
download.file("http://www2.census.gov/acs/downloads/pums/2002/csv_por.zip", destfile = "csv_por_2002.zip")
unzip("csv_por_2002.zip", list = TRUE)
por_2002 <- read.csv(unz("csv_por_2002.zip", "ss02por.csv"),stringsAsFactors = FALSE)[,c(3,56,57)]
# "SERIALNO" "WKHP"     "WKL"

# download OR 2001 housing #
download.file("http://www2.census.gov/acs/downloads/pums/2001/csv_hor.zip", destfile = "csv_hor_2001.zip")
unzip("csv_hor_2001.zip", list = TRUE)
hor_2001 <- read.csv(unz("csv_hor_2001.zip", "ss01hor.csv"),stringsAsFactors = FALSE)[,c(2,9,56)]


# download OR 2001 personal #
download.file("http://www2.census.gov/acs/downloads/pums/2001/csv_por.zip", destfile = "csv_por_2001.zip")
unzip("csv_por_2001.zip", list = TRUE)
por_2001 <- read.csv(unz("csv_por_2001.zip", "ss01por.csv"),stringsAsFactors = FALSE)[,c(3,56,57)]



## FANGWU

# download OR 2000 housing #
download.file("http://www2.census.gov/acs/downloads/pums/2000/csv_hor.zip", destfile = "csv_hor_2000.zip")
unzip("csv_hor_2000.zip", list = TRUE)
hor_2000 <- read.csv(unz("csv_hor_2000.zip", "c2sshor.csv"),stringsAsFactors = FALSE)[,c(2,9,56)]
# extract data from three columns: "SERIALNO" "ADJUST" "HINCP"

# download OR 2000 personal #
download.file("http://www2.census.gov/acs/downloads/pums/2000/csv_por.zip", destfile = "csv_por_2000.zip")
unzip("csv_por_2000.zip", list = TRUE)
por_2000 <- read.csv(unz("csv_por_2000.zip", "c2sspor.csv"),stringsAsFactors = FALSE)[,c(3,56,57)]
# extract data from three columns: "SERIALNO" "WKHP" "WKL"

library(dplyr)

# extracting persons who worked last 12 months
por_2000_1 <- filter(por_2000,WKL=="1")
# group each person by SERIALNO that is household number
household <- group_by(por_2000_1,SERIALNO)
# creating a new data frame in terms of each household, including average working hours per household, highest education level per household, and number of members per household
house_aggregation <- summarise(household,avg_hours=mean(WKHP,na.rm=TRUE),high_edu=max(SCHL,na.rm=TRUE),n=n())
# extracting the housing data per household in terms of SERIALNO in new data frame "house_aggregation"
hor_2000_1 <- hor_2000[hor_2000$SERIALNO %in% house_aggregation$SERIALNO,] 
# merging the new household data frame with housing data based in terms of the unique SERIALNO
data_2000 <- cbind(hor_2000_1,avg_hours=house_aggregation$avg_hours,high_edu=house_aggregation$high_edu,n=house_aggregation$n)


# matching education level to code
# codes from data dictionary for 2000-2002
# I'm not sure the dictionary is the same for other years, please double check
# You can find PUMS DATA DICTIONARY for specific time periods through this link: http://www.census.gov/acs/www/data_documentation/pums_documentation/
EDU_codes <- c("bb"="N/A (less than 3 years old",
               "01"="None",
               "02"="Nursery school to grade 4",
               "03"="Grade 5 or grade 6",
               "04"="Grade 7 or grade 8",
               "05"="Grade 9",
               "06"="Grade 10",
               "07"="Grade 11",
               "08"="Grade 12 no diploma",
               "09"="High school graduate",
               "10"="Some college but no degree",
               "11"="Vo/Tech/Bus school degree",
               "12"="Associate degree in college",
               "13"="Bachelor's degree",
               "14"="Master's degree",
               "15"="Professional school degree",
               "16"="Doctorate degree")

# adding education codes to data frame "data_2000"
data_2000 <- mutate(data_2000,highest_education=EDU_codes[as.character(high_edu)])

result_2000 <- summarise(data_2000, avg_inc=mean(HINCP,na.rm=TRUE),avg_work=mean(avg_hours))
