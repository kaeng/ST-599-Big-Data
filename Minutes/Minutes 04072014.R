#===============================
# Project 1: American Community Survey (ACS)
# Presentation Date: Weds 4/23/14
# Meeting Notes
# 4/7/14
#===============================

# 1) Group Members assigned to roles
  Coordinator - Lu Wang
  Recorder - Katie Eng
  Monitor - Fang Wu Wei
  Checker - Ben Brintz

# 2) Relevant links
Group Github:
  https://github.com/kaeng/ST-599-Big-Data

Data can be found here:
  http://www.census.gov/acs/www/data_documentation/pums_data/
  
Data dictionary (list of variable names and codings):
  http://www.census.gov/acs/www/data_documentation/pums_documentation/
  
Survey questions avaliable online here: # Note: this is different than the first link sent
  # the question numbers in the first link sent do not match up to the survey distributed in class
  http://www.census.gov/acs/www/about_the_survey/explore_the_form/
  
#3) Proposed research questions, so far
  - Question 21: What is the annual payment for fire, hazard, and flood insurance on THIS property?

  * Does Oregon have higher / lower reported insurance coverage than California?
  (Even though we cannot compare the different types of insurance, total insurance payments can
   be compared.)


  - Question 11: At this house, apartment, or movile home - do you or any member of this household
  subscribe to the Internet using - dial up, DSL, cable modem, fiber optic, mobile broadband,
  satellite internet, other. (Each internet service method has a check box for yes/no, while "other"
  has a fill-in-the-blank.)

  * How is the proportion of respondants subscribing to dial-up, etc. methods change over time?
    (Oregon? Oregon vs. California?)
  

  - Question 14: Last month, what was the cost of ELECTRICITY for this house, apartment, or
  mobile home? (Dollar response, unless "included in rent fee" or "no charge or electricity
  not used" options sected.) Last month, what was the cost of GAS for this house, apartment, or
  mobile home? (Dollar response, unless "included in rent fee" or "included in electricity payment"
  or"no charge or electricity not used" options sected.)

  * How to electricity and gas costs compare? (Oregon? Oregon vs. California?)
  
  -#Fangwu's questions
  Page 11. Question 48: person’s total income
  Aggregating question 48 for all persons of a household.
  
  * Is there any relationship between total household income and a collection of housing questions including 
    Q.8 (basic features such as running water) and 9 (usage of computers)(page 5, Housing), Q.12 (# of vehicles)
    and 13 (fuel for heating) (page 6, Housing)? Regression?
  * Or is there any geographic patterns for these social determinants by using statistical tests 
    (e.g. cluster analysis)?

  I’m not sure these questions are doable because most of questions are discrete values. 


  - #Katie's question 
  Rudimentary estimation of divorce rates in Oregon vs California
  using questions 20 and 22 on page 9 of the survey. Notice that we may have to assume that
  if a respondant is currently married, then the marriage will not dissolve. Also, we would
  weight each response evenly, not accounting for within person 'prob of divorce'. (If a person
  has married multiple times, they will have multiple contributions to the observed proportion.)


  - #Lu's question
  Question 13: Which Fuel is used most for heating this house, apartment, or mobile home? 
  
  * Combine with the information of building type(question 1),we may think about whether there is a relationship 
  between type of fuel used and type of building they are living. 
  * Also, is there any relationship between where they live and the type of fuel used? The coast area and inner 
  land may have different choices, and we may select two or three states to make such comparison. 
  * Moreover, combine with the information of acres of the building(question 4), we may consider is there any 
  relationship between these two. For example, if they are living in a pretty big house, they may choose cheaper 
  fuel to save money. 

#4) Started drafting Team Expectations contract.
Draft in github as .R file.


# ============
# TO DO LIST
# ============

- Email entire group one proposed question of interest by 4/8/14 at 8:00pm
  - Ben, compile all questions and bring them to class?
  - On Weds, 4/9/14, we will share/discuss our ideas with the class

- Work on updating Team Expectations contract.
  - Ben will check and print this before submitting it on Weds, 4/9/14
  - Katie has posted a draft on the github (4/7/14)
