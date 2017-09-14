

mainbody <- div(
  
  
  tabItems(
    # First tab content
    tabItem(tabName = "news_and_WAS",
            tabsetPanel(
              tabPanel("客户信息",
                       br(),
                       
                       box(width = 3,
                           title = "周期列表",
                           solidHeader = TRUE, status = "primary",
                           
                           actionButton(inputId="phase1_hospital_info", label="周期1:  客户信息",
                                        style="width:150px"),
                           br(),br(),
                           disabled(actionButton(inputId="phase2_hospital_info", label="周期2:  客户信息",
                                                 style="width:150px")),
                           br(),br(),
                           disabled(actionButton(inputId="phase3_hospital_info", label="周期3:  客户信息",
                                                 style="width:150px")),
                           br(),br(),
                           disabled(actionButton(inputId="phase4_hospital_info", label="周期4:  客户信息",
                                                 style="width:150px"))),
                       
                       div(id="phase1_hospital_info_box",
                           box(width = 8,
                               title = "客户信息",
                               solidHeader = TRUE, status = "primary",
                               dataTableOutput("hospital_info"))),
                       hidden(
                         div(id="phase2_hospital_info_box",
                             box(
                               title = "客户信息",
                               solidHeader = TRUE, status = "primary",
                               "客户信息2"
                             )
                         )),
                       hidden(
                         div(id="phase3_hospital_info_box",
                             box(
                               title = "客户信息",
                               solidHeader = TRUE, status = "primary",
                               "客户信息3"
                               
                             )
                         )),
                       hidden(
                         div(id="phase4_hospital_info_box",
                             box(
                               title = "客户信息",
                               solidHeader = TRUE, status = "primary",
                               "客户信息4"
                               
                             )
                         ))
              ),
              tabPanel("新闻",
                       br(),
                       box(width = 3,
                           title = "周期列表",
                           solidHeader = TRUE, status = "primary",
                           
                           actionButton(inputId="phase1_WAS_info", label="周期1:  新闻快报",
                                        style="width:150px"),
                           br(),br(),
                           disabled(
                             actionButton(inputId="phase2_WAS_info", label="周期2:  新闻快报",
                                          style="width:150px")),
                           br(),br(),
                           disabled(
                             actionButton(inputId="phase3_WAS_info", label="周期3:  新闻快报",
                                          style="width:150px")),
                           br(),br(),
                           disabled(
                             actionButton(inputId="phase4_WAS_info", label="周期4:  新闻快报",
                                          style="width:150px"))),
                       
                       div(id="phase1_WAS_info_box",
                           box(width = 8,
                               title = "新闻快报",
                               solidHeader = TRUE, status = "primary",
                               "新闻快报1")),
                       hidden(
                         div(id="phase2_WAS_info_box",
                             box(width = 8,
                                 title = "新闻快报",
                                 solidHeader = TRUE, status = "primary",
                                 "新闻快报2"
                             )
                         )),
                       hidden(
                         div(id="phase3_WAS_info_box",
                             box(width = 8,
                                 title = "新闻快报",
                                 solidHeader = TRUE, status = "primary",
                                 "新闻快报3"
                             )
                         )),
                       hidden(
                         div(id="phase4_WAS_info_box",
                             box(width = 8,
                                 title = "新闻快报",
                                 solidHeader = TRUE, status = "primary",
                                 "新闻快报4"
                             )
                         ))
              ))),
    
    # First tab content
    tabItem(tabName = "sr",
            box(title = "销售代表介绍",
                solidHeader = TRUE, status = "primary",
                width = 12,
                dataTableOutput("sales_rep_info"))
    ),
    
    # First tab content
    tabItem(tabName = "products",
            box(title = "销售产品介绍",
                solidHeader = TRUE, status = "primary",
                width = 12,
                dataTableOutput("products_info"))
    ),
    
    # First tab content
    tabItem(
      tabName = "decision1",
      tabsetPanel(
        #position = "left",
        
        
        tabPanel("周期1",
                 value="phase1",
                 br(),
                 
                 #fluidRow(
                 # h3("总推广预算"),
                 box(title = "总推广预算",
                     status = "primary",
                     solidHeader = TRUE,
                     width="100%",
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "总推广预算"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                                verbatimTextOutput("p1_total_promotional_budget"))
                     ),
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "已分配的推广预算(%)"),
                       tags$div(
                         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                         verbatimTextOutput("p1_arranged_promotional_budget")
                       )
                     )
                 ),
                 
                 br(),
                 box(
                   title=hospital_info$hospital[1],
                   status = "primary",
                   solidHeader = TRUE,
                   width="100%",
                   
                   #fluidRow(  
                   
                   #h3("决策-医院1"),
                   #h3(hospital_info$hospital[1]),
                   #htmlOutput(),
                   tags$div(
                     tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                              product_info_initial$product[1]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[2]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[3]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[4])
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
                 # fluidRow(
                 #   h3("决策-医院2"),
                 box(
                   title=hospital_info$hospital[2],
                   status = "primary",
                   solidHeader = TRUE,
                   width="100%",
                   tags$div(
                     tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                              product_info_initial$product[1]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[2]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[3]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[4])
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
                 # fluidRow(
                 #   h3("决策-医院3"),
                 box(
                   title=hospital_info$hospital[3],
                   status = "primary",
                   solidHeader = TRUE,
                   width="100%",
                   tags$div(
                     tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                              product_info_initial$product[1]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[2]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[3]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[4])
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
                 # fluidRow(
                 #   h3("决策-医院4"),
                 box(
                   title=hospital_info$hospital[4],
                   status = "primary",
                   solidHeader = TRUE,
                   width="100%",
                   tags$div(
                     tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                              product_info_initial$product[1]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[2]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[3]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[4])
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
                 # fluidRow(
                 #   h3("决策-医院5"),
                 box(
                   title=hospital_info$hospital[5],
                   status = "primary",
                   solidHeader = TRUE,
                   width="100%",
                   tags$div(
                     tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                              product_info_initial$product[1]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[2]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[3]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[4])
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
                 
                 # fluidRow(
                 #   h3("决策-医院6"),
                 box(
                   title=hospital_info$hospital[6],
                   status = "primary",
                   solidHeader = TRUE,
                   width="100%",
                   tags$div(
                     tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                              product_info_initial$product[1]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[2]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[3]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[4])
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
                 # fluidRow(
                 #   h3("决策-医院7"),
                 box(
                   title=hospital_info$hospital[7],
                   status = "primary",
                   solidHeader = TRUE,
                   width="100%",
                   tags$div(
                     tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                              product_info_initial$product[1]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[2]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[3]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[4])
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
                 
                 # fluidRow(
                 #   h3("决策-医院8"),
                 box(
                   title=hospital_info$hospital[8],
                   status = "primary",
                   solidHeader = TRUE,
                   width="100%",
                   tags$div(
                     tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                              product_info_initial$product[1]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[2]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[3]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[4])
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
                 # fluidRow(
                 #   h3("决策-医院9"),
                 box(
                   title=hospital_info$hospital[9],
                   status = "primary",
                   solidHeader = TRUE,
                   width="100%",
                   tags$div(
                     tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                              product_info_initial$product[1]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[2]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[3]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[4])
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
                 
                 # fluidRow(
                 #   h3("决策-医院10"),
                 box(
                   title=hospital_info$hospital[10],
                   status = "primary",
                   solidHeader = TRUE,
                   width="100%",
                   tags$div(
                     tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                              product_info_initial$product[1]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[2]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[3]),
                     tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                              product_info_initial$product[4])
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
          value="phase2",
          
          # fluidRow(
          #   h3("总推广预算"),
          br(),
          hidden(
            div(id="decision1_phase2",
                box(
                  title="总推广预算",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                             "总推广预算"),
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                             verbatimTextOutput("p2_total_promotional_budget"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                             "已分配的推广预算(%)"),
                    tags$div(
                      style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                      verbatimTextOutput("p2_arranged_promotional_budget")
                    )
                  )
                ),
                br(),
                # fluidRow(
                #   h3("决策-医院1"),
                box(
                  title=hospital_info$hospital[1],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院2"),
                box(
                  title=hospital_info$hospital[2],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院3"),
                box(
                  title=hospital_info$hospital[3],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院4"),
                box(
                  title=hospital_info$hospital[4],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院5"),
                box(
                  title=hospital_info$hospital[5],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                
                # fluidRow(
                #   h3("决策-医院6"),
                box(
                  title=hospital_info$hospital[6],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院7"),
                box(
                  title=hospital_info$hospital[7],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                
                # fluidRow(
                #   h3("决策-医院8"),
                box(
                  title=hospital_info$hospital[8],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院9"),
                box(
                  title=hospital_info$hospital[9],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                
                # fluidRow(
                #   h3("决策-医院10"),
                box(
                  title=hospital_info$hospital[10],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
            )
          )),
        tabPanel(
          "周期3",
          
          # fluidRow(
          #   h3("总推广预算"),
          br(),
          hidden(
            div(id="decision1_phase3",
                box(
                  title="总推广预算",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                             "总推广预算"),
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                             verbatimTextOutput("p3_total_promotional_budget"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                             "已分配的推广预算(%)"),
                    tags$div(
                      style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                      verbatimTextOutput("p3_arranged_promotional_budget")
                    )
                  )
                ),
                
                br(),
                # fluidRow(
                #   h3("决策-医院1"),
                box(
                  title=hospital_info$hospital[1],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院2"),
                box(
                  title=hospital_info$hospital[2],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院3"),
                box(
                  title=hospital_info$hospital[3],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院4"),
                box(
                  title=hospital_info$hospital[4],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院5"),
                box(
                  title=hospital_info$hospital[5],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                
                # fluidRow(
                #   h3("决策-医院6"),
                box(
                  title=hospital_info$hospital[6],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院7"),
                box(
                  title=hospital_info$hospital[7],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                
                # fluidRow(
                #   h3("决策-医院8"),
                box(
                  title=hospital_info$hospital[8],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院9"),
                box(
                  title=hospital_info$hospital[9],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                
                # fluidRow(
                #   h3("决策-医院10"),
                box(
                  title=hospital_info$hospital[10],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
            ))),
        tabPanel(
          "周期4",
          
          # fluidRow(
          #   h3("总推广预算"),
          br(),
          hidden(
            div(id="decision1_phase4",
                box(
                  title="总推广预算",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                             "总推广预算"),
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                             verbatimTextOutput("p4_total_promotional_budget"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                             "已分配的推广预算(%)"),
                    tags$div(
                      style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                      verbatimTextOutput("p4_arranged_promotional_budget")
                    )
                  )
                ),
                
                br(),
                # fluidRow(
                #   h3("决策-医院1"),
                box(
                  title=hospital_info$hospital[1],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院2"),
                box(
                  title=hospital_info$hospital[2],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院3"),
                box(
                  title=hospital_info$hospital[3],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院4"),
                box(
                  title=hospital_info$hospital[4],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院5"),
                box(
                  title=hospital_info$hospital[5],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                
                # fluidRow(
                #   h3("决策-医院6"),
                box(
                  title=hospital_info$hospital[6],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院7"),
                box(
                  title=hospital_info$hospital[7],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                
                # fluidRow(
                #   h3("决策-医院8"),
                box(
                  title=hospital_info$hospital[8],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                # fluidRow(
                #   h3("决策-医院9"),
                box(
                  title=hospital_info$hospital[9],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                
                # fluidRow(
                #   h3("决策-医院10"),
                box(
                  title=hospital_info$hospital[10],
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;margin-left:18%;width:18%;text-align:center",
                             product_info_initial$product[1]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[2]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[3]),
                    tags$div(style = "display:inline-block;width:18%;text-align:center;vertical-align:middle;margin-left:10px",
                             product_info_initial$product[4])
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
                
                
                
                
                
                
            )))
      )),
    tabItem(
      tabName = "decision2",
      
      tabsetPanel(
        tabPanel(
          "周期1",
          
          actionButton("decision2_phase1_submit", "提交"),
          actionButton('save_inputs', '保存输入'),
          actionButton("load_inputs", "加载输入"),
          #fluidRow(h3("时间分配"),
          box(
            title="时间分配",
            status = "primary",
            solidHeader = TRUE,
            width="100%",
            tags$div(
              tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                       "可供时间分配(天)"),
              tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_work_time"))
            ),
            tags$div(
              tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                       "已分配时间 销售代表1(天)"),
              tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_arranged_time_of_sr1"))
            ),
            tags$div(
              tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                       "已分配时间 销售代表2(天)"),
              tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_arranged_time_of_sr2"))
            ),
            tags$div(
              tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                       "已分配时间 销售代表3(天)"),
              tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_arranged_time_of_sr3"))
            ),
            tags$div(
              tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                       "已分配时间 销售代表4(天)"),
              tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_arranged_time_of_sr4"))
            ),
            tags$div(
              tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                       "已分配时间 销售代表5(天)"),
              tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_arranged_time_of_sr5"))
            )),
          hr(),
          # fluidRow(
          #   h3("经理时间分配(天数)"),
          box(
            title="经理时间分配(天数)",
            status = "primary",
            solidHeader = TRUE,
            width="100%",
            tags$div(
              tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                       "总时间的百分比"),
              tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                       "经理"),
              tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                       sr_info_initial_value$sales_rep[1]),
              tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                       sr_info_initial_value$sales_rep[2]),
              tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                       sr_info_initial_value$sales_rep[3]),
              tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                       sr_info_initial_value$sales_rep[4]),
              tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                       sr_info_initial_value$sales_rep[5])
            ),
            br(),
            tags$div(
              tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px",
                       "销售培训"),
              tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_sales_training")),
              tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
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
              tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_field_work")),
              tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
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
              tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_team_meeting")),
              tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                       textInput("p1_flm_team_meeting", label =
                                   NULL,value=5)),
              tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                       verbatimTextOutput("p1_sr1_team_meeting")),
              tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                       verbatimTextOutput("p1_sr2_team_meeting")),
              tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                       verbatimTextOutput("p1_sr3_team_meeting")),
              tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                       verbatimTextOutput("p1_sr4_team_meeting")),
              tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                       verbatimTextOutput("p1_sr5_team_meeting"))
            ),
            tags$div(
              tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                       "KPI 报告分析"),
              tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_kpi_analysis")),
              tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                       textInput("p1_flm_kpi_analysis", label =
                                   NULL,value=5))
            ),
            tags$div(
              tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                       "战略和周期计划"),
              tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_strategy_planning")),
              tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                       textInput("p1_flm_strategy_planning", label =
                                   NULL,value=5))
            ),
            tags$div(
              tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                       "行政工作"),
              tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_admin_work")),
              tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                       textInput("p1_flm_admin_work", label =
                                   NULL,value=5))
            ),
            tags$div(
              tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px",
                       "总体"),
              tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_management")),
              tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_flm_management"))
            )
          ),
          br(),
          # fluidRow(
          #   h3("产品培训"),
          box(
            title="产品培训",
            status = "primary",
            solidHeader = TRUE,
            width="100%",
            tags$div(
              tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                       sr_info_initial_value$sales_rep[1]),
              tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                       sr_info_initial_value$sales_rep[2]),
              tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                       sr_info_initial_value$sales_rep[3]),
              tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                       sr_info_initial_value$sales_rep[4]),
              tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                       sr_info_initial_value$sales_rep[5])
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
          hidden(
            div(id="decision2_phase2",
                
                actionButton("decision2_phase2_submit","提交"),
                #fluidRow(h3("时间分配"),
                box(
                  title="时间分配",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;margin-left:20px;width:15%;text-align:left;",
                             "可供时间分配(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_work_time"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表1(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_arranged_time_of_sr1"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表2(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_arranged_time_of_sr2"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表3(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_arranged_time_of_sr3"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表4(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_arranged_time_of_sr4"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表5(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_arranged_time_of_sr5"))
                  )),
                hr(),
                # fluidRow(
                #   h3("经理时间分配(天数)"),
                box(
                  title="经理时间分配(天数)",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                             "总时间的百分比"),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             "经理"),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[2]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[3]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[4]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[5])
                  ),
                  br(),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "销售培训"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_sales_training")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
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
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_field_work")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
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
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p2_flm_team_meeting", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p2_sr1_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p2_sr2_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p2_sr3_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p2_sr4_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p2_sr5_team_meeting"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "KPI 报告分析"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_kpi_analysis")),
                    tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p2_flm_kpi_analysis", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "战略和周期计划"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_strategy_planning")),
                    tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p2_flm_strategy_planning", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "行政工作"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_admin_work")),
                    tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p2_flm_admin_work", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "总体"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_management")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_flm_management"))
                  )
                ),
                br(),
                # fluidRow(
                #   h3("产品培训"),
                box(
                  title="产品培训",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[2]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[3]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[4]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[5])
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
                )))
        ),
        tabPanel(
          "周期3",
          hidden(
            div(id="decision2_phase3",
                
                actionButton("decision2_phase3_submit","提交"),
                #fluidRow(h3("时间分配"),
                box(
                  title="时间分配",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "可供时间分配(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_work_time"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表1(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_arranged_time_of_sr1"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表2(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_arranged_time_of_sr2"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表3(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_arranged_time_of_sr3"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表4(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_arranged_time_of_sr4"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表5(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_arranged_time_of_sr5"))
                  )),
                hr(),
                # fluidRow(
                #   h3("经理时间分配(天数)"),
                box(
                  title="经理时间分配(天数)",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                             "总时间的百分比"),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             "经理"),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[2]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[3]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[4]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[5])
                  ),
                  br(),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "销售培训"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_sales_training")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
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
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_field_work")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
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
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p3_flm_team_meeting", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p3_sr1_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p3_sr2_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p3_sr3_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p3_sr4_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p3_sr5_team_meeting"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "KPI 报告分析"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_kpi_analysis")),
                    tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p3_flm_kpi_analysis", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "战略和周期计划"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_strategy_planning")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p3_flm_strategy_planning", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "行政工作"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_admin_work")),
                    tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p3_flm_admin_work", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "总体"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_management")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_flm_management"))
                  )
                ),
                br(),
                # fluidRow(
                #   h3("产品培训"),
                box(
                  title="产品培训",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[2]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[3]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[4]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[5])
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
                )))
        ),
        tabPanel(
          "周期4",
          hidden(
            div(id="decision2_phase4",
                
                actionButton("decision2_phase4_submit","提交"),
                #fluidRow(h3("时间分配"),
                box(
                  title="时间分配",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "可供时间分配(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_work_time"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表1(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_arranged_time_of_sr1"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表2(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_arranged_time_of_sr2"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表3(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_arranged_time_of_sr3"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表4(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_arranged_time_of_sr4"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表5(天)"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_arranged_time_of_sr5"))
                  )),
                hr(),
                # fluidRow(
                #   h3("经理时间分配(天数)"),
                box(
                  title="经理时间分配(天数)",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                             "总时间的百分比"),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             "经理"),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[2]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[3]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[4]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[5])
                  ),
                  br(),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "销售培训"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_sales_training")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
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
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_field_work")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
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
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p4_flm_team_meeting", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p4_sr1_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p4_sr2_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p4_sr3_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p4_sr4_team_meeting")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p4_sr5_team_meeting"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "KPI 报告分析"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_kpi_analysis")),
                    tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p4_flm_kpi_analysis", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "战略和周期计划"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_strategy_planning")),
                    tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p4_flm_strategy_planning", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px",
                             "行政工作"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_admin_work")),
                    tags$div(style = "display:inline-block;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p4_flm_admin_work", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;text-align:left;width:13%;margin-left:20px;",
                             "总体"),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_management")),
                    tags$div(style = "display:inline-block;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_flm_management"))
                  )
                ),
                br(),
                # fluidRow(
                #   h3("产品培训"),
                box(
                  title="产品培训",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;margin-left:15%;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[2]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[3]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[4]),
                    tags$div(style = "display:inline-block;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[5])
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
        ))),
    
    tabItem(tabName = "reports",
            tabsetPanel(
              tabPanel("周期1",
                       br(),
                       box(title="代表报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           
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
                                    dataTableOutput("p1_report1_5"))
                       ),
                       br(),
                       box(title="经理报告",
                           width="100%",
                           status = "primary", solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report2_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;;margin-left:3%",
                                    dataTableOutput("p1_report2_2"))),
                       br(),
                       box(title="分配报告",
                           width="100%",
                           status = "primary", solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report3"))),
                       br(),
                       box(title="决策报告",
                           width="100%",
                           status = "primary", solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report4_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report4_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report4_3"))),
                       br(),
                       box(title="利润贡献(总体)",
                           width="100%",
                           status = "primary", solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report5_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report5_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report5_3"))),
                       br(),
                       box(title="利润贡献(每客户)",
                           width="100%",
                           status = "primary", solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report6_1"))),
                       br(),
                       box(title="销售报告",
                           width="100%",
                           status = "primary", solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report7_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report7_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report7_3"))),
                       br(),
                       box(title="市场调研报告",
                           width="100%",
                           status = "primary", solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report8_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report8_2")))
                       
              ),
              
              tabPanel("周期2",
                       br(),
                       box(title="代表报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
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
                                    dataTableOutput("p2_report1_5"))
                       ),
                       br(),
                       box(title="经理报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report2_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;;margin-left:3%",
                                    dataTableOutput("p2_report2_2"))),
                       br(),
                       box(title="分配报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report3"))),
                       br(),
                       box(title="决策报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report4_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report4_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report4_3"))),
                       br(),
                       box(title="利润贡献(总体)",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report5_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report5_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report5_3"))),
                       br(),
                       box(title="利润贡献(每客户)",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report6_1"))),
                       br(),
                       box(title="销售报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report7_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report7_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report7_3"))),
                       br(),
                       box(title="市场调研报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report8_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report8_2")))),
              
              tabPanel("周期3",
                       br(),
                       box(title="代表报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
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
                                    dataTableOutput("p3_report1_5"))),
                       br(),
                       box(title="经理报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report2_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;;margin-left:3%",
                                    dataTableOutput("p3_report2_2"))),
                       br(),
                       box(title="分配报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report3"))),
                       br(),
                       box(title="决策报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report4_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report4_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report4_3"))),
                       br(),
                       box(title="利润贡献(总体)",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report5_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report5_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report5_3"))),
                       br(),
                       box(title="利润贡献(每客户)",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report6_1"))),
                       br(),
                       box(title="销售报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report7_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report7_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report7_3"))),
                       br(),
                       box(title="市场调研报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report8_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report8_2")))),
              
              tabPanel("周期4",
                       br(),
                       box(title="代表报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
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
                                    dataTableOutput("p4_report1_5"))),
                       br(),
                       box(title="经理报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report2_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;;margin-left:3%",
                                    dataTableOutput("p4_report2_2"))),
                       br(),
                       box(title="分配报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report3"))),
                       br(),
                       box(title="决策报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,      
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report4_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report4_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report4_3"))),
                       br(),
                       box(title="利润贡献(总体)",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report5_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report5_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report5_3"))),
                       br(),
                       box(title="利润贡献(每客户)",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report6_1"))),
                       br(),
                       box(title="销售报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report7_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report7_2")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report7_3"))),
                       br(),
                       box(title="市场调研报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report8_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report8_2")))
              ),
              tabPanel("总报告",
                       br(),
                       box(title="总报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("final_report"))))
              
            )))
)

