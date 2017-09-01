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
          tabPanel("Phase1",
                   actionButton("decision1_phase1_calculator", "calculator"),
                   actionButton("decision1_phase1_submit", "submit"),
                   fluidRow(
                     h3("总推广预算"),
                     tags$div(
                       tags$div(style = "display:inline-block;width:150px;margin-left:10px;",
                                "总推广预算"),
                       tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                                verbatimTextOutput("p1_total_promotional_budget"))
                     ),
                     tags$div(
                       tags$div(style = "display:inline-block;width:150px;margin-left:10px;",
                                "已分配的推广预算"),
                       tags$div(
                         style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p1_arranged_promotional_budget")
                       )
                     )
                   ),
                   fluidRow(
                     h3("时间分配"),
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:10px;",
                                "时间分配 销售代表1"),
                       tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                                verbatimTextOutput("p1_arranged_time_of_sr1"))
                     ),
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:10px;",
                                "时间分配 销售代表2"),
                       tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                                verbatimTextOutput("p1_arranged_time_of_sr2"))
                     ),
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:10px;",
                                "时间分配 销售代表3"),
                       tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                                verbatimTextOutput("p1_arranged_time_of_sr3"))
                     ),
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:10px;",
                                "时间分配 销售代表4"),
                       tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                                verbatimTextOutput("p1_arranged_time_of_sr4"))
                     ),
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:10px;",
                                "时间分配 销售代表5"),
                       tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                                verbatimTextOutput("p1_arranged_time_of_sr5"))
                     )
                   ),
                   
                   fluidRow(
                     h3("决策-医院1"),
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                                "product1"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product2"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product3"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product4")
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product1$hospital1)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital1)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital1)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital1)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp1_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp1_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp1_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp1_4", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_promotional_budget_hosp1", 
                                          label = NULL,
                                          value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital1)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product2$hospital1)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product3$hospital1)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product4$hospital1)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp1_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp1_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp1_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp1_sales_target_4",label = NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         selectizeInput(
                           "p1_sr_hosp1",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp1_worktime_1",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp1_worktime_2",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp1_worktime_3",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp1_worktime_4",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 医生(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp1_worktime_doc",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 营养师(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp1_worktime_diet",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 行政(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp1_worktime_admin",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 护士(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp1_worktime_nurs",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                verbatimTextOutput("p1_decison1_summary_hosp1"))
                     )
                     
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院2"),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                                "product1"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product2"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product3"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product4")
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product1$hospital2)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital2)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product3$hospital2)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product4$hospital2)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp2_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp2_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp2_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp2_4", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_promotional_budget_hosp2", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital2)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product2$hospital2)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product3$hospital2)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product4$hospital2)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp2_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp2_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp2_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp2_sales_target_4",label = NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         selectizeInput(
                           "p1_sr_hosp2",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp2_worktime_1",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp2_worktime_2",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp2_worktime_3",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp2_worktime_4",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 医生(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp2_worktime_doc",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 营养师(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp2_worktime_diet",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 行政(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp2_worktime_admin",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 护士(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp2_worktime_nurs",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                verbatimTextOutput("p1_decison1_summary_hosp2"))
                     )
                     
                   ),
                   fluidRow(
                     h3("决策-医院3"),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                                "product1"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product2"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product3"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product4")
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product1$hospital3)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital3)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product3$hospital3)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product4$hospital3)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp3_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp3_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp3_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp3_4", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_promotional_budget_hosp3", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital3)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product2$hospital3)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital3)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital3)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp3_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp3_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp3_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp3_sales_target_4",label = NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         selectizeInput(
                           "p1_sr_hosp3",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp3_worktime_1",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp3_worktime_2",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp3_worktime_3",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp3_worktime_4",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 医生(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp3_worktime_doc",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 营养师(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp3_worktime_diet",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 行政(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp3_worktime_admin",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 护士(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp3_worktime_nurs",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                verbatimTextOutput("p1_decison1_summary_hosp3"))
                     )
                     
                   ),
                   fluidRow(
                     h3("决策-医院4"),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                                "product1"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product2"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product3"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product4")
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product1$hospital4)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital4)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product3$hospital4)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product4$hospital4)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp4_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp4_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp4_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp4_4", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_promotional_budget_hosp4", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital4)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product2$hospital4)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product3$hospital4)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product4$hospital4)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp4_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp4_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp4_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp4_sales_target_4",label = NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         selectizeInput(
                           "p1_sr_hosp4",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp4_worktime_1",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp4_worktime_2",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp4_worktime_3",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp4_worktime_4",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 医生(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp4_worktime_doc",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 营养师(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp4_worktime_diet",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 行政(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp4_worktime_admin",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 护士(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp4_worktime_nurs",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                verbatimTextOutput("p1_decison1_summary_hosp4"))
                     )
                     
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院5"),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                                "product1"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product2"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product3"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product4")
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product1$hospital5)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital5)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product3$hospital5)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product4$hospital5)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp5_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp5_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp5_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp5_4", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_promotional_budget_hosp5", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital5)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product2$hospital5)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product3$hospital5)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product4$hospital5)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp5_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp5_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp5_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp5_sales_target_4",label = NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         selectizeInput(
                           "p1_sr_hosp5",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp5_worktime_1",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp5_worktime_2",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp5_worktime_3",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp5_worktime_4",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 医生(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp5_worktime_doc",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 营养师(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp5_worktime_diet",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 行政(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp5_worktime_admin",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 护士(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp5_worktime_nurs",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                verbatimTextOutput("p1_decison1_summary_hosp5"))
                     )
                     
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院6"),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                                "product1"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product2"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product3"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product4")
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product1$hospital6)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital6)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product3$hospital6)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product4$hospital6)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp6_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp6_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp6_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp6_4", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_promotional_budget_hosp6", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital6)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product2$hospital6)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product3$hospital6)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product4$hospital6)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp6_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp6_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp6_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp6_sales_target_4",label = NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         selectizeInput(
                           "p1_sr_hosp6",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp6_worktime_1",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp6_worktime_2",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp6_worktime_3",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp6_worktime_4",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 医生(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp6_worktime_doc",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 营养师(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp6_worktime_diet",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 行政(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp6_worktime_admin",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 护士(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp6_worktime_nurs",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                verbatimTextOutput("p1_decison1_summary_hosp6"))
                     )
                     
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院7"),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                                "product1"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product2"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product3"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product4")
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product1$hospital7)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital7)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product3$hospital7)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product4$hospital7)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp7_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp7_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp7_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp7_4", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_promotional_budget_hosp7", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital7)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product2$hospital7)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product3$hospital7)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product4$hospital7)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp7_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp7_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp7_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp7_sales_target_4",label = NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         selectizeInput(
                           "p1_sr_hosp7",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp7_worktime_1",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp7_worktime_2",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp7_worktime_3",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp7_worktime_4",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 医生(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp7_worktime_doc",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 营养师(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp7_worktime_diet",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 行政(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp7_worktime_admin",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 护士(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp7_worktime_nurs",
                           label = NULL,
                           value = 6,
                           min = 0,
                           max = 100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                verbatimTextOutput("p1_decison1_summary_hosp7"))
                     )
                     
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院8"),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                                "product1"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product2"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product3"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product4")
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product1$hospital8)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital8)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product3$hospital8)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product4$hospital8)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp8_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp8_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp8_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp8_4", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_promotional_budget_hosp8", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital8)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product2$hospital8)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product3$hospital8)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product4$hospital8)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp8_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp8_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp8_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp8_sales_target_4",label = NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         selectizeInput(
                           "p1_sr_hosp8",
                           label = NULL,
                           choices = available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp8_worktime_1",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp8_worktime_2",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp8_worktime_3",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp8_worktime_4",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 医生(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp8_worktime_doc",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 营养师(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp8_worktime_diet",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 行政(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp8_worktime_admin",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 护士(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp8_worktime_nurs",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                verbatimTextOutput("p1_decison1_summary_hosp8"))
                     )
                     
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院9"),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                                "product1"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product2"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product3"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product4")
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product1$hospital9)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital9)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product3$hospital9)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product4$hospital9)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp9_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp9_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp9_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp9_4", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "推广预算分配(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_promotional_budget_hosp9", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital9)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product2$hospital9)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product3$hospital9)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product4$hospital9)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp9_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp9_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp9_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp9_sales_target_4",label = NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         selectizeInput(
                           "p1_sr_hosp9",
                           label =
                             NULL,
                           choices =
                             available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp9_worktime_1",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp9_worktime_2",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp9_worktime_3",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp9_worktime_4",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 医生(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp9_worktime_doc",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 营养师(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp9_worktime_diet",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 行政(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp9_worktime_admin",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 护士(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp9_worktime_nurs",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                verbatimTextOutput("p1_decison1_summary_hosp9"))
                     )
                     
                   ),
                   br(),
                   fluidRow(
                     h3("决策-医院10"),
                     
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                                "product1"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product2"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product3"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "product4")
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "客户潜力"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product1$hospital10)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product2$hospital10)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product3$hospital10)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (potential_sales_product4$hospital10)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "折扣(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp10_1", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp10_2", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp10_3", label =
                                            NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_discount_hosp10_4", label =
                                            NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "推广预算分配(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         textInput("p1_promotional_budget_hosp10", label =
                                     NULL, value="5")
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "目前的销售情况"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product1$hospital10)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product2$hospital10)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product3$hospital10)$phase1),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                (current_sales_product4$hospital10)$phase1)
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售指标"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp10_sales_target_1",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp10_sales_target_2",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp10_sales_target_3",label = NULL, value="5")),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                textInput("p1_hosp10_sales_target_4",label = NULL, value="5"))
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "销售代表"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         selectizeInput(
                           "p1_sr_hosp10",
                           label =
                             NULL,
                           choices =
                             available_srs,
                           selected = NULL
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "代表的客户工作时间(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp10_worktime_1",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp10_worktime_2",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp10_worktime_3",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       ),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp10_worktime_4",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 医生(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp10_worktime_doc",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 营养师(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp10_worktime_diet",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 行政(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp10_worktime_admin",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "时间被分配到 护士(%)"),
                       tags$div(
                         style = "display:inline-block;width:18%;text-align:center",
                         numericInput(
                           "p1_hosp10_worktime_nurs",
                           label =
                             NULL,
                           value =
                             6,
                           min =
                             0,
                           max =
                             100
                         )
                       )
                     ),
                     br(),
                     tags$div(
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                "总体(%)"),
                       tags$div(style = "display:inline-block;width:18%;text-align:center",
                                verbatimTextOutput("p1_decison1_summary_hosp10"))
                     )
                     
                   )
          ),
          tabPanel(
            "Phase2",
            actionButton("decision1_phase2_calculator", "calculator"),
            actionButton("decision1_phase2_submit", "submit"),
            fluidRow(
              h3("总推广预算"),
              tags$div(
                tags$div(style = "display:inline-block;width:150px;margin-left:10px;",
                         "总推广预算"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p2_total_promotional_budget"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:150px;margin-left:10px;",
                         "已分配的推广预算"),
                tags$div(
                  style = "display:inline-block;width:300px;margin-left:50px;",
                  verbatimTextOutput("p2_arranged_promotional_budget")
                )
              )
            ),
            fluidRow(
              h3("时间分配"),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表1"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p2_arranged_time_of_sr1"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表2"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p2_arranged_time_of_sr2"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表3"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p2_arranged_time_of_sr3"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表4"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p2_arranged_time_of_sr4"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表5"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p2_arranged_time_of_sr5"))
              )
            ),
            
            fluidRow(
              h3("决策-医院1"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital1)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital1)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital1)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital1)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp1_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp1_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp1_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp1_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_promotional_budget_hosp1", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital1)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital1)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital1)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital1)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp1_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp1_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp1_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp1_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p2_sr_hosp1",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp1_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp1_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp1_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp1_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp1_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp1_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp1_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp1_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p2_decison1_summary_hosp1"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院2"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital2)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital2)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital2)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital2)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital2)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital2)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital2)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital2)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp2_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp2_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp2_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp2_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp2_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp2_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp2_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp2_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_promotional_budget_hosp2", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p2_sr_hosp2",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp2_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp2_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp2_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp2_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp2_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp2_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp2_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp2_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p2_decison1_summary_hosp2"))
              )
              
            ),
            fluidRow(
              h3("决策-医院3"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital3)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital3)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital3)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital3)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp3_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp3_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp3_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp3_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_promotional_budget_hosp3", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital3)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital3)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital3)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital3)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp3_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp3_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp3_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp3_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p2_sr_hosp3",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp3_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp3_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp3_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp3_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp3_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp3_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp3_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp3_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p2_decison1_summary_hosp3"))
              )
              
            ),
            fluidRow(
              h3("决策-医院4"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital4)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital4)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital4)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital4)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp4_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp4_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp4_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp4_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_promotional_budget_hosp4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital4)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital4)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital4)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital4)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp4_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp4_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp4_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp4_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p2_sr_hosp4",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp4_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp4_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp4_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp4_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp4_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp4_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp4_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp4_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p2_decison1_summary_hosp4"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院5"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital5)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital5)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital5)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital5)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp5_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp5_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp5_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp5_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_promotional_budget_hosp5", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital5)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital5)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital5)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital5)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp5_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp5_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp5_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp5_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p2_sr_hosp5",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp5_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp5_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp5_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp5_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp5_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp5_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp5_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp5_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p2_decison1_summary_hosp5"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院6"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital6)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital6)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital6)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital6)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp6_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp6_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp6_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp6_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_promotional_budget_hosp6", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital6)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital6)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital6)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital6)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp6_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp6_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp6_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp6_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p2_sr_hosp6",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp6_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp6_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp6_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp6_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp6_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp6_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp6_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp6_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p2_decison1_summary_hosp6"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院7"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital7)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital7)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital7)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital7)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp7_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp7_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp7_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp7_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_promotional_budget_hosp7", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital7)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital7)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital7)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital7)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp7_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp7_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp7_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp7_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p2_sr_hosp7",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp7_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp7_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp7_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp7_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp7_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp7_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp7_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp7_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p2_decison1_summary_hosp7"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院8"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital8)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital8)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital8)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital8)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp8_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp8_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp8_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp8_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_promotional_budget_hosp8", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital8)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital8)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital8)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital8)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp8_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp8_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp8_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp8_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p2_sr_hosp8",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp8_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp8_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp8_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp8_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp8_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp8_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp8_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp8_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p2_decison1_summary_hosp8"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院9"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital9)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital9)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital9)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital9)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp9_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp9_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp9_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp9_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_promotional_budget_hosp9", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital9)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital9)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital9)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital9)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp9_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp9_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp9_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp9_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p2_sr_hosp9",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp9_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp9_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp9_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp9_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp9_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp9_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp9_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp9_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p2_decison1_summary_hosp9"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院10"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital10)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital10)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital10)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital10)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp10_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp10_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp10_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_discount_hosp10_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  textInput("p2_promotional_budget_hosp10", label =
                              NULL)
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital10)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital10)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital10)$phase2),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital10)$phase2)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp10_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp10_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp10_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p2_hosp10_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p2_sr_hosp10",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp10_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp10_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp10_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp10_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp10_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp10_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp10_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p2_hosp10_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p2_decison1_summary_hosp10"))
              )
              
            )
          ),
          tabPanel(
            "Phase3",
            actionButton("decision1_phase3_calculator", "calculator"),
            actionButton("decision1_phase3_submit", "submit"),
            fluidRow(
              h3("总推广预算"),
              tags$div(
                tags$div(style = "display:inline-block;width:150px;margin-left:10px;",
                         "总推广预算"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p3_total_promotional_budget"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:150px;margin-left:10px;",
                         "已分配的推广预算"),
                tags$div(
                  style = "display:inline-block;width:300px;margin-left:50px;",
                  verbatimTextOutput("p3_arranged_promotional_budget")
                )
              )
            ),
            fluidRow(
              h3("时间分配"),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表1"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p3_arranged_time_of_sr1"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表2"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p3_arranged_time_of_sr2"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表3"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p3_arranged_time_of_sr3"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表4"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p3_arranged_time_of_sr4"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表5"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p3_arranged_time_of_sr5"))
              )
            ),
            
            fluidRow(
              h3("决策-医院1"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital1)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital1)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital1)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital1)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp1_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp1_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp1_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp1_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_promotional_budget_hosp1", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital1)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital1)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital1)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital1)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp1_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp1_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp1_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp1_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p3_sr_hosp1",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp1_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp1_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp1_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp1_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp1_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp1_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp1_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp1_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p3_decison1_summary_hosp1"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院2"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital2)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital2)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital2)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital2)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital2)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital2)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital2)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital2)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp2_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp2_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp2_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp2_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp2_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp2_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp2_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp2_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_promotional_budget_hosp2", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p3_sr_hosp2",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp2_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp2_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp2_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp2_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp2_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp2_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp2_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp2_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p3_decison1_summary_hosp2"))
              )
              
            ),
            fluidRow(
              h3("决策-医院3"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital3)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital3)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital3)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital3)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp3_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp3_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp3_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp3_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_promotional_budget_hosp3", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital3)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital3)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital3)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital3)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp3_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp3_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp3_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp3_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p3_sr_hosp3",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp3_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp3_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp3_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp3_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp3_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp3_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp3_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp3_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p3_decison1_summary_hosp3"))
              )
              
            ),
            fluidRow(
              h3("决策-医院4"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital4)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital4)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital4)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital4)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp4_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp4_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp4_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp4_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_promotional_budget_hosp4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital4)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital4)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital4)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital4)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp4_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp4_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp4_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp4_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p3_sr_hosp4",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp4_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp4_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp4_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp4_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp4_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp4_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp4_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp4_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p3_decison1_summary_hosp4"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院5"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital5)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital5)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital5)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital5)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp5_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp5_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp5_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp5_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_promotional_budget_hosp5", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital5)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital5)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital5)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital5)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp5_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp5_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp5_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp5_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p3_sr_hosp5",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp5_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp5_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp5_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp5_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp5_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp5_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp5_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp5_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p3_decison1_summary_hosp5"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院6"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital6)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital6)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital6)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital6)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp6_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp6_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp6_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp6_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_promotional_budget_hosp6", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital6)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital6)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital6)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital6)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp6_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp6_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp6_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp6_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p3_sr_hosp6",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp6_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp6_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp6_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp6_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp6_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp6_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp6_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp6_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p3_decison1_summary_hosp6"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院7"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital7)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital7)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital7)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital7)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp7_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp7_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp7_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp7_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_promotional_budget_hosp7", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital7)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital7)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital7)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital7)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp7_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp7_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp7_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp7_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p3_sr_hosp7",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp7_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp7_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp7_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp7_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp7_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp7_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp7_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp7_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p3_decison1_summary_hosp7"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院8"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital8)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital8)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital8)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital8)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp8_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp8_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp8_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp8_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_promotional_budget_hosp8", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital8)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital8)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital8)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital8)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp8_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp8_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp8_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp8_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p3_sr_hosp8",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp8_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp8_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp8_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp8_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp8_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp8_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp8_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp8_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p3_decison1_summary_hosp8"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院9"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital9)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital9)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital9)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital9)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp9_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp9_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp9_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp9_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_promotional_budget_hosp9", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital9)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital9)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital9)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital9)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp9_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp9_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp9_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp9_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p3_sr_hosp9",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp9_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp9_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp9_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp9_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp9_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp9_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp9_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp9_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p3_decison1_summary_hosp9"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院10"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital10)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital10)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital10)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital10)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp10_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp10_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp10_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_discount_hosp10_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  textInput("p3_promotional_budget_hosp10", label =
                              NULL)
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital10)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital10)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital10)$phase3),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital10)$phase3)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp10_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp10_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp10_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p3_hosp10_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p3_sr_hosp10",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp10_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp10_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp10_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp10_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp10_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp10_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp10_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p3_hosp10_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p3_decison1_summary_hosp10"))
              )
              
            )
          ),
          tabPanel(
            "Phase4",
            actionButton("decision1_phase4_calculator", "calculator"),
            actionButton("decision1_phase4_submit", "submit"),
            fluidRow(
              h3("总推广预算"),
              tags$div(
                tags$div(style = "display:inline-block;width:150px;margin-left:10px;",
                         "总推广预算"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p4_total_promotional_budget"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;width:150px;margin-left:10px;",
                         "已分配的推广预算"),
                tags$div(
                  style = "display:inline-block;width:300px;margin-left:50px;",
                  verbatimTextOutput("p4_arranged_promotional_budget")
                )
              )
            ),
            fluidRow(
              h3("时间分配"),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表1"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p4_arranged_time_of_sr1"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表2"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p4_arranged_time_of_sr2"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表3"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p4_arranged_time_of_sr3"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表4"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p4_arranged_time_of_sr4"))
              ),
              tags$div(
                tags$div(style = "display:inline-block;margin-left:10px;",
                         "时间分配 销售代表5"),
                tags$div(style = "display:inline-block;width:300px;margin-left:50px;",
                         verbatimTextOutput("p4_arranged_time_of_sr5"))
              )
            ),
            
            fluidRow(
              h3("决策-医院1"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital1)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital1)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital1)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital1)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp1_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp1_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp1_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp1_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_promotional_budget_hosp1", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital1)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital1)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital1)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital1)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp1_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp1_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp1_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp1_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p4_sr_hosp1",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp1_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp1_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp1_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp1_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp1_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp1_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp1_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp1_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p4_decison1_summary_hosp1"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院2"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital2)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital2)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital2)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital2)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital2)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital2)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital2)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital2)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp2_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp2_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp2_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp2_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp2_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp2_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp2_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp2_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_promotional_budget_hosp2", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p4_sr_hosp2",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp2_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp2_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp2_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp2_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp2_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp2_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp2_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp2_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p4_decison1_summary_hosp2"))
              )
              
            ),
            fluidRow(
              h3("决策-医院3"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital3)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital3)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital3)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital3)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp3_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp3_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp3_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp3_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_promotional_budget_hosp3", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital3)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital3)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital3)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital3)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp3_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp3_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp3_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp3_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p4_sr_hosp3",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp3_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp3_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp3_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp3_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp3_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp3_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp3_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp3_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p4_decison1_summary_hosp3"))
              )
              
            ),
            fluidRow(
              h3("决策-医院4"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital4)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital4)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital4)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital4)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp4_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp4_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp4_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp4_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_promotional_budget_hosp4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital4)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital4)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital4)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital4)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp4_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp4_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp4_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp4_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p4_sr_hosp4",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp4_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp4_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp4_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp4_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp4_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp4_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp4_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp4_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p4_decison1_summary_hosp4"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院5"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital5)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital5)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital5)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital5)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp5_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp5_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp5_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp5_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_promotional_budget_hosp5", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital5)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital5)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital5)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital5)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp5_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp5_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp5_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp5_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p4_sr_hosp5",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp5_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp5_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp5_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp5_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp5_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp5_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp5_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp5_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p4_decison1_summary_hosp5"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院6"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital6)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital6)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital6)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital6)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp6_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp6_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp6_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp6_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_promotional_budget_hosp6", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital6)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital6)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital6)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital6)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp6_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp6_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp6_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp6_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p4_sr_hosp6",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp6_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp6_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp6_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp6_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp6_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp6_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp6_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp6_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p4_decison1_summary_hosp6"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院7"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital7)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital7)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital7)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital7)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp7_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp7_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp7_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp7_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_promotional_budget_hosp7", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital7)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital7)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital7)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital7)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp7_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp7_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp7_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp7_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p4_sr_hosp7",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp7_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp7_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp7_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp7_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp7_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp7_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp7_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp7_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p4_decison1_summary_hosp7"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院8"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital8)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital8)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital8)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital8)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp8_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp8_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp8_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp8_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_promotional_budget_hosp8", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital8)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital8)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital8)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital8)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp8_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp8_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp8_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp8_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p4_sr_hosp8",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp8_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp8_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp8_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp8_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp8_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp8_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp8_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp8_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p4_decison1_summary_hosp8"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院9"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital9)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital9)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital9)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital9)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp9_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp9_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp9_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp9_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_promotional_budget_hosp9", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital9)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital9)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital9)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital9)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp9_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp9_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp9_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp9_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p4_sr_hosp9",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp9_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp9_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp9_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp9_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp9_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp9_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp9_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp9_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p4_decison1_summary_hosp9"))
              )
              
            ),
            br(),
            fluidRow(
              h3("决策-医院10"),
              
              tags$div(
                tags$div(style = "display:inline-block;margin-left:18%;width:18%;text-align:center",
                         "product1"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product2"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product3"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "product4")
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "客户潜力"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product1$hospital10)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product2$hospital10)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product3$hospital10)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (potential_sales_product4$hospital10)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "折扣(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp10_1", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp10_2", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp10_3", label =
                                     NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_discount_hosp10_4", label =
                                     NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "推广预算分配(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  textInput("p4_promotional_budget_hosp10", label =
                              NULL)
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "目前的销售情况"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product1$hospital10)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product2$hospital10)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product3$hospital10)$phase4),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         (current_sales_product4$hospital10)$phase4)
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售指标"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp10_sales_target_1",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp10_sales_target_2",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp10_sales_target_3",label = NULL)),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         textInput("p4_hosp10_sales_target_4",label = NULL))
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "销售代表"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  selectizeInput(
                    "p4_sr_hosp10",
                    label =
                      NULL,
                    choices =
                      available_srs,
                    selected = NULL
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "代表的客户工作时间(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp10_worktime_1",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp10_worktime_2",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp10_worktime_3",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                ),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp10_worktime_4",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 医生(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp10_worktime_doc",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 营养师(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp10_worktime_diet",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 行政(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp10_worktime_admin",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "时间被分配到 护士(%)"),
                tags$div(
                  style = "display:inline-block;width:18%;text-align:center",
                  numericInput(
                    "p4_hosp10_worktime_nurs",
                    label =
                      NULL,
                    value =
                      NULL,
                    min =
                      0,
                    max =
                      100
                  )
                )
              ),
              br(),
              tags$div(
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         "总体(%)"),
                tags$div(style = "display:inline-block;width:18%;text-align:center",
                         verbatimTextOutput("p4_decison1_summary_hosp10"))
              )
              
            )
          )
        )
      ),
      tabItem(
        tabName = "decision2",
        tabsetPanel(
          tabPanel(
            "Phase1",
            actionButton("decision2_phase1_submit", "submit"),
            actionButton('save_inputs', 'Save inputs'),
            fluidRow(h3("时间分配"),
                     tags$div(
                       tags$div(style = "display:inline-block;text-align:center;width:15%",
                                "时间分配(天)"),
                       tags$div(style = "display:inline-block;width:40%;text-align:center;",
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
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "KPI 报告分析"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_total_kpi_analysis")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p1_flm_kpi_analysis", label =
                                     NULL,value=5))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "战略和周期计划"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_total_strategy_planning")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p1_flm_strategy_planning", label =
                                     NULL,value=5))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "行政工作"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p1_total_admin_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p1_flm_admin_work", label =
                                     NULL,value=5))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:15%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表5")
              ),
              # tags$div(
              #   tags$div(style = "display:inline-block;text-align:center;width:15%",
              #            "销售指标"),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p1_sr1_sales_target", label =
              #                        NULL,value=5)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p1_sr2_sales_target", label =
              #                        NULL,value=5)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p1_sr3_sales_target", label =
              #                        NULL,value=5)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p1_sr4_sales_target", label =
              #                        NULL,value=5)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p1_sr5_sales_target", label =
              #                        NULL,value=5))
              # ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "产品培训(天)"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p1_sr1_product_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p1_sr2_product_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p1_sr3_product_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p1_sr4_product_training", label =
                                     NULL,value=5)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p1_sr5_product_training", label =
                                     NULL,value=5))
              )
            )
          ),
          tabPanel(
            "Phase2",
            fluidRow(h3("时间分配"),
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:10px;width:40%;text-align:center;",
                                "时间分配(天)"),
                       tags$div(style = "display:inline-block;width:40%;text-align:center;",
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
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "KPI 报告分析"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_total_kpi_analysis")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p2_flm_kpi_analysis", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "战略和周期计划"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_total_stategy_planning")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p2_p2_flm_stategy_planning", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "行政工作"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p2_total_admin_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p2_flm_admin_work", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:15%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表5")
              ),
              # tags$div(
              #   tags$div(style = "display:inline-block;text-align:center;width:15%",
              #            "销售指标"),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p2_sr1_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p2_sr2_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p2_sr3_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p2_sr4_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p2_sr5_sales_target", label =
              #                        NULL))
              # ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "产品培训(天)"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p2_sr1_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p2_sr2_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p2_sr3_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p2_sr4_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p2_sr5_product_training", label =
                                     NULL))
              )
            )
          ),
          tabPanel(
            "Phase3",
            fluidRow(h3("时间分配"),
                     tags$div(
                       tags$div(style = "display:inline-block;margin-left:10px;width:40%;text-align:center;",
                                "时间分配(天)"),
                       tags$div(style = "display:inline-block;width:40%;text-align:center;",
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
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "KPI 报告分析"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_total_kpi_analysis")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p3_flm_kpi_analysis", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "战略和周期计划"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_total_stategy_planning")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p3_p3_flm_stategy_planning", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "行政工作"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p3_total_admin_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p3_flm_admin_work", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:15%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表5")
              ),
              # tags$div(
              #   tags$div(style = "display:inline-block;text-align:center;width:15%",
              #            "销售指标"),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p3_sr1_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p3_sr2_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p3_sr3_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p3_sr4_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p3_sr5_sales_target", label =
              #                        NULL))
              # ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "产品培训(天)"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p3_sr1_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p3_sr2_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p3_sr3_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p3_sr4_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p3_sr5_product_training", label =
                                     NULL))
              )
            )
          ),
          tabPanel(
            "Phase4",
            fluidRow(h3("时间分配"),
                     tags$div(
                       tags$div(style = "display:inline-block;text-align:center;width:15%",
                                "时间分配(天)"),
                       tags$div(style = "display:inline-block;width:40%;text-align:center;",
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
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "KPI 报告分析"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_total_kpi_analysis")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p4_flm_kpi_analysis", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "战略和周期计划"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_total_stategy_planning")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p4_p4_flm_stategy_planning", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "行政工作"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                         verbatimTextOutput("p4_total_admin_work")),
                tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                         textInput("p4_flm_admin_work", label =
                                     NULL))
              ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
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
                tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:15%",
                         "代表1"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表2"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表3"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表4"),
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "代表5")
              ),
              # tags$div(
              #   tags$div(style = "display:inline-block;text-align:center;width:15%",
              #            "销售指标"),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p4_sr1_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p4_sr2_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p4_sr3_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p4_sr4_sales_target", label =
              #                        NULL)),
              #   tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
              #            textInput("p4_sr5_sales_target", label =
              #                        NULL))
              # ),
              tags$div(
                tags$div(style = "display:inline-block;text-align:center;width:15%",
                         "产品培训(天)"),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p4_sr1_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p4_sr2_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p4_sr3_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
                         textInput("p4_sr4_product_training", label =
                                     NULL)),
                tags$div(style = "display:inline-block;text-align:center;margin-left:3%;width:9%;margin-right:3%",
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
                tabPanel("Phase1",
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "代表报告"),
                           fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                             "职员成本"),
                                    tableOutput("p1_report1_1")),
                           fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                             "时间分配"),
                                    tableOutput("p1_report1_2")),
                           fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                             "产品知识"),
                                    tableOutput("p1_report1_3")),
                           fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                             "经验"),
                                    tableOutput("p1_report1_4")),
                           fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                             "销售技巧"),
                                    tableOutput("p1_report1_5")),
                           fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                             "动力值"),
                                    tableOutput("p1_report1_6"))),
                         br(),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "经理报告"),
                                  fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                                    "职员成本"),
                                           tableOutput("p1_report2_1")),
                                  fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                                    "时间分配"),
                                           tableOutput("p1_report2_2"))
                                  ),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "分配报告"),
                                  fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                                    "医院"),
                                           tableOutput("p1_report3"))
                                  # fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                  #                   "医院1"),
                                  #          tableOutput("p1_report3_1")),
                                  # fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                  #                   "医院2"),
                                  #          tableOutput("p1_report3_2")),
                                  # fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                  #                   "医院3"),
                                  #          tableOutput("p1_report3_3")),
                                  # fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                  #                   "医院4"),
                                  #          tableOutput("p1_report3_4")),
                                  # fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                  #                   "医院5"),
                                  #          tableOutput("p1_report3_5")),
                                  # fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                  #                   "医院6"),
                                  #          tableOutput("p1_report3_6")),
                                  # fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                  #                   "医院7"),
                                  #          tableOutput("p1_report3_7")),
                                  # fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                  #                   "医院8"),
                                  #          tableOutput("p1_report3_8")),
                                  # fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                  #                   "医院9"),
                                  #          tableOutput("p1_report3_9")),
                                  # fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                  #                   "医院10"),
                                  #          tableOutput("p1_report3_10"))
                                  ),
                         fluidRow(tags$div(style = "text-align:center;width:100%",
                                           "决策报告"),
                                  fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                                    "总体的分配情况"),
                                           tableOutput("p1_report4_1")),
                                  fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                                    "分级匹配度"),
                                           tableOutput("p1_report4_2")),
                                  fluidRow(tags$div(style = "text-align:left;width:100%;margin-left:3%",
                                                    "决策质量"),
                                           tableOutput("p1_report4_3"))
                                                 )),
                
                tabPanel("Phase2"),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink())),
                tabPanel("Phase3"),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink())),
                tabPanel("Phase4")
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()),
                #          fluidRow(actionLink()))
                ))))),
  
  
         server=function(input, output) {
           
           ##phase1
           
           output$p1_total_promotional_budget <- renderText(
             total_promotional_budget$phase1
           )
           
           
           p1_calculator_result <- eventReactive(input$decision1_phase1_calculator,{
             calculator(input,1)
           })
           
           
           output$p1_arranged_promotional_budget <- renderText(p1_calculator_result()[1]) 
           output$p1_arranged_time_of_sr1 <- renderText(p1_calculator_result()[2])
           output$p1_arranged_time_of_sr2 <- renderText(p1_calculator_result()[3])
           output$p1_arranged_time_of_sr3 <- renderText(p1_calculator_result()[4])
           output$p1_arranged_time_of_sr4 <- renderText(p1_calculator_result()[5])
           output$p1_arranged_time_of_sr5 <- renderText(p1_calculator_result()[6])
           
           
           observeEvent(input$decision1_phase1_submit, {
             disable("p1_discount_hosp1_1")
             disable("p1_discount_hosp1_2")
             output$p1_decison1_summary_hosp1 <- renderText({12})
             output$p1_decison1_summary_hosp2 <- renderText({12})
           })
           
           data1_phase1 <- eventReactive(input$decision1_phase1_submit,{
             get.data1(input,1)
           })
           
           data2_phase1 <- eventReactive(input$decision2_phase1_submit,{
             get.data2(input,1)
             
           })
           
           observeEvent(input$save_inputs,{saveRDS( reactiveValuesToList(input) , file = 'inputs.RDS')})
           
           output$report1_table <- renderDataTable(data1_phase1())
           output$report2_table <- renderDataTable(data2_phase1())
           
           
           output$p1_total_sales_training <-renderText(sales_training(input,1))
           output$p1_flm_sales_training <- renderText(sales_training(input,1))
           output$p1_total_field_work <-renderText(field_work(input,1))
           output$p1_flm_field_work <- renderText(field_work(input,1))
           output$p1_total_team_meeting <- renderText(input$p1_flm_team_meeting)
           output$p1_total_kpi_analysis <- renderText(input$p1_flm_kpi_analysis)
           output$p1_total_strategy_planning <- renderText(input$p1_flm_strategy_planning)
           output$p1_total_admin_work <- renderText(input$p1_flm_admin_work)
           output$p1_total_management <- renderText(total_management(input,phase))
           
           p1_flm_data <- reactive(get.data3(input,1))
           
           
           output$report3_table <- renderDataTable({
             data1<-data1_phase1()
             data2<-data2_phase1()
             calculation(pp_info_by_hosp_product,
                         sr_info_initial_value,
                         data1,
                         data2)
             
             #left_join(data1_phase1(),pp_info_by_hosp_product_new,by=c("hospital","product"))
           })
           
           p1_report <- reactive({
             data1<-get.data1(input,1)
             data2<-get.data2(input,1)
             tmp <- calculation(pp_info_by_hosp_product,
                                sr_info_initial_value,
                                data1,
                                data2)
             flm_data <- get.data3(input,1)
             p1_report <- report_data(tmp,flm_data)})
           
           output$p1_report1_1 <- renderTable(p1_report()$report1_mod1)
           output$p1_report1_2 <- renderTable(p1_report()$report1_mod2)
           output$p1_report1_3 <- renderTable(p1_report()$report1_mod3)
           output$p1_report1_4 <- renderTable(p1_report()$report1_mod4)
           output$p1_report1_5 <- renderTable(p1_report()$report1_mod5)

           output$p1_report2_1 <- renderTable(p1_report()$report2_mod1)
           output$p1_report2_2 <- renderTable(p1_report()$report2_mod2)

           output$p1_report3 <- renderTable(p1_report()$hospital_report)

           output$p1_report4_1 <- renderTable(p1_report()$report4_mod1)
           output$p1_report4_2 <- renderTable(p1_report()$report4_mod2)
           output$p1_report4_3 <- renderTable(p1_report()$report4_mod3)
           
           
           
           
           
           
           
           
         })