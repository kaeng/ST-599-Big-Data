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
or_sm <- read.csv(unz("csv_hor.zip", "ss12hor.csv"),stringsAsFactors = FALSE)[,c(2,9,54)]


## BEN
download.file("http://www2.census.gov/acs2012_5yr/pums/csv_por.zip", 
              destfile = "csv_por.zip")
por_twelve <- read.csv(unz("csv_por.zip", "ss12por.csv"),stringsAsFactors = FALSE)[,c(2,76,77)]

download.file("http://www2.census.gov/acs2007_3yr/pums/csv_hor.zip", 
              destfile = "csv_horsev.zip")
hor_seven <- read.csv(unz("csv_horsev.zip", "ss07hor.csv"),stringsAsFactors = FALSE)[,c(2,8,49)]

download.file("http://www2.census.gov/acs2007_3yr/pums/csv_por.zip", 
              destfile = "csv_porsev.zip")
por_seven <- read.csv(unz("csv_porsev.zip", "ss07por.csv"),stringsAsFactors = FALSE)[,c(2,59,60)]
## LU



## KATIE



## FANG WU

