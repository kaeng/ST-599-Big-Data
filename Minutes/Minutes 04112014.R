#===============================
# Project 1: American Community Survey (ACS)
# Presentation Date: Weds 4/23/14
# Meeting Notes
# 4/11/14
#===============================

# Members Present:
Ben, Lu, Katie

# ================================
# 1) Data Discovery Problems
# ================================
It was discovered that the data required to answer Fang Wus question concerning
internet services is not avaliable in the PUMS data sets, so Fang Wus excellent
question could not be answered.

# ================================
# 2) New Research Question
# ================================
Katie proposes a new research question: create a scatterplot between average 
number of hours worked and average household income from 2000 to 2012 for OREGON.
(See example here: http://economistsview.typepad.com/economistsview/2006/02/scatterplot_of_.html)

Each point on scatterplot would correspond to a one year average of the two variables.
We might see a similar pattern in our scatterplot compared to the example plot.

Present members agree to this research question.

# ================================
# 3) Variables of interest
# ================================
Note: One observation in the PUMS data set corresponds to one person
(can be multiple people per family. Need to confirm)

These are the variable names and descriptions we would like to collect from the PUMS data sets
are below. NOTE: The columns identified may not be the same from year to year. I may also
have also looked this up incorrectly. CHECK!
  
  
  # =============================================================================
  1) SERIALNO (in HOUSING data file - 2nd column):
    "Housing unit/GQ person serial number 2008000000001..2012999999999 .Unique identifier"
  # =============================================================================
  2) ADJINC (in HOUSING data file - 9th column):
  "Adjustment factor for income and earnings dollar amounts (6 implied decimal 
                                                            places) 
    1086024 .2008 factor (1.018389 * 1.06641366) 
    1069920 .2009 factor (0.999480 * 1.07047619)
    1061121 .2010 factor (1.007624 * 1.05309182) 
    1039508 .2011 factor (1.018237 * 1.02089010) 
    1010207 .2012 factor (1.010207 * 1.00000000)" 

    "1082467 .2005 factor (1.019190 * 1.06208580) 
    1044488 .2006 factor (1.015675 * 1.02836879) 
    1016787 .2007 factor (1.016787 * 1.00000000)"

    - NOTE: this ADJINC variable will be used to identify what year an observation was measured.
            (e.g., 1086024 indicates measurement was taken in 2008)
    - NOTE: Older data files may not have this same variable name
            (e.g., for 2000 - 2002, this variable name is ADJUST)
    - NOTE: This will be an important identifying number, since early years (e.g., 2000,2001)
            recycle the same serial numbers, however, no two years have the same ADJINC.
  # =============================================================================
  3) HINCP (in HOUSING data file - 54th column):
      "Household income (past 12 months) 
      bbbbbbbb .N/A(GQ/vacant) 
      00000000 .No household income
      -0059999 .Loss of -$59,999 or more 
      -0000001..-0059998 .Loss of $1 to -$59,998 
      00000001 .$1 or Break even 
      00000002..99999999 .Total household income in dollars (Components are 
                                                       .rounded) 

      Note: Use values from ADJINC to adjust HINCP to constant dollars."

    - NOTE: Notice that we only have income adjustments unique for each data set.
            (e.g., We cannot get 2001 observations adjusted to 2012 dollars since 2001 data
             was collected before 2012...)
            I propose we do not use the conversions provided by PUMS, and rather get
            conversion values from some outside source.
  # =============================================================================
  4) WKHP (in PERSON data file - 76th column):
    "Usual hours worked per week past 12 months 
      bb .N/A (less than 16 years old/did not work 
               .during the past 12 months) 
      01..98 .1 to 98 usual hours 
      99 .99 or more usual hours"
  # =============================================================================
  5) WKL (in PERSON data file) 
    "When last worked 
    b .N/A (less than 16 years old) 
    1 .Within the past 12 months 
    2 .1-5 years ago 
    3 .Over 5 years ago or never worked"
  # =============================================================================



# ================================
# 4) TO DO
# ================================

Type code to download assigned files, as we have on the GetData.R file posted
today, 4/11/14. Type your code in the space allocated to you. Have this completed
by Monday, 4/14/14. Only read in the variables listed in the above section.

http://www.census.gov/acs/www/data_documentation/pums_data/

## Ben

5 year personal
3 year (2005 - 2007) housing
3 year (2005 - 2007) personal

## Lu

2004 housing
2004 personal
2003 housing
2003 personal

## Katie

2002 housing
2002 personal
2001 housing
2001 personal

## Fang Wu

2000 housing
2000 personal


