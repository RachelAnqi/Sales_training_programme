library(shiny)
library(shinyjs)
library(shinydashboard)
library(digest)

fieldsMandatory <- c("user", "pw", "pw_m", "name", 
                     "corperation", "department", "title", "mobile_phone",
                     "email", "boarding_date")

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

appCSS <-
  ".mandatory_star { color: red; }"

fieldsAll <-c("user", "pw", "pw_m", "name", 
              "corperation", "department", "title", "mobile_phone",
              "email", "boarding_date")


epochTime <- function() {
  as.integer(Sys.time())
}

# responsesDir <- "/srv/shiny-server/sales_training_platform_beta1/credentials/"
# responsesDir <- "C:\\Users\\Thinkpad\\Desktop\\Register\\data\\"

saveData <- function(data) {
  # file_name <- paste(as.integer(Sys.time()), "_", digest(data), ".csv", sep = "")
  write.table(x = data, 
              file = "data/register_data.csv",
              sep = ",",
              row.names = FALSE,
              col.names = FALSE,
              append = TRUE)
}


humanTime <- function() format(Sys.time(), "%Y%m%d-%H%M%OS")

loadData <- function() {
  
  file_name <- "register_data.csv"
  data <- read.csv("data/register_data.csv",
                   stringsAsFactors = FALSE)
  data
}


adminUsers <- c("admin", "super_admin")