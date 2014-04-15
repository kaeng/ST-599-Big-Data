# Code to download Oregon housing data 2000-2012.

# ==== Setwd to the location where you would like data saved  ==== #

# === download file === #
# download OR 2012_5yr
download.file("http://www2.census.gov/acs2012_5yr/pums/csv_hor.zip", 
              destfile = "csv_hor.zip")


# === unzip and get file === #
# look into others function: unz, unzip, system('unzip ...'), 
# check files in the zip archive without extracting
unzip("csv_hor.zip", list = TRUE)


# extract and read in one go
hor_twelve <- read.csv(unz("csv_hor.zip", "ss12hor.csv"),stringsAsFactors = FALSE)[,c(2,9,54)]


## BEN
# 2008-2012 Transform:
download.file("http://www2.census.gov/acs2012_5yr/pums/csv_por.zip", 
              destfile = "csv_por.zip")
por_twelve <- read.csv(unz("csv_por.zip", "ss12por.csv"),stringsAsFactors = FALSE)[,c(2,76,77)]
avgpor_twelve=por_twelve %.%
  group_by(SERIALNO) %.%
  filter(WKL=="1") %.%
  summarise(avgWKHP=mean(WKHP,na.rm=TRUE))
merge_twelve=merge(hor_twelve,avgpor_twelve,by.x = "SERIALNO",by.y = "SERIALNO")

# 2005-2007 Transform: 
download.file("http://www2.census.gov/acs2007_3yr/pums/csv_hor.zip", 
              destfile = "csv_horsev.zip")
hor_seven <- read.csv(unz("csv_horsev.zip", "ss07hor.csv"),stringsAsFactors = FALSE)[,c(2,8,49)]

download.file("http://www2.census.gov/acs2007_3yr/pums/csv_por.zip", 
              destfile = "csv_porsev.zip")
por_seven <- read.csv(unz("csv_porsev.zip", "ss07por.csv"),stringsAsFactors = FALSE)[,c(2,59,60)]



## LU

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

Test

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
hor_2000 <- read.csv(unz("csv_hor_2000.zip", "ss00hor.csv"),stringsAsFactors = FALSE)[,c(2,9,56)]
# extract data from three columns: "SERIALNO" "ADJUST" "HINCP"

# download OR 2000 personal #
download.file("http://www2.census.gov/acs/downloads/pums/2000/csv_por.zip", destfile = "csv_por_2000.zip")
unzip("csv_por_2000.zip", list = TRUE)
por_2002 <- read.csv(unz("csv_por_2000.zip", "ss00por.csv"),stringsAsFactors = FALSE)[,c(3,56,57)]
# extract data from three columns: "SERIALNO" "WKHP" "WKL"
