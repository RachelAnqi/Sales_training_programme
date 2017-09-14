library(shiny)
library(shinydashboard)
library(shinyjs)
library(DT)
library(plyr)
library(dplyr)
library(tidyr)
library(digest)






num_fails_to_lockout<-10


header <- dashboardHeader(title = "销售培训")

sidebar <- dashboardSidebar(uiOutput("sidebarpanel"))


body <- dashboardBody(uiOutput("body"))

ui <- dashboardPage(header, sidebar, body)