#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
knitr::opts_chunk$set(echo = FALSE, warning = FALSE, message = FALSE)
library(tidyverse)
library(knitr)
library(kableExtra)
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
funding <- tribble(
  ~Amount, ~Organization, ~Fund, ~Year,
  "$680,000", "Emory University", "Lab Start-up Fund", "2026",
  "$130,000", "US Geological Survey", "Climate Adaptation Postdoctoral Fellows", "2025",
  "$195,000", "University of Florida", "Doctoral Preeminence Fellowship Award", "2019",
  "$4,000", "University of Florida", "Robin Nadeau Graduate Research Award", "2019",
  "$5,000", "National Science Foundation", "Research Experience for Undergraduates", "2013",
  "$5,000", "National Science Foundation", "Research Experience for Undergraduates", "2012",
  "$1,100", "Eastern Kentucky University", "Marcia Athey Research Grant", "2016",
  "$800", "Eastern Kentucky University", "Dept. Biology Travel Grant", "2017",
  "$700", "Society Freshwater Science", "Instars Fellowship", "2014",
  "$700", "Society Freshwater Science", "Instars Fellowship", "2013",
  "$500", "Soc. Study Amphibians & Reptiles", "Grant-in-Aid of Herpetological Research", "2016",
  "$500", "Eastern Kentucky University", "Dep. Biological Sciences Travel Stipend", "2016",
  "$500", "Eastern Kentucky University", "Div. Natural Areas Research Grant", "2016",
  "$500", "University of Arkansas", "Dept. Biology Travel Grant", "2013"
)

kable(funding, 
      format = "latex",
      booktabs = TRUE,
      linesep = "",
      align = c("r", "l", "l", "r"),
      col.names = c("Amount", "Organization", "Fund Name", "Year")) %>%
  kable_styling(latex_options = c("scale_down", "HOLD_position"),
                font_size = 11)
```
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
funding <- tribble(
  ~Activity, ~Event, ~Audience, ~Year,
  "Guest teacher -- ecosystems", "Holt Middle School, AR", "~30", "2013",
  "Watershed clean-up", "Lake Fayetteville, AR", "~30", "2013",
  "High school science fair judge", "NWA STEM Fair, AR", "~50", "2013",
  "Guest teacher -- reptiles and amphibians", "Model Elementary, AR", "~15", "2015",
  "Environmental stewardship", "EKU Career Fair, KY", "~150", "2016",
  "Community water quality testing", "Eastern Kentucky", "~30", "2016",
  "Vertebrate conservation education", "Memphis Zoo, TN", "~300", "2018"
)

kable(funding, 
      format = "latex",
      booktabs = TRUE,
      linesep = "",
      align = c("r", "l", "l", "r"),
      col.names = c("Activity", "Event", "# Reached", "Year")) %>%
  kable_styling(latex_options = c("scale_down", "HOLD_position"),
                font_size = 11)
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
non_funding <- tribble(
  ~Amount, ~Organization, ~Fund, ~Year,
  "$235,000", "Emory University", "Lab Start-up Fund", "2026",
  "$130,000", "US Geological Survey", "Climate Adaptation Postdoctoral Fellows", "2025",
  "$195,000", "University of Florida", "Doctoral Preeminence Fellowship Award", "2019",
  "$4,000", "University of Florida", "Robin Nadeau Graduate Research Award", "2019",
  "$5,000", "National Science Foundation", "Research Experience for Undergraduates", "2013",
  "$5,000", "National Science Foundation", "Research Experience for Undergraduates", "2012",
  "$1,100", "Eastern Kentucky University", "Marcia Athey Research Grant", "2016",
  "$800", "Eastern Kentucky University", "Dept. Biology Travel Grant", "2017",
  "$700", "Society Freshwater Science", "Instars Fellowship", "2014",
  "$700", "Society Freshwater Science", "Instars Fellowship", "2013",
  "$500", "Soc. Study Amphibians & Reptiles", "Grant-in-Aid of Herpetological Research", "2016",
  "$500", "Eastern Kentucky University", "Dep. Biological Sciences Travel Stipend", "2016",
  "$500", "Eastern Kentucky University", "Div. Natural Areas Research Grant", "2016",
  "$500", "University of Arkansas", "Dept. Biology Travel Grant", "2013"
)

kable(non_funding, 
      format = "latex",
      booktabs = TRUE,
      linesep = "",
      align = c("r", "l", "l", "r"),
      col.names = c("Amount", "Organization", "Fund Name", "Year")) %>%
  kable_styling(latex_options = c("scale_down", "HOLD_position"),
                font_size = 11)
```
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
