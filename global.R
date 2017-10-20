library(shiny)
library(shinyjs)
library(shinydashboard)
library(digest)
library(mongolite)

options(mongodb = list(
  "host" = "59.110.31.50:2017"
  # "username" = "root",
  # "password" = "root"
))

databaseName <- "STP"
collectionName <- "register"


fieldsMandatory <- c("user", "pw", "pw_m", "name", 
                     "corperation", "department", "title", "mobile_phone",
                     "email", "age")

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
              "email", "age")


epochTime <- function() {
  as.integer(Sys.time())
}

# responsesDir <- "/srv/shiny-server/sales_training_platform_beta1/credentials/"
# responsesDir <- "C:\\Users\\Thinkpad\\Desktop\\Register\\data\\"

# saveData <- function(data) {
#   # file_name <- paste(as.integer(Sys.time()), "_", digest(data), ".csv", sep = "")
#   write.table(x = data, 
#               file = "data/register_data.csv",
#               sep = ",",
#               row.names = FALSE,
#               col.names = FALSE,
#               append = TRUE)
# }
saveData <- function(data) {
  # Connect to the database
  db <- mongo(collection = collectionName,
              url = sprintf(
                # "mongodb://%s:%s@%s/%s",
                "mongodb://%s/%s",
                # options()$mongodb$username,
                # options()$mongodb$password,
                options()$mongodb$host,
                databaseName))
  # Insert the data into the mongo collection as a data.frame
  data <- as.data.frame(t(data))
  db$insert(data)
}


humanTime <- function() format(Sys.time(), "%Y%m%d-%H%M%OS")

# loadData <- function() {
#   
#   file_name <- "register_data.csv"
#   data <- read.csv("data/register_data.csv",
#                    stringsAsFactors = FALSE)
#   data
# }

loadData <- function() {
  # Connect to the database
  db <- mongo(collection = collectionName,
              url = sprintf(
                "mongodb://%s/%s",
                # options()$mongodb$username,
                # options()$mongodb$password,
                options()$mongodb$host,
                databaseName))
  # Read all the entries
  data <- db$find()
  data
}

# 
# adminUsers <- c("admin", "super_admin")
