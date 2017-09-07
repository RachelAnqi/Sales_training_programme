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
                   
                   
                   
                   
                   
                   
          ),
          tabPanel(
            "周期2",
            actionButton("decision1_phase2_calculator", "calculator"),
            actionButton("decision1_phase2_submit", "submit")
            
          ),
          tabPanel(
            "周期3",
            actionButton("decision1_phase3_calculator", "calculator"),
            actionButton("decision1_phase3_submit", "submit")
            
          ),
          tabPanel(
            "周期4",
            actionButton("decision1_phase4_calculator", "calculator"),
            actionButton("decision1_phase4_submit", "submit")
            
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
              actionButton("decision2_phase2_submit","submit"),
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
                                               dataTableOutput("p4_report5_2")))))
                  
                ))))),
  
  
  server=function(input, output,session) {
    
    
    ##phase1
    
    output$p1_total_promotional_budget <- renderText(total_promotional_budget$phase1)
    
    
    p1_calculator_result <- eventReactive(input$decision1_phase1_calculator,{
      calculator(input,1)
    })
    
    output$p1_potential_sales_hosp1_1 <- renderText((potential_sales_product1$hospital1)$phase1)
    output$p1_potential_sales_hosp1_2 <- renderText((potential_sales_product2$hospital1)$phase1)
    output$p1_potential_sales_hosp1_3 <- renderText((potential_sales_product3$hospital1)$phase1)
    output$p1_potential_sales_hosp1_4 <- renderText((potential_sales_product4$hospital1)$phase1)
    output$p1_current_sales_hosp1_1 <- renderText((current_sales_product1$hospital1)$phase1)
    output$p1_current_sales_hosp1_2 <- renderText((current_sales_product2$hospital1)$phase1)
    output$p1_current_sales_hosp1_3 <- renderText((current_sales_product3$hospital1)$phase1)
    output$p1_current_sales_hosp1_3 <- renderText((current_sales_product4$hospital1)$phase1)
    
    output$p1_potential_sales_hosp2_1 <- renderText((potential_sales_product1$hospital2)$phase1)
    output$p1_potential_sales_hosp2_2 <- renderText((potential_sales_product2$hospital2)$phase1)
    output$p1_potential_sales_hosp2_3 <- renderText((potential_sales_product3$hospital2)$phase1)
    output$p1_potential_sales_hosp2_4 <- renderText((potential_sales_product4$hospital2)$phase1)
    output$p1_current_sales_hosp2_1 <- renderText((current_sales_product1$hospital2)$phase1)
    output$p1_current_sales_hosp2_2 <- renderText((current_sales_product2$hospital2)$phase1)
    output$p1_current_sales_hosp2_3 <- renderText((current_sales_product3$hospital2)$phase1)
    output$p1_current_sales_hosp2_3 <- renderText((current_sales_product4$hospital2)$phase1)
    
    output$p1_potential_sales_hosp3_1 <- renderText((potential_sales_product1$hospital3)$phase1)
    output$p1_potential_sales_hosp3_2 <- renderText((potential_sales_product2$hospital3)$phase1)
    output$p1_potential_sales_hosp3_3 <- renderText((potential_sales_product3$hospital3)$phase1)
    output$p1_potential_sales_hosp3_4 <- renderText((potential_sales_product4$hospital3)$phase1)
    output$p1_current_sales_hosp3_1 <- renderText((current_sales_product1$hospital3)$phase1)
    output$p1_current_sales_hosp3_2 <- renderText((current_sales_product2$hospital3)$phase1)
    output$p1_current_sales_hosp3_3 <- renderText((current_sales_product3$hospital3)$phase1)
    output$p1_current_sales_hosp3_3 <- renderText((current_sales_product4$hospital3)$phase1)
    
    output$p1_potential_sales_hosp4_1 <- renderText((potential_sales_product1$hospital4)$phase1)
    output$p1_potential_sales_hosp4_2 <- renderText((potential_sales_product2$hospital4)$phase1)
    output$p1_potential_sales_hosp4_3 <- renderText((potential_sales_product3$hospital4)$phase1)
    output$p1_potential_sales_hosp4_4 <- renderText((potential_sales_product4$hospital4)$phase1)
    output$p1_current_sales_hosp4_1 <- renderText((current_sales_product1$hospital4)$phase1)
    output$p1_current_sales_hosp4_2 <- renderText((current_sales_product2$hospital4)$phase1)
    output$p1_current_sales_hosp4_3 <- renderText((current_sales_product3$hospital4)$phase1)
    output$p1_current_sales_hosp4_3 <- renderText((current_sales_product4$hospital4)$phase1)
    
    output$p1_potential_sales_hosp5_1 <- renderText((potential_sales_product1$hospital5)$phase1)
    output$p1_potential_sales_hosp5_2 <- renderText((potential_sales_product2$hospital5)$phase1)
    output$p1_potential_sales_hosp5_3 <- renderText((potential_sales_product3$hospital5)$phase1)
    output$p1_potential_sales_hosp5_4 <- renderText((potential_sales_product4$hospital5)$phase1)
    output$p1_current_sales_hosp5_1 <- renderText((current_sales_product1$hospital5)$phase1)
    output$p1_current_sales_hosp5_2 <- renderText((current_sales_product2$hospital5)$phase1)
    output$p1_current_sales_hosp5_3 <- renderText((current_sales_product3$hospital5)$phase1)
    output$p1_current_sales_hosp5_3 <- renderText((current_sales_product4$hospital5)$phase1)
    
    output$p1_potential_sales_hosp6_1 <- renderText((potential_sales_product1$hospital6)$phase1)
    output$p1_potential_sales_hosp6_2 <- renderText((potential_sales_product2$hospital6)$phase1)
    output$p1_potential_sales_hosp6_3 <- renderText((potential_sales_product3$hospital6)$phase1)
    output$p1_potential_sales_hosp6_4 <- renderText((potential_sales_product4$hospital6)$phase1)
    output$p1_current_sales_hosp6_1 <- renderText((current_sales_product1$hospital6)$phase1)
    output$p1_current_sales_hosp6_2 <- renderText((current_sales_product2$hospital6)$phase1)
    output$p1_current_sales_hosp6_3 <- renderText((current_sales_product3$hospital6)$phase1)
    output$p1_current_sales_hosp6_3 <- renderText((current_sales_product4$hospital6)$phase1)
    
    output$p1_potential_sales_hosp7_1 <- renderText((potential_sales_product1$hospital7)$phase1)
    output$p1_potential_sales_hosp7_2 <- renderText((potential_sales_product2$hospital7)$phase1)
    output$p1_potential_sales_hosp7_3 <- renderText((potential_sales_product3$hospital7)$phase1)
    output$p1_potential_sales_hosp7_4 <- renderText((potential_sales_product4$hospital7)$phase1)
    output$p1_current_sales_hosp7_1 <- renderText((current_sales_product1$hospital7)$phase1)
    output$p1_current_sales_hosp7_2 <- renderText((current_sales_product2$hospital7)$phase1)
    output$p1_current_sales_hosp7_3 <- renderText((current_sales_product3$hospital7)$phase1)
    output$p1_current_sales_hosp7_3 <- renderText((current_sales_product4$hospital7)$phase1)
    
    output$p1_potential_sales_hosp8_1 <- renderText((potential_sales_product1$hospital8)$phase1)
    output$p1_potential_sales_hosp8_2 <- renderText((potential_sales_product2$hospital8)$phase1)
    output$p1_potential_sales_hosp8_3 <- renderText((potential_sales_product3$hospital8)$phase1)
    output$p1_potential_sales_hosp8_4 <- renderText((potential_sales_product4$hospital8)$phase1)
    output$p1_current_sales_hosp8_1 <- renderText((current_sales_product1$hospital8)$phase1)
    output$p1_current_sales_hosp8_2 <- renderText((current_sales_product2$hospital8)$phase1)
    output$p1_current_sales_hosp8_3 <- renderText((current_sales_product3$hospital8)$phase1)
    output$p1_current_sales_hosp8_3 <- renderText((current_sales_product4$hospital8)$phase1)
    
    output$p1_potential_sales_hosp9_1 <- renderText((potential_sales_product1$hospital9)$phase1)
    output$p1_potential_sales_hosp9_2 <- renderText((potential_sales_product2$hospital9)$phase1)
    output$p1_potential_sales_hosp9_3 <- renderText((potential_sales_product3$hospital9)$phase1)
    output$p1_potential_sales_hosp9_4 <- renderText((potential_sales_product4$hospital9)$phase1)
    output$p1_current_sales_hosp9_1 <- renderText((current_sales_product1$hospital9)$phase1)
    output$p1_current_sales_hosp9_2 <- renderText((current_sales_product2$hospital9)$phase1)
    output$p1_current_sales_hosp9_3 <- renderText((current_sales_product3$hospital9)$phase1)
    output$p1_current_sales_hosp9_3 <- renderText((current_sales_product4$hospital9)$phase1)
    
    output$p1_potential_sales_hosp10_1 <- renderText((potential_sales_product1$hospital10)$phase1)
    output$p1_potential_sales_hosp10_2 <- renderText((potential_sales_product2$hospital10)$phase1)
    output$p1_potential_sales_hosp10_3 <- renderText((potential_sales_product3$hospital10)$phase1)
    output$p1_potential_sales_hosp10_4 <- renderText((potential_sales_product4$hospital10)$phase1)
    output$p1_current_sales_hosp10_1 <- renderText((current_sales_product1$hospital10)$phase1)
    output$p1_current_sales_hosp10_2 <- renderText((current_sales_product2$hospital10)$phase1)
    output$p1_current_sales_hosp10_3 <- renderText((current_sales_product3$hospital10)$phase1)
    output$p1_current_sales_hosp10_3 <- renderText((current_sales_product4$hospital10)$phase1)
    
    output$p1_arranged_promotional_budget <- renderText(p1_calculator_result()[1]) 
    output$p1_arranged_time_of_sr1 <- renderText(p1_calculator_result()[2])
    output$p1_arranged_time_of_sr2 <- renderText(p1_calculator_result()[3])
    output$p1_arranged_time_of_sr3 <- renderText(p1_calculator_result()[4])
    output$p1_arranged_time_of_sr4 <- renderText(p1_calculator_result()[5])
    output$p1_arranged_time_of_sr5 <- renderText(p1_calculator_result()[6])
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
    observeEvent(input$decision1_phase1_submit,{
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
    
    output$p2_potential_sales_hosp1_1 <- renderText((potential_sales_product1$hospital4)$phase2)
    output$p2_potential_sales_hosp1_2 <- renderText((potential_sales_product2$hospital4)$phase2)
    output$p2_potential_sales_hosp1_3 <- renderText((potential_sales_product3$hospital4)$phase2)
    output$p2_potential_sales_hosp1_4 <- renderText((potential_sales_product4$hospital4)$phase2)
    output$p2_current_sales_hosp1_1 <- renderText((current_sales_product1$hospital4)$phase2)
    output$p2_current_sales_hosp1_2 <- renderText((current_sales_product2$hospital4)$phase2)
    output$p2_current_sales_hosp1_3 <- renderText((current_sales_product3$hospital4)$phase2)
    output$p2_current_sales_hosp1_3 <- renderText((current_sales_product4$hospital4)$phase2)
    
    
    
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
    
    
    
 })