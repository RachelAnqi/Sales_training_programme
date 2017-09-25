library(shiny)
library(shinydashboard)
library(shinyjs)
library(DT)
library(plyr)
library(dplyr)
library(tidyr)
library(digest)






num_fails_to_lockout<-10


header <- dashboardHeader(title = "区域管理培训模拟平台")

sidebar <- dashboardSidebar(uiOutput("sidebarpanel"))


body <- dashboardBody(uiOutput("body"))

ui <- dashboardPage(header, sidebar, body)
