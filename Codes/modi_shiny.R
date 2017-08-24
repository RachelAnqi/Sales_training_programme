shinyApp(
  ui <- 
    dashboardPage(
      dashboardHeader(title = "销售培训"),
      dashboardSidebar(
        tags$div(style="text-align:center;height:40px",
        menuItem("新闻&WAS计划", tabName = "new&WAS", icon = icon("navicon"))),
        menuItem("报告", tabName = "reports", icon = icon("list-alt")),
        menuItem("销售代表", tabName = "sr", icon = icon("address-card-o")),
        menuItem("产品", tabName = "products", icon = icon("plus-square-o")),
        menuItem("决策", tabName = "decisions", icon = icon("edit"),
                 menuSubItem("客户决定",tabName = "decision1"),
                 menuSubItem("管理决策",tabName = "decision2"))
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
          tabItem(tabName = "decision1",
                  tabsetPanel(#position = "left",
                              tabPanel("Phase1",
                                       # tags$style(
                                       #   ".container div {width:50px;height:50px;}"),
                                       fluidRow(h3("总推广预算"),
                                                tags$div(
                                                  tags$div(style="display:inline-block;width:100px;margin-left:10px;",
                                                           "总推广预算"),
                                                  tags$div(style="display:inline-block;width:300px;margin-left:50px;",
                                                           verbatimTextOutput("total_promotional_budget"))),
                                                tags$div(
                                                  tags$div(style="display:inline-block;width:100px;margin-left:10px;",
                                                           "已分配的推广预算"),
                                                  tags$div(style="display:inline-block;width:300px;margin-left:50px;",
                                                           verbatimTextOutput("arranged_promotional_budget")))),
                                       fluidRow(h3("时间分配"),
                                                tags$div(
                                                  tags$div(style="display:inline-block;margin-left:10px;",
                                                           "时间分配 销售代表1"),
                                                  tags$div(style="display:inline-block;width:300px;margin-left:50px;",
                                                           verbatimTextOutput("arranged_time_of_sr1"))),
                                                tags$div(
                                                  tags$div(style="display:inline-block;margin-left:10px;",
                                                           "时间分配 销售代表2"),
                                                  tags$div(style="display:inline-block;width:300px;margin-left:50px;",
                                                           verbatimTextOutput("arranged_time_of_sr2"))),
                                                tags$div(
                                                  tags$div(style="display:inline-block;margin-left:10px;",
                                                           "时间分配 销售代表3"),
                                                  tags$div(style="display:inline-block;width:300px;margin-left:50px;",
                                                           verbatimTextOutput("arranged_time_of_sr3"))),
                                                tags$div(
                                                  tags$div(style="display:inline-block;margin-left:10px;",
                                                           "时间分配 销售代表4"),
                                                  tags$div(style="display:inline-block;width:300px;margin-left:50px;",
                                                           verbatimTextOutput("arranged_time_of_sr4"))),
                                                tags$div(
                                                  tags$div(style="display:inline-block;margin-left:10px;",
                                                           "时间分配 销售代表5"),
                                                  tags$div(style="display:inline-block;width:300px;margin-left:50px;",
                                                           verbatimTextOutput("arranged_time_of_sr5")))),
                                                
                                       fluidRow(h3("决策-医院1"),
                                                
                                                tags$div(
                                                  tags$div(style="display:inline-block;margin-left:18%;width:18%;text-align:center",
                                                           "product1"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "product2"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "product3"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "product4")),
                                                br(),
                                                tags$div(
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "客户潜力"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           htmlOutput("potential_hosp1_1")),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           htmlOutput("potential_hosp1_2")),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           htmlOutput("potential_hosp1_3")),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           htmlOutput("potential_hosp1_4"))),
                                                br(),
                                                tags$div(
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "目前的销售情况"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           htmlOutput("current_sales_hosp1_1")),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           htmlOutput("current_sales_hosp1_2")),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           htmlOutput("current_sales_hosp1_3")),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           htmlOutput("current_sales_hosp1_4"))),
                                                br(),
                                                tags$div(
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "销售代表"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           selectizeInput("sr_hosp1",
                                                                          label=NULL,
                                                                          choices=available_srs,
                                                                          selected = NULL))
                                                 ),
                                                br(),
                                                tags$div(
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "代表的客户工作时间(%)"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           numericInput("hosp1_worktime_1",
                                                                        label=NULL,
                                                                        value=NULL,
                                                                        min=0,
                                                                        max=100)),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           numericInput("hosp1_worktime_2",
                                                                        label=NULL,
                                                                        value=NULL,
                                                                        min=0,
                                                                        max=100)),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           numericInput("hosp1_worktime_3",
                                                                        label=NULL,
                                                                        value=NULL,
                                                                        min=0,
                                                                        max=100)),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           numericInput("hosp1_worktime_4",
                                                                        label=NULL,
                                                                        value=NULL,
                                                                        min=0,
                                                                        max=100))),
                                                br(),
                                                tags$div(
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "时间被分配到 医生(%)"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           numericInput("hosp1_worktime_1_doc",
                                                                        label=NULL,
                                                                        value=NULL,
                                                                        min=0,
                                                                        max=100))),
                                                br(),
                                                tags$div(
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "时间被分配到 营养师(%)"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           numericInput("hosp1_worktime_1_diet",
                                                                        label=NULL,
                                                                        value=NULL,
                                                                        min=0,
                                                                        max=100))),
                                                br(),
                                                tags$div(
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "时间被分配到 行政(%)"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           numericInput("hosp1_worktime_1_admin",
                                                                        label=NULL,
                                                                        value=NULL,
                                                                        min=0,
                                                                        max=100))),
                                                br(),
                                                tags$div(
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "时间被分配到 营养师(%)"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           numericInput("hosp1_worktime_1_nurs",
                                                                        label=NULL,
                                                                        value=NULL,
                                                                        min=0,
                                                                        max=100))),
                                                br(),
                                                tags$div(
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           "总体(%)"),
                                                  tags$div(style="display:inline-block;width:18%;text-align:center",
                                                           verbatimTextOutput("decison1_summary_1")))
                                                
                                       )),
                              tabPanel("Phase2"),
                              tabPanel("Phase3"),
                              tabPanel("Phase4")
          )),
          tabItem(tabName = "decision2",
                  tabsetPanel(
                    tabPanel("Phase1",
                             fluidRow(
                               h3("时间分配"),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;margin-left:10px;width:40%;text-align:center;",
                                   "时间分配(天)"),
                                 tags$div(
                                   style="display:inline-block;width:40%;text-align:center;",
                                   "100"
                               ))),hr(),
                             fluidRow(
                               h3("经理时间分配(天数)"),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                                   "总时间的百分比"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:11.5%",
                                   "经理"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:11.5%",
                                   "代表1"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:11.5%",
                                   "代表2"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:11.5%",
                                   "代表3"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:11.5%",
                                   "代表4"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:11.5%",
                                   "代表5")
                               ),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "销售培训"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:5%;margin-right:3%",
                                   verbatimTextOutput("total_sales_training")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   verbatimTextOutput("flm_sales_training")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("sr1_sales_training",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("sr2_sales_training",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("sr3_sales_training",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("sr4_sales_training",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("sr5_sales_training",label=NULL))
                               ),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "医院拜访"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:5%;margin-right:3%",
                                   verbatimTextOutput("total_field_work")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   verbatimTextOutput("flm_field_work")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("sr1_field_work",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("sr2_field_work",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("sr3_field_work",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("sr4_field_work",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("sr5_field_work",label=NULL))
                               ),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "团队会议"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:5%;margin-right:3%",
                                   verbatimTextOutput("total_team_meeting")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("flm_team_meeting",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   verbatimTextOutput("sr1_team_meeting")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   verbatimTextOutput("sr2_team_meeting")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   verbatimTextOutput("sr3_team_meeting")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   verbatimTextOutput("sr4_team_meeting")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   verbatimTextOutput("sr5_team_meeting"))
                               ),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "KPI 报告分析"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:5%;margin-right:3%",
                                   verbatimTextOutput("total_kpi_analysis")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("flm_kpi_analysis",label=NULL))
                               ),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "战略和周期计划"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:5%;margin-right:3%",
                                   verbatimTextOutput("total_stategy_planning")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("flm_stategy_planning",label=NULL))
                               ),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "行政工作"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:5%;margin-right:3%",
                                   verbatimTextOutput("total_admin_work")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   textInput("flm_admin_work",label=NULL))
                               ),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "总体"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:5%;margin-right:3%",
                                   verbatimTextOutput("total_management")),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3.5%;width:5%;margin-right:3%",
                                   verbatimTextOutput("flm_management"))
                               )
                             ),br(),
                             fluidRow(
                               h3("销售指标&产品培训"),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;margin-left:15%;text-align:center;width:15%",
                                   "代表1"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "代表2"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "代表3"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "代表4"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "代表5")
                               ),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "销售指标"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                                   textInput("sr1_sales_target",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                                   textInput("sr2_sales_target",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                                   textInput("sr3_sales_target",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                                   textInput("sr4_sales_target",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                                   textInput("sr5_sales_target",label=NULL))
                               ),
                               tags$div(
                                 tags$div(
                                   style="display:inline-block;text-align:center;width:15%",
                                   "产品培训(天)"),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                                   textInput("sr1_product_training",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                                   textInput("sr2_product_training",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                                   textInput("sr3_product_training",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                                   textInput("sr4_product_training",label=NULL)),
                                 tags$div(
                                   style="display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                                   textInput("sr5_product_training",label=NULL))
                               )
                             )
                            ),
                    tabPanel("Phase2"),
                    tabPanel("Phase3"),
                    tabPanel("Phase4"))
                  )))),
  server=function(input,output){
## phase 1    
    output$total_promotional_budget <- renderPrint("待计算")
    output$arranged_promotional_budget <- renderPrint("待计算")
    output$arranged_time_of_sr1 <- renderPrint("待计算")
    output$arranged_time_of_sr2 <- renderPrint("待计算")
    output$arranged_time_of_sr3 <- renderPrint("待计算")
    output$arranged_time_of_sr4 <- renderPrint("待计算")
    output$arranged_time_of_sr5 <- renderPrint("待计算")
    output$potential_hosp1_1 <- renderPrint("待计算")
    output$potential_hosp1_2 <- renderPrint("待计算")
    output$potential_hosp1_3 <- renderPrint("待计算")
    output$potential_hosp1_4 <- renderPrint("待计算")
    output$current_sales_hosp1_1 <- renderPrint("待计算")
    output$current_sales_hosp1_2 <- renderPrint("待计算")
    output$current_sales_hosp1_3 <- renderPrint("待计算")
    output$current_sales_hosp1_4 <- renderPrint("待计算")
    output$hosp1_worktime_1 <- renderPrint("待计算")
    output$hosp1_worktime_2 <- renderPrint("待计算")
    output$hosp1_worktime_3 <- renderPrint("待计算")
    output$hosp1_worktime_4 <- renderPrint("待计算")
    output$hosp1_worktime_1_doc <- renderPrint("待计算")
    output$hosp1_worktime_1_diet <- renderPrint("待计算")
    output$hosp1_worktime_1_admin <- renderPrint("待计算")
    output$hosp1_worktime_1_nurs <- renderPrint("待计算")
    output$decison1_summary_1 <- renderPrint("待计算")
    
    output$total_sales_training <- renderPrint(as.numeric(input$sr1_sales_training)+
                                                 as.numeric(input$sr2_sales_training)+
                                                 as.numeric(input$sr3_sales_training)+
                                                 as.numeric(input$sr4_sales_training)+
                                                 as.numeric(input$sr1_sales_training))
    
    output$flm_sales_training <- renderPrint(as.numeric(input$sr1_sales_training)+
                                               as.numeric(input$sr2_sales_training)+
                                               as.numeric(input$sr3_sales_training)+
                                               as.numeric(input$sr4_sales_training)+
                                               as.numeric(input$sr1_sales_training))
    
    output$total_field_work <- renderPrint(as.numeric(input$sr1_field_work)+
                                                 as.numeric(input$sr2_field_work)+
                                                 as.numeric(input$sr3_field_work)+
                                                 as.numeric(input$sr4_field_work)+
                                                 as.numeric(input$sr5_field_work))
    
    output$flm_field_work <- renderPrint(as.numeric(input$sr1_field_work)+
                                               as.numeric(input$sr2_field_work)+
                                               as.numeric(input$sr3_field_work)+
                                               as.numeric(input$sr4_field_work)+
                                               as.numeric(input$sr5_field_work))
    
    output$total_team_meeting <- renderPrint(as.numeric(input$flm_team_meeting))
    output$sr1_team_meeting <- renderPrint(as.numeric(input$flm_team_meeting))
    output$sr3_team_meeting <- renderPrint(as.numeric(input$flm_team_meeting))
    output$sr3_team_meeting <- renderPrint(as.numeric(input$flm_team_meeting))
    output$sr4_team_meeting <- renderPrint(as.numeric(input$flm_team_meeting))
    output$sr5_team_meeting <- renderPrint(as.numeric(input$flm_team_meeting))
    
    output$total_kpi_analysis <- renderPrint(as.numeric(input$flm_kpi_analysis))
    output$total_strategy_planning <- renderPrint(as.numeric(input$flm_strategy_planning))
    output$total_admin_work <- renderPrint(as.numeric(input$admin_work))
    # output$total_management_time <- renderPrint(as.numeric(input$flm_sales_training)+
    #                                               as.numeric(input$flm_field_work)+
    #                                               as.numeric(input$flm_team_meeting)+
    #                                               as.numeric(input$flm_kpi_analysis))
    
    output$potential_hosp1_4 <- renderPrint("待计算")
    output$potential_hosp1_5 <- renderPrint("待计算")
    output$potential_hosp1_3 <- renderPrint("待计算")
    output$potential_hosp1_4 <- renderPrint("待计算")
    output$potential_hosp1_5 <- renderPrint("待计算")
    output$potential_hosp1_3 <- renderPrint("待计算")
    output$potential_hosp1_4 <- renderPrint("待计算")
    output$potential_hosp1_5 <- renderPrint("待计算")
    
    
    
  })