mainsidebar <- div(
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
             icon = icon("list-alt")
             )))

header <- dashboardHeader(title = "销售培训")

sidebar <- dashboardSidebar(uiOutput("sidebarpanel"))


body <- dashboardBody(uiOutput("body"))



shinyApp(
  ui <- dashboardPage(header, sidebar, body),
  
  server=function(input, output, session) {
    
    load(".\\required.RData")
    #### UI code --------------------------------------------------------------
    output$body <- renderUI({
      if (user_input$authenticated == FALSE) {
        ##### UI code for login page
        
        
         
            column(width = 4, offset = 4,
                   br(), br(), br(), br(),
                   br(), br(), br(), br(),
                   uiOutput("uiLogin"),
                   uiOutput("pass"))
        
      } else { 
        #### Your app's UI code goes here!
        mainbody
        
       
      }
    })
    
    output$sidebarpanel <- renderUI({
      
      if (user_input$authenticated == FALSE) {
        
        
      } else {mainsidebar}
      
    })
    
    #### YOUR APP'S SERVER CODE GOES HERE ----------------------------------------
    
    observeEvent(input$phase1_hospital_info,{
      shinyjs::show(id="phase1_hospital_info_box")
      shinyjs::hide(id="phase2_hospital_info_box")
      shinyjs::hide(id="phase3_hospital_info_box")
      shinyjs::hide(id="phase4_hospital_info_box")
    })
    
    observeEvent(input$phase2_hospital_info,{
      shinyjs::hide(id="phase1_hospital_info_box")
      shinyjs::show(id="phase2_hospital_info_box")
      shinyjs::hide(id="phase3_hospital_info_box")
      shinyjs::hide(id="phase4_hospital_info_box")
    })
    
    observeEvent(input$phase3_hospital_info,{
      shinyjs::hide(id="phase1_hospital_info_box")
      shinyjs::hide(id="phase2_hospital_info_box")
      shinyjs::show(id="phase3_hospital_info_box")
      shinyjs::hide(id="phase4_hospital_info_box")
    })
    
    observeEvent(input$phase4_hospital_info,{
      shinyjs::hide(id="phase1_hospital_info_box")
      shinyjs::hide(id="phase2_hospital_info_box")
      shinyjs::hide(id="phase3_hospital_info_box")
      shinyjs::show(id="phase4_hospital_info_box")
    })
    
    observeEvent(input$phase1_WAS_info,{
      shinyjs::show(id="phase1_WAS_info_box")
      shinyjs::hide(id="phase2_WAS_info_box")
      shinyjs::hide(id="phase3_WAS_info_box")
      shinyjs::hide(id="phase4_WAS_info_box")
    })
    
    observeEvent(input$phase2_WAS_info,{
      shinyjs::hide(id="phase1_WAS_info_box")
      shinyjs::show(id="phase2_WAS_info_box")
      shinyjs::hide(id="phase3_WAS_info_box")
      shinyjs::hide(id="phase4_WAS_info_box")
    })
    
    observeEvent(input$phase3_WAS_info,{
      shinyjs::hide(id="phase1_WAS_info_box")
      shinyjs::hide(id="phase2_WAS_info_box")
      shinyjs::show(id="phase3_WAS_info_box")
      shinyjs::hide(id="phase4_WAS_info_box")
    })
    
    observeEvent(input$phase4_WAS_info,{
      shinyjs::hide(id="phase1_WAS_info_box")
      shinyjs::hide(id="phase2_WAS_info_box")
      shinyjs::hide(id="phase3_WAS_info_box")
      shinyjs::show(id="phase4_WAS_info_box")
    })
    
    output$p1_work_time <- renderText(worktime)
    output$p2_work_time <- renderText(worktime)
    output$p3_work_time <- renderText(worktime)
    output$p4_work_time <- renderText(worktime)
    
    
    output$sales_rep_info <- renderDataTable(
      datatable(sr_info_initial,
                rownames = FALSE,
                caption="",
                options =list(ordering = F, dom = "t",
                              columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header());",
                                "}")))
    )
    output$products_info <- renderDataTable(
      datatable(product_info_initial_ui,
                rownames = FALSE,
                caption="",
                options =list(ordering = F, dom = "t",
                              columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header());",
                                "}"))))
    output$hospital_info <- renderDataTable(
      datatable(hospital_info_initial_ui,
                rownames = FALSE,
                caption="",
                options =list(ordering = F, dom = "t",
                              columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header());",
                                "}"))))
    
    output$p1_worktime <- renderText(worktime)
    output$p2_worktime <- renderText(worktime)
    output$p3_worktime <- renderText(worktime)
    output$p4_worktime <- renderText(worktime)
    
    ##phase1
    
    output$p1_total_promotional_budget <- renderText(total_promotional_budget$phase1)
    
    
    p1_calculator_result <- reactive({calculator(input,1)})
    
    
    
    
    output$p1_arranged_promotional_budget <- renderText(p1_calculator_result()[1]) 
    output$p1_arranged_time_of_sr1 <- renderText(p1_calculator_result()[2])
    output$p1_arranged_time_of_sr2 <- renderText(p1_calculator_result()[3])
    output$p1_arranged_time_of_sr3 <- renderText(p1_calculator_result()[4])
    output$p1_arranged_time_of_sr4 <- renderText(p1_calculator_result()[5])
    output$p1_arranged_time_of_sr5 <- renderText(p1_calculator_result()[6])
    
    output$p1_potential_sales_hosp1_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp1_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp1_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==2),]$potential_volume)
    output$p1_potential_sales_hosp1_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==4),]$potential_volume)
    output$p1_current_sales_hosp1_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$current_volume)
    output$p1_current_sales_hosp1_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==2),]$current_volume)
    output$p1_current_sales_hosp1_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==3),]$current_volume)
    output$p1_current_sales_hosp1_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==4),]$current_volume)
    output$p1_potential_sales_hosp2_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp2_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp2_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==2),]$potential_volume)
    output$p1_potential_sales_hosp2_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==4),]$potential_volume)
    output$p1_current_sales_hosp2_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$current_volume)
    output$p1_current_sales_hosp2_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==2),]$current_volume)
    output$p1_current_sales_hosp2_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==3),]$current_volume)
    output$p1_current_sales_hosp2_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==4),]$current_volume)
    output$p1_potential_sales_hosp3_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp3_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp3_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==2),]$potential_volume)
    output$p1_potential_sales_hosp3_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==4),]$potential_volume)
    output$p1_current_sales_hosp3_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$current_volume)
    output$p1_current_sales_hosp3_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==2),]$current_volume)
    output$p1_current_sales_hosp3_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==3),]$current_volume)
    output$p1_current_sales_hosp3_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==4),]$current_volume)
    output$p1_potential_sales_hosp4_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp4_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp4_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==2),]$potential_volume)
    output$p1_potential_sales_hosp4_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==4),]$potential_volume)
    output$p1_current_sales_hosp4_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$current_volume)
    output$p1_current_sales_hosp4_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==2),]$current_volume)
    output$p1_current_sales_hosp4_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==3),]$current_volume)
    output$p1_current_sales_hosp4_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==4),]$current_volume)
    output$p1_potential_sales_hosp5_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp5_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp5_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==2),]$potential_volume)
    output$p1_potential_sales_hosp5_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==4),]$potential_volume)
    output$p1_current_sales_hosp5_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$current_volume)
    output$p1_current_sales_hosp5_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==2),]$current_volume)
    output$p1_current_sales_hosp5_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==3),]$current_volume)
    output$p1_current_sales_hosp5_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==4),]$current_volume)
    output$p1_potential_sales_hosp6_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp6_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp6_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==2),]$potential_volume)
    output$p1_potential_sales_hosp6_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==4),]$potential_volume)
    output$p1_current_sales_hosp6_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$current_volume)
    output$p1_current_sales_hosp6_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==2),]$current_volume)
    output$p1_current_sales_hosp6_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==3),]$current_volume)
    output$p1_current_sales_hosp6_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==4),]$current_volume)
    output$p1_potential_sales_hosp7_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp7_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp7_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==2),]$potential_volume)
    output$p1_potential_sales_hosp7_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==4),]$potential_volume)
    output$p1_current_sales_hosp7_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$current_volume)
    output$p1_current_sales_hosp7_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==2),]$current_volume)
    output$p1_current_sales_hosp7_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==3),]$current_volume)
    output$p1_current_sales_hosp7_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==4),]$current_volume)
    output$p1_potential_sales_hosp8_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp8_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp8_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==2),]$potential_volume)
    output$p1_potential_sales_hosp8_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==4),]$potential_volume)
    output$p1_current_sales_hosp8_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$current_volume)
    output$p1_current_sales_hosp8_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==2),]$current_volume)
    output$p1_current_sales_hosp8_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==3),]$current_volume)
    output$p1_current_sales_hosp8_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==4),]$current_volume)
    output$p1_potential_sales_hosp9_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp9_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp9_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==2),]$potential_volume)
    output$p1_potential_sales_hosp9_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==4),]$potential_volume)
    output$p1_current_sales_hosp9_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$current_volume)
    output$p1_current_sales_hosp9_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==2),]$current_volume)
    output$p1_current_sales_hosp9_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==3),]$current_volume)
    output$p1_current_sales_hosp9_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==4),]$current_volume)
    output$p1_potential_sales_hosp10_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp10_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$potential_volume)
    output$p1_potential_sales_hosp10_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==2),]$potential_volume)
    output$p1_potential_sales_hosp10_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==4),]$potential_volume)
    output$p1_current_sales_hosp10_1 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$current_volume)
    output$p1_current_sales_hosp10_2 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==2),]$current_volume)
    output$p1_current_sales_hosp10_3 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==3),]$current_volume)
    output$p1_current_sales_hosp10_4 <- renderText(
      volume_info[which(volume_info$phase=="周期1"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==4),]$current_volume)
    
    
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
    
    
    
    # data1_phase1 <- eventReactive(input$decision1_phase1_submit,{
    #   get.data1(input,1)
    # })
    # 
    # data2_phase1 <- eventReactive(input$decision2_phase1_submit,{
    #   get.data2(input,1)
    #   
    # })
    # 
    observeEvent(input$save_inputs,{
      time <- gsub("-","_",Sys.Date())
      saveRDS( reactiveValuesToList(input) ,
               file = paste(input$user_name,"_",time,'.RDS',sep=""))})
    observeEvent(input$load_inputs,{   
      
      if(!file.exists('inputs.RDS')) {return(NULL)}
      
      savedInputs <- readRDS('inputs.RDS')
      
      inputIDs      <- names(savedInputs) 
      inputvalues   <- unlist(savedInputs) 
      for (i in 1:length(savedInputs)) { 
        session$sendInputMessage(inputIDs[i],  list(value=inputvalues[[i]]) )
      }
    })
    
    # output$report1_table <- renderDataTable(data1_phase1())
    # output$report2_table <- renderDataTable(data2_phase1())
    
    p1_flm_data <- reactive(get.data3(input,1))
    
    
    output$p1_total_sales_training <-renderText(sales_training(input,1))
    output$p1_flm_sales_training <- renderText(sales_training(input,1))
    output$p1_total_field_work <-renderText(field_work(input,1))
    output$p1_flm_field_work <- renderText(field_work(input,1))
    output$p1_sr1_team_meeting <- renderText(ifelse(input$p1_flm_team_meeting=="",
                                                    NA,
                                                    input$p1_flm_team_meeting))
    output$p1_sr2_team_meeting <- renderText(ifelse(input$p1_flm_team_meeting=="",
                                                    NA,
                                                    input$p1_flm_team_meeting))
    output$p1_sr3_team_meeting <- renderText(ifelse(input$p1_flm_team_meeting=="",
                                                    NA,
                                                    input$p1_flm_team_meeting))
    output$p1_sr4_team_meeting <- renderText(ifelse(input$p1_flm_team_meeting=="",
                                                    NA,
                                                    input$p1_flm_team_meeting))
    output$p1_sr5_team_meeting <- renderText(ifelse(input$p1_flm_team_meeting=="",
                                                    NA,
                                                    input$p1_flm_team_meeting))
    output$p1_total_team_meeting <- renderText(ifelse(input$p1_flm_team_meeting=="",
                                                      NA,
                                                      input$p1_flm_team_meeting))
    output$p1_total_kpi_analysis <- renderText(ifelse(input$p1_flm_kpi_analysis=="",
                                                      NA,
                                                      input$p1_flm_kpi_analysis))
    output$p1_total_strategy_planning <- renderText(ifelse(input$p1_flm_strategy_planning=="",
                                                           NA,
                                                           input$p1_flm_strategy_planning))
    output$p1_total_admin_work <- renderText(ifelse(input$p1_flm_admin_work=="",
                                                    NA,
                                                    input$p1_flm_admin_work))
    output$p1_total_management <- renderText(sum(p1_flm_data()))
    output$p1_flm_management <- renderText(sum(p1_flm_data()))
    
    
    
    
    
    # output$report3_table <- renderDataTable({
    #   data1<-data1_phase1()
    #   data2<-data2_phase1()
    #   calculation(pp_info_by_hosp_product,
    #               sr_info_initial_value,
    #               data1,
    #               data2)
    #   
    #   #left_join(data1_phase1(),pp_info_by_hosp_product_new,by=c("hospital","product"))
    # })
    
    tmp <- reactive({
      pp_data1 <- pp_info_by_hosp_product
      pp_data2 <- sr_info_initial_value
      cp_data1 <- get.data1(input,1)
      cp_data2 <- get.data2(input,1)
      tmp <- calculation(pp_data1,
                         pp_data2,
                         cp_data1,
                         cp_data2)})
    
    
    
    
    
    p1_report <- eventReactive(input$decision2_phase1_submit,{
      if (
        
        p1_calculator_result()[1] <=100 &
        p1_calculator_result()[2] <=worktime &
        p1_calculator_result()[3] <=worktime &
        p1_calculator_result()[4] <=worktime &
        p1_calculator_result()[5] <=worktime &
        p1_calculator_result()[6] <=worktime &
        sum(p1_flm_data()) <=worktime
      ) {
        p1_report <- report_data(tmp(),p1_flm_data())
        return(p1_report)
      } 
      
    })
    
    
    observeEvent(input$decision2_phase1_submit,{
      if (
        p1_calculator_result()[1] >100 |
        p1_calculator_result()[2] >worktime |
        p1_calculator_result()[3] >worktime |
        p1_calculator_result()[4] >worktime |
        p1_calculator_result()[5] >worktime |
        p1_calculator_result()[6] >worktime |
        sum(p1_flm_data()) >=worktime
      ) {
        shinyjs::alert("推广预算分配或是时间分配超出最大值！！")
        
      } else{
        
        shinyjs::show(id="decision1_phase2",anim=T)
        shinyjs::show(id="decision2_phase2",anim=T)
        shinyjs::enable(id="phase2_hospital_info")
        shinyjs::enable(id="phase2_WAS_info")
        
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
        disable("p1_hosp10_worktime_nurs")
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
        disable("p1_sr5_product_training")}
    })
    
    
    
    
    output$p1_report1_1 <-
      renderDataTable(datatable(p1_report()$report1_mod1,
                                caption="职员成本",
                                options = 
                                  list(ordering = F, dom = "t",
                                       # autoWidth = TRUE,
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
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
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report1_3 <- 
      renderDataTable(datatable(p1_report()$report1_mod3,
                                caption="产品知识",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report1_4 <- 
      renderDataTable(datatable(p1_report()$report1_mod4,
                                caption="经验",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p1_report1_5 <- 
      renderDataTable(datatable(p1_report()$report1_mod5,
                                caption="销售技巧",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report2_1 <- 
      renderDataTable(datatable(p1_report()$report2_mod1,
                                caption="职员成本",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report2_2 <- 
      renderDataTable(datatable(p1_report()$report2_mod2,
                                caption="时间分配",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report3 <- 
      renderDataTable(datatable(p1_report()$report3_mod1,
                                rownames = F,
                                caption="时间分配",
                                options = 
                                  list(pageLength = 30,
                                       ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report4_1 <- 
      renderDataTable(datatable(p1_report()$report4_mod1,
                                caption="总体的分配情况",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p1_report4_2 <- 
      renderDataTable(datatable(p1_report()$report4_mod2,
                                caption="分级匹配度",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p1_report4_3 <- 
      renderDataTable(datatable(p1_report()$report4_mod3,
                                caption="决策质量",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p1_report5_1 <- 
      renderDataTable(datatable(p1_report()$report5_mod1,
                                caption="利润贡献I 每产品(总)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p1_report5_2 <- 
      renderDataTable(datatable(p1_report()$report5_mod2,
                                caption="利润贡献I 每产品(每件)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report5_3 <- 
      renderDataTable(datatable(p1_report()$report5_mod3,
                                caption="利润贡献III (总体)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report6_1 <- 
      renderDataTable(datatable(p1_report()$report6_mod1,
                                rownames = F,
                                caption="利润贡献 每客户",
                                options = 
                                  list(pageLength = 120,
                                       ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report7_1 <- 
      renderDataTable(datatable(p1_report()$report7_mod1,
                                caption="销售额和数量/客户",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report7_2 <- 
      renderDataTable(datatable(p1_report()$report7_mod2,
                                caption="销售额和数量/客户",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report7_3 <- 
      renderDataTable(datatable(p1_report()$report7_mod3,
                                caption="销售额和数量/产品",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p1_report8_1 <- 
      renderDataTable(datatable(p1_report()$report8_mod1,
                                caption="商业价值",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p1_report8_2 <- 
      renderDataTable(datatable(p1_report()$report8_mod2,
                                caption="总市场概述",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    
    
    
    
    
    
    
    
    ##phase2
    
    output$p2_total_promotional_budget <- renderText(
      total_promotional_budget$phase2
    )
    
    
    p2_calculator_result <- reactive(calculator(input,2))
    
    
    
    output$p2_arranged_promotional_budget <- renderText(p2_calculator_result()[1])
    output$p2_arranged_time_of_sr1 <- renderText(p2_calculator_result()[2])
    output$p2_arranged_time_of_sr2 <- renderText(p2_calculator_result()[3])
    output$p2_arranged_time_of_sr3 <- renderText(p2_calculator_result()[4])
    output$p2_arranged_time_of_sr4 <- renderText(p2_calculator_result()[5])
    output$p2_arranged_time_of_sr5 <- renderText(p2_calculator_result()[6])
    
    output$p2_potential_sales_hosp1_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp1_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp1_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==2),]$potential_volume)
    output$p2_potential_sales_hosp1_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==4),]$potential_volume)
    output$p2_current_sales_hosp1_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$current_volume)
    output$p2_current_sales_hosp1_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==2),]$current_volume)
    output$p2_current_sales_hosp1_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==3),]$current_volume)
    output$p2_current_sales_hosp1_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==4),]$current_volume)
    output$p2_potential_sales_hosp2_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp2_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp2_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==2),]$potential_volume)
    output$p2_potential_sales_hosp2_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==4),]$potential_volume)
    output$p2_current_sales_hosp2_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$current_volume)
    output$p2_current_sales_hosp2_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==2),]$current_volume)
    output$p2_current_sales_hosp2_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==3),]$current_volume)
    output$p2_current_sales_hosp2_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==4),]$current_volume)
    output$p2_potential_sales_hosp3_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp3_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp3_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==2),]$potential_volume)
    output$p2_potential_sales_hosp3_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==4),]$potential_volume)
    output$p2_current_sales_hosp3_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$current_volume)
    output$p2_current_sales_hosp3_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==2),]$current_volume)
    output$p2_current_sales_hosp3_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==3),]$current_volume)
    output$p2_current_sales_hosp3_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==4),]$current_volume)
    output$p2_potential_sales_hosp4_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp4_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp4_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==2),]$potential_volume)
    output$p2_potential_sales_hosp4_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==4),]$potential_volume)
    output$p2_current_sales_hosp4_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$current_volume)
    output$p2_current_sales_hosp4_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==2),]$current_volume)
    output$p2_current_sales_hosp4_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==3),]$current_volume)
    output$p2_current_sales_hosp4_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==4),]$current_volume)
    output$p2_potential_sales_hosp5_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp5_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp5_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==2),]$potential_volume)
    output$p2_potential_sales_hosp5_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==4),]$potential_volume)
    output$p2_current_sales_hosp5_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$current_volume)
    output$p2_current_sales_hosp5_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==2),]$current_volume)
    output$p2_current_sales_hosp5_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==3),]$current_volume)
    output$p2_current_sales_hosp5_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==4),]$current_volume)
    output$p2_potential_sales_hosp6_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp6_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp6_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==2),]$potential_volume)
    output$p2_potential_sales_hosp6_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==4),]$potential_volume)
    output$p2_current_sales_hosp6_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$current_volume)
    output$p2_current_sales_hosp6_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==2),]$current_volume)
    output$p2_current_sales_hosp6_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==3),]$current_volume)
    output$p2_current_sales_hosp6_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==4),]$current_volume)
    output$p2_potential_sales_hosp7_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp7_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp7_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==2),]$potential_volume)
    output$p2_potential_sales_hosp7_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==4),]$potential_volume)
    output$p2_current_sales_hosp7_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$current_volume)
    output$p2_current_sales_hosp7_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==2),]$current_volume)
    output$p2_current_sales_hosp7_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==3),]$current_volume)
    output$p2_current_sales_hosp7_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==4),]$current_volume)
    output$p2_potential_sales_hosp8_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp8_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp8_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==2),]$potential_volume)
    output$p2_potential_sales_hosp8_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==4),]$potential_volume)
    output$p2_current_sales_hosp8_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$current_volume)
    output$p2_current_sales_hosp8_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==2),]$current_volume)
    output$p2_current_sales_hosp8_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==3),]$current_volume)
    output$p2_current_sales_hosp8_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==4),]$current_volume)
    output$p2_potential_sales_hosp9_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp9_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp9_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==2),]$potential_volume)
    output$p2_potential_sales_hosp9_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==4),]$potential_volume)
    output$p2_current_sales_hosp9_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$current_volume)
    output$p2_current_sales_hosp9_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==2),]$current_volume)
    output$p2_current_sales_hosp9_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==3),]$current_volume)
    output$p2_current_sales_hosp9_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==4),]$current_volume)
    output$p2_potential_sales_hosp10_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp10_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$potential_volume)
    output$p2_potential_sales_hosp10_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==2),]$potential_volume)
    output$p2_potential_sales_hosp10_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==4),]$potential_volume)
    output$p2_current_sales_hosp10_1 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$current_volume)
    output$p2_current_sales_hosp10_2 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==2),]$current_volume)
    output$p2_current_sales_hosp10_3 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==3),]$current_volume)
    output$p2_current_sales_hosp10_4 <- renderText(
      volume_info[which(volume_info$phase=="周期2"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==4),]$current_volume)
    
    
    
    
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
    
    
    
    
    p2_flm_data <- reactive(get.data3(input,2))
    
    output$p2_total_sales_training <-renderText(sales_training(input,2))
    output$p2_flm_sales_training <- renderText(sales_training(input,2))
    output$p2_total_field_work <-renderText(field_work(input,2))
    output$p2_flm_field_work <- renderText(field_work(input,2))
    output$p2_sr1_team_meeting <- renderText(ifelse(input$p2_flm_team_meeting=="",
                                                    NA,
                                                    input$p2_flm_team_meeting))
    output$p2_sr2_team_meeting <- renderText(ifelse(input$p2_flm_team_meeting=="",
                                                    NA,
                                                    input$p2_flm_team_meeting))
    output$p2_sr3_team_meeting <- renderText(ifelse(input$p2_flm_team_meeting=="",
                                                    NA,
                                                    input$p2_flm_team_meeting))
    output$p2_sr4_team_meeting <- renderText(ifelse(input$p2_flm_team_meeting=="",
                                                    NA,
                                                    input$p2_flm_team_meeting))
    output$p2_sr5_team_meeting <- renderText(ifelse(input$p2_flm_team_meeting=="",
                                                    NA,
                                                    input$p2_flm_team_meeting))
    output$p2_total_team_meeting <- renderText(ifelse(input$p2_flm_team_meeting=="",
                                                      NA,
                                                      input$p2_flm_team_meeting))
    output$p2_total_kpi_analysis <- renderText(ifelse(input$p2_flm_kpi_analysis=="",
                                                      NA,
                                                      input$p2_flm_kpi_analysis))
    output$p2_total_strategy_planning <- renderText(ifelse(input$p2_flm_strategy_planning=="",
                                                           NA,
                                                           input$p2_flm_strategy_planning))
    output$p2_total_admin_work <- renderText(ifelse(input$p2_flm_admin_work=="",
                                                    NA,
                                                    input$p2_flm_admin_work))
    output$p2_total_management <- renderText(sum(p2_flm_data()))
    output$p2_flm_management <- renderText(sum(p2_flm_data()))
    
    
    
    tmp2 <- reactive({
      pp_data1 <- tmp() %>% select(hospital,
                                   product,
                                   real_revenue,
                                   real_volume,
                                   sr_sales_performance,
                                   deployment_quality_index,
                                   customer_relationship_index,
                                   promotional_support_index,
                                   sales_performance,
                                   offer_attractiveness,
                                   acc_offer_attractiveness) %>%
        distinct()
      
      colnames(pp_data1)[3:11] <- paste("pp_",colnames(pp_data1)[3:11],sep="")
      
      pp_data2 <- tmp() %>% select(sales_rep,
                                   sales_level,
                                   sr_revenue,
                                   sr_volume,
                                   sr_acc_revenue,
                                   sales_skills_index,
                                   product_knowledge_index,
                                   motivation_index,
                                   sr_acc_field_work) %>%
        distinct()
      
      colnames(pp_data2)[3:9] <- paste("pp_",colnames(pp_data2)[3:9],sep="")
      cp_data1 <- get.data1(input,2)
      cp_data2 <- get.data2(input,2)
      tmp <- calculation(pp_data1,
                         pp_data2,
                         cp_data1,
                         cp_data2)})
    
    
    
    p2_report<- eventReactive(input$decision2_phase2_submit,{
      if (
        
        p2_calculator_result()[1] <=100 &
        p2_calculator_result()[2] <=worktime &
        p2_calculator_result()[3] <=worktime &
        p2_calculator_result()[4] <=worktime &
        p2_calculator_result()[5] <=worktime &
        p2_calculator_result()[6] <=worktime &
        sum(p2_flm_data()) <=worktime
      ) {
        p2_report <- report_data(tmp2(),p2_flm_data())
        return(p2_report)
      } 
      
    })
    
    
    
    observeEvent(input$decision2_phase2_submit, {
      
      if (
        p2_calculator_result()[1] >100 |
        p2_calculator_result()[2] >worktime |
        p2_calculator_result()[3] >worktime |
        p2_calculator_result()[4] >worktime |
        p2_calculator_result()[5] >worktime |
        p2_calculator_result()[6] >worktime |
        sum(p2_flm_data()) >worktime
      ) {
        shinyjs::alert("推广预算分配或是时间分配超出最大值！！")
        
      } else{
        
        shinyjs::show(id="decision1_phase3")
        shinyjs::show(id="decision2_phase3")
        shinyjs::enable(id="phase3_hospital_info")
        shinyjs::enable(id="phase3_WAS_info")
        
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
        disable("p2_hosp10_worktime_nurs")
        
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
        disable("p2_sr5_product_training")}
    })
    
    
    output$p2_report1_1 <-
      renderDataTable(datatable(p2_report()$report1_mod1,
                                caption="职员成本",
                                options = 
                                  list(ordering = F, dom = "t",
                                       # autoWidth = TRUE,
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
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
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report1_3 <- 
      renderDataTable(datatable(p2_report()$report1_mod3,
                                caption="产品知识",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report1_4 <- 
      renderDataTable(datatable(p2_report()$report1_mod4,
                                caption="经验",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p2_report1_5 <- 
      renderDataTable(datatable(p2_report()$report1_mod5,
                                caption="销售技巧",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report2_1 <- 
      renderDataTable(datatable(p2_report()$report2_mod1,
                                caption="职员成本",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report2_2 <- 
      renderDataTable(datatable(p2_report()$report2_mod2,
                                caption="时间分配",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report3 <- 
      renderDataTable(datatable(p2_report()$report3_mod1,
                                rownames = F,
                                caption="时间分配",
                                options = 
                                  list(pageLength = 30,
                                       ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report4_1 <- 
      renderDataTable(datatable(p2_report()$report4_mod1,
                                caption="总体的分配情况",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p2_report4_2 <- 
      renderDataTable(datatable(p2_report()$report4_mod2,
                                caption="分级匹配度",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p2_report4_3 <- 
      renderDataTable(datatable(p2_report()$report4_mod3,
                                caption="决策质量",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p2_report5_1 <- 
      renderDataTable(datatable(p2_report()$report5_mod1,
                                caption="利润贡献I 每产品(总)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p2_report5_2 <- 
      renderDataTable(datatable(p2_report()$report5_mod2,
                                caption="利润贡献I 每产品(每件)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report5_3 <- 
      renderDataTable(datatable(p2_report()$report5_mod3,
                                caption="利润贡献III (总体)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report6_1 <- 
      renderDataTable(datatable(p2_report()$report6_mod1,
                                rownames = F,
                                caption="利润贡献 每客户",
                                options = 
                                  list(pageLength = 120,
                                       ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report7_1 <- 
      renderDataTable(datatable(p2_report()$report7_mod1,
                                caption="销售额和数量/客户",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report7_2 <- 
      renderDataTable(datatable(p2_report()$report7_mod2,
                                caption="销售额和数量/客户",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report7_3 <- 
      renderDataTable(datatable(p2_report()$report7_mod3,
                                caption="销售额和数量/产品",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p2_report8_1 <- 
      renderDataTable(datatable(p2_report()$report8_mod1,
                                caption="商业价值",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p2_report8_2 <- 
      renderDataTable(datatable(p2_report()$report8_mod2,
                                caption="总市场概述",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    
    
    
    
    
    
    ##phase3
    
    output$p3_total_promotional_budget <- renderText(
      total_promotional_budget$phase3
    )
    
    
    p3_calculator_result <- reactive(calculator(input,3))
    
    output$p3_arranged_promotional_budget <- renderText(p3_calculator_result()[1])
    output$p3_arranged_time_of_sr1 <- renderText(p3_calculator_result()[2])
    output$p3_arranged_time_of_sr2 <- renderText(p3_calculator_result()[3])
    output$p3_arranged_time_of_sr3 <- renderText(p3_calculator_result()[4])
    output$p3_arranged_time_of_sr4 <- renderText(p3_calculator_result()[5])
    output$p3_arranged_time_of_sr5 <- renderText(p3_calculator_result()[6])
    
    output$p3_potential_sales_hosp1_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp1_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp1_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==2),]$potential_volume)
    output$p3_potential_sales_hosp1_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==4),]$potential_volume)
    output$p3_current_sales_hosp1_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$current_volume)
    output$p3_current_sales_hosp1_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==2),]$current_volume)
    output$p3_current_sales_hosp1_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==3),]$current_volume)
    output$p3_current_sales_hosp1_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==4),]$current_volume)
    output$p3_potential_sales_hosp2_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp2_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp2_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==2),]$potential_volume)
    output$p3_potential_sales_hosp2_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==4),]$potential_volume)
    output$p3_current_sales_hosp2_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$current_volume)
    output$p3_current_sales_hosp2_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==2),]$current_volume)
    output$p3_current_sales_hosp2_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==3),]$current_volume)
    output$p3_current_sales_hosp2_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==4),]$current_volume)
    output$p3_potential_sales_hosp3_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp3_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp3_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==2),]$potential_volume)
    output$p3_potential_sales_hosp3_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==4),]$potential_volume)
    output$p3_current_sales_hosp3_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$current_volume)
    output$p3_current_sales_hosp3_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==2),]$current_volume)
    output$p3_current_sales_hosp3_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==3),]$current_volume)
    output$p3_current_sales_hosp3_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==4),]$current_volume)
    output$p3_potential_sales_hosp4_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp4_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp4_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==2),]$potential_volume)
    output$p3_potential_sales_hosp4_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==4),]$potential_volume)
    output$p3_current_sales_hosp4_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$current_volume)
    output$p3_current_sales_hosp4_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==2),]$current_volume)
    output$p3_current_sales_hosp4_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==3),]$current_volume)
    output$p3_current_sales_hosp4_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==4),]$current_volume)
    output$p3_potential_sales_hosp5_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp5_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp5_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==2),]$potential_volume)
    output$p3_potential_sales_hosp5_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==4),]$potential_volume)
    output$p3_current_sales_hosp5_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$current_volume)
    output$p3_current_sales_hosp5_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==2),]$current_volume)
    output$p3_current_sales_hosp5_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==3),]$current_volume)
    output$p3_current_sales_hosp5_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==4),]$current_volume)
    output$p3_potential_sales_hosp6_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp6_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp6_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==2),]$potential_volume)
    output$p3_potential_sales_hosp6_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==4),]$potential_volume)
    output$p3_current_sales_hosp6_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$current_volume)
    output$p3_current_sales_hosp6_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==2),]$current_volume)
    output$p3_current_sales_hosp6_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==3),]$current_volume)
    output$p3_current_sales_hosp6_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==4),]$current_volume)
    output$p3_potential_sales_hosp7_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp7_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp7_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==2),]$potential_volume)
    output$p3_potential_sales_hosp7_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==4),]$potential_volume)
    output$p3_current_sales_hosp7_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$current_volume)
    output$p3_current_sales_hosp7_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==2),]$current_volume)
    output$p3_current_sales_hosp7_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==3),]$current_volume)
    output$p3_current_sales_hosp7_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==4),]$current_volume)
    output$p3_potential_sales_hosp8_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp8_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp8_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==2),]$potential_volume)
    output$p3_potential_sales_hosp8_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==4),]$potential_volume)
    output$p3_current_sales_hosp8_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$current_volume)
    output$p3_current_sales_hosp8_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==2),]$current_volume)
    output$p3_current_sales_hosp8_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==3),]$current_volume)
    output$p3_current_sales_hosp8_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==4),]$current_volume)
    output$p3_potential_sales_hosp9_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp9_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp9_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==2),]$potential_volume)
    output$p3_potential_sales_hosp9_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==4),]$potential_volume)
    output$p3_current_sales_hosp9_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$current_volume)
    output$p3_current_sales_hosp9_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==2),]$current_volume)
    output$p3_current_sales_hosp9_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==3),]$current_volume)
    output$p3_current_sales_hosp9_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==4),]$current_volume)
    output$p3_potential_sales_hosp10_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp10_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$potential_volume)
    output$p3_potential_sales_hosp10_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==2),]$potential_volume)
    output$p3_potential_sales_hosp10_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==4),]$potential_volume)
    output$p3_current_sales_hosp10_1 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$current_volume)
    output$p3_current_sales_hosp10_2 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==2),]$current_volume)
    output$p3_current_sales_hosp10_3 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==3),]$current_volume)
    output$p3_current_sales_hosp10_4 <- renderText(
      volume_info[which(volume_info$phase=="周期3"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==4),]$current_volume)
    
    
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
    
    
    
    
    p3_flm_data <- reactive(get.data3(input,3))
    
    output$p3_total_sales_training <-renderText(sales_training(input,3))
    output$p3_flm_sales_training <- renderText(sales_training(input,3))
    output$p3_total_field_work <-renderText(field_work(input,3))
    output$p3_flm_field_work <- renderText(field_work(input,3))
    output$p3_sr1_team_meeting <- renderText(ifelse(input$p3_flm_team_meeting=="",
                                                    NA,
                                                    input$p3_flm_team_meeting))
    output$p3_sr2_team_meeting <- renderText(ifelse(input$p3_flm_team_meeting=="",
                                                    NA,
                                                    input$p3_flm_team_meeting))
    output$p3_sr3_team_meeting <- renderText(ifelse(input$p3_flm_team_meeting=="",
                                                    NA,
                                                    input$p3_flm_team_meeting))
    output$p3_sr4_team_meeting <- renderText(ifelse(input$p3_flm_team_meeting=="",
                                                    NA,
                                                    input$p3_flm_team_meeting))
    output$p3_sr5_team_meeting <- renderText(ifelse(input$p3_flm_team_meeting=="",
                                                    NA,
                                                    input$p3_flm_team_meeting))
    output$p3_total_team_meeting <- renderText(ifelse(input$p3_flm_team_meeting=="",
                                                      NA,
                                                      input$p3_flm_team_meeting))
    output$p3_total_kpi_analysis <- renderText(ifelse(input$p3_flm_kpi_analysis=="",
                                                      NA,
                                                      input$p3_flm_kpi_analysis))
    output$p3_total_strategy_planning <- renderText(ifelse(input$p3_flm_strategy_planning=="",
                                                           NA,
                                                           input$p3_flm_strategy_planning))
    output$p3_total_admin_work <- renderText(ifelse(input$p3_flm_admin_work=="",
                                                    NA,
                                                    input$p3_flm_admin_work))
    output$p3_total_management <- renderText(sum(p3_flm_data()))
    output$p3_flm_management <- renderText(sum(p3_flm_data()))
    
    
    
    tmp3 <- reactive({
      pp_data1 <- tmp2() %>% select(hospital,
                                    product,
                                    real_revenue,
                                    real_volume,
                                    sr_sales_performance,
                                    deployment_quality_index,
                                    customer_relationship_index,
                                    promotional_support_index,
                                    sales_performance,
                                    offer_attractiveness,
                                    acc_offer_attractiveness) %>%
        distinct()
      
      colnames(pp_data1)[3:11] <- paste("pp_",colnames(pp_data1)[3:11],sep="")
      
      pp_data2 <- tmp2() %>% select(sales_rep,
                                    sales_level,
                                    sr_revenue,
                                    sr_volume,
                                    sr_acc_revenue,
                                    sales_skills_index,
                                    product_knowledge_index,
                                    motivation_index,
                                    sr_acc_field_work) %>%
        distinct()
      
      colnames(pp_data2)[3:9] <- paste("pp_",colnames(pp_data2)[3:9],sep="")
      cp_data1 <- get.data1(input,3)
      cp_data2 <- get.data2(input,3)
      tmp <- calculation(pp_data1,
                         pp_data2,
                         cp_data1,
                         cp_data2)})
    
    p3_report<- eventReactive(input$decision2_phase3_submit,{
      if (
        
        p3_calculator_result()[1] <=100 &
        p3_calculator_result()[2] <=worktime &
        p3_calculator_result()[3] <=worktime &
        p3_calculator_result()[4] <=worktime &
        p3_calculator_result()[5] <=worktime &
        p3_calculator_result()[6] <=worktime &
        sum(p3_flm_data()) <=worktime
      ) {
        p3_report <- report_data(tmp3(),p3_flm_data())
        return(p3_report)
      } 
      
    })
    
    
    
    observeEvent(input$decision2_phase3_submit, {
      if (
        p3_calculator_result()[1] >100 |
        p3_calculator_result()[2] >worktime |
        p3_calculator_result()[3] >worktime |
        p3_calculator_result()[4] >worktime |
        p3_calculator_result()[5] >worktime |
        p3_calculator_result()[6] >worktime |
        sum(p3_flm_data()) >=worktime
      ) {
        shinyjs::alert("推广预算分配或是时间分配超出最大值！！")
        
      } else{
        shinyjs::show(id="decision1_phase4")
        shinyjs::show(id="decision2_phase4")
        shinyjs::enable(id="phase4_hospital_info")
        shinyjs::enable(id="phase4_WAS_info")  
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
        disable("p3_hosp10_worktime_nurs")
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
        disable("p3_sr5_product_training")}
    })
    
    output$p3_report1_1 <-
      renderDataTable(datatable(p3_report()$report1_mod1,
                                caption="职员成本",
                                options = 
                                  list(ordering = F, dom = "t",
                                       # autoWidth = TRUE,
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
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
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report1_3 <- 
      renderDataTable(datatable(p3_report()$report1_mod3,
                                caption="产品知识",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report1_4 <- 
      renderDataTable(datatable(p3_report()$report1_mod4,
                                caption="经验",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p3_report1_5 <- 
      renderDataTable(datatable(p3_report()$report1_mod5,
                                caption="销售技巧",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report2_1 <- 
      renderDataTable(datatable(p3_report()$report2_mod1,
                                caption="职员成本",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report2_2 <- 
      renderDataTable(datatable(p3_report()$report2_mod2,
                                caption="时间分配",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report3 <- 
      renderDataTable(datatable(p3_report()$report3_mod1,
                                rownames = F,
                                caption="时间分配",
                                options = 
                                  list(pageLength = 30,
                                       ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report4_1 <- 
      renderDataTable(datatable(p3_report()$report4_mod1,
                                caption="总体的分配情况",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p3_report4_2 <- 
      renderDataTable(datatable(p3_report()$report4_mod2,
                                caption="分级匹配度",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p3_report4_3 <- 
      renderDataTable(datatable(p3_report()$report4_mod3,
                                caption="决策质量",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p3_report5_1 <- 
      renderDataTable(datatable(p3_report()$report5_mod1,
                                caption="利润贡献I 每产品(总)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p3_report5_2 <- 
      renderDataTable(datatable(p3_report()$report5_mod2,
                                caption="利润贡献I 每产品(每件)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report5_3 <- 
      renderDataTable(datatable(p3_report()$report5_mod3,
                                caption="利润贡献III (总体)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report6_1 <- 
      renderDataTable(datatable(p3_report()$report6_mod1,
                                rownames = F,
                                caption="利润贡献 每客户",
                                options = 
                                  list(pageLength = 120,
                                       ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report7_1 <- 
      renderDataTable(datatable(p3_report()$report7_mod1,
                                caption="销售额和数量/客户",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report7_2 <- 
      renderDataTable(datatable(p3_report()$report7_mod2,
                                caption="销售额和数量/客户",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report7_3 <- 
      renderDataTable(datatable(p3_report()$report7_mod3,
                                caption="销售额和数量/产品",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p3_report8_1 <- 
      renderDataTable(datatable(p3_report()$report8_mod1,
                                caption="商业价值",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p3_report8_2 <- 
      renderDataTable(datatable(p3_report()$report8_mod2,
                                caption="总市场概述",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    
    
    
    
    ##phase4
    output$p4_total_promotional_budget <- renderText(
      total_promotional_budget$phase4
    )
    
    
    p4_calculator_result <- reactive(calculator(input,4))
    
    output$p4_arranged_promotional_budget <- renderText(p4_calculator_result()[1])
    output$p4_arranged_time_of_sr1 <- renderText(p4_calculator_result()[2])
    output$p4_arranged_time_of_sr2 <- renderText(p4_calculator_result()[3])
    output$p4_arranged_time_of_sr3 <- renderText(p4_calculator_result()[4])
    output$p4_arranged_time_of_sr4 <- renderText(p4_calculator_result()[5])
    output$p4_arranged_time_of_sr5 <- renderText(p4_calculator_result()[6])
    
    output$p4_potential_sales_hosp1_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp1_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp1_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==2),]$potential_volume)
    output$p4_potential_sales_hosp1_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==4),]$potential_volume)
    output$p4_current_sales_hosp1_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==1),]$current_volume)
    output$p4_current_sales_hosp1_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==2),]$current_volume)
    output$p4_current_sales_hosp1_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==3),]$current_volume)
    output$p4_current_sales_hosp1_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==1&
                          volume_info$product.no==4),]$current_volume)
    output$p4_potential_sales_hosp2_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp2_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp2_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==2),]$potential_volume)
    output$p4_potential_sales_hosp2_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==4),]$potential_volume)
    output$p4_current_sales_hosp2_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==1),]$current_volume)
    output$p4_current_sales_hosp2_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==2),]$current_volume)
    output$p4_current_sales_hosp2_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==3),]$current_volume)
    output$p4_current_sales_hosp2_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==2&
                          volume_info$product.no==4),]$current_volume)
    output$p4_potential_sales_hosp3_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp3_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp3_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==2),]$potential_volume)
    output$p4_potential_sales_hosp3_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==4),]$potential_volume)
    output$p4_current_sales_hosp3_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==1),]$current_volume)
    output$p4_current_sales_hosp3_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==2),]$current_volume)
    output$p4_current_sales_hosp3_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==3),]$current_volume)
    output$p4_current_sales_hosp3_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==3&
                          volume_info$product.no==4),]$current_volume)
    output$p4_potential_sales_hosp4_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp4_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp4_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==2),]$potential_volume)
    output$p4_potential_sales_hosp4_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==4),]$potential_volume)
    output$p4_current_sales_hosp4_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==1),]$current_volume)
    output$p4_current_sales_hosp4_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==2),]$current_volume)
    output$p4_current_sales_hosp4_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==3),]$current_volume)
    output$p4_current_sales_hosp4_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==4&
                          volume_info$product.no==4),]$current_volume)
    output$p4_potential_sales_hosp5_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp5_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp5_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==2),]$potential_volume)
    output$p4_potential_sales_hosp5_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==4),]$potential_volume)
    output$p4_current_sales_hosp5_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==1),]$current_volume)
    output$p4_current_sales_hosp5_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==2),]$current_volume)
    output$p4_current_sales_hosp5_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==3),]$current_volume)
    output$p4_current_sales_hosp5_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==5&
                          volume_info$product.no==4),]$current_volume)
    output$p4_potential_sales_hosp6_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp6_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp6_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==2),]$potential_volume)
    output$p4_potential_sales_hosp6_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==4),]$potential_volume)
    output$p4_current_sales_hosp6_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==1),]$current_volume)
    output$p4_current_sales_hosp6_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==2),]$current_volume)
    output$p4_current_sales_hosp6_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==3),]$current_volume)
    output$p4_current_sales_hosp6_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==6&
                          volume_info$product.no==4),]$current_volume)
    output$p4_potential_sales_hosp7_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp7_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp7_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==2),]$potential_volume)
    output$p4_potential_sales_hosp7_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==4),]$potential_volume)
    output$p4_current_sales_hosp7_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==1),]$current_volume)
    output$p4_current_sales_hosp7_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==2),]$current_volume)
    output$p4_current_sales_hosp7_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==3),]$current_volume)
    output$p4_current_sales_hosp7_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==7&
                          volume_info$product.no==4),]$current_volume)
    output$p4_potential_sales_hosp8_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp8_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp8_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==2),]$potential_volume)
    output$p4_potential_sales_hosp8_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==4),]$potential_volume)
    output$p4_current_sales_hosp8_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==1),]$current_volume)
    output$p4_current_sales_hosp8_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==2),]$current_volume)
    output$p4_current_sales_hosp8_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==3),]$current_volume)
    output$p4_current_sales_hosp8_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==8&
                          volume_info$product.no==4),]$current_volume)
    output$p4_potential_sales_hosp9_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp9_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp9_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==2),]$potential_volume)
    output$p4_potential_sales_hosp9_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==4),]$potential_volume)
    output$p4_current_sales_hosp9_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==1),]$current_volume)
    output$p4_current_sales_hosp9_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==2),]$current_volume)
    output$p4_current_sales_hosp9_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==3),]$current_volume)
    output$p4_current_sales_hosp9_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==9&
                          volume_info$product.no==4),]$current_volume)
    output$p4_potential_sales_hosp10_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp10_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$potential_volume)
    output$p4_potential_sales_hosp10_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==2),]$potential_volume)
    output$p4_potential_sales_hosp10_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==4),]$potential_volume)
    output$p4_current_sales_hosp10_1 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==1),]$current_volume)
    output$p4_current_sales_hosp10_2 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==2),]$current_volume)
    output$p4_current_sales_hosp10_3 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==3),]$current_volume)
    output$p4_current_sales_hosp10_4 <- renderText(
      volume_info[which(volume_info$phase=="周期4"&
                          volume_info$hospital.no==10&
                          volume_info$product.no==4),]$current_volume)
    
    
    
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
    
    
    
    p4_flm_data <- reactive(get.data3(input,4))
    
    output$p4_total_sales_training <-renderText(sales_training(input,4))
    output$p4_flm_sales_training <- renderText(sales_training(input,4))
    output$p4_total_field_work <-renderText(field_work(input,4))
    output$p4_flm_field_work <- renderText(field_work(input,4))
    output$p4_sr1_team_meeting <- renderText(ifelse(input$p4_flm_team_meeting=="",
                                                    NA,
                                                    input$p4_flm_team_meeting))
    output$p4_sr2_team_meeting <- renderText(ifelse(input$p4_flm_team_meeting=="",
                                                    NA,
                                                    input$p4_flm_team_meeting))
    output$p4_sr3_team_meeting <- renderText(ifelse(input$p4_flm_team_meeting=="",
                                                    NA,
                                                    input$p4_flm_team_meeting))
    output$p4_sr4_team_meeting <- renderText(ifelse(input$p4_flm_team_meeting=="",
                                                    NA,
                                                    input$p4_flm_team_meeting))
    output$p4_sr5_team_meeting <- renderText(ifelse(input$p4_flm_team_meeting=="",
                                                    NA,
                                                    input$p4_flm_team_meeting))
    output$p4_total_team_meeting <- renderText(ifelse(input$p4_flm_team_meeting=="",
                                                      NA,
                                                      input$p4_flm_team_meeting))
    output$p4_total_kpi_analysis <- renderText(ifelse(input$p4_flm_kpi_analysis=="",
                                                      NA,
                                                      input$p4_flm_kpi_analysis))
    output$p4_total_strategy_planning <- renderText(ifelse(input$p4_flm_strategy_planning=="",
                                                           NA,
                                                           input$p4_flm_strategy_planning))
    output$p4_total_admin_work <- renderText(ifelse(input$p4_flm_admin_work=="",
                                                    NA,
                                                    input$p4_flm_admin_work))
    output$p4_total_management <- renderText(sum(p4_flm_data()))
    output$p4_flm_management <- renderText(sum(p4_flm_data()))
    
    
    tmp4 <- reactive({
      pp_data1 <- tmp() %>% select(hospital,
                                   product,
                                   real_revenue,
                                   real_volume,
                                   sr_sales_performance,
                                   deployment_quality_index,
                                   customer_relationship_index,
                                   promotional_support_index,
                                   sales_performance,
                                   offer_attractiveness,
                                   acc_offer_attractiveness) %>%
        distinct()
      
      colnames(pp_data1)[3:11] <- paste("pp_",colnames(pp_data1)[3:11],sep="")
      
      pp_data2 <- tmp() %>% select(sales_rep,
                                   sales_level,
                                   sr_revenue,
                                   sr_volume,
                                   sr_acc_revenue,
                                   sales_skills_index,
                                   product_knowledge_index,
                                   motivation_index,
                                   sr_acc_field_work) %>%
        distinct()
      
      colnames(pp_data2)[3:9] <- paste("pp_",colnames(pp_data2)[3:9],sep="")
      cp_data1 <- get.data1(input,4)
      cp_data2 <- get.data2(input,4)
      tmp <- calculation(pp_data1,
                         pp_data2,
                         cp_data1,
                         cp_data2)})
    
    p4_report<- eventReactive(input$decision2_phase4_submit,{
      if (
        
        p4_calculator_result()[1] <=100 &
        p4_calculator_result()[2] <=worktime &
        p4_calculator_result()[3] <=worktime &
        p4_calculator_result()[4] <=worktime &
        p4_calculator_result()[5] <=worktime &
        p4_calculator_result()[6] <=worktime &
        sum(p4_flm_data()) <=worktime
      ) {
        p4_report <- report_data(tmp4(),p4_flm_data())
        return(p4_report)
      } 
      
    })
    
    
    
    observeEvent(input$decision2_phase4_submit, {
      if (
        p4_calculator_result()[1] >100 |
        p4_calculator_result()[2] >worktime |
        p4_calculator_result()[3] >worktime |
        p4_calculator_result()[4] >worktime |
        p4_calculator_result()[5] >worktime |
        p4_calculator_result()[6] >worktime |
        sum(p4_flm_data()) >worktime
      ) {
        shinyjs::alert("推广预算分配或是时间分配超出最大值！！")
        
      } else{
        
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
        disable("p4_hosp10_worktime_nurs")
        
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
        disable("p4_sr5_product_training")}
    })
    
    output$p4_report1_1 <-
      renderDataTable(datatable(p4_report()$report1_mod1,
                                caption="职员成本",
                                options = 
                                  list(ordering = F, dom = "t",
                                       # autoWidth = TRUE,
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
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
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report1_3 <- 
      renderDataTable(datatable(p4_report()$report1_mod3,
                                caption="产品知识",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report1_4 <- 
      renderDataTable(datatable(p4_report()$report1_mod4,
                                caption="经验",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p4_report1_5 <- 
      renderDataTable(datatable(p4_report()$report1_mod5,
                                caption="销售技巧",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report2_1 <- 
      renderDataTable(datatable(p4_report()$report2_mod1,
                                caption="职员成本",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report2_2 <- 
      renderDataTable(datatable(p4_report()$report2_mod2,
                                caption="时间分配",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report3 <- 
      renderDataTable(datatable(p4_report()$report3_mod1,
                                rownames = F,
                                caption="时间分配",
                                options = 
                                  list(pageLength = 30,
                                       ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report4_1 <- 
      renderDataTable(datatable(p4_report()$report4_mod1,
                                caption="总体的分配情况",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p4_report4_2 <- 
      renderDataTable(datatable(p4_report()$report4_mod2,
                                caption="分级匹配度",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p4_report4_3 <- 
      renderDataTable(datatable(p4_report()$report4_mod3,
                                caption="决策质量",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p4_report5_1 <- 
      renderDataTable(datatable(p4_report()$report5_mod1,
                                caption="利润贡献I 每产品(总)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p4_report5_2 <- 
      renderDataTable(datatable(p4_report()$report5_mod2,
                                caption="利润贡献I 每产品(每件)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report5_3 <- 
      renderDataTable(datatable(p4_report()$report5_mod3,
                                caption="利润贡献III (总体)",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report6_1 <- 
      renderDataTable(datatable(p4_report()$report6_mod1,
                                rownames = F,
                                caption="利润贡献 每客户",
                                options = 
                                  list(pageLength = 120,
                                       ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report7_1 <- 
      renderDataTable(datatable(p4_report()$report7_mod1,
                                caption="销售额和数量/客户",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report7_2 <- 
      renderDataTable(datatable(p4_report()$report7_mod2,
                                caption="销售额和数量/客户",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report7_3 <- 
      renderDataTable(datatable(p4_report()$report7_mod3,
                                caption="销售额和数量/产品",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    output$p4_report8_1 <- 
      renderDataTable(datatable(p4_report()$report8_mod1,
                                caption="商业价值",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    output$p4_report8_2 <- 
      renderDataTable(datatable(p4_report()$report8_mod2,
                                caption="总市场概述",
                                options = 
                                  list(ordering = F, dom = "t",
                                       columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                       initComplete = JS(
                                         "function(settings, json) {",
                                         "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                         "}"))))
    
    
    
    
    
    
    
    final_report_data <- reactive({
      phase1 <- data_filter(tmp(),as.numeric(p1_report()$report5_mod3[8,1]))
      phase2 <- data_filter(tmp2(),as.numeric(p2_report()$report5_mod3[8,1]))
      phase3 <- data_filter(tmp3(),as.numeric(p3_report()$report5_mod3[8,1]))
      phase4 <- data_filter(tmp4(),as.numeric(p4_report()$report5_mod3[8,1]))
      
      out <- final_report(phase1,phase2,phase3,phase4)
      out
    })
    
    output$final_report <-renderDataTable(
      datatable(final_report_data(),
                caption="总分数",
                options =list(ordering = F, dom = "t",
                              columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                              initComplete = JS(
                                "function(settings, json) {",
                                "$(this.api().table().header()).css({'background-color': '#2F4F4F', 'color': '#fff'});",
                                "}")))
    ) 
    
    
    
    #### PASSWORD server code ---------------------------------------------------- 
    # reactive value containing user's authentication status
    user_input <- reactiveValues(authenticated = FALSE, valid_credentials = FALSE, 
                                 user_locked_out = FALSE, status = "")
    
    # authenticate user by:
    #   1. checking whether their user name and password are in the credentials 
    #       data frame and on the same row (credentials are valid)
    #   2. if credentials are valid, retrieve their lockout status from the data frame
    #   3. if user has failed login too many times and is not currently locked out, 
    #       change locked out status to TRUE in credentials DF and save DF to file
    #   4. if user is not authenticated, determine whether the user name or the password 
    #       is bad (username precedent over pw) or he is locked out. set status value for
    #       error message code below
    observeEvent(input$login_button, {
      credentials <- readRDS("credentials/credentials.rds")
      
      row_username <- which(credentials$user == input$user_name)
      row_password <- which(credentials$pw == digest(input$password)) # digest() makes md5 hash of password
      
      # if user name row and password name row are same, credentials are valid
      #   and retrieve locked out status
      if (length(row_username) == 1 && 
          length(row_password) >= 1 &&  # more than one user may have same pw
          (row_username %in% row_password)) {
        user_input$valid_credentials <- TRUE
        user_input$user_locked_out <- credentials$locked_out[row_username]
      }
      
      # if user is not currently locked out but has now failed login too many times:
      #   1. set current lockout status to TRUE
      #   2. if username is present in credentials DF, set locked out status in 
      #     credentials DF to TRUE and save DF
      if (input$login_button == num_fails_to_lockout & 
          user_input$user_locked_out == FALSE) {
        
        user_input$user_locked_out <- TRUE
        
        if (length(row_username) == 1) {
          credentials$locked_out[row_username] <- TRUE
          
          saveRDS(credentials, "credentials/credentials.rds")
        }
      }
      
      # if a user has valid credentials and is not locked out, he is authenticated      
      if (user_input$valid_credentials == TRUE & user_input$user_locked_out == FALSE) {
        user_input$authenticated <- TRUE
      } else {
        user_input$authenticated <- FALSE
      }
      
      # if user is not authenticated, set login status variable for error messages below
      if (user_input$authenticated == FALSE) {
        if (user_input$user_locked_out == TRUE) {
          user_input$status <- "locked_out"  
        } else if (length(row_username) > 1) {
          user_input$status <- "credentials_data_error"  
        } else if (input$user_name == "" || length(row_username) == 0) {
          user_input$status <- "bad_user"
        } else if (input$password == "" || length(row_password) == 0) {
          user_input$status <- "bad_password"
        }
      }
    })   
    
    # password entry UI componenets:
    #   username and password text fields, login button
    output$uiLogin <- renderUI({
      wellPanel(
        textInput("user_name", "User Name:"),

        passwordInput("password", "Password:"),

        actionButton("login_button", "Log in")
      )
    })
    
    # red error message if bad credentials
    output$pass <- renderUI({
      if (user_input$status == "locked_out") {
        h5(strong(paste0("Your account is locked because of too many\n",
                         "failed login attempts. Contact administrator."), style = "color:red"), align = "center")
      } else if (user_input$status == "credentials_data_error") {    
        h5(strong("Credentials data error - contact administrator!", style = "color:red"), align = "center")
      } else if (user_input$status == "bad_user") {
        h5(strong("User name not found!", style = "color:red"), align = "center")
      } else if (user_input$status == "bad_password") {
        h5(strong("Incorrect password!", style = "color:red"), align = "center")
      } else {
        ""
      }
    })  
    
  })

