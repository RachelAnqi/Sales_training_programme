library(shiny)
library(shinydashboard)
library(shinyjs)
library(DT)
library(plyr)
library(dplyr)
library(tidyr)
library(htmlTable)
library(htmlwidgets)


shinyApp(ui=dashboardPage(
  dashboardHeader(title = "销售培训"),
  dashboardSidebar(
    useShinyjs(),
    sidebarMenu(
      id = "sidebarmenu",
      menuItem("新闻&WAS计划", tabName = "news_and_WAS", icon = icon("navicon")),
      menuItem("销售代表",
               tabName = "sr",
               icon = icon("address-card-o")
      ),
      menuItem("产品", tabName = "products", icon = icon("plus-square-o")),
      menuItem("决策",
               tabName = "decisions",
               icon = icon("edit"),
               menuSubItem("客户决定", tabName = "decision1"),
               menuSubItem("管理决策", tabName = "decision2")
      ),
      menuItem("报告",
               tabName = "reports", 
               icon = icon("list-alt"),
               menuSubItem("staff Report",tabName = "report1"),
               menuSubItem("Time Allocation Report",tabName = "report2"),
               menuSubItem("Deployment Report",tabName = "report3"),
               menuSubItem("Contribution Margin",tabName = "report4")
      )
    )),
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "news_and_WAS",
              tabsetPanel(
                tabPanel("客户信息",
                         dataTableOutput("hospital_info")),
                tabPanel("新闻")
              )),
      
      # First tab content
      tabItem(tabName = "sr",
              dataTableOutput("sales_rep_info")),
      
      # First tab content
      tabItem(tabName = "products",
              dataTableOutput("products_info")),
      
      # First tab content
      tabItem(
        tabName = "decision1",
        tabsetPanel(
          #position = "left",
          tabPanel("周期1",
                   actionButton("decision1_phase1_calculator", "calculator"),
                   actionButton("decision1_phase1_submit", "submit"),
                   fluidRow(
                     h3("总推广预算"),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总推广预算"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                                verbatimTextOutput("p1_total_promotional_budget"))
                     ),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "已分配的推广预算"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p1_arranged_promotional_budget")
                       )
                     )
                   ),
                   br(),
                   fluidRow(
                     h3("时间分配"),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间分配 销售代表1"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                                verbatimTextOutput("p1_arranged_time_of_sr1"))
                     ),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间分配 销售代表2"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                                verbatimTextOutput("p1_arranged_time_of_sr2"))
                     ),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间分配 销售代表3"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                                verbatimTextOutput("p1_arranged_time_of_sr3"))
                     ),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间分配 销售代表4"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                                verbatimTextOutput("p1_arranged_time_of_sr4"))
                     ),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间分配 销售代表5"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                                verbatimTextOutput("p1_arranged_time_of_sr5"))
                     )
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院1"),
                     tags$div(
                       tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                                htmlOutput("p1_hosp1_1")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp1_2")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp1_3")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp1_4"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp1_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp1_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp1_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp1_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp1_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp1_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp1_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp1_4", label =
                                            NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_promotional_budget_hosp1", 
                                          label = NULL,
                                          value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp1_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp1_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp1_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp1_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp1_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp1_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp1_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp1_sales_target_4",label = NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         selectizeInput(
                           "p1_sr_hosp1",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp1_worktime_1",
                           label = NULL,
                           value = "6"
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp1_worktime_2",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp1_worktime_3",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp1_worktime_4",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 A级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp1_worktime_doc",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 B级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp1_worktime_diet",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 C级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp1_worktime_admin",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 D级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp1_worktime_nurs",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_decison1_summary_hosp1"))
                     )
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院2"),
                     tags$div(
                       tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                                htmlOutput("p1_hosp2_1")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp2_2")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp2_3")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp2_4"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp2_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp2_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp2_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp2_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp2_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp2_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp2_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp2_4", label =
                                            NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_promotional_budget_hosp2", 
                                          label = NULL,
                                          value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp2_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp2_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp2_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp2_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp2_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp2_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp2_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp2_sales_target_4",label = NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         selectizeInput(
                           "p1_sr_hosp2",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp2_worktime_1",
                           label = NULL,
                           value = "6"
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp2_worktime_2",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp2_worktime_3",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp2_worktime_4",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 A级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp2_worktime_doc",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 B级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp2_worktime_diet",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 C级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp2_worktime_admin",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 D级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp2_worktime_nurs",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_decison1_summary_hosp2"))
                     )
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院3"),
                     tags$div(
                       tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                                htmlOutput("p1_hosp3_1")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp3_2")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp3_3")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp3_4"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp3_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp3_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp3_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp3_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp3_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp3_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp3_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp3_4", label =
                                            NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_promotional_budget_hosp3", 
                                          label = NULL,
                                          value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp3_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp3_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp3_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp3_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp3_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp3_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp3_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp3_sales_target_4",label = NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         selectizeInput(
                           "p1_sr_hosp3",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp3_worktime_1",
                           label = NULL,
                           value = "6"
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp3_worktime_2",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp3_worktime_3",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp3_worktime_4",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 A级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp3_worktime_doc",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 B级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp3_worktime_diet",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 C级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp3_worktime_admin",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 D级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp3_worktime_nurs",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_decison1_summary_hosp3"))
                     )
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院4"),
                     tags$div(
                       tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                                htmlOutput("p1_hosp4_1")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp4_2")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp4_3")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp4_4"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp4_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp4_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp4_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp4_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp4_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp4_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp4_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp4_4", label =
                                            NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_promotional_budget_hosp4", 
                                          label = NULL,
                                          value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp4_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp4_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp4_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp4_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp4_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp4_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp4_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp4_sales_target_4",label = NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         selectizeInput(
                           "p1_sr_hosp4",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp4_worktime_1",
                           label = NULL,
                           value = "6"
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp4_worktime_2",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp4_worktime_3",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp4_worktime_4",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 A级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp4_worktime_doc",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 B级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp4_worktime_diet",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 C级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp4_worktime_admin",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 D级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp4_worktime_nurs",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_decison1_summary_hosp4"))
                     )
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院5"),
                     tags$div(
                       tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                                htmlOutput("p1_hosp5_1")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp5_2")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp5_3")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp5_4"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp5_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp5_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp5_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp5_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp5_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp5_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp5_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp5_4", label =
                                            NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_promotional_budget_hosp5", 
                                          label = NULL,
                                          value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp5_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp5_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp5_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp5_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp5_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp5_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp5_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp5_sales_target_4",label = NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         selectizeInput(
                           "p1_sr_hosp5",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp5_worktime_1",
                           label = NULL,
                           value = "6"
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp5_worktime_2",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp5_worktime_3",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp5_worktime_4",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 A级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp5_worktime_doc",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 B级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp5_worktime_diet",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 C级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp5_worktime_admin",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 D级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp5_worktime_nurs",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_decison1_summary_hosp5"))
                     )
                   ),
                   br(),
                   
                   fluidRow(
                     h3("决策-医院6"),
                     tags$div(
                       tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                                htmlOutput("p1_hosp6_1")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp6_2")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp6_3")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp6_4"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp6_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp6_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp6_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp6_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp6_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp6_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp6_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp6_4", label =
                                            NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_promotional_budget_hosp6", 
                                          label = NULL,
                                          value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp6_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp6_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp6_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp6_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp6_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp6_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp6_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp6_sales_target_4",label = NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         selectizeInput(
                           "p1_sr_hosp6",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp6_worktime_1",
                           label = NULL,
                           value = "6"
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp6_worktime_2",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp6_worktime_3",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp6_worktime_4",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 A级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp6_worktime_doc",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 B级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp6_worktime_diet",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 C级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp6_worktime_admin",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 D级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp6_worktime_nurs",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_decison1_summary_hosp6"))
                     )
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院7"),
                     tags$div(
                       tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                                htmlOutput("p1_hosp7_1")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp7_2")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp7_3")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp7_4"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp7_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp7_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp7_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp7_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp7_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp7_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp7_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp7_4", label =
                                            NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_promotional_budget_hosp7", 
                                          label = NULL,
                                          value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp7_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp7_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp7_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp7_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp7_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp7_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp7_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp7_sales_target_4",label = NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         selectizeInput(
                           "p1_sr_hosp7",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp7_worktime_1",
                           label = NULL,
                           value = "6"
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp7_worktime_2",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp7_worktime_3",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp7_worktime_4",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 A级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp7_worktime_doc",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 B级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp7_worktime_diet",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 C级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp7_worktime_admin",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 D级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp7_worktime_nurs",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_decison1_summary_hosp7"))
                     )
                   ),
                   br(),
                   
                   fluidRow(
                     h3("决策-医院8"),
                     tags$div(
                       tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                                htmlOutput("p1_hosp8_1")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp8_2")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp8_3")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp8_4"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp8_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp8_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp8_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp8_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp8_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp8_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp8_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp8_4", label =
                                            NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_promotional_budget_hosp8", 
                                          label = NULL,
                                          value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp8_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp8_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp8_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp8_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp8_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp8_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp8_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp8_sales_target_4",label = NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         selectizeInput(
                           "p1_sr_hosp8",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp8_worktime_1",
                           label = NULL,
                           value = "6"
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp8_worktime_2",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp8_worktime_3",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp8_worktime_4",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 A级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp8_worktime_doc",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 B级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp8_worktime_diet",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 C级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp8_worktime_admin",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 D级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp8_worktime_nurs",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_decison1_summary_hosp8"))
                     )
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院9"),
                     tags$div(
                       tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                                htmlOutput("p1_hosp9_1")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp9_2")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp9_3")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp9_4"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp9_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp9_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp9_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp9_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp9_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp9_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp9_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp9_4", label =
                                            NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_promotional_budget_hosp9", 
                                          label = NULL,
                                          value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp9_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp9_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp9_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp9_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp9_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp9_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp9_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp9_sales_target_4",label = NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         selectizeInput(
                           "p1_sr_hosp9",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp9_worktime_1",
                           label = NULL,
                           value = "6"
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp9_worktime_2",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp9_worktime_3",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp9_worktime_4",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 A级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp9_worktime_doc",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 B级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp9_worktime_diet",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 C级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp9_worktime_admin",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 D级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp9_worktime_nurs",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_decison1_summary_hosp9"))
                     )
                   ),
                   br(),
                   
                   fluidRow(
                     h3("决策-医院10"),
                     tags$div(
                       tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                                htmlOutput("p1_hosp10_1")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp10_2")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp10_3")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                                htmlOutput("p1_hosp10_4"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp10_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp10_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp10_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_potential_sales_hosp10_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp10_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp10_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp10_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_discount_hosp10_4", label =
                                            NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_promotional_budget_hosp10", 
                                          label = NULL,
                                          value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp10_1")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp10_2")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp10_3")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_current_sales_hosp10_4"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp10_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp10_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp10_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                                textInput("p1_hosp10_sales_target_4",label = NULL, value="5"))
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         selectizeInput(
                           "p1_sr_hosp10",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp10_worktime_1",
                           label = NULL,
                           value = "6"
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp10_worktime_2",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp10_worktime_3",
                           label = NULL,
                           value = "6"
                           
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp10_worktime_4",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 A级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp10_worktime_doc",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 B级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp10_worktime_diet",
                           label = NULL,
                           value = "6"
                           
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 C级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp10_worktime_admin",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "时间被分配到 D级客户(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput(
                           "p1_hosp10_worktime_nurs",
                           label = NULL,
                           value = "6"
                         )
                       )
                     ),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                                verbatimTextOutput("p1_decison1_summary_hosp10"))
                     )
                   )
                   
                   
                   
                   
                   
          ),
          tabPanel(
            "周期2",
            actionButton("decision1_phase2_calculator", "calculator"),
            actionButton("decision1_phase2_submit", "submit"),
            fluidRow(
              h3("总推广预算"),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总推广预算"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p2_total_promotional_budget"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "已分配的推广预算"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                  verbatimTextOutput("p2_arranged_promotional_budget")
                )
              )
            ),
            br(),
            fluidRow(
              h3("时间分配"),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表1"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p2_arranged_time_of_sr1"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表2"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p2_arranged_time_of_sr2"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表3"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p2_arranged_time_of_sr3"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表4"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p2_arranged_time_of_sr4"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表5"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p2_arranged_time_of_sr5"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院1"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p2_hosp1_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp1_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp1_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp1_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp1_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp1_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp1_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp1_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp1_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp1_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp1_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp1_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_promotional_budget_hosp1", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp1_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp1_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp1_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp1_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp1_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp1_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp1_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp1_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p2_sr_hosp1",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp1_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp1_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp1_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp1_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp1_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp1_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp1_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp1_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_decison1_summary_hosp1"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院2"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p2_hosp2_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp2_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp2_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp2_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp2_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp2_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp2_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp2_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp2_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp2_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp2_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp2_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_promotional_budget_hosp2", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp2_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp2_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp2_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp2_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp2_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp2_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp2_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp2_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p2_sr_hosp2",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp2_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp2_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp2_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp2_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp2_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp2_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp2_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp2_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_decison1_summary_hosp2"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院3"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p2_hosp3_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp3_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp3_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp3_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp3_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp3_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp3_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp3_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp3_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp3_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp3_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp3_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_promotional_budget_hosp3", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp3_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp3_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp3_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp3_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp3_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp3_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp3_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp3_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p2_sr_hosp3",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp3_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp3_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp3_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp3_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp3_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp3_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp3_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp3_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_decison1_summary_hosp3"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院4"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p2_hosp4_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp4_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp4_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp4_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp4_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp4_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp4_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp4_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp4_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp4_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp4_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp4_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_promotional_budget_hosp4", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp4_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp4_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp4_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp4_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp4_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp4_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp4_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp4_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p2_sr_hosp4",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp4_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp4_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp4_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp4_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp4_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp4_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp4_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp4_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_decison1_summary_hosp4"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院5"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p2_hosp5_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp5_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp5_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp5_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp5_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp5_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp5_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp5_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp5_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp5_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp5_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp5_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_promotional_budget_hosp5", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp5_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp5_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp5_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp5_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp5_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp5_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp5_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp5_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p2_sr_hosp5",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp5_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp5_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp5_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp5_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp5_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp5_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp5_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp5_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_decison1_summary_hosp5"))
              )
            ),
            br(),
            
            fluidRow(
              h3("决策-医院6"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p2_hosp6_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp6_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp6_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp6_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp6_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp6_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp6_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp6_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp6_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp6_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp6_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp6_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_promotional_budget_hosp6", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp6_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp6_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp6_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp6_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp6_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp6_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp6_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp6_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p2_sr_hosp6",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp6_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp6_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp6_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp6_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp6_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp6_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp6_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp6_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_decison1_summary_hosp6"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院7"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p2_hosp7_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp7_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp7_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp7_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp7_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp7_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp7_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp7_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp7_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp7_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp7_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp7_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_promotional_budget_hosp7", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp7_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp7_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp7_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp7_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp7_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp7_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp7_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp7_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p2_sr_hosp7",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp7_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp7_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp7_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp7_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp7_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp7_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp7_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp7_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_decison1_summary_hosp7"))
              )
            ),
            br(),
            
            fluidRow(
              h3("决策-医院8"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p2_hosp8_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp8_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp8_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp8_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp8_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp8_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp8_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp8_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp8_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp8_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp8_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp8_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_promotional_budget_hosp8", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp8_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp8_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp8_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp8_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp8_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp8_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp8_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp8_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p2_sr_hosp8",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp8_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp8_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp8_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp8_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp8_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp8_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp8_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp8_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_decison1_summary_hosp8"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院9"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p2_hosp9_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp9_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp9_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp9_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp9_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp9_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp9_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp9_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp9_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp9_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp9_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp9_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_promotional_budget_hosp9", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp9_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp9_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp9_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp9_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp9_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp9_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp9_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp9_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p2_sr_hosp9",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp9_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp9_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp9_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp9_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp9_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp9_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp9_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp9_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_decison1_summary_hosp9"))
              )
            ),
            br(),
            
            fluidRow(
              h3("决策-医院10"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p2_hosp10_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp10_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp10_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p2_hosp10_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp10_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp10_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp10_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_potential_sales_hosp10_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp10_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp10_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp10_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_discount_hosp10_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_promotional_budget_hosp10", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp10_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp10_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp10_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_current_sales_hosp10_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp10_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp10_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp10_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p2_hosp10_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p2_sr_hosp10",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp10_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp10_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp10_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp10_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp10_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp10_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp10_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p2_hosp10_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p2_decison1_summary_hosp10"))
              )
            )
            
            
            
            
            
            
          ),
          tabPanel(
            "周期3",
            actionButton("decision1_phase3_calculator", "calculator"),
            actionButton("decision1_phase3_submit", "submit"),
            fluidRow(
              h3("总推广预算"),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总推广预算"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p3_total_promotional_budget"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "已分配的推广预算"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                  verbatimTextOutput("p3_arranged_promotional_budget")
                )
              )
            ),
            br(),
            fluidRow(
              h3("时间分配"),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表1"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p3_arranged_time_of_sr1"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表2"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p3_arranged_time_of_sr2"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表3"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p3_arranged_time_of_sr3"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表4"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p3_arranged_time_of_sr4"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表5"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p3_arranged_time_of_sr5"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院1"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p3_hosp1_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp1_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp1_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp1_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp1_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp1_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp1_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp1_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp1_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp1_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp1_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp1_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_promotional_budget_hosp1", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp1_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp1_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp1_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp1_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp1_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp1_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp1_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp1_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p3_sr_hosp1",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp1_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp1_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp1_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp1_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp1_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp1_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp1_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp1_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_decison1_summary_hosp1"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院2"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p3_hosp2_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp2_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp2_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp2_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp2_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp2_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp2_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp2_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp2_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp2_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp2_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp2_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_promotional_budget_hosp2", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp2_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp2_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp2_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp2_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp2_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp2_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp2_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp2_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p3_sr_hosp2",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp2_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp2_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp2_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp2_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp2_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp2_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp2_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp2_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_decison1_summary_hosp2"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院3"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p3_hosp3_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp3_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp3_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp3_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp3_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp3_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp3_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp3_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp3_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp3_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp3_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp3_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_promotional_budget_hosp3", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp3_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp3_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp3_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp3_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp3_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp3_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp3_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp3_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p3_sr_hosp3",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp3_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp3_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp3_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp3_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp3_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp3_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp3_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp3_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_decison1_summary_hosp3"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院4"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p3_hosp4_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp4_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp4_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp4_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp4_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp4_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp4_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp4_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp4_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp4_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp4_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp4_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_promotional_budget_hosp4", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp4_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp4_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp4_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp4_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp4_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp4_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp4_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp4_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p3_sr_hosp4",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp4_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp4_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp4_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp4_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp4_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp4_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp4_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp4_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_decison1_summary_hosp4"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院5"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p3_hosp5_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp5_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp5_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp5_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp5_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp5_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp5_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp5_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp5_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp5_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp5_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp5_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_promotional_budget_hosp5", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp5_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp5_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp5_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp5_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp5_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp5_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp5_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp5_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p3_sr_hosp5",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp5_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp5_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp5_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp5_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp5_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp5_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp5_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp5_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_decison1_summary_hosp5"))
              )
            ),
            br(),
            
            fluidRow(
              h3("决策-医院6"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p3_hosp6_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp6_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp6_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp6_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp6_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp6_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp6_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp6_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp6_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp6_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp6_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp6_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_promotional_budget_hosp6", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp6_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp6_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp6_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp6_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp6_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp6_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp6_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp6_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p3_sr_hosp6",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp6_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp6_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp6_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp6_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp6_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp6_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp6_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp6_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_decison1_summary_hosp6"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院7"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p3_hosp7_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp7_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp7_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp7_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp7_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp7_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp7_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp7_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp7_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp7_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp7_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp7_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_promotional_budget_hosp7", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp7_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp7_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp7_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp7_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp7_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp7_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp7_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp7_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p3_sr_hosp7",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp7_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp7_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp7_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp7_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp7_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp7_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp7_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp7_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_decison1_summary_hosp7"))
              )
            ),
            br(),
            
            fluidRow(
              h3("决策-医院8"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p3_hosp8_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp8_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp8_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp8_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp8_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp8_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp8_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp8_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp8_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp8_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp8_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp8_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_promotional_budget_hosp8", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp8_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp8_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp8_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp8_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp8_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp8_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp8_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp8_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p3_sr_hosp8",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp8_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp8_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp8_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp8_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp8_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp8_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp8_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp8_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_decison1_summary_hosp8"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院9"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p3_hosp9_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp9_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp9_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp9_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp9_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp9_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp9_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp9_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp9_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp9_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp9_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp9_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_promotional_budget_hosp9", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp9_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp9_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp9_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp9_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp9_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp9_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp9_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp9_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p3_sr_hosp9",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp9_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp9_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp9_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp9_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp9_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp9_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp9_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp9_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_decison1_summary_hosp9"))
              )
            ),
            br(),
            
            fluidRow(
              h3("决策-医院10"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p3_hosp10_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp10_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp10_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p3_hosp10_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp10_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp10_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp10_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_potential_sales_hosp10_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp10_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp10_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp10_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_discount_hosp10_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_promotional_budget_hosp10", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp10_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp10_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp10_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_current_sales_hosp10_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp10_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp10_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp10_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p3_hosp10_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p3_sr_hosp10",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp10_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp10_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp10_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp10_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp10_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp10_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp10_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p3_hosp10_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p3_decison1_summary_hosp10"))
              )
            )
            
            
            
            
            
            
          ),
          tabPanel(
            "周期4",
            actionButton("decision1_phase4_calculator", "calculator"),
            actionButton("decision1_phase4_submit", "submit"),
            fluidRow(
              h3("总推广预算"),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总推广预算"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p4_total_promotional_budget"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "已分配的推广预算"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                  verbatimTextOutput("p4_arranged_promotional_budget")
                )
              )
            ),
            br(),
            fluidRow(
              h3("时间分配"),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表1"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p4_arranged_time_of_sr1"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表2"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p4_arranged_time_of_sr2"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表3"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p4_arranged_time_of_sr3"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表4"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p4_arranged_time_of_sr4"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间分配 销售代表5"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p4_arranged_time_of_sr5"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院1"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p4_hosp1_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp1_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp1_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp1_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp1_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp1_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp1_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp1_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp1_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp1_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp1_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp1_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_promotional_budget_hosp1", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp1_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp1_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp1_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp1_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp1_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp1_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp1_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp1_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p4_sr_hosp1",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp1_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp1_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp1_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp1_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp1_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp1_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp1_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp1_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_decison1_summary_hosp1"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院2"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p4_hosp2_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp2_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp2_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp2_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp2_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp2_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp2_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp2_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp2_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp2_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp2_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp2_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_promotional_budget_hosp2", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp2_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp2_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp2_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp2_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp2_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp2_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp2_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp2_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p4_sr_hosp2",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp2_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp2_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp2_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp2_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp2_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp2_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp2_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp2_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_decison1_summary_hosp2"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院3"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p4_hosp3_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp3_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp3_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp3_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp3_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp3_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp3_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp3_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp3_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp3_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp3_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp3_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_promotional_budget_hosp3", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp3_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp3_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp3_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp3_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp3_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp3_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp3_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp3_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p4_sr_hosp3",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp3_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp3_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp3_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp3_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp3_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp3_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp3_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp3_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_decison1_summary_hosp3"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院4"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p4_hosp4_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp4_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp4_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp4_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp4_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp4_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp4_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp4_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp4_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp4_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp4_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp4_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_promotional_budget_hosp4", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp4_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp4_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp4_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp4_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp4_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp4_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp4_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp4_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p4_sr_hosp4",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp4_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp4_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp4_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp4_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp4_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp4_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp4_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp4_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_decison1_summary_hosp4"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院5"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p4_hosp5_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp5_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp5_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp5_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp5_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp5_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp5_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp5_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp5_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp5_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp5_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp5_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_promotional_budget_hosp5", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp5_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp5_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp5_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp5_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp5_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp5_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp5_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp5_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p4_sr_hosp5",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp5_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp5_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp5_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp5_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp5_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp5_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp5_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp5_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_decison1_summary_hosp5"))
              )
            ),
            br(),
            
            fluidRow(
              h3("决策-医院6"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p4_hosp6_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp6_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp6_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp6_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp6_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp6_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp6_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp6_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp6_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp6_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp6_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp6_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_promotional_budget_hosp6", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp6_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp6_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp6_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp6_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp6_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp6_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp6_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp6_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p4_sr_hosp6",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp6_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp6_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp6_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp6_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp6_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp6_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp6_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp6_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_decison1_summary_hosp6"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院7"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p4_hosp7_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp7_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp7_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp7_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp7_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp7_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp7_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp7_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp7_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp7_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp7_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp7_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_promotional_budget_hosp7", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp7_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp7_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp7_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp7_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp7_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp7_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp7_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp7_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p4_sr_hosp7",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp7_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp7_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp7_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp7_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp7_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp7_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp7_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp7_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_decison1_summary_hosp7"))
              )
            ),
            br(),
            
            fluidRow(
              h3("决策-医院8"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p4_hosp8_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp8_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp8_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp8_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp8_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp8_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp8_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp8_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp8_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp8_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp8_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp8_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_promotional_budget_hosp8", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp8_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp8_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp8_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp8_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp8_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp8_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp8_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp8_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p4_sr_hosp8",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp8_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp8_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp8_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp8_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp8_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp8_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp8_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp8_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_decison1_summary_hosp8"))
              )
            ),
            br(),
            fluidRow(
              h3("决策-医院9"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p4_hosp9_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp9_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp9_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp9_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp9_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp9_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp9_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp9_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp9_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp9_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp9_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp9_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_promotional_budget_hosp9", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp9_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp9_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp9_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp9_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp9_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp9_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp9_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp9_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p4_sr_hosp9",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp9_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp9_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp9_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp9_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp9_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp9_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp9_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp9_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_decison1_summary_hosp9"))
              )
            ),
            br(),
            
            fluidRow(
              h3("决策-医院10"),
              tags$div(
                tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                         htmlOutput("p4_hosp10_1")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp10_2")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp10_3")),
                tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                         htmlOutput("p4_hosp10_4"))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp10_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp10_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp10_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_potential_sales_hosp10_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp10_1", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp10_2", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp10_3", label =
                                     NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_discount_hosp10_4", label =
                                     NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_promotional_budget_hosp10", 
                                   label = NULL,
                                   value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp10_1")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp10_2")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp10_3")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_current_sales_hosp10_4"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp10_sales_target_1",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp10_sales_target_2",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp10_sales_target_3",label = NULL, value="5")),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                         textInput("p4_hosp10_sales_target_4",label = NULL, value="5"))
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  selectizeInput(
                    "p4_sr_hosp10",
                    label = NULL,
                    choices = available_srs,
                    selected = NULL
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp10_worktime_1",
                    label = NULL,
                    value = "6"
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp10_worktime_2",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp10_worktime_3",
                    label = NULL,
                    value = "6"
                    
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp10_worktime_4",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 A级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp10_worktime_doc",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 B级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp10_worktime_diet",
                    label = NULL,
                    value = "6"
                    
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 C级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp10_worktime_admin",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "时间被分配到 D级客户(%)"),
                tags$div(
                  style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  textInput(
                    "p4_hosp10_worktime_nurs",
                    label = NULL,
                    value = "6"
                  )
                )
              ),
              
              tags$div(
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                         verbatimTextOutput("p4_decison1_summary_hosp10"))
              )
            )
            
            
            
            
            
            
          )
        )),
      tabItem(
        tabName = "decision2",
        tabsetPanel(
          tabPanel(
            "周期1",
            actionButton("decision2_phase1_submit", "submit"),
            actionButton('save_inputs', 'Save inputs'),
            actionButton("load_inputs", "Load inputs"),
            fluidRow(h3("时间分配"),
                     tags$div(
                       tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                                "时间分配(天)"),
                       tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                                "100")
                     )),
            hr(),
            fluidRow(
              h3("经理时间分配(天数)"),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                         "总时间的百分比"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "经理"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表5")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px",
                         "销售培训"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_total_sales_training")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_flm_sales_training")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr1_sales_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr2_sales_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr3_sales_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr4_sales_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr5_sales_training", label =
                                     NULL,value=5))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "医院拜访"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_total_field_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_flm_field_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr1_field_work", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr2_field_work", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr3_field_work", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr4_field_work", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr5_field_work", label =
                                     NULL,value=5))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "团队会议"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_total_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p1_flm_team_meeting", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p1_sr1_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p1_sr2_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p1_sr3_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p1_sr4_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p1_sr5_team_meeting"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "KPI 报告分析"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_total_kpi_analysis")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p1_flm_kpi_analysis", label =
                                     NULL,value=5))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "战略和周期计划"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_total_strategy_planning")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p1_flm_strategy_planning", label =
                                     NULL,value=5))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "行政工作"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_total_admin_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p1_flm_admin_work", label =
                                     NULL,value=5))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px",
                         "总体"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_total_management")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_flm_management"))
              )
            ),
            br(),
            fluidRow(
              h3("销售指标&产品培训"),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表5")
              ),
              br(),
              
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px",
                         "产品培训(天)"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         textInput("p1_sr1_product_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p1_sr2_product_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr3_product_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr4_product_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p1_sr5_product_training", label =
                                     NULL,value=5))
              )
            )
          ),
          tabPanel(
            "周期2",
            actionButton("decision2_phase2_submit","submit"),
            fluidRow(h3("时间分配"),
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:20px;width:13%;text-align:left;",
                                "时间分配(天)"),
                       tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                                "100")
                     )),
            hr(),
            fluidRow(
              h3("经理时间分配(天数)"),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                         "总时间的百分比"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "经理"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表5")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "销售培训"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_total_sales_training")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_flm_sales_training")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr1_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr2_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr3_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr4_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr5_sales_training", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "医院拜访"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_total_field_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_flm_field_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr1_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr2_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr3_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr4_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr5_field_work", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "团队会议"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_total_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p2_flm_team_meeting", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p2_sr1_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p2_sr2_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p2_sr3_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p2_sr4_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p2_sr5_team_meeting"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "KPI 报告分析"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_total_kpi_analysis")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p2_flm_kpi_analysis", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "战略和周期计划"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_total_strategy_planning")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p2_flm_strategy_planning", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "行政工作"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_total_admin_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p2_flm_admin_work", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "总体"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_total_management")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_flm_management"))
              )
            ),
            br(),
            fluidRow(
              h3("产品培训"),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表5")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "产品培训(天)"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         textInput("p2_sr1_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p2_sr2_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr3_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr4_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p2_sr5_product_training", label =
                                     NULL))
              )
            )
          ),
          tabPanel(
            "周期3",
            actionButton("decision2_phase3_submit","submit"),
            fluidRow(h3("时间分配"),
                     tags$div(
                       tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                                "时间分配(天)"),
                       tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                                "100")
                     )),
            hr(),
            fluidRow(
              h3("经理时间分配(天数)"),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                         "总时间的百分比"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "经理"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表5")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "销售培训"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_total_sales_training")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_flm_sales_training")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr1_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr2_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr3_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr4_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr5_sales_training", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "医院拜访"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_total_field_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_flm_field_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr1_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr2_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr3_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr4_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr5_field_work", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "团队会议"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_total_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p3_flm_team_meeting", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p3_sr1_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p3_sr2_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p3_sr3_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p3_sr4_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p3_sr5_team_meeting"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "KPI 报告分析"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_total_kpi_analysis")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p3_flm_kpi_analysis", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "战略和周期计划"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_total_strategy_planning")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p3_flm_strategy_planning", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "行政工作"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_total_admin_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p3_flm_admin_work", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "总体"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_total_management")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_flm_management"))
              )
            ),
            br(),
            fluidRow(
              h3("产品培训"),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表5")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px",
                         "产品培训(天)"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         textInput("p3_sr1_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p3_sr2_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr3_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr4_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p3_sr5_product_training", label =
                                     NULL))
              )
            )
          ),
          tabPanel(
            "周期4",
            actionButton("decision2_phase4_submit","submit"),
            fluidRow(h3("时间分配"),
                     tags$div(
                       tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                                "时间分配(天)"),
                       tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                                "100")
                     )),
            hr(),
            fluidRow(
              h3("经理时间分配(天数)"),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                         "总时间的百分比"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "经理"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表5")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "销售培训"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_total_sales_training")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_flm_sales_training")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr1_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr2_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr3_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr4_sales_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr5_sales_training", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "医院拜访"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_total_field_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_flm_field_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr1_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr2_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr3_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr4_field_work", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr5_field_work", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "团队会议"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_total_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p4_flm_team_meeting", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p4_sr1_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p4_sr2_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p4_sr3_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p4_sr4_team_meeting")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         verbatimTextOutput("p4_sr5_team_meeting"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "KPI 报告分析"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_total_kpi_analysis")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p4_flm_kpi_analysis", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "战略和周期计划"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_total_strategy_planning")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p4_flm_strategy_planning", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px",
                         "行政工作"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_total_admin_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p4_flm_admin_work", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                         "总体"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_total_management")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_flm_management"))
              )
            ),
            br(),
            fluidRow(
              h3("产品培训"),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                         "代表5")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px",
                         "产品培训(天)"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         textInput("p4_sr1_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p4_sr2_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr3_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr4_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                         textInput("p4_sr5_product_training", label =
                                     NULL))
                
              )
            )
          )
        )
      ),
      tabItem(tabName = "report1",
              DT::dataTableOutput("report1_table")),
      tabItem(tabName = "report2",
              DT::dataTableOutput("report2_table")),
      tabItem(tabName = "report3",
              DT::dataTableOutput("report3_table")),
      tabItem(tabName = "report4",
              tabsetPanel(
                tabPanel("周期1",
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "代表报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report1_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report1_2")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report1_3")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report1_4")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report1_5")))
                         ),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "经理报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report2_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;;margin-left:3%",
                                             dataTableOutput("p1_report2_2")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "分配报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report3")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "决策报告"),
                                  fluidRow(       
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report4_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report4_2")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report4_3")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "市场调研报告"),
                                  fluidRow(    
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report5_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p1_report5_2"))))
                         
                ),
                
                tabPanel("周期2",
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "代表报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report1_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report1_2")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report1_3")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report1_4")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report1_5")))
                         ),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "经理报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report2_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;;margin-left:3%",
                                             dataTableOutput("p2_report2_2")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "分配报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report3")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "决策报告"),
                                  fluidRow(       
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report4_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report4_2")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report4_3")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "市场调研报告"),
                                  fluidRow(    
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report5_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p2_report5_2"))))),
                
                tabPanel("周期3",
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "代表报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report1_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report1_2")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report1_3")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report1_4")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report1_5")))
                         ),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "经理报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report2_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;;margin-left:3%",
                                             dataTableOutput("p3_report2_2")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "分配报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report3")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "决策报告"),
                                  fluidRow(       
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report4_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report4_2")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report4_3")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "市场调研报告"),
                                  fluidRow(    
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report5_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p3_report5_2"))))),
                
                tabPanel("周期4",
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "代表报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report1_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report1_2")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report1_3")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report1_4")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report1_5")))
                         ),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "经理报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report2_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;;margin-left:3%",
                                             dataTableOutput("p4_report2_2")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "分配报告"),
                                  fluidRow(
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report3")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "决策报告"),
                                  fluidRow(       
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report4_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report4_2")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report4_3")))),
                         br(),br(),br(),br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "市场调研报告"),
                                  fluidRow(    
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report5_1")),
                                    br(),br(),br(),
                                    tags$div(style = "text-align:left;margin-left:3%",
                                             dataTableOutput("p4_report5_2"))))),
                tabPanel("总报告",fluidRow(
                  tags$div(style = "text-align:left;margin-left:3%",
                           dataTableOutput("final_report"))))
                
              ))))),
  server=function(input, output,session) {
    # output$p1_hosp1 <- renderText(hospital_info_initial$name[1])
    # output$p1_hosp2 <- renderText(hospital_info_initial$name[2])
    # output$p1_hosp3 <- renderText(hospital_info_initial$name[3])
    # output$p1_hosp4 <- renderText(hospital_info_initial$name[4])
    # output$p1_hosp5 <- renderText(hospital_info_initial$name[5])
    # output$p1_hosp6 <- renderText(hospital_info_initial$name[6])
    # output$p1_hosp7 <- renderText(hospital_info_initial$name[7])
    # output$p1_hosp8 <- renderText(hospital_info_initial$name[8])
    # output$p1_hosp9 <- renderText(hospital_info_initial$name[9])
    # output$p1_hosp10 <- renderText(hospital_info_initial$name[10])
    # 
    # output$p2_hosp1 <- renderText(hospital_info_initial$name[1])
    # output$p2_hosp2 <- renderText(hospital_info_initial$name[2])
    # output$p2_hosp3 <- renderText(hospital_info_initial$name[3])
    # output$p2_hosp4 <- renderText(hospital_info_initial$name[4])
    # output$p2_hosp5 <- renderText(hospital_info_initial$name[5])
    # output$p2_hosp6 <- renderText(hospital_info_initial$name[6])
    # output$p2_hosp7 <- renderText(hospital_info_initial$name[7])
    # output$p2_hosp8 <- renderText(hospital_info_initial$name[8])
    # output$p2_hosp9 <- renderText(hospital_info_initial$name[9])
    # output$p2_hosp10 <- renderText(hospital_info_initial$name[10])
    # 
    # output$p3_hosp1 <- renderText(hospital_info_initial$name[1])
    # output$p3_hosp2 <- renderText(hospital_info_initial$name[2])
    # output$p3_hosp3 <- renderText(hospital_info_initial$name[3])
    # output$p3_hosp4 <- renderText(hospital_info_initial$name[4])
    # output$p3_hosp5 <- renderText(hospital_info_initial$name[5])
    # output$p3_hosp6 <- renderText(hospital_info_initial$name[6])
    # output$p3_hosp7 <- renderText(hospital_info_initial$name[7])
    # output$p3_hosp8 <- renderText(hospital_info_initial$name[8])
    # output$p3_hosp9 <- renderText(hospital_info_initial$name[9])
    # output$p3_hosp10 <- renderText(hospital_info_initial$name[10])
    # 
    # output$p4_hosp1 <- renderText(hospital_info_initial$name[1])
    # output$p4_hosp2 <- renderText(hospital_info_initial$name[2])
    # output$p4_hosp3 <- renderText(hospital_info_initial$name[3])
    # output$p4_hosp4 <- renderText(hospital_info_initial$name[4])
    # output$p4_hosp5 <- renderText(hospital_info_initial$name[5])
    # output$p4_hosp6 <- renderText(hospital_info_initial$name[6])
    # output$p4_hosp7 <- renderText(hospital_info_initial$name[7])
    # output$p4_hosp8 <- renderText(hospital_info_initial$name[8])
    # output$p4_hosp9 <- renderText(hospital_info_initial$name[9])
    # output$p4_hosp10 <- renderText(hospital_info_initial$name[10])
    
    output$p1_hosp1_1 <- renderText(product_info_initial$name2[1])
    output$p1_hosp1_2 <- renderText(product_info_initial$name2[2])
    output$p1_hosp1_3 <- renderText(product_info_initial$name2[3])
    output$p1_hosp1_4 <- renderText(product_info_initial$name2[4])
    
    output$p1_hosp2_1 <- renderText(product_info_initial$name2[1])
    output$p1_hosp2_2 <- renderText(product_info_initial$name2[2])
    output$p1_hosp2_3 <- renderText(product_info_initial$name2[3])
    output$p1_hosp2_4 <- renderText(product_info_initial$name2[4])
    
    output$p1_hosp3_1 <- renderText(product_info_initial$name2[1])
    output$p1_hosp3_2 <- renderText(product_info_initial$name2[2])
    output$p1_hosp3_3 <- renderText(product_info_initial$name2[3])
    output$p1_hosp3_4 <- renderText(product_info_initial$name2[4])
    
    output$p1_hosp4_1 <- renderText(product_info_initial$name2[1])
    output$p1_hosp4_2 <- renderText(product_info_initial$name2[2])
    output$p1_hosp4_3 <- renderText(product_info_initial$name2[3])
    output$p1_hosp4_4 <- renderText(product_info_initial$name2[4])
    
    output$p1_hosp5_1 <- renderText(product_info_initial$name2[1])
    output$p1_hosp5_2 <- renderText(product_info_initial$name2[2])
    output$p1_hosp5_3 <- renderText(product_info_initial$name2[3])
    output$p1_hosp5_4 <- renderText(product_info_initial$name2[4])
    
    output$p1_hosp6_1 <- renderText(product_info_initial$name2[1])
    output$p1_hosp6_2 <- renderText(product_info_initial$name2[2])
    output$p1_hosp6_3 <- renderText(product_info_initial$name2[3])
    output$p1_hosp6_4 <- renderText(product_info_initial$name2[4])
    
    output$p1_hosp7_1 <- renderText(product_info_initial$name2[1])
    output$p1_hosp7_2 <- renderText(product_info_initial$name2[2])
    output$p1_hosp7_3 <- renderText(product_info_initial$name2[3])
    output$p1_hosp7_4 <- renderText(product_info_initial$name2[4])
    
    output$p1_hosp8_1 <- renderText(product_info_initial$name2[1])
    output$p1_hosp8_2 <- renderText(product_info_initial$name2[2])
    output$p1_hosp8_3 <- renderText(product_info_initial$name2[3])
    output$p1_hosp8_4 <- renderText(product_info_initial$name2[4])
    
    output$p1_hosp9_1 <- renderText(product_info_initial$name2[1])
    output$p1_hosp9_2 <- renderText(product_info_initial$name2[2])
    output$p1_hosp9_3 <- renderText(product_info_initial$name2[3])
    output$p1_hosp9_4 <- renderText(product_info_initial$name2[4])
    
    output$p1_hosp10_1 <- renderText(product_info_initial$name2[1])
    output$p1_hosp10_2 <- renderText(product_info_initial$name2[2])
    output$p1_hosp10_3 <- renderText(product_info_initial$name2[3])
    output$p1_hosp10_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp1_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp1_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp1_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp1_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp2_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp2_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp2_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp2_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp3_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp3_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp3_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp3_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp4_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp4_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp4_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp4_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp5_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp5_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp5_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp5_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp6_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp6_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp6_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp6_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp7_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp7_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp7_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp7_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp8_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp8_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp8_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp8_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp9_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp9_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp9_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp9_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp10_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp10_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp10_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp10_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp1_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp1_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp1_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp1_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp2_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp2_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp2_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp2_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp3_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp3_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp3_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp3_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp4_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp4_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp4_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp4_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp5_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp5_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp5_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp5_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp6_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp6_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp6_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp6_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp7_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp7_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp7_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp7_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp8_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp8_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp8_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp8_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp9_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp9_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp9_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp9_4 <- renderText(product_info_initial$name2[4])
    
    output$p2_hosp10_1 <- renderText(product_info_initial$name2[1])
    output$p2_hosp10_2 <- renderText(product_info_initial$name2[2])
    output$p2_hosp10_3 <- renderText(product_info_initial$name2[3])
    output$p2_hosp10_4 <- renderText(product_info_initial$name2[4])
    
    output$p3_hosp1_1 <- renderText(product_info_initial$name2[1])
    output$p3_hosp1_2 <- renderText(product_info_initial$name2[2])
    output$p3_hosp1_3 <- renderText(product_info_initial$name2[3])
    output$p3_hosp1_4 <- renderText(product_info_initial$name2[4])
    
    output$p3_hosp2_1 <- renderText(product_info_initial$name2[1])
    output$p3_hosp2_2 <- renderText(product_info_initial$name2[2])
    output$p3_hosp2_3 <- renderText(product_info_initial$name2[3])
    output$p3_hosp2_4 <- renderText(product_info_initial$name2[4])
    
    output$p3_hosp3_1 <- renderText(product_info_initial$name2[1])
    output$p3_hosp3_2 <- renderText(product_info_initial$name2[2])
    output$p3_hosp3_3 <- renderText(product_info_initial$name2[3])
    output$p3_hosp3_4 <- renderText(product_info_initial$name2[4])
    
    output$p3_hosp4_1 <- renderText(product_info_initial$name2[1])
    output$p3_hosp4_2 <- renderText(product_info_initial$name2[2])
    output$p3_hosp4_3 <- renderText(product_info_initial$name2[3])
    output$p3_hosp4_4 <- renderText(product_info_initial$name2[4])
    
    output$p3_hosp5_1 <- renderText(product_info_initial$name2[1])
    output$p3_hosp5_2 <- renderText(product_info_initial$name2[2])
    output$p3_hosp5_3 <- renderText(product_info_initial$name2[3])
    output$p3_hosp5_4 <- renderText(product_info_initial$name2[4])
    
    output$p3_hosp6_1 <- renderText(product_info_initial$name2[1])
    output$p3_hosp6_2 <- renderText(product_info_initial$name2[2])
    output$p3_hosp6_3 <- renderText(product_info_initial$name2[3])
    output$p3_hosp6_4 <- renderText(product_info_initial$name2[4])
    
    output$p3_hosp7_1 <- renderText(product_info_initial$name2[1])
    output$p3_hosp7_2 <- renderText(product_info_initial$name2[2])
    output$p3_hosp7_3 <- renderText(product_info_initial$name2[3])
    output$p3_hosp7_4 <- renderText(product_info_initial$name2[4])
    
    output$p3_hosp8_1 <- renderText(product_info_initial$name2[1])
    output$p3_hosp8_2 <- renderText(product_info_initial$name2[2])
    output$p3_hosp8_3 <- renderText(product_info_initial$name2[3])
    output$p3_hosp8_4 <- renderText(product_info_initial$name2[4])
    
    output$p3_hosp9_1 <- renderText(product_info_initial$name2[1])
    output$p3_hosp9_2 <- renderText(product_info_initial$name2[2])
    output$p3_hosp9_3 <- renderText(product_info_initial$name2[3])
    output$p3_hosp9_4 <- renderText(product_info_initial$name2[4])
    
    output$p3_hosp10_1 <- renderText(product_info_initial$name2[1])
    output$p3_hosp10_2 <- renderText(product_info_initial$name2[2])
    output$p3_hosp10_3 <- renderText(product_info_initial$name2[3])
    output$p3_hosp10_4 <- renderText(product_info_initial$name2[4])
    
    output$p4_hosp1_1 <- renderText(product_info_initial$name2[1])
    output$p4_hosp1_2 <- renderText(product_info_initial$name2[2])
    output$p4_hosp1_3 <- renderText(product_info_initial$name2[3])
    output$p4_hosp1_4 <- renderText(product_info_initial$name2[4])
    
    output$p4_hosp2_1 <- renderText(product_info_initial$name2[1])
    output$p4_hosp2_2 <- renderText(product_info_initial$name2[2])
    output$p4_hosp2_3 <- renderText(product_info_initial$name2[3])
    output$p4_hosp2_4 <- renderText(product_info_initial$name2[4])
    
    output$p4_hosp3_1 <- renderText(product_info_initial$name2[1])
    output$p4_hosp3_2 <- renderText(product_info_initial$name2[2])
    output$p4_hosp3_3 <- renderText(product_info_initial$name2[3])
    output$p4_hosp3_4 <- renderText(product_info_initial$name2[4])
    
    output$p4_hosp4_1 <- renderText(product_info_initial$name2[1])
    output$p4_hosp4_2 <- renderText(product_info_initial$name2[2])
    output$p4_hosp4_3 <- renderText(product_info_initial$name2[3])
    output$p4_hosp4_4 <- renderText(product_info_initial$name2[4])
    
    output$p4_hosp5_1 <- renderText(product_info_initial$name2[1])
    output$p4_hosp5_2 <- renderText(product_info_initial$name2[2])
    output$p4_hosp5_3 <- renderText(product_info_initial$name2[3])
    output$p4_hosp5_4 <- renderText(product_info_initial$name2[4])
    
    output$p4_hosp6_1 <- renderText(product_info_initial$name2[1])
    output$p4_hosp6_2 <- renderText(product_info_initial$name2[2])
    output$p4_hosp6_3 <- renderText(product_info_initial$name2[3])
    output$p4_hosp6_4 <- renderText(product_info_initial$name2[4])
    
    output$p4_hosp7_1 <- renderText(product_info_initial$name2[1])
    output$p4_hosp7_2 <- renderText(product_info_initial$name2[2])
    output$p4_hosp7_3 <- renderText(product_info_initial$name2[3])
    output$p4_hosp7_4 <- renderText(product_info_initial$name2[4])
    
    output$p4_hosp8_1 <- renderText(product_info_initial$name2[1])
    output$p4_hosp8_2 <- renderText(product_info_initial$name2[2])
    output$p4_hosp8_3 <- renderText(product_info_initial$name2[3])
    output$p4_hosp8_4 <- renderText(product_info_initial$name2[4])
    
    output$p4_hosp9_1 <- renderText(product_info_initial$name2[1])
    output$p4_hosp9_2 <- renderText(product_info_initial$name2[2])
    output$p4_hosp9_3 <- renderText(product_info_initial$name2[3])
    output$p4_hosp9_4 <- renderText(product_info_initial$name2[4])
    
    output$p4_hosp10_1 <- renderText(product_info_initial$name2[1])
    output$p4_hosp10_2 <- renderText(product_info_initial$name2[2])
    output$p4_hosp10_3 <- renderText(product_info_initial$name2[3])
    output$p4_hosp10_4 <- renderText(product_info_initial$name2[4])
    
    
    output$sales_rep_info <- renderDataTable(sr_info_initial)
    output$products_info <- renderDataTable(product_info_initial)
    output$hospital_info <- renderDataTable(hospital_info_initial)
    
    output$p1_worktime <- renderText(worktime)
    output$p2_worktime <- renderText(worktime)
    output$p3_worktime <- renderText(worktime)
    output$p4_worktime <- renderText(worktime)
    
    ##phase1
    
    output$p1_total_promotional_budget <- renderText(total_promotional_budget$phase1)
    
    
    p1_calculator_result <- eventReactive(input$decision1_phase1_calculator,{
      calculator(input,1)
    })
    
    output$p1_arranged_promotional_budget <- renderText(
      ifelse(input$decision1_phase1_calculator==0,0,p1_calculator_result()[1])) 
    output$p1_arranged_time_of_sr1 <- renderText(
      ifelse(input$decision1_phase1_calculator==0,0,p1_calculator_result()[2]))
    output$p1_arranged_time_of_sr2 <- renderText(
      ifelse(input$decision1_phase1_calculator==0,0,p1_calculator_result()[3]))
    output$p1_arranged_time_of_sr3 <- renderText(
      ifelse(input$decision1_phase1_calculator==0,0,p1_calculator_result()[4]))
    output$p1_arranged_time_of_sr4 <- renderText(
      ifelse(input$decision1_phase1_calculator==0,0,p1_calculator_result()[5]))
    output$p1_arranged_time_of_sr5 <- renderText(
      ifelse(input$decision1_phase1_calculator==0,0,p1_calculator_result()[6]))
    
    output$p1_potential_sales_hosp1_1 <- renderText((potential_sales_product1$hospital1)$phase1)
    output$p1_potential_sales_hosp1_2 <- renderText((potential_sales_product2$hospital1)$phase1)
    output$p1_potential_sales_hosp1_3 <- renderText((potential_sales_product3$hospital1)$phase1)
    output$p1_potential_sales_hosp1_4 <- renderText((potential_sales_product4$hospital1)$phase1)
    output$p1_current_sales_hosp1_1 <- renderText((current_sales_product1$hospital1)$phase1)
    output$p1_current_sales_hosp1_2 <- renderText((current_sales_product2$hospital1)$phase1)
    output$p1_current_sales_hosp1_3 <- renderText((current_sales_product3$hospital1)$phase1)
    output$p1_current_sales_hosp1_4 <- renderText((current_sales_product4$hospital1)$phase1)
    
    output$p1_potential_sales_hosp2_1 <- renderText((potential_sales_product1$hospital2)$phase1)
    output$p1_potential_sales_hosp2_2 <- renderText((potential_sales_product2$hospital2)$phase1)
    output$p1_potential_sales_hosp2_3 <- renderText((potential_sales_product3$hospital2)$phase1)
    output$p1_potential_sales_hosp2_4 <- renderText((potential_sales_product4$hospital2)$phase1)
    output$p1_current_sales_hosp2_1 <- renderText((current_sales_product1$hospital2)$phase1)
    output$p1_current_sales_hosp2_2 <- renderText((current_sales_product2$hospital2)$phase1)
    output$p1_current_sales_hosp2_3 <- renderText((current_sales_product3$hospital2)$phase1)
    output$p1_current_sales_hosp2_4 <- renderText((current_sales_product4$hospital2)$phase1)
    
    output$p1_potential_sales_hosp3_1 <- renderText((potential_sales_product1$hospital3)$phase1)
    output$p1_potential_sales_hosp3_2 <- renderText((potential_sales_product2$hospital3)$phase1)
    output$p1_potential_sales_hosp3_3 <- renderText((potential_sales_product3$hospital3)$phase1)
    output$p1_potential_sales_hosp3_4 <- renderText((potential_sales_product4$hospital3)$phase1)
    output$p1_current_sales_hosp3_1 <- renderText((current_sales_product1$hospital3)$phase1)
    output$p1_current_sales_hosp3_2 <- renderText((current_sales_product2$hospital3)$phase1)
    output$p1_current_sales_hosp3_3 <- renderText((current_sales_product3$hospital3)$phase1)
    output$p1_current_sales_hosp3_4 <- renderText((current_sales_product4$hospital3)$phase1)
    
    output$p1_potential_sales_hosp4_1 <- renderText((potential_sales_product1$hospital4)$phase1)
    output$p1_potential_sales_hosp4_2 <- renderText((potential_sales_product2$hospital4)$phase1)
    output$p1_potential_sales_hosp4_3 <- renderText((potential_sales_product3$hospital4)$phase1)
    output$p1_potential_sales_hosp4_4 <- renderText((potential_sales_product4$hospital4)$phase1)
    output$p1_current_sales_hosp4_1 <- renderText((current_sales_product1$hospital4)$phase1)
    output$p1_current_sales_hosp4_2 <- renderText((current_sales_product2$hospital4)$phase1)
    output$p1_current_sales_hosp4_3 <- renderText((current_sales_product3$hospital4)$phase1)
    output$p1_current_sales_hosp4_4 <- renderText((current_sales_product4$hospital4)$phase1)
    
    output$p1_potential_sales_hosp5_1 <- renderText((potential_sales_product1$hospital5)$phase1)
    output$p1_potential_sales_hosp5_2 <- renderText((potential_sales_product2$hospital5)$phase1)
    output$p1_potential_sales_hosp5_3 <- renderText((potential_sales_product3$hospital5)$phase1)
    output$p1_potential_sales_hosp5_4 <- renderText((potential_sales_product4$hospital5)$phase1)
    output$p1_current_sales_hosp5_1 <- renderText((current_sales_product1$hospital5)$phase1)
    output$p1_current_sales_hosp5_2 <- renderText((current_sales_product2$hospital5)$phase1)
    output$p1_current_sales_hosp5_3 <- renderText((current_sales_product3$hospital5)$phase1)
    output$p1_current_sales_hosp5_4 <- renderText((current_sales_product4$hospital5)$phase1)
    
    output$p1_potential_sales_hosp6_1 <- renderText((potential_sales_product1$hospital6)$phase1)
    output$p1_potential_sales_hosp6_2 <- renderText((potential_sales_product2$hospital6)$phase1)
    output$p1_potential_sales_hosp6_3 <- renderText((potential_sales_product3$hospital6)$phase1)
    output$p1_potential_sales_hosp6_4 <- renderText((potential_sales_product4$hospital6)$phase1)
    output$p1_current_sales_hosp6_1 <- renderText((current_sales_product1$hospital6)$phase1)
    output$p1_current_sales_hosp6_2 <- renderText((current_sales_product2$hospital6)$phase1)
    output$p1_current_sales_hosp6_3 <- renderText((current_sales_product3$hospital6)$phase1)
    output$p1_current_sales_hosp6_4 <- renderText((current_sales_product4$hospital6)$phase1)
    
    output$p1_potential_sales_hosp7_1 <- renderText((potential_sales_product1$hospital7)$phase1)
    output$p1_potential_sales_hosp7_2 <- renderText((potential_sales_product2$hospital7)$phase1)
    output$p1_potential_sales_hosp7_3 <- renderText((potential_sales_product3$hospital7)$phase1)
    output$p1_potential_sales_hosp7_4 <- renderText((potential_sales_product4$hospital7)$phase1)
    output$p1_current_sales_hosp7_1 <- renderText((current_sales_product1$hospital7)$phase1)
    output$p1_current_sales_hosp7_2 <- renderText((current_sales_product2$hospital7)$phase1)
    output$p1_current_sales_hosp7_3 <- renderText((current_sales_product3$hospital7)$phase1)
    output$p1_current_sales_hosp7_4 <- renderText((current_sales_product4$hospital7)$phase1)
    
    output$p1_potential_sales_hosp8_1 <- renderText((potential_sales_product1$hospital8)$phase1)
    output$p1_potential_sales_hosp8_2 <- renderText((potential_sales_product2$hospital8)$phase1)
    output$p1_potential_sales_hosp8_3 <- renderText((potential_sales_product3$hospital8)$phase1)
    output$p1_potential_sales_hosp8_4 <- renderText((potential_sales_product4$hospital8)$phase1)
    output$p1_current_sales_hosp8_1 <- renderText((current_sales_product1$hospital8)$phase1)
    output$p1_current_sales_hosp8_2 <- renderText((current_sales_product2$hospital8)$phase1)
    output$p1_current_sales_hosp8_3 <- renderText((current_sales_product3$hospital8)$phase1)
    output$p1_current_sales_hosp8_4 <- renderText((current_sales_product4$hospital8)$phase1)
    
    output$p1_potential_sales_hosp9_1 <- renderText((potential_sales_product1$hospital9)$phase1)
    output$p1_potential_sales_hosp9_2 <- renderText((potential_sales_product2$hospital9)$phase1)
    output$p1_potential_sales_hosp9_3 <- renderText((potential_sales_product3$hospital9)$phase1)
    output$p1_potential_sales_hosp9_4 <- renderText((potential_sales_product4$hospital9)$phase1)
    output$p1_current_sales_hosp9_1 <- renderText((current_sales_product1$hospital9)$phase1)
    output$p1_current_sales_hosp9_2 <- renderText((current_sales_product2$hospital9)$phase1)
    output$p1_current_sales_hosp9_3 <- renderText((current_sales_product3$hospital9)$phase1)
    output$p1_current_sales_hosp9_4 <- renderText((current_sales_product4$hospital9)$phase1)
    
    output$p1_potential_sales_hosp10_1 <- renderText((potential_sales_product1$hospital10)$phase1)
    output$p1_potential_sales_hosp10_2 <- renderText((potential_sales_product2$hospital10)$phase1)
    output$p1_potential_sales_hosp10_3 <- renderText((potential_sales_product3$hospital10)$phase1)
    output$p1_potential_sales_hosp10_4 <- renderText((potential_sales_product4$hospital10)$phase1)
    output$p1_current_sales_hosp10_1 <- renderText((current_sales_product1$hospital10)$phase1)
    output$p1_current_sales_hosp10_2 <- renderText((current_sales_product2$hospital10)$phase1)
    output$p1_current_sales_hosp10_3 <- renderText((current_sales_product3$hospital10)$phase1)
    output$p1_current_sales_hosp10_4 <- renderText((current_sales_product4$hospital10)$phase1)
    
    
    output$p1_decison1_summary_hosp1 <- renderText(decision1_summary(input,1,1))
    output$p1_decison1_summary_hosp2 <- renderText(decision1_summary(input,1,2))
    output$p1_decison1_summary_hosp3 <- renderText(decision1_summary(input,1,3))
    output$p1_decison1_summary_hosp4 <- renderText(decision1_summary(input,1,4))
    output$p1_decison1_summary_hosp5 <- renderText(decision1_summary(input,1,5))
    output$p1_decison1_summary_hosp6 <- renderText(decision1_summary(input,1,6))
    output$p1_decison1_summary_hosp7 <- renderText(decision1_summary(input,1,7))
    output$p1_decison1_summary_hosp8 <- renderText(decision1_summary(input,1,8))
    output$p1_decison1_summary_hosp9 <- renderText(decision1_summary(input,1,9))
    output$p1_decison1_summary_hosp10 <- renderText(decision1_summary(input,1,10))
    
    
    
    observeEvent(input$decision1_phase1_submit, {
      #hosp1
      disable("p1_discount_hosp1_1")
      disable("p1_discount_hosp1_2")
      disable("p1_discount_hosp1_3")
      disable("p1_discount_hosp1_4")
      disable("p1_promotional_budget_hosp1")
      disable("p1_hosp1_sales_target_1")
      disable("p1_hosp1_sales_target_2")
      disable("p1_hosp1_sales_target_3")
      disable("p1_hosp1_sales_target_4")
      disable("p1_sr_hosp1")
      disable("p1_hosp1_worktime_1")
      disable("p1_hosp1_worktime_2")
      disable("p1_hosp1_worktime_3")
      disable("p1_hosp1_worktime_4")
      disable("p1_hosp1_worktime_doc")
      disable("p1_hosp1_worktime_diet")
      disable("p1_hosp1_worktime_admin")
      disable("p1_hosp1_worktime_nurs")
      ##hosp2
      disable("p1_discount_hosp2_1")
      disable("p1_discount_hosp2_2")
      disable("p1_discount_hosp2_3")
      disable("p1_discount_hosp2_4")
      disable("p1_promotional_budget_hosp2")
      disable("p1_hosp2_sales_target_1")
      disable("p1_hosp2_sales_target_2")
      disable("p1_hosp2_sales_target_3")
      disable("p1_hosp2_sales_target_4")
      disable("p1_sr_hosp2")
      disable("p1_hosp2_worktime_1")
      disable("p1_hosp2_worktime_2")
      disable("p1_hosp2_worktime_3")
      disable("p1_hosp2_worktime_4")
      disable("p1_hosp2_worktime_doc")
      disable("p1_hosp2_worktime_diet")
      disable("p1_hosp2_worktime_admin")
      disable("p1_hosp2_worktime_nurs")
      ##hosp3
      disable("p1_discount_hosp3_1")
      disable("p1_discount_hosp3_2")
      disable("p1_discount_hosp3_3")
      disable("p1_discount_hosp3_4")
      disable("p1_promotional_budget_hosp3")
      disable("p1_hosp3_sales_target_1")
      disable("p1_hosp3_sales_target_2")
      disable("p1_hosp3_sales_target_3")
      disable("p1_hosp3_sales_target_4")
      disable("p1_sr_hosp3")
      disable("p1_hosp3_worktime_1")
      disable("p1_hosp3_worktime_2")
      disable("p1_hosp3_worktime_3")
      disable("p1_hosp3_worktime_4")
      disable("p1_hosp3_worktime_doc")
      disable("p1_hosp3_worktime_diet")
      disable("p1_hosp3_worktime_admin")
      disable("p1_hosp3_worktime_nurs")
      ##hosp4
      disable("p1_discount_hosp4_1")
      disable("p1_discount_hosp4_2")
      disable("p1_discount_hosp4_3")
      disable("p1_discount_hosp4_4")
      disable("p1_promotional_budget_hosp4")
      disable("p1_hosp4_sales_target_1")
      disable("p1_hosp4_sales_target_2")
      disable("p1_hosp4_sales_target_3")
      disable("p1_hosp4_sales_target_4")
      disable("p1_sr_hosp4")
      disable("p1_hosp4_worktime_1")
      disable("p1_hosp4_worktime_2")
      disable("p1_hosp4_worktime_3")
      disable("p1_hosp4_worktime_4")
      disable("p1_hosp4_worktime_doc")
      disable("p1_hosp4_worktime_diet")
      disable("p1_hosp4_worktime_admin")
      disable("p1_hosp4_worktime_nurs")
      ##hosp5
      disable("p1_discount_hosp5_1")
      disable("p1_discount_hosp5_2")
      disable("p1_discount_hosp5_3")
      disable("p1_discount_hosp5_4")
      disable("p1_promotional_budget_hosp5")
      disable("p1_hosp5_sales_target_1")
      disable("p1_hosp5_sales_target_2")
      disable("p1_hosp5_sales_target_3")
      disable("p1_hosp5_sales_target_4")
      disable("p1_sr_hosp5")
      disable("p1_hosp5_worktime_1")
      disable("p1_hosp5_worktime_2")
      disable("p1_hosp5_worktime_3")
      disable("p1_hosp5_worktime_4")
      disable("p1_hosp5_worktime_doc")
      disable("p1_hosp5_worktime_diet")
      disable("p1_hosp5_worktime_admin")
      disable("p1_hosp5_worktime_nurs")
      ##hosp6
      disable("p1_discount_hosp6_1")
      disable("p1_discount_hosp6_2")
      disable("p1_discount_hosp6_3")
      disable("p1_discount_hosp6_4")
      disable("p1_promotional_budget_hosp6")
      disable("p1_hosp6_sales_target_1")
      disable("p1_hosp6_sales_target_2")
      disable("p1_hosp6_sales_target_3")
      disable("p1_hosp6_sales_target_4")
      disable("p1_sr_hosp6")
      disable("p1_hosp6_worktime_1")
      disable("p1_hosp6_worktime_2")
      disable("p1_hosp6_worktime_3")
      disable("p1_hosp6_worktime_4")
      disable("p1_hosp6_worktime_doc")
      disable("p1_hosp6_worktime_diet")
      disable("p1_hosp6_worktime_admin")
      disable("p1_hosp6_worktime_nurs")
      ##hosp7
      disable("p1_discount_hosp7_1")
      disable("p1_discount_hosp7_2")
      disable("p1_discount_hosp7_3")
      disable("p1_discount_hosp7_4")
      disable("p1_promotional_budget_hosp7")
      disable("p1_hosp7_sales_target_1")
      disable("p1_hosp7_sales_target_2")
      disable("p1_hosp7_sales_target_3")
      disable("p1_hosp7_sales_target_4")
      disable("p1_sr_hosp7")
      disable("p1_hosp7_worktime_1")
      disable("p1_hosp7_worktime_2")
      disable("p1_hosp7_worktime_3")
      disable("p1_hosp7_worktime_4")
      disable("p1_hosp7_worktime_doc")
      disable("p1_hosp7_worktime_diet")
      disable("p1_hosp7_worktime_admin")
      disable("p1_hosp7_worktime_nurs")
      ##hosp8
      disable("p1_discount_hosp8_1")
      disable("p1_discount_hosp8_2")
      disable("p1_discount_hosp8_3")
      disable("p1_discount_hosp8_4")
      disable("p1_promotional_budget_hosp8")
      disable("p1_hosp8_sales_target_1")
      disable("p1_hosp8_sales_target_2")
      disable("p1_hosp8_sales_target_3")
      disable("p1_hosp8_sales_target_4")
      disable("p1_sr_hosp8")
      disable("p1_hosp8_worktime_1")
      disable("p1_hosp8_worktime_2")
      disable("p1_hosp8_worktime_3")
      disable("p1_hosp8_worktime_4")
      disable("p1_hosp8_worktime_doc")
      disable("p1_hosp8_worktime_diet")
      disable("p1_hosp8_worktime_admin")
      disable("p1_hosp8_worktime_nurs")
      ##hosp9
      disable("p1_discount_hosp9_1")
      disable("p1_discount_hosp9_2")
      disable("p1_discount_hosp9_3")
      disable("p1_discount_hosp9_4")
      disable("p1_promotional_budget_hosp9")
      disable("p1_hosp9_sales_target_1")
      disable("p1_hosp9_sales_target_2")
      disable("p1_hosp9_sales_target_3")
      disable("p1_hosp9_sales_target_4")
      disable("p1_sr_hosp9")
      disable("p1_hosp9_worktime_1")
      disable("p1_hosp9_worktime_2")
      disable("p1_hosp9_worktime_3")
      disable("p1_hosp9_worktime_4")
      disable("p1_hosp9_worktime_doc")
      disable("p1_hosp9_worktime_diet")
      disable("p1_hosp9_worktime_admin")
      disable("p1_hosp9_worktime_nurs")
      ##hosp10
      disable("p1_discount_hosp10_1")
      disable("p1_discount_hosp10_2")
      disable("p1_discount_hosp10_3")
      disable("p1_discount_hosp10_4")
      disable("p1_promotional_budget_hosp10")
      disable("p1_hosp10_sales_target_1")
      disable("p1_hosp10_sales_target_2")
      disable("p1_hosp10_sales_target_3")
      disable("p1_hosp10_sales_target_4")
      disable("p1_sr_hosp10")
      disable("p1_hosp10_worktime_1")
      disable("p1_hosp10_worktime_2")
      disable("p1_hosp10_worktime_3")
      disable("p1_hosp10_worktime_4")
      disable("p1_hosp10_worktime_doc")
      disable("p1_hosp10_worktime_diet")
      disable("p1_hosp10_worktime_admin")
      disable("p1_hosp10_worktime_nurs")})
    
    data1_phase1 <- eventReactive(input$decision1_phase1_submit,{
      get.data1(input,1)
    })
    
    data2_phase1 <- eventReactive(input$decision2_phase1_submit,{
      get.data2(input,1)
      
    })
    observeEvent(input$decision2_phase1_submit,{
      disable("p1_sr1_sales_training")
      disable("p1_sr2_sales_training")
      disable("p1_sr3_sales_training")
      disable("p1_sr4_sales_training")
      disable("p1_sr5_sales_training")
      disable("p1_sr1_field_work")
      disable("p1_sr2_field_work")
      disable("p1_sr3_field_work")
      disable("p1_sr4_field_work")
      disable("p1_sr5_field_work")
      disable("p1_flm_team_meeting")
      disable("p1_flm_kpi_analysis")
      disable("p1_flm_strategy_planning")
      disable("p1_flm_admin_work")
      disable("p1_sr1_product_training")
      disable("p1_sr2_product_training")
      disable("p1_sr3_product_training")
      disable("p1_sr4_product_training")
      disable("p1_sr5_product_training")
    })
    observeEvent(input$save_inputs,{saveRDS( reactiveValuesToList(input) , file = 'inputs.RDS')})
    observeEvent(input$load_inputs,{   
      
      if(!file.exists('inputs.RDS')) {return(NULL)}
      
      savedInputs <- readRDS('inputs.RDS')
      
      inputIDs      <- names(savedInputs) 
      inputvalues   <- unlist(savedInputs) 
      for (i in 1:length(savedInputs)) { 
        session$sendInputMessage(inputIDs[i],  list(value=inputvalues[[i]]) )
      }
    })
    
    output$report1_table <- renderDataTable(data1_phase1())
    output$report2_table <- renderDataTable(data2_phase1())
    
    p1_flm_data <- reactive(get.data3(input,1))
    
    
    output$p1_total_sales_training <-renderText(round(sales_training(input,1)/worktime*100))
    output$p1_flm_sales_training <- renderText(sales_training(input,1))
    output$p1_total_field_work <-renderText(round(field_work(input,1)/worktime*100))
    output$p1_flm_field_work <- renderText(field_work(input,1))
    output$p1_total_team_meeting <- renderText(round(as.numeric(input$p1_flm_team_meeting)/worktime*100))
    output$p1_total_kpi_analysis <- renderText(round(as.numeric(input$p1_flm_kpi_analysis)/worktime*100))
    output$p1_total_strategy_planning <- renderText(round(as.numeric(input$p1_flm_strategy_planning)/worktime*100))
    output$p1_total_admin_work <- renderText(round(as.numeric(input$p1_flm_admin_work)/worktime*100))
    output$p1_total_management <- renderText(round(sum(p1_flm_data())/worktime*100))
    output$p1_flm_management <- renderText(sum(p1_flm_data()))
    
    
    
    
    
    output$report3_table <- renderDataTable({
      data1<-data1_phase1()
      data2<-data2_phase1()
      calculation(pp_info_by_hosp_product,
                  sr_info_initial_value,
                  data1,
                  data2)
      
      #left_join(data1_phase1(),pp_info_by_hosp_product_new,by=c("hospital","product"))
    })
    
    tmp <- reactive({
      pp_data1 <- pp_info_by_hosp_product
      pp_data2 <- sr_info_initial_value
      cp_data1 <- get.data1(input,1)
      cp_data2 <- get.data2(input,1)
      tmp <- calculation(pp_data1,
                         pp_data2,
                         cp_data1,
                         cp_data2)})
    
    p1_report<- reactive({
      flm_data <- get.data3(input,1)
      p1_report <- report_data(tmp(),flm_data)})
    
    
    
    output$p1_report1_1 <-
      renderDataTable(datatable(p1_report()$report1_mod1,
                                caption="职员成本",
                                options = 
                                  list(ordering = F, dom = "t",
                                       # autoWidth = TRUE,
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report1_2 <- 
      renderDataTable(datatable(p1_report()$report1_mod2,
                                caption="时间分配",
                                options = 
                                  list(ordering = F, dom = "t",
                                       # autoWidth = TRUE,
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report1_3 <- 
      renderDataTable(datatable(p1_report()$report1_mod3,
                                caption="产品知识",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report1_4 <- 
      renderDataTable(datatable(p1_report()$report1_mod4,
                                caption="经验",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    output$p1_report1_5 <- 
      renderDataTable(datatable(p1_report()$report1_mod5,
                                caption="销售技巧",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report2_1 <- 
      renderDataTable(datatable(p1_report()$report2_mod1,
                                caption="职员成本",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report2_2 <- 
      renderDataTable(datatable(p1_report()$report2_mod2,
                                caption="时间分配",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report3 <- 
      renderDataTable(datatable(p1_report()$hospital_report,
                                caption="时间分配",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report4_1 <- 
      renderDataTable(datatable(p1_report()$report4_mod1,
                                caption="总体的分配情况",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    output$p1_report4_2 <- 
      renderDataTable(datatable(p1_report()$report4_mod2,
                                caption="分级匹配度",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    output$p1_report4_3 <- 
      renderDataTable(datatable(p1_report()$report4_mod3,
                                caption="决策质量",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    output$p1_report5_1 <- 
      renderDataTable(datatable(p1_report()$report5_mod1,
                                caption="商业价值",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    output$p1_report5_2 <- 
      renderDataTable(datatable(p1_report()$report5_mod2,
                                caption="总市场概述",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                         "}"))))
    
    
    
    
    
    
    
    
    
    ##phase2
    
    output$p2_total_promotional_budget <- renderText(
      total_promotional_budget$phase2
    )
    
    
    p2_calculator_result <- eventReactive(input$decision1_phase2_calculator,{
      calculator(input,2)
    })
    
    output$p2_arranged_promotional_budget <- renderText(
      ifelse(input$decision1_phase2_calculator==0,0,p2_calculator_result()[1])) 
    output$p2_arranged_time_of_sr1 <- renderText(
      ifelse(input$decision1_phase2_calculator==0,0,p2_calculator_result()[2]))
    output$p2_arranged_time_of_sr2 <- renderText(
      ifelse(input$decision1_phase2_calculator==0,0,p2_calculator_result()[3]))
    output$p2_arranged_time_of_sr3 <- renderText(
      ifelse(input$decision1_phase2_calculator==0,0,p2_calculator_result()[4]))
    output$p2_arranged_time_of_sr4 <- renderText(
      ifelse(input$decision1_phase2_calculator==0,0,p2_calculator_result()[5]))
    output$p2_arranged_time_of_sr5 <- renderText(
      ifelse(input$decision1_phase2_calculator==0,0,p2_calculator_result()[6]))
    
    output$p2_potential_sales_hosp1_1 <- renderText((potential_sales_product1$hospital1)$phase2)
    output$p2_potential_sales_hosp1_2 <- renderText((potential_sales_product2$hospital1)$phase2)
    output$p2_potential_sales_hosp1_3 <- renderText((potential_sales_product3$hospital1)$phase2)
    output$p2_potential_sales_hosp1_4 <- renderText((potential_sales_product4$hospital1)$phase2)
    output$p2_current_sales_hosp1_1 <- renderText((current_sales_product1$hospital1)$phase2)
    output$p2_current_sales_hosp1_2 <- renderText((current_sales_product2$hospital1)$phase2)
    output$p2_current_sales_hosp1_3 <- renderText((current_sales_product3$hospital1)$phase2)
    output$p2_current_sales_hosp1_4 <- renderText((current_sales_product4$hospital1)$phase2)
    
    output$p2_potential_sales_hosp2_1 <- renderText((potential_sales_product1$hospital2)$phase2)
    output$p2_potential_sales_hosp2_2 <- renderText((potential_sales_product2$hospital2)$phase2)
    output$p2_potential_sales_hosp2_3 <- renderText((potential_sales_product3$hospital2)$phase2)
    output$p2_potential_sales_hosp2_4 <- renderText((potential_sales_product4$hospital2)$phase2)
    output$p2_current_sales_hosp2_1 <- renderText((current_sales_product1$hospital2)$phase2)
    output$p2_current_sales_hosp2_2 <- renderText((current_sales_product2$hospital2)$phase2)
    output$p2_current_sales_hosp2_3 <- renderText((current_sales_product3$hospital2)$phase2)
    output$p2_current_sales_hosp2_4 <- renderText((current_sales_product4$hospital2)$phase2)
    
    output$p2_potential_sales_hosp3_1 <- renderText((potential_sales_product1$hospital3)$phase2)
    output$p2_potential_sales_hosp3_2 <- renderText((potential_sales_product2$hospital3)$phase2)
    output$p2_potential_sales_hosp3_3 <- renderText((potential_sales_product3$hospital3)$phase2)
    output$p2_potential_sales_hosp3_4 <- renderText((potential_sales_product4$hospital3)$phase2)
    output$p2_current_sales_hosp3_1 <- renderText((current_sales_product1$hospital3)$phase2)
    output$p2_current_sales_hosp3_2 <- renderText((current_sales_product2$hospital3)$phase2)
    output$p2_current_sales_hosp3_3 <- renderText((current_sales_product3$hospital3)$phase2)
    output$p2_current_sales_hosp3_4 <- renderText((current_sales_product4$hospital3)$phase2)
    
    output$p2_potential_sales_hosp4_1 <- renderText((potential_sales_product1$hospital4)$phase2)
    output$p2_potential_sales_hosp4_2 <- renderText((potential_sales_product2$hospital4)$phase2)
    output$p2_potential_sales_hosp4_3 <- renderText((potential_sales_product3$hospital4)$phase2)
    output$p2_potential_sales_hosp4_4 <- renderText((potential_sales_product4$hospital4)$phase2)
    output$p2_current_sales_hosp4_1 <- renderText((current_sales_product1$hospital4)$phase2)
    output$p2_current_sales_hosp4_2 <- renderText((current_sales_product2$hospital4)$phase2)
    output$p2_current_sales_hosp4_3 <- renderText((current_sales_product3$hospital4)$phase2)
    output$p2_current_sales_hosp4_4 <- renderText((current_sales_product4$hospital4)$phase2)
    
    output$p2_potential_sales_hosp5_1 <- renderText((potential_sales_product1$hospital5)$phase2)
    output$p2_potential_sales_hosp5_2 <- renderText((potential_sales_product2$hospital5)$phase2)
    output$p2_potential_sales_hosp5_3 <- renderText((potential_sales_product3$hospital5)$phase2)
    output$p2_potential_sales_hosp5_4 <- renderText((potential_sales_product4$hospital5)$phase2)
    output$p2_current_sales_hosp5_1 <- renderText((current_sales_product1$hospital5)$phase2)
    output$p2_current_sales_hosp5_2 <- renderText((current_sales_product2$hospital5)$phase2)
    output$p2_current_sales_hosp5_3 <- renderText((current_sales_product3$hospital5)$phase2)
    output$p2_current_sales_hosp5_4 <- renderText((current_sales_product4$hospital5)$phase2)
    
    output$p2_potential_sales_hosp6_1 <- renderText((potential_sales_product1$hospital6)$phase2)
    output$p2_potential_sales_hosp6_2 <- renderText((potential_sales_product2$hospital6)$phase2)
    output$p2_potential_sales_hosp6_3 <- renderText((potential_sales_product3$hospital6)$phase2)
    output$p2_potential_sales_hosp6_4 <- renderText((potential_sales_product4$hospital6)$phase2)
    output$p2_current_sales_hosp6_1 <- renderText((current_sales_product1$hospital6)$phase2)
    output$p2_current_sales_hosp6_2 <- renderText((current_sales_product2$hospital6)$phase2)
    output$p2_current_sales_hosp6_3 <- renderText((current_sales_product3$hospital6)$phase2)
    output$p2_current_sales_hosp6_4 <- renderText((current_sales_product4$hospital6)$phase2)
    
    output$p2_potential_sales_hosp7_1 <- renderText((potential_sales_product1$hospital7)$phase2)
    output$p2_potential_sales_hosp7_2 <- renderText((potential_sales_product2$hospital7)$phase2)
    output$p2_potential_sales_hosp7_3 <- renderText((potential_sales_product3$hospital7)$phase2)
    output$p2_potential_sales_hosp7_4 <- renderText((potential_sales_product4$hospital7)$phase2)
    output$p2_current_sales_hosp7_1 <- renderText((current_sales_product1$hospital7)$phase2)
    output$p2_current_sales_hosp7_2 <- renderText((current_sales_product2$hospital7)$phase2)
    output$p2_current_sales_hosp7_3 <- renderText((current_sales_product3$hospital7)$phase2)
    output$p2_current_sales_hosp7_4 <- renderText((current_sales_product4$hospital7)$phase2)
    
    output$p2_potential_sales_hosp8_1 <- renderText((potential_sales_product1$hospital8)$phase2)
    output$p2_potential_sales_hosp8_2 <- renderText((potential_sales_product2$hospital8)$phase2)
    output$p2_potential_sales_hosp8_3 <- renderText((potential_sales_product3$hospital8)$phase2)
    output$p2_potential_sales_hosp8_4 <- renderText((potential_sales_product4$hospital8)$phase2)
    output$p2_current_sales_hosp8_1 <- renderText((current_sales_product1$hospital8)$phase2)
    output$p2_current_sales_hosp8_2 <- renderText((current_sales_product2$hospital8)$phase2)
    output$p2_current_sales_hosp8_3 <- renderText((current_sales_product3$hospital8)$phase2)
    output$p2_current_sales_hosp8_4 <- renderText((current_sales_product4$hospital8)$phase2)
    
    output$p2_potential_sales_hosp9_1 <- renderText((potential_sales_product1$hospital9)$phase2)
    output$p2_potential_sales_hosp9_2 <- renderText((potential_sales_product2$hospital9)$phase2)
    output$p2_potential_sales_hosp9_3 <- renderText((potential_sales_product3$hospital9)$phase2)
    output$p2_potential_sales_hosp9_4 <- renderText((potential_sales_product4$hospital9)$phase2)
    output$p2_current_sales_hosp9_1 <- renderText((current_sales_product1$hospital9)$phase2)
    output$p2_current_sales_hosp9_2 <- renderText((current_sales_product2$hospital9)$phase2)
    output$p2_current_sales_hosp9_3 <- renderText((current_sales_product3$hospital9)$phase2)
    output$p2_current_sales_hosp9_4 <- renderText((current_sales_product4$hospital9)$phase2)
    
    output$p2_potential_sales_hosp10_1 <- renderText((potential_sales_product1$hospital10)$phase2)
    output$p2_potential_sales_hosp10_2 <- renderText((potential_sales_product2$hospital10)$phase2)
    output$p2_potential_sales_hosp10_3 <- renderText((potential_sales_product3$hospital10)$phase2)
    output$p2_potential_sales_hosp10_4 <- renderText((potential_sales_product4$hospital10)$phase2)
    output$p2_current_sales_hosp10_1 <- renderText((current_sales_product1$hospital10)$phase2)
    output$p2_current_sales_hosp10_2 <- renderText((current_sales_product2$hospital10)$phase2)
    output$p2_current_sales_hosp10_3 <- renderText((current_sales_product3$hospital10)$phase2)
    output$p2_current_sales_hosp10_4 <- renderText((current_sales_product4$hospital10)$phase2)
    
    
    output$p2_decison1_summary_hosp1 <- renderText(decision1_summary(input,2,1))
    output$p2_decison1_summary_hosp2 <- renderText(decision1_summary(input,2,2))
    output$p2_decison1_summary_hosp3 <- renderText(decision1_summary(input,2,3))
    output$p2_decison1_summary_hosp4 <- renderText(decision1_summary(input,2,4))
    output$p2_decison1_summary_hosp5 <- renderText(decision1_summary(input,2,5))
    output$p2_decison1_summary_hosp6 <- renderText(decision1_summary(input,2,6))
    output$p2_decison1_summary_hosp7 <- renderText(decision1_summary(input,2,7))
    output$p2_decison1_summary_hosp8 <- renderText(decision1_summary(input,2,8))
    output$p2_decison1_summary_hosp9 <- renderText(decision1_summary(input,2,9))
    output$p2_decison1_summary_hosp10 <- renderText(decision1_summary(input,2,10))
    
    
    observeEvent(input$decision1_phase2_submit, {
      #hosp1
      disable("p2_discount_hosp1_1")
      disable("p2_discount_hosp1_2")
      disable("p2_discount_hosp1_3")
      disable("p2_discount_hosp1_4")
      disable("p2_promotional_budget_hosp1")
      disable("p2_hosp1_sales_target_1")
      disable("p2_hosp1_sales_target_2")
      disable("p2_hosp1_sales_target_3")
      disable("p2_hosp1_sales_target_4")
      disable("p2_sr_hosp1")
      disable("p2_hosp1_worktime_1")
      disable("p2_hosp1_worktime_2")
      disable("p2_hosp1_worktime_3")
      disable("p2_hosp1_worktime_4")
      disable("p2_hosp1_worktime_doc")
      disable("p2_hosp1_worktime_diet")
      disable("p2_hosp1_worktime_admin")
      disable("p2_hosp1_worktime_nurs")
      ##hosp2
      disable("p2_discount_hosp2_1")
      disable("p2_discount_hosp2_2")
      disable("p2_discount_hosp2_3")
      disable("p2_discount_hosp2_4")
      disable("p2_promotional_budget_hosp2")
      disable("p2_hosp2_sales_target_1")
      disable("p2_hosp2_sales_target_2")
      disable("p2_hosp2_sales_target_3")
      disable("p2_hosp2_sales_target_4")
      disable("p2_sr_hosp2")
      disable("p2_hosp2_worktime_1")
      disable("p2_hosp2_worktime_2")
      disable("p2_hosp2_worktime_3")
      disable("p2_hosp2_worktime_4")
      disable("p2_hosp2_worktime_doc")
      disable("p2_hosp2_worktime_diet")
      disable("p2_hosp2_worktime_admin")
      disable("p2_hosp2_worktime_nurs")
      ##hosp3
      disable("p2_discount_hosp3_1")
      disable("p2_discount_hosp3_2")
      disable("p2_discount_hosp3_3")
      disable("p2_discount_hosp3_4")
      disable("p2_promotional_budget_hosp3")
      disable("p2_hosp3_sales_target_1")
      disable("p2_hosp3_sales_target_2")
      disable("p2_hosp3_sales_target_3")
      disable("p2_hosp3_sales_target_4")
      disable("p2_sr_hosp3")
      disable("p2_hosp3_worktime_1")
      disable("p2_hosp3_worktime_2")
      disable("p2_hosp3_worktime_3")
      disable("p2_hosp3_worktime_4")
      disable("p2_hosp3_worktime_doc")
      disable("p2_hosp3_worktime_diet")
      disable("p2_hosp3_worktime_admin")
      disable("p2_hosp3_worktime_nurs")
      ##hosp4
      disable("p2_discount_hosp4_1")
      disable("p2_discount_hosp4_2")
      disable("p2_discount_hosp4_3")
      disable("p2_discount_hosp4_4")
      disable("p2_promotional_budget_hosp4")
      disable("p2_hosp4_sales_target_1")
      disable("p2_hosp4_sales_target_2")
      disable("p2_hosp4_sales_target_3")
      disable("p2_hosp4_sales_target_4")
      disable("p2_sr_hosp4")
      disable("p2_hosp4_worktime_1")
      disable("p2_hosp4_worktime_2")
      disable("p2_hosp4_worktime_3")
      disable("p2_hosp4_worktime_4")
      disable("p2_hosp4_worktime_doc")
      disable("p2_hosp4_worktime_diet")
      disable("p2_hosp4_worktime_admin")
      disable("p2_hosp4_worktime_nurs")
      ##hosp5
      disable("p2_discount_hosp5_1")
      disable("p2_discount_hosp5_2")
      disable("p2_discount_hosp5_3")
      disable("p2_discount_hosp5_4")
      disable("p2_promotional_budget_hosp5")
      disable("p2_hosp5_sales_target_1")
      disable("p2_hosp5_sales_target_2")
      disable("p2_hosp5_sales_target_3")
      disable("p2_hosp5_sales_target_4")
      disable("p2_sr_hosp5")
      disable("p2_hosp5_worktime_1")
      disable("p2_hosp5_worktime_2")
      disable("p2_hosp5_worktime_3")
      disable("p2_hosp5_worktime_4")
      disable("p2_hosp5_worktime_doc")
      disable("p2_hosp5_worktime_diet")
      disable("p2_hosp5_worktime_admin")
      disable("p2_hosp5_worktime_nurs")
      ##hosp6
      disable("p2_discount_hosp6_1")
      disable("p2_discount_hosp6_2")
      disable("p2_discount_hosp6_3")
      disable("p2_discount_hosp6_4")
      disable("p2_promotional_budget_hosp6")
      disable("p2_hosp6_sales_target_1")
      disable("p2_hosp6_sales_target_2")
      disable("p2_hosp6_sales_target_3")
      disable("p2_hosp6_sales_target_4")
      disable("p2_sr_hosp6")
      disable("p2_hosp6_worktime_1")
      disable("p2_hosp6_worktime_2")
      disable("p2_hosp6_worktime_3")
      disable("p2_hosp6_worktime_4")
      disable("p2_hosp6_worktime_doc")
      disable("p2_hosp6_worktime_diet")
      disable("p2_hosp6_worktime_admin")
      disable("p2_hosp6_worktime_nurs")
      ##hosp7
      disable("p2_discount_hosp7_1")
      disable("p2_discount_hosp7_2")
      disable("p2_discount_hosp7_3")
      disable("p2_discount_hosp7_4")
      disable("p2_promotional_budget_hosp7")
      disable("p2_hosp7_sales_target_1")
      disable("p2_hosp7_sales_target_2")
      disable("p2_hosp7_sales_target_3")
      disable("p2_hosp7_sales_target_4")
      disable("p2_sr_hosp7")
      disable("p2_hosp7_worktime_1")
      disable("p2_hosp7_worktime_2")
      disable("p2_hosp7_worktime_3")
      disable("p2_hosp7_worktime_4")
      disable("p2_hosp7_worktime_doc")
      disable("p2_hosp7_worktime_diet")
      disable("p2_hosp7_worktime_admin")
      disable("p2_hosp7_worktime_nurs")
      ##hosp8
      disable("p2_discount_hosp8_1")
      disable("p2_discount_hosp8_2")
      disable("p2_discount_hosp8_3")
      disable("p2_discount_hosp8_4")
      disable("p2_promotional_budget_hosp8")
      disable("p2_hosp8_sales_target_1")
      disable("p2_hosp8_sales_target_2")
      disable("p2_hosp8_sales_target_3")
      disable("p2_hosp8_sales_target_4")
      disable("p2_sr_hosp8")
      disable("p2_hosp8_worktime_1")
      disable("p2_hosp8_worktime_2")
      disable("p2_hosp8_worktime_3")
      disable("p2_hosp8_worktime_4")
      disable("p2_hosp8_worktime_doc")
      disable("p2_hosp8_worktime_diet")
      disable("p2_hosp8_worktime_admin")
      disable("p2_hosp8_worktime_nurs")
      ##hosp9
      disable("p2_discount_hosp9_1")
      disable("p2_discount_hosp9_2")
      disable("p2_discount_hosp9_3")
      disable("p2_discount_hosp9_4")
      disable("p2_promotional_budget_hosp9")
      disable("p2_hosp9_sales_target_1")
      disable("p2_hosp9_sales_target_2")
      disable("p2_hosp9_sales_target_3")
      disable("p2_hosp9_sales_target_4")
      disable("p2_sr_hosp9")
      disable("p2_hosp9_worktime_1")
      disable("p2_hosp9_worktime_2")
      disable("p2_hosp9_worktime_3")
      disable("p2_hosp9_worktime_4")
      disable("p2_hosp9_worktime_doc")
      disable("p2_hosp9_worktime_diet")
      disable("p2_hosp9_worktime_admin")
      disable("p2_hosp9_worktime_nurs")
      ##hosp10
      disable("p2_discount_hosp10_1")
      disable("p2_discount_hosp10_2")
      disable("p2_discount_hosp10_3")
      disable("p2_discount_hosp10_4")
      disable("p2_promotional_budget_hosp10")
      disable("p2_hosp10_sales_target_1")
      disable("p2_hosp10_sales_target_2")
      disable("p2_hosp10_sales_target_3")
      disable("p2_hosp10_sales_target_4")
      disable("p2_sr_hosp10")
      disable("p2_hosp10_worktime_1")
      disable("p2_hosp10_worktime_2")
      disable("p2_hosp10_worktime_3")
      disable("p2_hosp10_worktime_4")
      disable("p2_hosp10_worktime_doc")
      disable("p2_hosp10_worktime_diet")
      disable("p2_hosp10_worktime_admin")
      disable("p2_hosp10_worktime_nurs")})
    
    p2_flm_data <- reactive(get.data3(input,2))
    
    output$p2_total_sales_training <-renderText(round(sales_training(input,2)/worktime*100))
    output$p2_flm_sales_training <- renderText(sales_training(input,2))
    output$p2_total_field_work <-renderText(round(field_work(input,2)/worktime*100))
    output$p2_flm_field_work <- renderText(field_work(input,2))
    output$p2_total_team_meeting <- renderText(round(as.numeric(input$p2_flm_team_meeting)/worktime*100))
    output$p2_total_kpi_analysis <- renderText(round(as.numeric(input$p2_flm_kpi_analysis)/worktime*100))
    output$p2_total_strategy_planning <- renderText(round(as.numeric(input$p2_flm_strategy_planning)/worktime*100))
    output$p2_total_admin_work <- renderText(round(as.numeric(input$p2_flm_admin_work)/worktime*100))
    output$p2_total_management <- renderText(round(sum(p2_flm_data())/worktime*100))
    output$p2_flm_management <- renderText(sum(p2_flm_data()))
    
    
    
    tmp2 <- reactive({
      pp_data1 <- tmp() %>% select(hospital,
                                   product,
                                   real_sales,
                                   sr_sales_performance,
                                   deployment_quality_index,
                                   customer_relationship_index,
                                   promotional_support_index,
                                   sales_performance,
                                   offer_attractiveness,
                                   acc_offer_attractiveness) %>%
        distinct()
      
      colnames(pp_data1)[3:10] <- paste("pp_",colnames(pp_data1)[3:10],sep="")
      
      pp_data2 <- tmp() %>% select(sales_rep,
                                   sales_level,
                                   acc_revenue,
                                   sales_skills_index,
                                   product_knowledge_index,
                                   motivation_index,
                                   acc_field_work) %>%
        distinct()
      
      colnames(pp_data2)[3:7] <- paste("pp_",colnames(pp_data2)[3:7],sep="")
      cp_data1 <- get.data1(input,2)
      cp_data2 <- get.data2(input,2)
      tmp <- calculation(pp_data1,
                         pp_data2,
                         cp_data1,
                         cp_data2)})
    
    p2_report<- reactive({
      flm_data <- get.data3(input,2)
      p2_report <- report_data(tmp2(),flm_data)})
    
    
    
    observeEvent(input$decision2_phase2_submit, {
      
      disable("p2_sr1_sales_training")
      disable("p2_sr2_sales_training")
      disable("p2_sr3_sales_training")
      disable("p2_sr4_sales_training")
      disable("p2_sr5_sales_training")
      disable("p2_sr1_field_work")
      disable("p2_sr2_field_work")
      disable("p2_sr3_field_work")
      disable("p2_sr4_field_work")
      disable("p2_sr5_field_work")
      disable("p2_flm_team_meeting")
      disable("p2_flm_kpi_analysis")
      disable("p2_flm_strategy_planning")
      disable("p2_flm_admin_work")
      disable("p2_sr1_product_training")
      disable("p2_sr2_product_training")
      disable("p2_sr3_product_training")
      disable("p2_sr4_product_training")
      disable("p2_sr5_product_training")
      
      
      output$p2_report1_1 <-
        renderDataTable(datatable(p2_report()$report1_mod1,
                                  caption="职员成本",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         # autoWidth = TRUE,
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p2_report1_2 <- 
        renderDataTable(datatable(p2_report()$report1_mod2,
                                  caption="时间分配",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         # autoWidth = TRUE,
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p2_report1_3 <- 
        renderDataTable(datatable(p2_report()$report1_mod3,
                                  caption="产品知识",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p2_report1_4 <- 
        renderDataTable(datatable(p2_report()$report1_mod4,
                                  caption="经验",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p2_report1_5 <- 
        renderDataTable(datatable(p2_report()$report1_mod5,
                                  caption="销售技巧",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p2_report2_1 <- 
        renderDataTable(datatable(p2_report()$report2_mod1,
                                  caption="职员成本",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p2_report2_2 <- 
        renderDataTable(datatable(p2_report()$report2_mod2,
                                  caption="时间分配",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p2_report3 <- 
        renderDataTable(datatable(p2_report()$hospital_report,
                                  caption="时间分配",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p2_report4_1 <- 
        renderDataTable(datatable(p2_report()$report4_mod1,
                                  caption="总体的分配情况",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p2_report4_2 <- 
        renderDataTable(datatable(p2_report()$report4_mod2,
                                  caption="分级匹配度",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p2_report4_3 <- 
        renderDataTable(datatable(p2_report()$report4_mod3,
                                  caption="决策质量",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p2_report5_1 <- 
        renderDataTable(datatable(p2_report()$report5_mod1,
                                  caption="商业价值",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p2_report5_2 <- 
        renderDataTable(datatable(p2_report()$report5_mod2,
                                  caption="总市场概述",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      
      
      
      
    })
    
    ##phase3
    
    output$p3_total_promotional_budget <- renderText(
      total_promotional_budget$phase3
    )
    
    
    p3_calculator_result <- eventReactive(input$decision1_phase3_calculator,{
      calculator(input,3)
    })
    
    output$p3_arranged_promotional_budget <- renderText(
      ifelse(input$decision1_phase3_calculator==0,0,p3_calculator_result()[1])) 
    output$p3_arranged_time_of_sr1 <- renderText(
      ifelse(input$decision1_phase3_calculator==0,0,p3_calculator_result()[2]))
    output$p3_arranged_time_of_sr2 <- renderText(
      ifelse(input$decision1_phase3_calculator==0,0,p3_calculator_result()[3]))
    output$p3_arranged_time_of_sr3 <- renderText(
      ifelse(input$decision1_phase3_calculator==0,0,p3_calculator_result()[4]))
    output$p3_arranged_time_of_sr4 <- renderText(
      ifelse(input$decision1_phase3_calculator==0,0,p3_calculator_result()[5]))
    output$p3_arranged_time_of_sr5 <- renderText(
      ifelse(input$decision1_phase3_calculator==0,0,p3_calculator_result()[6]))
    
    output$p3_potential_sales_hosp1_1 <- renderText((potential_sales_product1$hospital1)$phase3)
    output$p3_potential_sales_hosp1_2 <- renderText((potential_sales_product2$hospital1)$phase3)
    output$p3_potential_sales_hosp1_3 <- renderText((potential_sales_product3$hospital1)$phase3)
    output$p3_potential_sales_hosp1_4 <- renderText((potential_sales_product4$hospital1)$phase3)
    output$p3_current_sales_hosp1_1 <- renderText((current_sales_product1$hospital1)$phase3)
    output$p3_current_sales_hosp1_2 <- renderText((current_sales_product2$hospital1)$phase3)
    output$p3_current_sales_hosp1_3 <- renderText((current_sales_product3$hospital1)$phase3)
    output$p3_current_sales_hosp1_4 <- renderText((current_sales_product4$hospital1)$phase3)
    
    output$p3_potential_sales_hosp2_1 <- renderText((potential_sales_product1$hospital2)$phase3)
    output$p3_potential_sales_hosp2_2 <- renderText((potential_sales_product2$hospital2)$phase3)
    output$p3_potential_sales_hosp2_3 <- renderText((potential_sales_product3$hospital2)$phase3)
    output$p3_potential_sales_hosp2_4 <- renderText((potential_sales_product4$hospital2)$phase3)
    output$p3_current_sales_hosp2_1 <- renderText((current_sales_product1$hospital2)$phase3)
    output$p3_current_sales_hosp2_2 <- renderText((current_sales_product2$hospital2)$phase3)
    output$p3_current_sales_hosp2_3 <- renderText((current_sales_product3$hospital2)$phase3)
    output$p3_current_sales_hosp2_4 <- renderText((current_sales_product4$hospital2)$phase3)
    
    output$p3_potential_sales_hosp3_1 <- renderText((potential_sales_product1$hospital3)$phase3)
    output$p3_potential_sales_hosp3_2 <- renderText((potential_sales_product2$hospital3)$phase3)
    output$p3_potential_sales_hosp3_3 <- renderText((potential_sales_product3$hospital3)$phase3)
    output$p3_potential_sales_hosp3_4 <- renderText((potential_sales_product4$hospital3)$phase3)
    output$p3_current_sales_hosp3_1 <- renderText((current_sales_product1$hospital3)$phase3)
    output$p3_current_sales_hosp3_2 <- renderText((current_sales_product2$hospital3)$phase3)
    output$p3_current_sales_hosp3_3 <- renderText((current_sales_product3$hospital3)$phase3)
    output$p3_current_sales_hosp3_4 <- renderText((current_sales_product4$hospital3)$phase3)
    
    output$p3_potential_sales_hosp4_1 <- renderText((potential_sales_product1$hospital4)$phase3)
    output$p3_potential_sales_hosp4_2 <- renderText((potential_sales_product2$hospital4)$phase3)
    output$p3_potential_sales_hosp4_3 <- renderText((potential_sales_product3$hospital4)$phase3)
    output$p3_potential_sales_hosp4_4 <- renderText((potential_sales_product4$hospital4)$phase3)
    output$p3_current_sales_hosp4_1 <- renderText((current_sales_product1$hospital4)$phase3)
    output$p3_current_sales_hosp4_2 <- renderText((current_sales_product2$hospital4)$phase3)
    output$p3_current_sales_hosp4_3 <- renderText((current_sales_product3$hospital4)$phase3)
    output$p3_current_sales_hosp4_4 <- renderText((current_sales_product4$hospital4)$phase3)
    
    output$p3_potential_sales_hosp5_1 <- renderText((potential_sales_product1$hospital5)$phase3)
    output$p3_potential_sales_hosp5_2 <- renderText((potential_sales_product2$hospital5)$phase3)
    output$p3_potential_sales_hosp5_3 <- renderText((potential_sales_product3$hospital5)$phase3)
    output$p3_potential_sales_hosp5_4 <- renderText((potential_sales_product4$hospital5)$phase3)
    output$p3_current_sales_hosp5_1 <- renderText((current_sales_product1$hospital5)$phase3)
    output$p3_current_sales_hosp5_2 <- renderText((current_sales_product2$hospital5)$phase3)
    output$p3_current_sales_hosp5_3 <- renderText((current_sales_product3$hospital5)$phase3)
    output$p3_current_sales_hosp5_4 <- renderText((current_sales_product4$hospital5)$phase3)
    
    output$p3_potential_sales_hosp6_1 <- renderText((potential_sales_product1$hospital6)$phase3)
    output$p3_potential_sales_hosp6_2 <- renderText((potential_sales_product2$hospital6)$phase3)
    output$p3_potential_sales_hosp6_3 <- renderText((potential_sales_product3$hospital6)$phase3)
    output$p3_potential_sales_hosp6_4 <- renderText((potential_sales_product4$hospital6)$phase3)
    output$p3_current_sales_hosp6_1 <- renderText((current_sales_product1$hospital6)$phase3)
    output$p3_current_sales_hosp6_2 <- renderText((current_sales_product2$hospital6)$phase3)
    output$p3_current_sales_hosp6_3 <- renderText((current_sales_product3$hospital6)$phase3)
    output$p3_current_sales_hosp6_4 <- renderText((current_sales_product4$hospital6)$phase3)
    
    output$p3_potential_sales_hosp7_1 <- renderText((potential_sales_product1$hospital7)$phase3)
    output$p3_potential_sales_hosp7_2 <- renderText((potential_sales_product2$hospital7)$phase3)
    output$p3_potential_sales_hosp7_3 <- renderText((potential_sales_product3$hospital7)$phase3)
    output$p3_potential_sales_hosp7_4 <- renderText((potential_sales_product4$hospital7)$phase3)
    output$p3_current_sales_hosp7_1 <- renderText((current_sales_product1$hospital7)$phase3)
    output$p3_current_sales_hosp7_2 <- renderText((current_sales_product2$hospital7)$phase3)
    output$p3_current_sales_hosp7_3 <- renderText((current_sales_product3$hospital7)$phase3)
    output$p3_current_sales_hosp7_4 <- renderText((current_sales_product4$hospital7)$phase3)
    
    output$p3_potential_sales_hosp8_1 <- renderText((potential_sales_product1$hospital8)$phase3)
    output$p3_potential_sales_hosp8_2 <- renderText((potential_sales_product2$hospital8)$phase3)
    output$p3_potential_sales_hosp8_3 <- renderText((potential_sales_product3$hospital8)$phase3)
    output$p3_potential_sales_hosp8_4 <- renderText((potential_sales_product4$hospital8)$phase3)
    output$p3_current_sales_hosp8_1 <- renderText((current_sales_product1$hospital8)$phase3)
    output$p3_current_sales_hosp8_2 <- renderText((current_sales_product2$hospital8)$phase3)
    output$p3_current_sales_hosp8_3 <- renderText((current_sales_product3$hospital8)$phase3)
    output$p3_current_sales_hosp8_4 <- renderText((current_sales_product4$hospital8)$phase3)
    
    output$p3_potential_sales_hosp9_1 <- renderText((potential_sales_product1$hospital9)$phase3)
    output$p3_potential_sales_hosp9_2 <- renderText((potential_sales_product2$hospital9)$phase3)
    output$p3_potential_sales_hosp9_3 <- renderText((potential_sales_product3$hospital9)$phase3)
    output$p3_potential_sales_hosp9_4 <- renderText((potential_sales_product4$hospital9)$phase3)
    output$p3_current_sales_hosp9_1 <- renderText((current_sales_product1$hospital9)$phase3)
    output$p3_current_sales_hosp9_2 <- renderText((current_sales_product2$hospital9)$phase3)
    output$p3_current_sales_hosp9_3 <- renderText((current_sales_product3$hospital9)$phase3)
    output$p3_current_sales_hosp9_4 <- renderText((current_sales_product4$hospital9)$phase3)
    
    output$p3_potential_sales_hosp10_1 <- renderText((potential_sales_product1$hospital10)$phase3)
    output$p3_potential_sales_hosp10_2 <- renderText((potential_sales_product2$hospital10)$phase3)
    output$p3_potential_sales_hosp10_3 <- renderText((potential_sales_product3$hospital10)$phase3)
    output$p3_potential_sales_hosp10_4 <- renderText((potential_sales_product4$hospital10)$phase3)
    output$p3_current_sales_hosp10_1 <- renderText((current_sales_product1$hospital10)$phase3)
    output$p3_current_sales_hosp10_2 <- renderText((current_sales_product2$hospital10)$phase3)
    output$p3_current_sales_hosp10_3 <- renderText((current_sales_product3$hospital10)$phase3)
    output$p3_current_sales_hosp10_4 <- renderText((current_sales_product4$hospital10)$phase3)
    
    
    output$p3_decison1_summary_hosp1 <- renderText(decision1_summary(input,3,1))
    output$p3_decison1_summary_hosp2 <- renderText(decision1_summary(input,3,2))
    output$p3_decison1_summary_hosp3 <- renderText(decision1_summary(input,3,3))
    output$p3_decison1_summary_hosp4 <- renderText(decision1_summary(input,3,4))
    output$p3_decison1_summary_hosp5 <- renderText(decision1_summary(input,3,5))
    output$p3_decison1_summary_hosp6 <- renderText(decision1_summary(input,3,6))
    output$p3_decison1_summary_hosp7 <- renderText(decision1_summary(input,3,7))
    output$p3_decison1_summary_hosp8 <- renderText(decision1_summary(input,3,8))
    output$p3_decison1_summary_hosp9 <- renderText(decision1_summary(input,3,9))
    output$p3_decison1_summary_hosp10 <- renderText(decision1_summary(input,3,10))
    
    
    observeEvent(input$decision1_phase3_submit, {
      #hosp1
      disable("p3_discount_hosp1_1")
      disable("p3_discount_hosp1_2")
      disable("p3_discount_hosp1_3")
      disable("p3_discount_hosp1_4")
      disable("p3_promotional_budget_hosp1")
      disable("p3_hosp1_sales_target_1")
      disable("p3_hosp1_sales_target_2")
      disable("p3_hosp1_sales_target_3")
      disable("p3_hosp1_sales_target_4")
      disable("p3_sr_hosp1")
      disable("p3_hosp1_worktime_1")
      disable("p3_hosp1_worktime_2")
      disable("p3_hosp1_worktime_3")
      disable("p3_hosp1_worktime_4")
      disable("p3_hosp1_worktime_doc")
      disable("p3_hosp1_worktime_diet")
      disable("p3_hosp1_worktime_admin")
      disable("p3_hosp1_worktime_nurs")
      ##hosp2
      disable("p3_discount_hosp2_1")
      disable("p3_discount_hosp2_2")
      disable("p3_discount_hosp2_3")
      disable("p3_discount_hosp2_4")
      disable("p3_promotional_budget_hosp2")
      disable("p3_hosp2_sales_target_1")
      disable("p3_hosp2_sales_target_2")
      disable("p3_hosp2_sales_target_3")
      disable("p3_hosp2_sales_target_4")
      disable("p3_sr_hosp2")
      disable("p3_hosp2_worktime_1")
      disable("p3_hosp2_worktime_2")
      disable("p3_hosp2_worktime_3")
      disable("p3_hosp2_worktime_4")
      disable("p3_hosp2_worktime_doc")
      disable("p3_hosp2_worktime_diet")
      disable("p3_hosp2_worktime_admin")
      disable("p3_hosp2_worktime_nurs")
      ##hosp3
      disable("p3_discount_hosp3_1")
      disable("p3_discount_hosp3_2")
      disable("p3_discount_hosp3_3")
      disable("p3_discount_hosp3_4")
      disable("p3_promotional_budget_hosp3")
      disable("p3_hosp3_sales_target_1")
      disable("p3_hosp3_sales_target_2")
      disable("p3_hosp3_sales_target_3")
      disable("p3_hosp3_sales_target_4")
      disable("p3_sr_hosp3")
      disable("p3_hosp3_worktime_1")
      disable("p3_hosp3_worktime_2")
      disable("p3_hosp3_worktime_3")
      disable("p3_hosp3_worktime_4")
      disable("p3_hosp3_worktime_doc")
      disable("p3_hosp3_worktime_diet")
      disable("p3_hosp3_worktime_admin")
      disable("p3_hosp3_worktime_nurs")
      ##hosp4
      disable("p3_discount_hosp4_1")
      disable("p3_discount_hosp4_2")
      disable("p3_discount_hosp4_3")
      disable("p3_discount_hosp4_4")
      disable("p3_promotional_budget_hosp4")
      disable("p3_hosp4_sales_target_1")
      disable("p3_hosp4_sales_target_2")
      disable("p3_hosp4_sales_target_3")
      disable("p3_hosp4_sales_target_4")
      disable("p3_sr_hosp4")
      disable("p3_hosp4_worktime_1")
      disable("p3_hosp4_worktime_2")
      disable("p3_hosp4_worktime_3")
      disable("p3_hosp4_worktime_4")
      disable("p3_hosp4_worktime_doc")
      disable("p3_hosp4_worktime_diet")
      disable("p3_hosp4_worktime_admin")
      disable("p3_hosp4_worktime_nurs")
      ##hosp5
      disable("p3_discount_hosp5_1")
      disable("p3_discount_hosp5_2")
      disable("p3_discount_hosp5_3")
      disable("p3_discount_hosp5_4")
      disable("p3_promotional_budget_hosp5")
      disable("p3_hosp5_sales_target_1")
      disable("p3_hosp5_sales_target_2")
      disable("p3_hosp5_sales_target_3")
      disable("p3_hosp5_sales_target_4")
      disable("p3_sr_hosp5")
      disable("p3_hosp5_worktime_1")
      disable("p3_hosp5_worktime_2")
      disable("p3_hosp5_worktime_3")
      disable("p3_hosp5_worktime_4")
      disable("p3_hosp5_worktime_doc")
      disable("p3_hosp5_worktime_diet")
      disable("p3_hosp5_worktime_admin")
      disable("p3_hosp5_worktime_nurs")
      ##hosp6
      disable("p3_discount_hosp6_1")
      disable("p3_discount_hosp6_2")
      disable("p3_discount_hosp6_3")
      disable("p3_discount_hosp6_4")
      disable("p3_promotional_budget_hosp6")
      disable("p3_hosp6_sales_target_1")
      disable("p3_hosp6_sales_target_2")
      disable("p3_hosp6_sales_target_3")
      disable("p3_hosp6_sales_target_4")
      disable("p3_sr_hosp6")
      disable("p3_hosp6_worktime_1")
      disable("p3_hosp6_worktime_2")
      disable("p3_hosp6_worktime_3")
      disable("p3_hosp6_worktime_4")
      disable("p3_hosp6_worktime_doc")
      disable("p3_hosp6_worktime_diet")
      disable("p3_hosp6_worktime_admin")
      disable("p3_hosp6_worktime_nurs")
      ##hosp7
      disable("p3_discount_hosp7_1")
      disable("p3_discount_hosp7_2")
      disable("p3_discount_hosp7_3")
      disable("p3_discount_hosp7_4")
      disable("p3_promotional_budget_hosp7")
      disable("p3_hosp7_sales_target_1")
      disable("p3_hosp7_sales_target_2")
      disable("p3_hosp7_sales_target_3")
      disable("p3_hosp7_sales_target_4")
      disable("p3_sr_hosp7")
      disable("p3_hosp7_worktime_1")
      disable("p3_hosp7_worktime_2")
      disable("p3_hosp7_worktime_3")
      disable("p3_hosp7_worktime_4")
      disable("p3_hosp7_worktime_doc")
      disable("p3_hosp7_worktime_diet")
      disable("p3_hosp7_worktime_admin")
      disable("p3_hosp7_worktime_nurs")
      ##hosp8
      disable("p3_discount_hosp8_1")
      disable("p3_discount_hosp8_2")
      disable("p3_discount_hosp8_3")
      disable("p3_discount_hosp8_4")
      disable("p3_promotional_budget_hosp8")
      disable("p3_hosp8_sales_target_1")
      disable("p3_hosp8_sales_target_2")
      disable("p3_hosp8_sales_target_3")
      disable("p3_hosp8_sales_target_4")
      disable("p3_sr_hosp8")
      disable("p3_hosp8_worktime_1")
      disable("p3_hosp8_worktime_2")
      disable("p3_hosp8_worktime_3")
      disable("p3_hosp8_worktime_4")
      disable("p3_hosp8_worktime_doc")
      disable("p3_hosp8_worktime_diet")
      disable("p3_hosp8_worktime_admin")
      disable("p3_hosp8_worktime_nurs")
      ##hosp9
      disable("p3_discount_hosp9_1")
      disable("p3_discount_hosp9_2")
      disable("p3_discount_hosp9_3")
      disable("p3_discount_hosp9_4")
      disable("p3_promotional_budget_hosp9")
      disable("p3_hosp9_sales_target_1")
      disable("p3_hosp9_sales_target_2")
      disable("p3_hosp9_sales_target_3")
      disable("p3_hosp9_sales_target_4")
      disable("p3_sr_hosp9")
      disable("p3_hosp9_worktime_1")
      disable("p3_hosp9_worktime_2")
      disable("p3_hosp9_worktime_3")
      disable("p3_hosp9_worktime_4")
      disable("p3_hosp9_worktime_doc")
      disable("p3_hosp9_worktime_diet")
      disable("p3_hosp9_worktime_admin")
      disable("p3_hosp9_worktime_nurs")
      ##hosp10
      disable("p3_discount_hosp10_1")
      disable("p3_discount_hosp10_2")
      disable("p3_discount_hosp10_3")
      disable("p3_discount_hosp10_4")
      disable("p3_promotional_budget_hosp10")
      disable("p3_hosp10_sales_target_1")
      disable("p3_hosp10_sales_target_2")
      disable("p3_hosp10_sales_target_3")
      disable("p3_hosp10_sales_target_4")
      disable("p3_sr_hosp10")
      disable("p3_hosp10_worktime_1")
      disable("p3_hosp10_worktime_2")
      disable("p3_hosp10_worktime_3")
      disable("p3_hosp10_worktime_4")
      disable("p3_hosp10_worktime_doc")
      disable("p3_hosp10_worktime_diet")
      disable("p3_hosp10_worktime_admin")
      disable("p3_hosp10_worktime_nurs")})
    
    p3_flm_data <- reactive(get.data3(input,3))
    
    output$p3_total_sales_training <-renderText(round(sales_training(input,3)/worktime*100))
    output$p3_flm_sales_training <- renderText(sales_training(input,3))
    output$p3_total_field_work <-renderText(round(field_work(input,3)/worktime*100))
    output$p3_flm_field_work <- renderText(field_work(input,3))
    output$p3_total_team_meeting <- renderText(round(as.numeric(input$p3_flm_team_meeting)/worktime*100))
    output$p3_total_kpi_analysis <- renderText(round(as.numeric(input$p3_flm_kpi_analysis)/worktime*100))
    output$p3_total_strategy_planning <- renderText(round(as.numeric(input$p3_flm_strategy_planning)/worktime*100))
    output$p3_total_admin_work <- renderText(round(as.numeric(input$p3_flm_admin_work)/worktime*100))
    output$p3_total_management <- renderText(round(sum(p3_flm_data())/worktime*100))
    output$p3_flm_management <- renderText(round(sum(p3_flm_data())/worktime*100))
    
    
    
    tmp3 <- reactive({
      pp_data1 <- tmp2() %>% select(hospital,
                                    product,
                                    real_sales,
                                    sr_sales_performance,
                                    deployment_quality_index,
                                    customer_relationship_index,
                                    promotional_support_index,
                                    sales_performance,
                                    offer_attractiveness,
                                    acc_offer_attractiveness) %>%
        distinct()
      
      colnames(pp_data1)[3:10] <- paste("pp_",colnames(pp_data1)[3:10],sep="")
      
      pp_data2 <- tmp2() %>% select(sales_rep,
                                    sales_level,
                                    acc_revenue,
                                    sales_skills_index,
                                    product_knowledge_index,
                                    motivation_index,
                                    acc_field_work) %>%
        distinct()
      
      colnames(pp_data2)[3:7] <- paste("pp_",colnames(pp_data2)[3:7],sep="")
      cp_data1 <- get.data1(input,3)
      cp_data2 <- get.data2(input,3)
      tmp <- calculation(pp_data1,
                         pp_data2,
                         cp_data1,
                         cp_data2)})
    
    p3_report<- reactive({
      flm_data <- get.data3(input,3)
      p3_report <- report_data(tmp3(),flm_data)})
    
    
    
    observeEvent(input$decision2_phase3_submit, {
      disable("p3_sr1_sales_training")
      disable("p3_sr2_sales_training")
      disable("p3_sr3_sales_training")
      disable("p3_sr4_sales_training")
      disable("p3_sr5_sales_training")
      disable("p3_sr1_field_work")
      disable("p3_sr2_field_work")
      disable("p3_sr3_field_work")
      disable("p3_sr4_field_work")
      disable("p3_sr5_field_work")
      disable("p3_flm_team_meeting")
      disable("p3_flm_kpi_analysis")
      disable("p3_flm_strategy_planning")
      disable("p3_flm_admin_work")
      disable("p3_sr1_product_training")
      disable("p3_sr2_product_training")
      disable("p3_sr3_product_training")
      disable("p3_sr4_product_training")
      disable("p3_sr5_product_training")
      
      output$p3_report1_1 <-
        renderDataTable(datatable(p3_report()$report1_mod1,
                                  caption="职员成本",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         # autoWidth = TRUE,
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p3_report1_2 <- 
        renderDataTable(datatable(p3_report()$report1_mod2,
                                  caption="时间分配",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         # autoWidth = TRUE,
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p3_report1_3 <- 
        renderDataTable(datatable(p3_report()$report1_mod3,
                                  caption="产品知识",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p3_report1_4 <- 
        renderDataTable(datatable(p3_report()$report1_mod4,
                                  caption="经验",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p3_report1_5 <- 
        renderDataTable(datatable(p3_report()$report1_mod5,
                                  caption="销售技巧",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p3_report2_1 <- 
        renderDataTable(datatable(p3_report()$report2_mod1,
                                  caption="职员成本",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p3_report2_2 <- 
        renderDataTable(datatable(p3_report()$report2_mod2,
                                  caption="时间分配",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p3_report3 <- 
        renderDataTable(datatable(p3_report()$hospital_report,
                                  caption="时间分配",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p3_report4_1 <- 
        renderDataTable(datatable(p3_report()$report4_mod1,
                                  caption="总体的分配情况",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p3_report4_2 <- 
        renderDataTable(datatable(p3_report()$report4_mod2,
                                  caption="分级匹配度",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p3_report4_3 <- 
        renderDataTable(datatable(p3_report()$report4_mod3,
                                  caption="决策质量",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p3_report5_1 <- 
        renderDataTable(datatable(p3_report()$report5_mod1,
                                  caption="商业价值",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p3_report5_2 <- 
        renderDataTable(datatable(p3_report()$report5_mod2,
                                  caption="总市场概述",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      
      
    })
    
    ## phase 4
    output$p4_total_promotional_budget <- renderText(
      total_promotional_budget$phase4
    )
    
    
    p4_calculator_result <- eventReactive(input$decision1_phase4_calculator,{
      calculator(input,4)
    })
    
    output$p4_arranged_promotional_budget <- renderText(
      ifelse(input$decision1_phase4_calculator==0,0,p4_calculator_result()[1])) 
    output$p4_arranged_time_of_sr1 <- renderText(
      ifelse(input$decision1_phase4_calculator==0,0,p4_calculator_result()[2]))
    output$p4_arranged_time_of_sr2 <- renderText(
      ifelse(input$decision1_phase4_calculator==0,0,p4_calculator_result()[3]))
    output$p4_arranged_time_of_sr3 <- renderText(
      ifelse(input$decision1_phase4_calculator==0,0,p4_calculator_result()[4]))
    output$p4_arranged_time_of_sr4 <- renderText(
      ifelse(input$decision1_phase4_calculator==0,0,p4_calculator_result()[5]))
    output$p4_arranged_time_of_sr5 <- renderText(
      ifelse(input$decision1_phase4_calculator==0,0,p4_calculator_result()[6]))
    
    output$p4_potential_sales_hosp1_1 <- renderText((potential_sales_product1$hospital1)$phase4)
    output$p4_potential_sales_hosp1_2 <- renderText((potential_sales_product2$hospital1)$phase4)
    output$p4_potential_sales_hosp1_3 <- renderText((potential_sales_product3$hospital1)$phase4)
    output$p4_potential_sales_hosp1_4 <- renderText((potential_sales_product4$hospital1)$phase4)
    output$p4_current_sales_hosp1_1 <- renderText((current_sales_product1$hospital1)$phase4)
    output$p4_current_sales_hosp1_2 <- renderText((current_sales_product2$hospital1)$phase4)
    output$p4_current_sales_hosp1_3 <- renderText((current_sales_product3$hospital1)$phase4)
    output$p4_current_sales_hosp1_4 <- renderText((current_sales_product4$hospital1)$phase4)
    
    output$p4_potential_sales_hosp2_1 <- renderText((potential_sales_product1$hospital2)$phase4)
    output$p4_potential_sales_hosp2_2 <- renderText((potential_sales_product2$hospital2)$phase4)
    output$p4_potential_sales_hosp2_3 <- renderText((potential_sales_product3$hospital2)$phase4)
    output$p4_potential_sales_hosp2_4 <- renderText((potential_sales_product4$hospital2)$phase4)
    output$p4_current_sales_hosp2_1 <- renderText((current_sales_product1$hospital2)$phase4)
    output$p4_current_sales_hosp2_2 <- renderText((current_sales_product2$hospital2)$phase4)
    output$p4_current_sales_hosp2_3 <- renderText((current_sales_product3$hospital2)$phase4)
    output$p4_current_sales_hosp2_4 <- renderText((current_sales_product4$hospital2)$phase4)
    
    output$p4_potential_sales_hosp3_1 <- renderText((potential_sales_product1$hospital3)$phase4)
    output$p4_potential_sales_hosp3_2 <- renderText((potential_sales_product2$hospital3)$phase4)
    output$p4_potential_sales_hosp3_3 <- renderText((potential_sales_product3$hospital3)$phase4)
    output$p4_potential_sales_hosp3_4 <- renderText((potential_sales_product4$hospital3)$phase4)
    output$p4_current_sales_hosp3_1 <- renderText((current_sales_product1$hospital3)$phase4)
    output$p4_current_sales_hosp3_2 <- renderText((current_sales_product2$hospital3)$phase4)
    output$p4_current_sales_hosp3_3 <- renderText((current_sales_product3$hospital3)$phase4)
    output$p4_current_sales_hosp3_4 <- renderText((current_sales_product4$hospital3)$phase4)
    
    output$p4_potential_sales_hosp4_1 <- renderText((potential_sales_product1$hospital4)$phase4)
    output$p4_potential_sales_hosp4_2 <- renderText((potential_sales_product2$hospital4)$phase4)
    output$p4_potential_sales_hosp4_3 <- renderText((potential_sales_product3$hospital4)$phase4)
    output$p4_potential_sales_hosp4_4 <- renderText((potential_sales_product4$hospital4)$phase4)
    output$p4_current_sales_hosp4_1 <- renderText((current_sales_product1$hospital4)$phase4)
    output$p4_current_sales_hosp4_2 <- renderText((current_sales_product2$hospital4)$phase4)
    output$p4_current_sales_hosp4_3 <- renderText((current_sales_product3$hospital4)$phase4)
    output$p4_current_sales_hosp4_4 <- renderText((current_sales_product4$hospital4)$phase4)
    
    output$p4_potential_sales_hosp5_1 <- renderText((potential_sales_product1$hospital5)$phase4)
    output$p4_potential_sales_hosp5_2 <- renderText((potential_sales_product2$hospital5)$phase4)
    output$p4_potential_sales_hosp5_3 <- renderText((potential_sales_product3$hospital5)$phase4)
    output$p4_potential_sales_hosp5_4 <- renderText((potential_sales_product4$hospital5)$phase4)
    output$p4_current_sales_hosp5_1 <- renderText((current_sales_product1$hospital5)$phase4)
    output$p4_current_sales_hosp5_2 <- renderText((current_sales_product2$hospital5)$phase4)
    output$p4_current_sales_hosp5_3 <- renderText((current_sales_product3$hospital5)$phase4)
    output$p4_current_sales_hosp5_4 <- renderText((current_sales_product4$hospital5)$phase4)
    
    output$p4_potential_sales_hosp6_1 <- renderText((potential_sales_product1$hospital6)$phase4)
    output$p4_potential_sales_hosp6_2 <- renderText((potential_sales_product2$hospital6)$phase4)
    output$p4_potential_sales_hosp6_3 <- renderText((potential_sales_product3$hospital6)$phase4)
    output$p4_potential_sales_hosp6_4 <- renderText((potential_sales_product4$hospital6)$phase4)
    output$p4_current_sales_hosp6_1 <- renderText((current_sales_product1$hospital6)$phase4)
    output$p4_current_sales_hosp6_2 <- renderText((current_sales_product2$hospital6)$phase4)
    output$p4_current_sales_hosp6_3 <- renderText((current_sales_product3$hospital6)$phase4)
    output$p4_current_sales_hosp6_4 <- renderText((current_sales_product4$hospital6)$phase4)
    
    output$p4_potential_sales_hosp7_1 <- renderText((potential_sales_product1$hospital7)$phase4)
    output$p4_potential_sales_hosp7_2 <- renderText((potential_sales_product2$hospital7)$phase4)
    output$p4_potential_sales_hosp7_3 <- renderText((potential_sales_product3$hospital7)$phase4)
    output$p4_potential_sales_hosp7_4 <- renderText((potential_sales_product4$hospital7)$phase4)
    output$p4_current_sales_hosp7_1 <- renderText((current_sales_product1$hospital7)$phase4)
    output$p4_current_sales_hosp7_2 <- renderText((current_sales_product2$hospital7)$phase4)
    output$p4_current_sales_hosp7_3 <- renderText((current_sales_product3$hospital7)$phase4)
    output$p4_current_sales_hosp7_4 <- renderText((current_sales_product4$hospital7)$phase4)
    
    output$p4_potential_sales_hosp8_1 <- renderText((potential_sales_product1$hospital8)$phase4)
    output$p4_potential_sales_hosp8_2 <- renderText((potential_sales_product2$hospital8)$phase4)
    output$p4_potential_sales_hosp8_3 <- renderText((potential_sales_product3$hospital8)$phase4)
    output$p4_potential_sales_hosp8_4 <- renderText((potential_sales_product4$hospital8)$phase4)
    output$p4_current_sales_hosp8_1 <- renderText((current_sales_product1$hospital8)$phase4)
    output$p4_current_sales_hosp8_2 <- renderText((current_sales_product2$hospital8)$phase4)
    output$p4_current_sales_hosp8_3 <- renderText((current_sales_product3$hospital8)$phase4)
    output$p4_current_sales_hosp8_4 <- renderText((current_sales_product4$hospital8)$phase4)
    
    output$p4_potential_sales_hosp9_1 <- renderText((potential_sales_product1$hospital9)$phase4)
    output$p4_potential_sales_hosp9_2 <- renderText((potential_sales_product2$hospital9)$phase4)
    output$p4_potential_sales_hosp9_3 <- renderText((potential_sales_product3$hospital9)$phase4)
    output$p4_potential_sales_hosp9_4 <- renderText((potential_sales_product4$hospital9)$phase4)
    output$p4_current_sales_hosp9_1 <- renderText((current_sales_product1$hospital9)$phase4)
    output$p4_current_sales_hosp9_2 <- renderText((current_sales_product2$hospital9)$phase4)
    output$p4_current_sales_hosp9_3 <- renderText((current_sales_product3$hospital9)$phase4)
    output$p4_current_sales_hosp9_4 <- renderText((current_sales_product4$hospital9)$phase4)
    
    output$p4_potential_sales_hosp10_1 <- renderText((potential_sales_product1$hospital10)$phase4)
    output$p4_potential_sales_hosp10_2 <- renderText((potential_sales_product2$hospital10)$phase4)
    output$p4_potential_sales_hosp10_3 <- renderText((potential_sales_product3$hospital10)$phase4)
    output$p4_potential_sales_hosp10_4 <- renderText((potential_sales_product4$hospital10)$phase4)
    output$p4_current_sales_hosp10_1 <- renderText((current_sales_product1$hospital10)$phase4)
    output$p4_current_sales_hosp10_2 <- renderText((current_sales_product2$hospital10)$phase4)
    output$p4_current_sales_hosp10_3 <- renderText((current_sales_product3$hospital10)$phase4)
    output$p4_current_sales_hosp10_4 <- renderText((current_sales_product4$hospital10)$phase4)
    
    
    
    output$p4_decison1_summary_hosp1 <- renderText(decision1_summary(input,4,1))
    output$p4_decison1_summary_hosp2 <- renderText(decision1_summary(input,4,2))
    output$p4_decison1_summary_hosp3 <- renderText(decision1_summary(input,4,3))
    output$p4_decison1_summary_hosp4 <- renderText(decision1_summary(input,4,4))
    output$p4_decison1_summary_hosp5 <- renderText(decision1_summary(input,4,5))
    output$p4_decison1_summary_hosp6 <- renderText(decision1_summary(input,4,6))
    output$p4_decison1_summary_hosp7 <- renderText(decision1_summary(input,4,7))
    output$p4_decison1_summary_hosp8 <- renderText(decision1_summary(input,4,8))
    output$p4_decison1_summary_hosp9 <- renderText(decision1_summary(input,4,9))
    output$p4_decison1_summary_hosp10 <- renderText(decision1_summary(input,4,10))
    
    
    observeEvent(input$decision1_phase4_submit, {
      #hosp1
      disable("p4_discount_hosp1_1")
      disable("p4_discount_hosp1_2")
      disable("p4_discount_hosp1_3")
      disable("p4_discount_hosp1_4")
      disable("p4_promotional_budget_hosp1")
      disable("p4_hosp1_sales_target_1")
      disable("p4_hosp1_sales_target_2")
      disable("p4_hosp1_sales_target_3")
      disable("p4_hosp1_sales_target_4")
      disable("p4_sr_hosp1")
      disable("p4_hosp1_worktime_1")
      disable("p4_hosp1_worktime_2")
      disable("p4_hosp1_worktime_3")
      disable("p4_hosp1_worktime_4")
      disable("p4_hosp1_worktime_doc")
      disable("p4_hosp1_worktime_diet")
      disable("p4_hosp1_worktime_admin")
      disable("p4_hosp1_worktime_nurs")
      ##hosp2
      disable("p4_discount_hosp2_1")
      disable("p4_discount_hosp2_2")
      disable("p4_discount_hosp2_3")
      disable("p4_discount_hosp2_4")
      disable("p4_promotional_budget_hosp2")
      disable("p4_hosp2_sales_target_1")
      disable("p4_hosp2_sales_target_2")
      disable("p4_hosp2_sales_target_3")
      disable("p4_hosp2_sales_target_4")
      disable("p4_sr_hosp2")
      disable("p4_hosp2_worktime_1")
      disable("p4_hosp2_worktime_2")
      disable("p4_hosp2_worktime_3")
      disable("p4_hosp2_worktime_4")
      disable("p4_hosp2_worktime_doc")
      disable("p4_hosp2_worktime_diet")
      disable("p4_hosp2_worktime_admin")
      disable("p4_hosp2_worktime_nurs")
      ##hosp3
      disable("p4_discount_hosp3_1")
      disable("p4_discount_hosp3_2")
      disable("p4_discount_hosp3_3")
      disable("p4_discount_hosp3_4")
      disable("p4_promotional_budget_hosp3")
      disable("p4_hosp3_sales_target_1")
      disable("p4_hosp3_sales_target_2")
      disable("p4_hosp3_sales_target_3")
      disable("p4_hosp3_sales_target_4")
      disable("p4_sr_hosp3")
      disable("p4_hosp3_worktime_1")
      disable("p4_hosp3_worktime_2")
      disable("p4_hosp3_worktime_3")
      disable("p4_hosp3_worktime_4")
      disable("p4_hosp3_worktime_doc")
      disable("p4_hosp3_worktime_diet")
      disable("p4_hosp3_worktime_admin")
      disable("p4_hosp3_worktime_nurs")
      ##hosp4
      disable("p4_discount_hosp4_1")
      disable("p4_discount_hosp4_2")
      disable("p4_discount_hosp4_3")
      disable("p4_discount_hosp4_4")
      disable("p4_promotional_budget_hosp4")
      disable("p4_hosp4_sales_target_1")
      disable("p4_hosp4_sales_target_2")
      disable("p4_hosp4_sales_target_3")
      disable("p4_hosp4_sales_target_4")
      disable("p4_sr_hosp4")
      disable("p4_hosp4_worktime_1")
      disable("p4_hosp4_worktime_2")
      disable("p4_hosp4_worktime_3")
      disable("p4_hosp4_worktime_4")
      disable("p4_hosp4_worktime_doc")
      disable("p4_hosp4_worktime_diet")
      disable("p4_hosp4_worktime_admin")
      disable("p4_hosp4_worktime_nurs")
      ##hosp5
      disable("p4_discount_hosp5_1")
      disable("p4_discount_hosp5_2")
      disable("p4_discount_hosp5_3")
      disable("p4_discount_hosp5_4")
      disable("p4_promotional_budget_hosp5")
      disable("p4_hosp5_sales_target_1")
      disable("p4_hosp5_sales_target_2")
      disable("p4_hosp5_sales_target_3")
      disable("p4_hosp5_sales_target_4")
      disable("p4_sr_hosp5")
      disable("p4_hosp5_worktime_1")
      disable("p4_hosp5_worktime_2")
      disable("p4_hosp5_worktime_3")
      disable("p4_hosp5_worktime_4")
      disable("p4_hosp5_worktime_doc")
      disable("p4_hosp5_worktime_diet")
      disable("p4_hosp5_worktime_admin")
      disable("p4_hosp5_worktime_nurs")
      ##hosp6
      disable("p4_discount_hosp6_1")
      disable("p4_discount_hosp6_2")
      disable("p4_discount_hosp6_3")
      disable("p4_discount_hosp6_4")
      disable("p4_promotional_budget_hosp6")
      disable("p4_hosp6_sales_target_1")
      disable("p4_hosp6_sales_target_2")
      disable("p4_hosp6_sales_target_3")
      disable("p4_hosp6_sales_target_4")
      disable("p4_sr_hosp6")
      disable("p4_hosp6_worktime_1")
      disable("p4_hosp6_worktime_2")
      disable("p4_hosp6_worktime_3")
      disable("p4_hosp6_worktime_4")
      disable("p4_hosp6_worktime_doc")
      disable("p4_hosp6_worktime_diet")
      disable("p4_hosp6_worktime_admin")
      disable("p4_hosp6_worktime_nurs")
      ##hosp7
      disable("p4_discount_hosp7_1")
      disable("p4_discount_hosp7_2")
      disable("p4_discount_hosp7_3")
      disable("p4_discount_hosp7_4")
      disable("p4_promotional_budget_hosp7")
      disable("p4_hosp7_sales_target_1")
      disable("p4_hosp7_sales_target_2")
      disable("p4_hosp7_sales_target_3")
      disable("p4_hosp7_sales_target_4")
      disable("p4_sr_hosp7")
      disable("p4_hosp7_worktime_1")
      disable("p4_hosp7_worktime_2")
      disable("p4_hosp7_worktime_3")
      disable("p4_hosp7_worktime_4")
      disable("p4_hosp7_worktime_doc")
      disable("p4_hosp7_worktime_diet")
      disable("p4_hosp7_worktime_admin")
      disable("p4_hosp7_worktime_nurs")
      ##hosp8
      disable("p4_discount_hosp8_1")
      disable("p4_discount_hosp8_2")
      disable("p4_discount_hosp8_3")
      disable("p4_discount_hosp8_4")
      disable("p4_promotional_budget_hosp8")
      disable("p4_hosp8_sales_target_1")
      disable("p4_hosp8_sales_target_2")
      disable("p4_hosp8_sales_target_3")
      disable("p4_hosp8_sales_target_4")
      disable("p4_sr_hosp8")
      disable("p4_hosp8_worktime_1")
      disable("p4_hosp8_worktime_2")
      disable("p4_hosp8_worktime_3")
      disable("p4_hosp8_worktime_4")
      disable("p4_hosp8_worktime_doc")
      disable("p4_hosp8_worktime_diet")
      disable("p4_hosp8_worktime_admin")
      disable("p4_hosp8_worktime_nurs")
      ##hosp9
      disable("p4_discount_hosp9_1")
      disable("p4_discount_hosp9_2")
      disable("p4_discount_hosp9_3")
      disable("p4_discount_hosp9_4")
      disable("p4_promotional_budget_hosp9")
      disable("p4_hosp9_sales_target_1")
      disable("p4_hosp9_sales_target_2")
      disable("p4_hosp9_sales_target_3")
      disable("p4_hosp9_sales_target_4")
      disable("p4_sr_hosp9")
      disable("p4_hosp9_worktime_1")
      disable("p4_hosp9_worktime_2")
      disable("p4_hosp9_worktime_3")
      disable("p4_hosp9_worktime_4")
      disable("p4_hosp9_worktime_doc")
      disable("p4_hosp9_worktime_diet")
      disable("p4_hosp9_worktime_admin")
      disable("p4_hosp9_worktime_nurs")
      ##hosp10
      disable("p4_discount_hosp10_1")
      disable("p4_discount_hosp10_2")
      disable("p4_discount_hosp10_3")
      disable("p4_discount_hosp10_4")
      disable("p4_promotional_budget_hosp10")
      disable("p4_hosp10_sales_target_1")
      disable("p4_hosp10_sales_target_2")
      disable("p4_hosp10_sales_target_3")
      disable("p4_hosp10_sales_target_4")
      disable("p4_sr_hosp10")
      disable("p4_hosp10_worktime_1")
      disable("p4_hosp10_worktime_2")
      disable("p4_hosp10_worktime_3")
      disable("p4_hosp10_worktime_4")
      disable("p4_hosp10_worktime_doc")
      disable("p4_hosp10_worktime_diet")
      disable("p4_hosp10_worktime_admin")
      disable("p4_hosp10_worktime_nurs")})
    
    p4_flm_data <- reactive(get.data3(input,4))
    
    output$p4_total_sales_training <-renderText(round(sales_training(input,4)/worktime*100))
    output$p4_flm_sales_training <- renderText(sales_training(input,4))
    output$p4_total_field_work <-renderText(round(field_work(input,4)/worktime*100))
    output$p4_flm_field_work <- renderText(field_work(input,4))
    output$p4_total_team_meeting <- renderText(round(as.numeric(input$p4_flm_team_meeting)/worktime*100))
    output$p4_total_kpi_analysis <- renderText(round(as.numeric(input$p4_flm_kpi_analysis)/worktime*100))
    output$p4_total_strategy_planning <- renderText(round(as.numeric(input$p4_flm_strategy_planning)/worktime*100))
    output$p4_total_admin_work <- renderText(round(as.numeric(input$p4_flm_admin_work)/worktime*100))
    output$p4_total_management <- renderText(round(sum(p4_flm_data())/worktime*100))
    output$p4_flm_management <- renderText(sum(p4_flm_data()))
    
    
    tmp4 <- reactive({
      pp_data1 <- tmp3() %>% select(hospital,
                                    product,
                                    real_sales,
                                    sr_sales_performance,
                                    deployment_quality_index,
                                    customer_relationship_index,
                                    promotional_support_index,
                                    sales_performance,
                                    offer_attractiveness,
                                    acc_offer_attractiveness) %>%
        distinct()
      
      colnames(pp_data1)[3:10] <- paste("pp_",colnames(pp_data1)[3:10],sep="")
      
      pp_data2 <- tmp3() %>% select(sales_rep,
                                    sales_level,
                                    acc_revenue,
                                    sales_skills_index,
                                    product_knowledge_index,
                                    motivation_index,
                                    acc_field_work) %>%
        distinct()
      
      colnames(pp_data2)[3:7] <- paste("pp_",colnames(pp_data2)[3:7],sep="")
      cp_data1 <- get.data1(input,4)
      cp_data2 <- get.data2(input,4)
      tmp <- calculation(pp_data1,
                         pp_data2,
                         cp_data1,
                         cp_data2)})
    
    p4_report<- reactive({
      flm_data <- get.data3(input,4)
      p4_report <- report_data(tmp4(),flm_data)})
    
    
    
    observeEvent(input$decision2_phase4_submit, {
      
      disable("p4_sr1_sales_training")
      disable("p4_sr2_sales_training")
      disable("p4_sr3_sales_training")
      disable("p4_sr4_sales_training")
      disable("p4_sr5_sales_training")
      disable("p4_sr1_field_work")
      disable("p4_sr2_field_work")
      disable("p4_sr3_field_work")
      disable("p4_sr4_field_work")
      disable("p4_sr5_field_work")
      disable("p4_flm_team_meeting")
      disable("p4_flm_kpi_analysis")
      disable("p4_flm_strategy_planning")
      disable("p4_flm_admin_work")
      disable("p4_sr1_product_training")
      disable("p4_sr2_product_training")
      disable("p4_sr3_product_training")
      disable("p4_sr4_product_training")
      disable("p4_sr5_product_training")
      
      output$p4_report1_1 <-
        renderDataTable(datatable(p4_report()$report1_mod1,
                                  caption="职员成本",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         # autoWidth = TRUE,
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p4_report1_2 <- 
        renderDataTable(datatable(p4_report()$report1_mod2,
                                  caption="时间分配",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         # autoWidth = TRUE,
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p4_report1_3 <- 
        renderDataTable(datatable(p4_report()$report1_mod3,
                                  caption="产品知识",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p4_report1_4 <- 
        renderDataTable(datatable(p4_report()$report1_mod4,
                                  caption="经验",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p4_report1_5 <- 
        renderDataTable(datatable(p4_report()$report1_mod5,
                                  caption="销售技巧",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p4_report2_1 <- 
        renderDataTable(datatable(p4_report()$report2_mod1,
                                  caption="职员成本",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p4_report2_2 <- 
        renderDataTable(datatable(p4_report()$report2_mod2,
                                  caption="时间分配",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p4_report3 <- 
        renderDataTable(datatable(p4_report()$hospital_report,
                                  caption="时间分配",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      output$p4_report4_1 <- 
        renderDataTable(datatable(p4_report()$report4_mod1,
                                  caption="总体的分配情况",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p4_report4_2 <- 
        renderDataTable(datatable(p4_report()$report4_mod2,
                                  caption="分级匹配度",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p4_report4_3 <- 
        renderDataTable(datatable(p4_report()$report4_mod3,
                                  caption="决策质量",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p4_report5_1 <- 
        renderDataTable(datatable(p4_report()$report5_mod1,
                                  caption="商业价值",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      output$p4_report5_2 <- 
        renderDataTable(datatable(p4_report()$report5_mod2,
                                  caption="总市场概述",
                                  options = 
                                    list(ordering = F, dom = "t",
                                         columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                         initComplete = JS(
                                           "function(settings, json) {",
                                           "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                           "}"))))
      
      final_report_data <- reactive({
        phase1 <- tmp()
        phase2 <- tmp2()
        phase3 <- tmp3()
        phase4 <- tmp4()
        
        out <- final_report(phase1,phase2,phase3,phase4)
        out
      })
      
      output$final_report <-renderDataTable(
        datatable(final_report_data,
                                                      caption="总分数",
                                                      options =
                                                        list(ordering = F, dom = "t",
                                                             columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                                             initComplete = JS(
                                                               "function(settings, json) {",
                                                               "$(this.api().table().header()).css({'background-color': '#000', 'color': '#fff'});",
                                                               "}")))
        ) 
      
      
      
      
      
      
    }) })