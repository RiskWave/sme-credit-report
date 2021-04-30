#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#


# Libraries
library(lubridate)
library(tidyr)
library(dplyr)
library(rmarkdown)
library(plumber)
library(RPostgres)
library(processx)
library(httr)
library(formattable)
library(sparkline)
library(highcharter)
library(echarts4r)
library(googlesheets4)
library(stringr)
library(httr)
library(jsonlite)
library(readxl)

#* @serializer contentType list(type="application/html; charset=utf-8")
#* @param company The ID of the company
#* @get /report
function(res, company = ""){
  include_html(rmarkdown::render("api/code.Rmd", params = list(company = company)), res) 
}