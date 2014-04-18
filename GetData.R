# Code to download Oregon housing data 2008-2012.

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
or_sm <- read.csv(unz("csv_hor.zip", "ss12hor.csv"),stringsAsFactors = FALSE)[,c(2,54)]


## BEN



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



## KATIE



## FANG WU

