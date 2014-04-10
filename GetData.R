# Code to download Oregon and California housing data 2008-2012.

# ==== Setwd to the location where you would like data saved  ==== #

# === download file === #
# download OR 2012_5yr
download.file("http://www2.census.gov/acs2012_5yr/pums/csv_hor.zip", 
              destfile = "csv_hor.zip")

# download CA 2012_5yr
download.file("http://www2.census.gov/acs2012_5yr/pums/csv_hca.zip", 
              destfile = "csv_hca.zip")

# === unzip and get file === #
# look into others function: unz, unzip, system('unzip ...'), 
# check files in the zip archive without extracting
unzip("csv_hor.zip", list = TRUE)
unzip("csv_hca.zip", list = TRUE)

# extract and read in one go
or_sm <- read.csv(unz("csv_hor.zip", "ss12hor.csv"),  # notice just 10 lines! why?
                  stringsAsFactors = FALSE)
str(or_sm)


ca_sm <- read.csv(unz("csv_hca.zip", "ss12hca.csv"),  # notice just 10 lines! why?
                  stringsAsFactors = FALSE)
str(ca_sm)
