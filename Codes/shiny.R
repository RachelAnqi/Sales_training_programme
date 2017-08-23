library(shiny)
library(shinythemes)
library(plotly)
library(dplyr)
library(shinydashboard)
library(tidyr)

shinyApp(
  dashboardPage(
    dashboardHeader(title = "销售培训"),
    dashboardSidebar(
      menuItem("新闻&WAS计划", tabName = "new&WAS", icon = icon("navicon")),
      menuItem("报告", tabName = "reports", icon = icon("list-alt")),
      menuItem("销售代表", tabName = "sr", icon = icon("address-card-o")),
      menuItem("产品", tabName = "products", icon = icon("plus-square-o")),
      menuItem("决策", tabName = "decisions", icon = icon("edit"))
    ),
    dashboardBody(
      tabItems(
        # First tab content
        tabItem(tabName = "new&WAS"),
        
        # Second tab content
        tabItem(tabName = "reports"),
        
        # First tab content
        tabItem(tabName = "sr"),
        
        # First tab content
        tabItem(tabName = "products"),
        
        # First tab content
        tabItem(tabName = "decisions",
                tabsetPanel(position = "left",
                            tabPanel("第一季度",
                                     fluidRow(
                                       column(3,
                                              h4("时间分配")
                                       )
                                     )),
                            tabPanel("第二季度"),
                            tabPanel("第三季度"),
                            tabPanel("第四季度")
                ))
        
        
      )
    )),
  server=function(input,output){})


  
    
      
    
