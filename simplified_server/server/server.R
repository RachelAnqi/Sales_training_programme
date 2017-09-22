library(shiny)
library(shinydashboard)
library(shinyjs)
library(DT)
library(plyr)
library(dplyr)
library(tidyr)
library(digest)










num_fails_to_lockout<-10


mainbody <- div(
  
  
  tabItems(
    # First tab content
    tabItem(tabName = "news_and_WAS",
            tabsetPanel(
              tabPanel("客户信息",
                       br(),
                       fluidRow(
                       
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
                               dataTableOutput("p1_hospital_info"))),
                       hidden(
                         div(id="phase2_hospital_info_box",
                             box(width = 8,
                               title = "客户信息",
                               solidHeader = TRUE, status = "primary",
                               dataTableOutput("p2_hospital_info")
                             )
                         )),
                       hidden(
                         div(id="phase3_hospital_info_box",
                             box(width = 8,
                               title = "客户信息",
                               solidHeader = TRUE, status = "primary",
                               dataTableOutput("p3_hospital_info")
                               
                             )
                         )),
                       hidden(
                         div(id="phase4_hospital_info_box",
                             box(width = 8,
                               title = "客户信息",
                               solidHeader = TRUE, status = "primary",
                               dataTableOutput("p4_hospital_info")
                               
                             )
                         )))
              ),
              tabPanel("新闻",
                       br(),
                       fluidRow(
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
                               dataTableOutput("p1_was_plan"))),
                       hidden(
                         div(id="phase2_WAS_info_box",
                             box(width = 8,
                                 title = "新闻快报",
                                 solidHeader = TRUE, status = "primary",
                                 dataTableOutput("p2_was_plan")
                             )
                         )),
                       hidden(
                         div(id="phase3_WAS_info_box",
                             box(width = 8,
                                 title = "新闻快报",
                                 solidHeader = TRUE, status = "primary",
                                 dataTableOutput("p3_was_plan")
                             )
                         )),
                       hidden(
                         div(id="phase4_WAS_info_box",
                             box(width = 8,
                                 title = "新闻快报",
                                 solidHeader = TRUE, status = "primary",
                                 dataTableOutput("p4_was_plan")
                             )
                         )))
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
                 box(title = "经理指标和推广预算",
                     status = "primary",
                     solidHeader = TRUE,
                     width="100%",
                     
                     tags$div(
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                                "经理的销售指标"),
                       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                                verbatimTextOutput("p1_flm_sales_target"))
                     ),
                     
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
                   
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "折扣(%)"),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp1_1", label =
                   #                        NULL, value="5")),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp1_2", label =
                   #                        NULL, value="5")),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp1_3", label =
                   #                        NULL, value="5")),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp1_4", label =
                   #                        NULL, value="5"))
                   # ),
                   
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
                         choices = sr_info_initial_value$sales_rep,
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
                   )
                   
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 A级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp1_worktime_doc",
                   #       label = NULL,
                   #       value = "6"
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 B级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp1_worktime_diet",
                   #       label = NULL,
                   #       value = "6"
                   #       
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 C级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp1_worktime_admin",
                   #       label = NULL,
                   #       value = "6"
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 D级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp1_worktime_nurs",
                   #       label = NULL,
                   #       value = "6"
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "总体(%)"),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                   #            verbatimTextOutput("p1_decison1_summary_hosp1"))
                   # )
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
                   
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "折扣(%)"),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp2_1", label =
                   #                        NULL, value="5")),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp2_2", label =
                   #                        NULL, value="5")),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp2_3", label =
                   #                        NULL, value="5")),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp2_4", label =
                   #                        NULL, value="5"))
                   # ),
                   
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
                         choices = sr_info_initial_value$sales_rep,
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
                   )
                   
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 A级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp2_worktime_doc",
                   #       label = NULL,
                   #       value = "6"
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 B级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp2_worktime_diet",
                   #       label = NULL,
                   #       value = "6"
                   #       
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 C级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp2_worktime_admin",
                   #       label = NULL,
                   #       value = "6"
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 D级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp2_worktime_nurs",
                   #       label = NULL,
                   #       value = "6"
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "总体(%)"),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                   #            verbatimTextOutput("p1_decison1_summary_hosp2"))
                   # )
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
                   
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "折扣(%)"),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp3_1", label =
                   #                        NULL, value="5")),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp3_2", label =
                   #                        NULL, value="5")),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp3_3", label =
                   #                        NULL, value="5")),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                   #            textInput("p1_discount_hosp3_4", label =
                   #                        NULL, value="5"))
                   # ),
                   
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
                         choices = sr_info_initial_value$sales_rep,
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
                   )
                   
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 A级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp3_worktime_doc",
                   #       label = NULL,
                   #       value = "6"
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 B级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp3_worktime_diet",
                   #       label = NULL,
                   #       value = "6"
                   #       
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 C级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp3_worktime_admin",
                   #       label = NULL,
                   #       value = "6"
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "时间被分配到 D级客户(%)"),
                   #   tags$div(
                   #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                   #     textInput(
                   #       "p1_hosp3_worktime_nurs",
                   #       label = NULL,
                   #       value = "6"
                   #     )
                   #   )
                   # ),
                   # 
                   # tags$div(
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                   #            "总体(%)"),
                   #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                   #            verbatimTextOutput("p1_decison1_summary_hosp3"))
                   # )
                 )),
        
        
        
        tabPanel(
          "周期2",
          value="phase2",
          
          # fluidRow(
          #   h3("总推广预算"),
          br(),
          hidden(
            div(id="decision1_phase2",
                box(
                  title="经理指标和推广预算",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  
                  tags$div(
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                             "经理的销售指标"),
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                             verbatimTextOutput("p2_flm_sales_target"))
                  ),
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
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "折扣(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp1_1", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp1_2", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp1_3", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp1_4", label =
                  #                        NULL, value="5"))
                  # ),
                  
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
                        choices = sr_info_initial_value$sales_rep,
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
                  )
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 A级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p2_hosp1_worktime_doc",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 B级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p2_hosp1_worktime_diet",
                  #       label = NULL,
                  #       value = "6"
                  #       
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 C级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p2_hosp1_worktime_admin",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 D级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p2_hosp1_worktime_nurs",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "总体(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                  #            verbatimTextOutput("p2_decison1_summary_hosp1"))
                  # )
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
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "折扣(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp2_1", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp2_2", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp2_3", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp2_4", label =
                  #                        NULL, value="5"))
                  # ),
                  
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
                        choices = sr_info_initial_value$sales_rep,
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
                  )
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 A级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p2_hosp2_worktime_doc",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 B级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p2_hosp2_worktime_diet",
                  #       label = NULL,
                  #       value = "6"
                  #       
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 C级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p2_hosp2_worktime_admin",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 D级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p2_hosp2_worktime_nurs",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "总体(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                  #            verbatimTextOutput("p2_decison1_summary_hosp2"))
                  # )
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
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "折扣(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp3_1", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp3_2", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp3_3", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p2_discount_hosp3_4", label =
                  #                        NULL, value="5"))
                  # ),
                  
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
                        choices = sr_info_initial_value$sales_rep,
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
                  )
                  
            #       tags$div(
            #         tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
            #                  "时间被分配到 A级客户(%)"),
            #         tags$div(
            #           style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
            #           textInput(
            #             "p2_hosp3_worktime_doc",
            #             label = NULL,
            #             value = "6"
            #           )
            #         )
            #       ),
            #       
            #       tags$div(
            #         tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
            #                  "时间被分配到 B级客户(%)"),
            #         tags$div(
            #           style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
            #           textInput(
            #             "p2_hosp3_worktime_diet",
            #             label = NULL,
            #             value = "6"
            #             
            #           )
            #         )
            #       ),
            #       
            #       tags$div(
            #         tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
            #                  "时间被分配到 C级客户(%)"),
            #         tags$div(
            #           style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
            #           textInput(
            #             "p2_hosp3_worktime_admin",
            #             label = NULL,
            #             value = "6"
            #           )
            #         )
            #       ),
            #       
            #       tags$div(
            #         tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
            #                  "时间被分配到 D级客户(%)"),
            #         tags$div(
            #           style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
            #           textInput(
            #             "p2_hosp3_worktime_nurs",
            #             label = NULL,
            #             value = "6"
            #           )
            #         )
            #       ),
            #       
            #       tags$div(
            #         tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
            #                  "总体(%)"),
            #         tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
            #                  verbatimTextOutput("p2_decison1_summary_hosp3"))
            #      
            # )
          )))),
        tabPanel(
          "周期3",
          
          # fluidRow(
          #   h3("总推广预算"),
          br(),
          hidden(
            div(id="decision1_phase3",
                box(
                  title="经理指标和推广预算",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  
                  tags$div(
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                             "经理的销售指标"),
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                             verbatimTextOutput("p3_flm_sales_target"))
                  ),
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
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "折扣(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp1_1", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp1_2", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp1_3", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp1_4", label =
                  #                        NULL, value="5"))
                  # ),
                  
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
                        choices = sr_info_initial_value$sales_rep,
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
                  )
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 A级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp1_worktime_doc",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 B级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp1_worktime_diet",
                  #       label = NULL,
                  #       value = "6"
                  #       
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 C级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp1_worktime_admin",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 D级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp1_worktime_nurs",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "总体(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                  #            verbatimTextOutput("p3_decison1_summary_hosp1"))
                  # )
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
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "折扣(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp2_1", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp2_2", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp2_3", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp2_4", label =
                  #                        NULL, value="5"))
                  # ),
                  
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
                        choices = sr_info_initial_value$sales_rep,
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
                  )
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 A级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp2_worktime_doc",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 B级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp2_worktime_diet",
                  #       label = NULL,
                  #       value = "6"
                  #       
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 C级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp2_worktime_admin",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 D级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp2_worktime_nurs",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "总体(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                  #            verbatimTextOutput("p3_decison1_summary_hosp2"))
                  # )
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
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "折扣(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp3_1", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp3_2", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp3_3", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p3_discount_hosp3_4", label =
                  #                        NULL, value="5"))
                  # ),
                  
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
                        choices = sr_info_initial_value$sales_rep,
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
                  )
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 A级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp3_worktime_doc",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 B级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp3_worktime_diet",
                  #       label = NULL,
                  #       value = "6"
                  #       
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 C级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp3_worktime_admin",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 D级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p3_hosp3_worktime_nurs",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "总体(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                  #            verbatimTextOutput("p3_decison1_summary_hosp3"))
                  # 
                  # )
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
                  title="经理指标和推广预算",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  
                  tags$div(
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                             "经理的销售指标"),
                    tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left",
                             verbatimTextOutput("p4_flm_sales_target"))
                  ),
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
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "折扣(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp1_1", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp1_2", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp1_3", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp1_4", label =
                  #                        NULL, value="5"))
                  # ),
                  
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
                        choices = sr_info_initial_value$sales_rep,
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
                  )
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 A级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p4_hosp1_worktime_doc",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 B级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p4_hosp1_worktime_diet",
                  #       label = NULL,
                  #       value = "6"
                  #       
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 C级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p4_hosp1_worktime_admin",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 D级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p4_hosp1_worktime_nurs",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "总体(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                  #            verbatimTextOutput("p4_decison1_summary_hosp1"))
                  # )
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
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "折扣(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp2_1", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp2_2", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp2_3", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp2_4", label =
                  #                        NULL, value="5"))
                  # ),
                  
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
                        choices = sr_info_initial_value$sales_rep,
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
                  )
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 A级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p4_hosp2_worktime_doc",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 B级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p4_hosp2_worktime_diet",
                  #       label = NULL,
                  #       value = "6"
                  #       
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 C级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p4_hosp2_worktime_admin",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 D级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p4_hosp2_worktime_nurs",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "总体(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                  #            verbatimTextOutput("p4_decison1_summary_hosp2"))
                  # )
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
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "折扣(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp3_1", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp3_2", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp3_3", label =
                  #                        NULL, value="5")),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:center;margin-right:10px;",
                  #            textInput("p4_discount_hosp3_4", label =
                  #                        NULL, value="5"))
                  # ),
                  
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
                        choices = sr_info_initial_value$sales_rep,
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
                  )
                  
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 A级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p4_hosp3_worktime_doc",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 B级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p4_hosp3_worktime_diet",
                  #       label = NULL,
                  #       value = "6"
                  #       
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 C级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(
                  #       "p4_hosp3_worktime_admin",
                  #       label = NULL,
                  #       value = "6"
                  #     )
                  #   )
                  # ),
                  # 
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "时间被分配到 D级客户(%)"),
                  #   tags$div(
                  #     style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #     textInput(tags$div(
                  #       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #                "时间被分配到 A级客户(%)"),
                  #       tags$div(
                  #         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #         textInput(
                  #           "p1_hosp2_worktime_doc",
                  #           label = NULL,
                  #           value = "6"
                  #         )
                  #       )
                  #     ),
                  #     
                  #     tags$div(
                  #       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #                "时间被分配到 B级客户(%)"),
                  #       tags$div(
                  #         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #         textInput(
                  #           "p1_hosp2_worktime_diet",
                  #           label = NULL,
                  #           value = "6"
                  #           
                  #         )
                  #       )
                  #     ),
                  #     
                  #     tags$div(
                  #       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #                "时间被分配到 C级客户(%)"),
                  #       tags$div(
                  #         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #         textInput(
                  #           "p1_hosp2_worktime_admin",
                  #           label = NULL,
                  #           value = "6"
                  #         )
                  #       )
                  #     ),
                  #     
                  #     tags$div(
                  #       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #                "时间被分配到 D级客户(%)"),
                  #       tags$div(
                  #         style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:center;margin-right:10px;",
                  #         textInput(
                  #           "p1_hosp2_worktime_nurs",
                  #           label = NULL,
                  #           value = "6"
                  #         )
                  #       )
                  #     ),
                  #     
                  #     tags$div(
                  #       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #                "总体(%)"),
                  #       tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                  #                verbatimTextOutput("p1_decison1_summary_hosp2"))
                  #     )
                #         "p4_hosp3_worktime_nurs",
                #         label = NULL,
                #         value = "6"
                #       )
                #     )
                #   ),
                #   
                  # tags$div(
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:20px;text-align:left;",
                  #            "总体(%)"),
                  #   tags$div(style = "display:inline-block;width:16%;vertical-align:middle;margin-left:10px;text-align:left;margin-right:10px;",
                  #            verbatimTextOutput("p4_decison1_summary_hosp3"))
                  # 
                  # )
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
          selectInput(inputId = "select_file",label = "filename",choices = list.files(pattern="\\.RDS$"),selected=NULL),
          #fluidRow(h3("时间分配"),
          box(
            title="时间分配",
            status = "primary",
            solidHeader = TRUE,
            width="100%",
            tags$div(
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:15%;margin-left:20px;",
                       "可供时间分配(天)"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_work_time"))
            ),
            tags$div(
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:15%;margin-left:20px;",
                       "已分配时间 销售代表1(天)"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_arranged_time_of_sr1"))
            ),
            tags$div(
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:15%;margin-left:20px;",
                       "已分配时间 销售代表2(天)"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_arranged_time_of_sr2"))
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
              tags$div(style = "display:inline-block;margin-left:15%;vertical-align:middle;text-align:center;width:11.5%",
                       "总时间的百分比"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:30px;width:8%",
                       "经理"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:25px;width:10.5%",
                       sr_info_initial_value$sales_rep[1]),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:20px;width:10.5%",
                       sr_info_initial_value$sales_rep[2])
            ),
            br(),
            tags$div(
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px",
                       "销售培训"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_sales_training")),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_flm_sales_training")),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                       textInput("p1_sr1_sales_training", label =
                                   NULL,value=5)),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                       textInput("p1_sr2_sales_training", label =
                                   NULL,value=5))
            ),
            tags$div(
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                       "医院拜访"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_field_work")),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_flm_field_work")),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                       textInput("p1_sr1_field_work", label =
                                   NULL,value=5)),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                       textInput("p1_sr2_field_work", label =
                                   NULL,value=5))
            ),
            tags$div(
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                       "团队会议"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_team_meeting")),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                       textInput("p1_flm_team_meeting", label =
                                   NULL,value=5)),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                       verbatimTextOutput("p1_sr1_team_meeting")),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                       verbatimTextOutput("p1_sr2_team_meeting"))
            ),
            tags$div(
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                       "KPI 报告分析"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_kpi_analysis")),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                       textInput("p1_flm_kpi_analysis", label =
                                   NULL,value=5))
            ),
            # tags$div(
            #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
            #            "战略和周期计划"),
            #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
            #            verbatimTextOutput("p1_total_strategy_planning")),
            #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
            #            textInput("p1_flm_strategy_planning", label =
            #                        NULL,value=5))
            # ),
            tags$div(
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                       "行政工作"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_admin_work")),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                       textInput("p1_flm_admin_work", label =
                                   NULL,value=5))
            ),
            tags$div(
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px",
                       "总体"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_total_management")),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                       verbatimTextOutput("p1_flm_management"))
            )
          ),
          br(),
          # fluidRow(
          #   h3("产品培训"),
          box(
            title="产品培训(天数)",
            status = "primary",
            solidHeader = TRUE,
            width="100%",
            tags$div(
              tags$div(style = "display:inline-block;margin-left:15%;vertical-align:middle;text-align:center;width:11.5%",
                       sr_info_initial_value$sales_rep[1]),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:30px;width:8%",
                       sr_info_initial_value$sales_rep[2])
            ),
            br(),
            
            tags$div(
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px",
                       "产品培训"),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                       textInput("p1_sr1_product_training", label =
                                   NULL,value=5)),
              tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                       textInput("p1_sr2_product_training", label =
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
                    tags$div(style = "display:inline-block;margin-left:20px;width:15%;vertical-align:middle;text-align:left;",
                             "可供时间分配(天)"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_work_time"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表1(天)"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_arranged_time_of_sr1"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表2(天)"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_arranged_time_of_sr2"))
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
                    tags$div(style = "display:inline-block;margin-left:15%;vertical-align:middle;text-align:center;width:11.5%",
                             "总时间的百分比"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:30px;width:8%",
                             "经理"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:25px;width:10.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:20px;width:10.5%",
                             sr_info_initial_value$sales_rep[2])
                  ),
                  br(),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "销售培训"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_sales_training")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_flm_sales_training")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p2_sr1_sales_training", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p2_sr2_sales_training", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "医院拜访"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_field_work")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_flm_field_work")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p2_sr1_field_work", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p2_sr2_field_work", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "团队会议"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_team_meeting")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p2_flm_team_meeting", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p2_sr1_team_meeting")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p2_sr2_team_meeting"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "KPI 报告分析"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_kpi_analysis")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p2_flm_kpi_analysis", label =
                                         NULL))
                  ),
                  # tags$div(
                  #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                  #            "战略和周期计划"),
                  #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                  #            verbatimTextOutput("p2_total_strategy_planning")),
                  #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                  #            textInput("p2_flm_strategy_planning", label =
                  #                        NULL))
                  # ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "行政工作"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_admin_work")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p2_flm_admin_work", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "总体"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_total_management")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p2_flm_management"))
                  )
                ),
                br(),
                # fluidRow(
                #   h3("产品培训"),
                box(
                  title="产品培训(天数)",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;margin-left:15%;vertical-align:middle;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:30px;width:8%",
                             sr_info_initial_value$sales_rep[2])
                  ),
                  br(),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "产品培训"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                             textInput("p2_sr1_product_training", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p2_sr2_product_training", label =
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
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:15%;margin-left:20px;",
                             "可供时间分配(天)"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_work_time"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表1(天)"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_arranged_time_of_sr1"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表2(天)"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_arranged_time_of_sr2"))
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
                    tags$div(style = "display:inline-block;margin-left:15%;vertical-align:middle;text-align:center;width:11.5%",
                             "总时间的百分比"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:30px;width:8%",
                             "经理"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:25px;width:10.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:20px;width:10.5%",
                             sr_info_initial_value$sales_rep[2])
                  ),
                  br(),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "销售培训"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_sales_training")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_flm_sales_training")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p3_sr1_sales_training", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p3_sr2_sales_training", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "医院拜访"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_field_work")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_flm_field_work")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p3_sr1_field_work", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p3_sr2_field_work", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "团队会议"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_team_meeting")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p3_flm_team_meeting", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p3_sr1_team_meeting")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p3_sr2_team_meeting"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "KPI 报告分析"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_kpi_analysis")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p3_flm_kpi_analysis", label =
                                         NULL))
                  ),
                  # tags$div(
                  #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                  #            "战略和周期计划"),
                  #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                  #            verbatimTextOutput("p3_total_strategy_planning")),
                  #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                  #            textInput("p3_flm_strategy_planning", label =
                  #                        NULL))
                  # ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "行政工作"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_admin_work")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p3_flm_admin_work", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "总体"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_total_management")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p3_flm_management"))
                  )
                ),
                br(),
                # fluidRow(
                #   h3("产品培训"),
                box(
                  title="产品培训(天数)",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;margin-left:15%;vertical-align:middle;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:30px;width:8%",
                             sr_info_initial_value$sales_rep[2])
                  ),
                  br(),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px",
                             "产品培训"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                             textInput("p3_sr1_product_training", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p3_sr2_product_training", label =
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
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:15%;margin-left:20px;",
                             "可供时间分配(天)"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_work_time"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表1(天)"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_arranged_time_of_sr1"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:15%;margin-left:20px;",
                             "已分配时间 销售代表2(天)"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:3%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_arranged_time_of_sr2"))
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
                    tags$div(style = "display:inline-block;margin-left:15%;vertical-align:middle;text-align:center;width:11.5%",
                             "总时间的百分比"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:30px;width:8%",
                             "经理"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:25px;width:10.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:20px;width:10.5%",
                             sr_info_initial_value$sales_rep[2])
                  ),
                  br(),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "销售培训"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_sales_training")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_flm_sales_training")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p4_sr1_sales_training", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p4_sr2_sales_training", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "医院拜访"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_field_work")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_flm_field_work")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p4_sr1_field_work", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2.5%;width:8%;margin-right:1.5%",
                             textInput("p4_sr2_field_work", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "团队会议"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_team_meeting")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p4_flm_team_meeting", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p4_sr1_team_meeting")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2.5%;width:8%;margin-right:1.5%",
                             verbatimTextOutput("p4_sr2_team_meeting"))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "KPI 报告分析"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_kpi_analysis")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p4_flm_kpi_analysis", label =
                                         NULL))
                  ),
                  # tags$div(
                  #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                  #            "战略和周期计划"),
                  #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                  #            verbatimTextOutput("p4_total_strategy_planning")),
                  #   tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                  #            textInput("p4_flm_strategy_planning", label =
                  #                        NULL))
                  # ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px",
                             "行政工作"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_admin_work")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p4_flm_admin_work", label =
                                         NULL))
                  ),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px;",
                             "总体"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:1%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_total_management")),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:2%;width:8%;margin-right:1%",
                             verbatimTextOutput("p4_flm_management"))
                  )
                ),
                br(),
                # fluidRow(
                #   h3("产品培训"),
                box(
                  title="产品培训(天数)",
                  status = "primary",
                  solidHeader = TRUE,
                  width="100%",
                  tags$div(
                    tags$div(style = "display:inline-block;margin-left:15%;vertical-align:middle;text-align:center;width:11.5%",
                             sr_info_initial_value$sales_rep[1]),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;margin-left:30px;width:8%",
                             sr_info_initial_value$sales_rep[2])
                  ),
                  br(),
                  tags$div(
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:left;width:13%;margin-left:20px",
                             "产品培训"),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:1%;width:8%;margin-right:1%",
                             textInput("p4_sr1_product_training", label =
                                         NULL)),
                    tags$div(style = "display:inline-block;vertical-align:middle;text-align:center;margin-left:2%;width:8%;margin-right:1%",
                             textInput("p4_sr2_product_training", label =
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
                       box(title="市场销售报告",
                           width="100%",
                           status = "primary", solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report8_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report8_2"))),
                       
                       br(),
                       box(title="代表报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           
                           
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
                                    dataTableOutput("p1_report1_5")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report1_6"))
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
                           
                           tags$div(style = "margin-left:3%",
                                    selectInput("p1_report3_hosp",
                                                label="选择医院",
                                                choice=c("ALL",as.character(hospital_info$hospital)),
                                                selected=NULL)),
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p1_report3"))),
                       br(),
                       box(title="决策报告",
                           width="100%",
                           status = "primary", solidHeader = TRUE,
                           
                           
                           
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
                                    dataTableOutput("p1_report5_3"))),
                       br(),
                       box(title="利润贡献(每客户)",
                           width="100%",
                           status = "primary", solidHeader = TRUE,
                           
                           tags$div(style = "margin-left:3%",
                                    selectInput("p1_profit3_hosp",
                                       label="选择医院",
                                       choice=c("ALL",as.character(hospital_info$hospital)),
                                       selected=NULL)),
                           
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
                                    dataTableOutput("p1_report7_3")))
                       
                       
              ),
              
              tabPanel("周期2",
                       
                       br(),
                       box(title="市场销售报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report8_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report8_2"))),
                       
                       br(),
                       box(title="代表报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           
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
                                    dataTableOutput("p2_report1_5")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report1_6"))
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
                           
                           tags$div(style = "margin-left:3%",
                                    selectInput("p2_report3_hosp",
                                                label="选择医院",
                                                choice=c("ALL",as.character(hospital_info$hospital)),
                                                selected=NULL)),
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p2_report3"))),
                       br(),
                       box(title="决策报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
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
                                    dataTableOutput("p2_report5_3"))),
                       br(),
                       box(title="利润贡献(每客户)",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "margin-left:3%",
                                    selectInput("p2_profit3_hosp",
                                                label="选择医院",
                                                choice=c("ALL",as.character(hospital_info$hospital)),
                                                selected=NULL)),
                           
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
                                    dataTableOutput("p2_report7_3")))
                       
                       ),
              
              tabPanel("周期3",
                       br(),
                       
                       br(),
                       box(title="市场销售报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report8_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report8_2"))),
                       
                       box(title="代表报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           
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
                                    dataTableOutput("p3_report1_5")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report1_6"))
                           ),
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
                           
                           tags$div(style = "margin-left:3%",
                                    selectInput("p3_report3_hosp",
                                                label="选择医院",
                                                choice=c("ALL",as.character(hospital_info$hospital)),
                                                selected=NULL)),
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p3_report3"))),
                       br(),
                       box(title="决策报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
                           
                           
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
                                    dataTableOutput("p3_report5_3"))),
                       br(),
                       box(title="利润贡献(每客户)",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "margin-left:3%",
                                    selectInput("p3_profit3_hosp",
                                                label="选择医院",
                                                choice=c("ALL",as.character(hospital_info$hospital)),
                                                selected=NULL)),
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
                                    dataTableOutput("p3_report7_3")))
                       ),
              
              tabPanel("周期4",
                       
                       br(),
                       box(title="市场销售报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report8_1")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report8_2"))),
                       
                       br(),
                       box(title="代表报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           
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
                                    dataTableOutput("p4_report1_5")),
                           br(),br(),br(),
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report1_6"))
                           ),
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
                           
                           tags$div(style = "margin-left:3%",
                                    selectInput("p4_report3_hosp",
                                                label="选择医院",
                                                choice=c("ALL",as.character(hospital_info$hospital)),
                                                selected=NULL)),
                           
                           tags$div(style = "text-align:left;margin-left:3%",
                                    dataTableOutput("p4_report3"))),
                       br(),
                       box(title="决策报告",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,      
                           
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
                                    dataTableOutput("p4_report5_3"))),
                       br(),
                       box(title="利润贡献(每客户)",
                           width="100%",
                           status = "primary", 
                           solidHeader = TRUE,
                           tags$div(style = "margin-left:3%",
                                    selectInput("p4_profit3_hosp",
                                                label="选择医院",
                                                choice=c("ALL",as.character(hospital_info$hospital)),
                                                selected=NULL)),
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
                                    dataTableOutput("p4_report7_3")))
                       
              )
              
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



server=function(input, output, session) {
  
  
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
  
  output$p1_flm_sales_target <- renderText("待定")
  output$p2_flm_sales_target <- renderText("待定")
  output$p3_flm_sales_target <- renderText("待定")
  output$p4_flm_sales_target <- renderText("待定")
  
  
  
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
  output$p1_hospital_info <- renderDataTable(
    datatable(hospital_info_initial_ui[which(hospital_info_initial_ui$phase=="周期1"),-1],
              rownames = FALSE,
              caption="",
              options =list(pageLength=30,
                            ordering = F, dom = "t",
                            columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                            initComplete = JS(
                              "function(settings, json) {",
                              "$(this.api().table().header());",
                              "}"))))
  
  output$p2_hospital_info <- renderDataTable(
    datatable(hospital_info_initial_ui[which(hospital_info_initial_ui$phase=="周期2"),-1],
              rownames = FALSE,
              caption="",
              options =list(pageLength=30,
                            ordering = F, dom = "t",
                            columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                            initComplete = JS(
                              "function(settings, json) {",
                              "$(this.api().table().header());",
                              "}"))))
  
  output$p3_hospital_info <- renderDataTable(
    datatable(hospital_info_initial_ui[which(hospital_info_initial_ui$phase=="周期3"),-1],
              rownames = FALSE,
              caption="",
              options =list(pageLength=30,
                            ordering = F, dom = "t",
                            columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                            initComplete = JS(
                              "function(settings, json) {",
                              "$(this.api().table().header());",
                              "}"))))
  
  output$p4_hospital_info <- renderDataTable(
    datatable(hospital_info_initial_ui[which(hospital_info_initial_ui$phase=="周期4"),-1],
              rownames = FALSE,
              caption="",
              options =list(pageLength=30,
                            ordering = F, dom = "t",
                            columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                            initComplete = JS(
                              "function(settings, json) {",
                              "$(this.api().table().header());",
                              "}"))))
  
  output$p1_was_plan <- renderDataTable(
    datatable(contact_priority_info[which(contact_priority_info$phase=="周期1"),-c(1,2)],
              rownames = FALSE,
              caption="",
              options =list(ordering = F, dom = "t",
                            columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                            initComplete = JS(
                              "function(settings, json) {",
                              "$(this.api().table().header());",
                              "}"))))
  
  output$p2_was_plan <- renderDataTable(
    datatable(contact_priority_info[which(contact_priority_info$phase=="周期2"),-c(1,2)],
              rownames = FALSE,
              caption="",
              options =list(ordering = F, dom = "t",
                            columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                            initComplete = JS(
                              "function(settings, json) {",
                              "$(this.api().table().header());",
                              "}"))))
  
  output$p3_was_plan <- renderDataTable(
    datatable(contact_priority_info[which(contact_priority_info$phase=="周期3"),-c(1,2)],
              rownames = FALSE,
              caption="",
              options =list(ordering = F, dom = "t",
                            columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                            initComplete = JS(
                              "function(settings, json) {",
                              "$(this.api().table().header());",
                              "}"))))
  
  output$p4_was_plan <- renderDataTable(
    datatable(contact_priority_info[which(contact_priority_info$phase=="周期4"),-c(1,2)],
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
  
  
  p1_calculator_result <- reactive({
    
    calculator(input,1)})
  
  
  
  
  output$p1_arranged_promotional_budget <- renderText(p1_calculator_result()[1]) 
  output$p1_arranged_time_of_sr1 <- renderText(p1_calculator_result()[2])
  output$p1_arranged_time_of_sr2 <- renderText(p1_calculator_result()[3])

  
  output$p1_potential_sales_hosp1_1 <- renderText(
    volume_info[which(volume_info$phase=="周期1"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==1),]$potential_volume)
  output$p1_potential_sales_hosp1_2 <- renderText(
    volume_info[which(volume_info$phase=="周期1"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==2),]$potential_volume)
  output$p1_potential_sales_hosp1_3 <- renderText(
    volume_info[which(volume_info$phase=="周期1"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==3),]$potential_volume)
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
                        volume_info$product.no==2),]$potential_volume)
  output$p1_potential_sales_hosp2_3 <- renderText(
    volume_info[which(volume_info$phase=="周期1"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==3),]$potential_volume)
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
                        volume_info$product.no==2),]$potential_volume)
  output$p1_potential_sales_hosp3_3 <- renderText(
    volume_info[which(volume_info$phase=="周期1"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==3),]$potential_volume)
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
  
  
  
  # output$p1_decison1_summary_hosp1 <- renderText(decision1_summary(input,1,1))
  # output$p1_decison1_summary_hosp2 <- renderText(decision1_summary(input,1,2))
  # output$p1_decison1_summary_hosp3 <- renderText(decision1_summary(input,1,3))
  
  
  observeEvent(input$save_inputs,{
    time <- gsub("-","_",Sys.Date())
    saveRDS( reactiveValuesToList(input) ,
             file = paste(input$user_name,"_",time,'.RDS',sep=""))})
  
  observeEvent(input$load_inputs,{   
    
    if(!file.exists(input$select_file)) {return(NULL)}
    
    savedInputs <- readRDS(input$select_file)
    
   
    for (i in 1:length(savedInputs)) { 
      session$sendInputMessage(names(savedInputs)[i],  list(value=savedInputs[[i]]) )
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
  output$p1_total_management <- renderText(sum(p1_flm_data(),na.rm=T))
  output$p1_flm_management <- renderText(sum(p1_flm_data(),na.rm=T))
  
  
  

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
      sum(p1_flm_data(),na.rm=T) <=worktime
    ) {
      p1_report <- report_data(tmp(),p1_flm_data(),null_report8)
      return(p1_report)
    } 
    
  })
  
  
  observeEvent(input$decision2_phase1_submit,{
    if (
      p1_calculator_result()[1] >100 |
      p1_calculator_result()[2] >worktime |
      sum(p1_flm_data(),na.rm=T) >worktime 
    ) {
      shinyjs::alert("推广预算分配或是时间分配超出最大值！！")
      
    } else{
      
      shinyjs::show(id="decision1_phase2",anim=T)
      shinyjs::show(id="decision2_phase2",anim=T)
      shinyjs::enable(id="phase2_hospital_info")
      shinyjs::enable(id="phase2_WAS_info")
      
      # #hosp1
      # disable("p1_discount_hosp1_1")
      # disable("p1_discount_hosp1_2")
      # disable("p1_discount_hosp1_3")
      # disable("p1_discount_hosp1_4")
      # disable("p1_promotional_budget_hosp1")
      # disable("p1_hosp1_sales_target_1")
      # disable("p1_hosp1_sales_target_2")
      # disable("p1_hosp1_sales_target_3")
      # disable("p1_hosp1_sales_target_4")
      # disable("p1_sr_hosp1")
      # disable("p1_hosp1_worktime_1")
      # disable("p1_hosp1_worktime_2")
      # disable("p1_hosp1_worktime_3")
      # disable("p1_hosp1_worktime_4")
      # disable("p1_hosp1_worktime_doc")
      # disable("p1_hosp1_worktime_diet")
      # disable("p1_hosp1_worktime_admin")
      # disable("p1_hosp1_worktime_nurs")
      # ##hosp2
      # disable("p1_discount_hosp2_1")
      # disable("p1_discount_hosp2_2")
      # disable("p1_discount_hosp2_3")
      # disable("p1_discount_hosp2_4")
      # disable("p1_promotional_budget_hosp2")
      # disable("p1_hosp2_sales_target_1")
      # disable("p1_hosp2_sales_target_2")
      # disable("p1_hosp2_sales_target_3")
      # disable("p1_hosp2_sales_target_4")
      # disable("p1_sr_hosp2")
      # disable("p1_hosp2_worktime_1")
      # disable("p1_hosp2_worktime_2")
      # disable("p1_hosp2_worktime_3")
      # disable("p1_hosp2_worktime_4")
      # disable("p1_hosp2_worktime_doc")
      # disable("p1_hosp2_worktime_diet")
      # disable("p1_hosp2_worktime_admin")
      # disable("p1_hosp2_worktime_nurs")
      # ##hosp3
      # disable("p1_discount_hosp3_1")
      # disable("p1_discount_hosp3_2")
      # disable("p1_discount_hosp3_3")
      # disable("p1_discount_hosp3_4")
      # disable("p1_promotional_budget_hosp3")
      # disable("p1_hosp3_sales_target_1")
      # disable("p1_hosp3_sales_target_2")
      # disable("p1_hosp3_sales_target_3")
      # disable("p1_hosp3_sales_target_4")
      # disable("p1_sr_hosp3")
      # disable("p1_hosp3_worktime_1")
      # disable("p1_hosp3_worktime_2")
      # disable("p1_hosp3_worktime_3")
      # disable("p1_hosp3_worktime_4")
      # disable("p1_hosp3_worktime_doc")
      # disable("p1_hosp3_worktime_diet")
      # disable("p1_hosp3_worktime_admin")
      # disable("p1_hosp3_worktime_nurs")
      # disable("p1_sr1_sales_training")
      # disable("p1_sr2_sales_training")
      # disable("p1_sr3_sales_training")
      # disable("p1_sr4_sales_training")
      # disable("p1_sr5_sales_training")
      # disable("p1_sr1_field_work")
      # disable("p1_sr2_field_work")
      # disable("p1_flm_team_meeting")
      # disable("p1_flm_kpi_analysis")
      # disable("p1_flm_strategy_planning")
      # disable("p1_flm_admin_work")
      # disable("p1_sr1_product_training")
      # disable("p1_sr2_product_training")
      }
  })
  
  
  
  

  
  output$p1_report1_2 <- 
    renderDataTable(datatable(p1_report()$report1_mod2,
                              caption="时间分配",
                              options = 
                                list(ordering = F, dom = "t",
                                     # autoWidth = TRUE,
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p1_report1_3 <- 
    renderDataTable(datatable(p1_report()$report1_mod3,
                              caption="产品知识",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p1_report1_4 <- 
    renderDataTable(datatable(p1_report()$report1_mod4,
                              caption="经验",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p1_report1_5 <- 
    renderDataTable(datatable(p1_report()$report1_mod5,
                              caption="销售技巧",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p1_report1_6 <- 
    renderDataTable(datatable(p1_report()$report1_mod6,
                              caption="动力值",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p1_report2_1 <- 
    renderDataTable(datatable(p1_report()$report2_mod1,
                              caption="职员成本",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p1_report2_2 <- 
    renderDataTable(datatable(p1_report()$report2_mod2,
                              caption="时间分配",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  p1_report3_mod1 <- reactive({
    if (input$p1_report3_hosp=="ALL") {
      out <- p1_report()$report3_mod1
    } else{
      data <- p1_report()$report3_mod1
      out <- data[which(data$医院==input$p1_report3_hosp),]
    }
    
    out
  })
  
  
  
  output$p1_report3 <- 
    renderDataTable(datatable(p1_report3_mod1(),
                              rownames = F,
                              caption="时间分配",
                              options = 
                                list(pageLength = 30,
                                     ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  
  
  output$p1_report4_3 <- 
    renderDataTable(datatable(p1_report()$report4_mod3,
                              caption="决策质量",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p1_report5_1 <- 
    renderDataTable(datatable(p1_report()$report5_mod1,
                              caption="利润贡献I 每产品(总)",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
 
  output$p1_report5_3 <- 
    renderDataTable(datatable(p1_report()$report5_mod3,
                              caption="利润贡献III (总体)",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  
  p1_report6_mod1 <- reactive({
    if (input$p1_profit3_hosp=="ALL") {
      out <- p1_report()$report6_mod1
    } else {
      data <- p1_report()$report6_mod1
      out <- data[which(data$医院==input$p1_profit3_hosp),]
    }
    out
  })
  
  output$p1_report6_1 <- 
    renderDataTable(datatable(p1_report6_mod1(),
                              rownames = F,
                              caption="利润贡献 每客户",
                              options = 
                                list(pageLength = 120,
                                     ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p1_report7_1 <- 
    renderDataTable(datatable(p1_report()$report7_mod1,
                              caption="销售额和数量/客户",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p1_report7_2 <- 
    renderDataTable(datatable(p1_report()$report7_mod2,
                              caption="销售额和数量/客户",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p1_report7_3 <- 
    renderDataTable(datatable(p1_report()$report7_mod3,
                              caption="销售额和数量/产品",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  p1_report8_mod1 <- reactive({
    report8_mod1 <- p1_report()$report8_mod1
    report8_mod1 <- report8_mod1 %>% 
      gather(variable,`值`,-phase) %>%
      spread(phase,`值`)
    
    
    report8_mod1 <- report8_mod1 %>%
      left_join(report8_mod1_rank,by="variable") %>%
      arrange(rank) %>%
      select(-variable,-rank)
    
    rownames(report8_mod1) <- report8_mod1$name
    
    report8_mod1 <- report8_mod1 %>%
      select(-name)
    
    
  })
  
  output$p1_report8_1 <- 
    renderDataTable(datatable(p1_report8_mod1(),
                              caption="商业价值",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p1_report8_2 <- 
    renderDataTable(datatable(p1_report()$report8_mod2,
                              caption="总市场概述",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  
  
  
  
  
  
  
  
  ##phase2
  
  output$p2_total_promotional_budget <- renderText(
    total_promotional_budget$phase2
  )
  
  
  p2_calculator_result <- reactive(calculator(input,2))
  
  
  
  output$p2_arranged_promotional_budget <- renderText(p2_calculator_result()[1])
  output$p2_arranged_time_of_sr1 <- renderText(p2_calculator_result()[2])
  output$p2_arranged_time_of_sr2 <- renderText(p2_calculator_result()[3])
  
  
  output$p2_potential_sales_hosp1_1 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==1),]$potential_volume)
  output$p2_potential_sales_hosp1_2 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==2),]$potential_volume)
  output$p2_potential_sales_hosp1_3 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==3),]$potential_volume)
  output$p2_potential_sales_hosp1_4 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==4),]$potential_volume)
  
  output$p2_current_sales_hosp1_1 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==1&
                        tmp()$product.no==1),]$real_volume)
  output$p2_current_sales_hosp1_2 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==1&
                        tmp()$product.no==2),]$real_volume)
  output$p2_current_sales_hosp1_3 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==1&
                        tmp()$product.no==3),]$real_volume)
  output$p2_current_sales_hosp1_4 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==1&
                        tmp()$product.no==4),]$real_volume)
  
  output$p2_potential_sales_hosp2_1 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==1),]$potential_volume)
  output$p2_potential_sales_hosp2_2 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==2),]$potential_volume)
  output$p2_potential_sales_hosp2_3 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==3),]$potential_volume)
  output$p2_potential_sales_hosp2_4 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==4),]$potential_volume)
  
  output$p2_current_sales_hosp2_1 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==2&
                        tmp()$product.no==1),]$real_volume)
  output$p2_current_sales_hosp2_2 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==2&
                        tmp()$product.no==2),]$real_volume)
  output$p2_current_sales_hosp2_3 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==2&
                        tmp()$product.no==3),]$real_volume)
  output$p2_current_sales_hosp2_4 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==2&
                        tmp()$product.no==4),]$real_volume)
  
  output$p2_potential_sales_hosp3_1 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==1),]$potential_volume)
  output$p2_potential_sales_hosp3_2 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==2),]$potential_volume)
  output$p2_potential_sales_hosp3_3 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==3),]$potential_volume)
  output$p2_potential_sales_hosp3_4 <- renderText(
    volume_info[which(volume_info$phase=="周期2"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==4),]$potential_volume)
  
  output$p2_current_sales_hosp3_1 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==3&
                        tmp()$product.no==1),]$real_volume)
  output$p2_current_sales_hosp3_2 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==3&
                        tmp()$product.no==2),]$real_volume)
  output$p2_current_sales_hosp3_3 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==3&
                        tmp()$product.no==3),]$real_volume)
  output$p2_current_sales_hosp3_4 <- renderText(
    tmp()[which(tmp()$phase=="周期1"&
                        tmp()$hospital.no==3&
                        tmp()$product.no==4),]$real_volume)
  
  
  
  
  # output$p2_decison1_summary_hosp1 <- renderText(decision1_summary(input,2,1))
  # output$p2_decison1_summary_hosp2 <- renderText(decision1_summary(input,2,2))
  # output$p2_decison1_summary_hosp3 <- renderText(decision1_summary(input,2,3))

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
  output$p2_total_management <- renderText(sum(p2_flm_data(),na.rm=T))
  output$p2_flm_management <- renderText(sum(p2_flm_data(),na.rm=T))
  
  
  
  tmp2 <- reactive({
    pp_data1 <- tmp() %>% select(hospital,
                                 hospital.no,
                                 product,
                                 product.no,
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
    
    colnames(pp_data1)[5:13] <- paste("pp_",colnames(pp_data1)[5:13],sep="")
    
    pp_data2 <- tmp() %>% select(sales_rep,
                                 sales_level,
                                 real_revenue_by_sr,
                                 real_volume_by_sr,
                                 sr_acc_revenue,
                                 sales_skills_index,
                                 product_knowledge_index,
                                 motivation_index,
                                 sr_acc_field_work,
                                 target_volume_realization_by_sr) %>%
      distinct()
    
    colnames(pp_data2)[3:10] <- paste("pp_",colnames(pp_data2)[3:10],sep="")
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
      sum(p2_flm_data(),na.rm=T) <=worktime
    ) {
      p2_report <- report_data(tmp2(),p2_flm_data(),p1_report()$report8_mod1)
      return(p2_report)
    } 
    
  })
  
  
  
  observeEvent(input$decision2_phase2_submit, {
    if (
      p2_calculator_result()[1] >100 |
      p2_calculator_result()[2] >worktime |
      p2_calculator_result()[3] >worktime |
      sum(p2_flm_data(),na.rm=T) >worktime 
          ) {
      shinyjs::alert("推广预算分配或是时间分配超出最大值！！")
      
    } else{
      
      shinyjs::show(id="decision1_phase3")
      shinyjs::show(id="decision2_phase3")
      shinyjs::enable(id="phase3_hospital_info")
      shinyjs::enable(id="phase3_WAS_info")
      
      # #hosp1
      # disable("p2_discount_hosp1_1")
      # disable("p2_discount_hosp1_2")
      # disable("p2_discount_hosp1_3")
      # disable("p2_discount_hosp1_4")
      # disable("p2_promotional_budget_hosp1")
      # disable("p2_hosp1_sales_target_1")
      # disable("p2_hosp1_sales_target_2")
      # disable("p2_hosp1_sales_target_3")
      # disable("p2_hosp1_sales_target_4")
      # disable("p2_sr_hosp1")
      # disable("p2_hosp1_worktime_1")
      # disable("p2_hosp1_worktime_2")
      # disable("p2_hosp1_worktime_3")
      # disable("p2_hosp1_worktime_4")
      # disable("p2_hosp1_worktime_doc")
      # disable("p2_hosp1_worktime_diet")
      # disable("p2_hosp1_worktime_admin")
      # disable("p2_hosp1_worktime_nurs")
      # ##hosp2
      # disable("p2_discount_hosp2_1")
      # disable("p2_discount_hosp2_2")
      # disable("p2_discount_hosp2_3")
      # disable("p2_discount_hosp2_4")
      # disable("p2_promotional_budget_hosp2")
      # disable("p2_hosp2_sales_target_1")
      # disable("p2_hosp2_sales_target_2")
      # disable("p2_hosp2_sales_target_3")
      # disable("p2_hosp2_sales_target_4")
      # disable("p2_sr_hosp2")
      # disable("p2_hosp2_worktime_1")
      # disable("p2_hosp2_worktime_2")
      # disable("p2_hosp2_worktime_3")
      # disable("p2_hosp2_worktime_4")
      # disable("p2_hosp2_worktime_doc")
      # disable("p2_hosp2_worktime_diet")
      # disable("p2_hosp2_worktime_admin")
      # disable("p2_hosp2_worktime_nurs")
      # ##hosp3
      # disable("p2_discount_hosp3_1")
      # disable("p2_discount_hosp3_2")
      # disable("p2_discount_hosp3_3")
      # disable("p2_discount_hosp3_4")
      # disable("p2_promotional_budget_hosp3")
      # disable("p2_hosp3_sales_target_1")
      # disable("p2_hosp3_sales_target_2")
      # disable("p2_hosp3_sales_target_3")
      # disable("p2_hosp3_sales_target_4")
      # disable("p2_sr_hosp3")
      # disable("p2_hosp3_worktime_1")
      # disable("p2_hosp3_worktime_2")
      # disable("p2_hosp3_worktime_3")
      # disable("p2_hosp3_worktime_4")
      # disable("p2_hosp3_worktime_doc")
      # disable("p2_hosp3_worktime_diet")
      # disable("p2_hosp3_worktime_admin")
      # disable("p2_hosp3_worktime_nurs")
      # disable("p2_sr1_sales_training")
      # disable("p2_sr2_sales_training")
      # disable("p2_sr1_field_work")
      # disable("p2_sr2_field_work")
      # disable("p2_flm_team_meeting")
      # disable("p2_flm_kpi_analysis")
      # disable("p2_flm_strategy_planning")
      # disable("p2_flm_admin_work")
      # disable("p2_sr1_product_training")
      # disable("p2_sr2_product_training")
       }
  })
  
  

  
  output$p2_report1_2 <- 
    renderDataTable(datatable(p2_report()$report1_mod2,
                              caption="时间分配",
                              options = 
                                list(ordering = F, dom = "t",
                                     # autoWidth = TRUE,
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p2_report1_3 <- 
    renderDataTable(datatable(p2_report()$report1_mod3,
                              caption="产品知识",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p2_report1_4 <- 
    renderDataTable(datatable(p2_report()$report1_mod4,
                              caption="经验",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p2_report1_5 <- 
    renderDataTable(datatable(p2_report()$report1_mod5,
                              caption="销售技巧",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p2_report1_6 <- 
    renderDataTable(datatable(p2_report()$report1_mod6,
                              caption="动力值",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p2_report2_1 <- 
    renderDataTable(datatable(p2_report()$report2_mod1,
                              caption="职员成本",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p2_report2_2 <- 
    renderDataTable(datatable(p2_report()$report2_mod2,
                              caption="时间分配",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  p2_report3_mod1 <- reactive({
    if (input$p2_report3_hosp=="ALL") {
      out <- p2_report()$report3_mod1
    } else {
      data <- p2_report()$report3_mod1
      out <- data[which(data$医院==input$p2_report3_hosp),]
    }
    
    out
  })
  
  output$p2_report3 <- 
    renderDataTable(datatable(p2_report3_mod1(),
                              rownames = F,
                              caption="时间分配",
                              options = 
                                list(pageLength = 30,
                                     ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
 
  output$p2_report4_3 <- 
    renderDataTable(datatable(p2_report()$report4_mod3,
                              caption="决策质量",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p2_report5_1 <- 
    renderDataTable(datatable(p2_report()$report5_mod1,
                              caption="利润贡献I 每产品(总)",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
 
  
  output$p2_report5_3 <- 
    renderDataTable(datatable(p2_report()$report5_mod3,
                              caption="利润贡献III (总体)",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  p2_report6_mod1 <- reactive({
    if (input$p2_profit3_hosp=="ALL") {
      out <- p2_report()$report6_mod1
    } else {
      data <- p2_report()$report6_mod1
      out <- data[which(data$医院==input$p2_profit3_hosp),]
    }
    
    out
  })
  
  output$p2_report6_1 <- 
    renderDataTable(datatable(p2_report6_mod1(),
                              rownames = F,
                              caption="利润贡献 每客户",
                              options = 
                                list(pageLength = 120,
                                     ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p2_report7_1 <- 
    renderDataTable(datatable(p2_report()$report7_mod1,
                              caption="销售额和数量/客户",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p2_report7_2 <- 
    renderDataTable(datatable(p2_report()$report7_mod2,
                              caption="销售额和数量/客户",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p2_report7_3 <- 
    renderDataTable(datatable(p2_report()$report7_mod3,
                              caption="销售额和数量/产品",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  p2_report8_mod1 <- reactive({
    report8_mod1 <- p2_report()$report8_mod1
    report8_mod1 <- report8_mod1 %>% 
      gather(variable,`值`,-phase) %>%
      spread(phase,`值`)
    
    
    report8_mod1 <- report8_mod1 %>%
      left_join(report8_mod1_rank,by="variable") %>%
      arrange(rank) %>%
      select(-variable,-rank)
    
    rownames(report8_mod1) <- report8_mod1$name
    
    report8_mod1 <- report8_mod1 %>%
      select(-name)
    
    
  })
  
  output$p2_report8_1 <- 
    renderDataTable(datatable(p2_report8_mod1(),
                              caption="商业价值",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p2_report8_2 <- 
    renderDataTable(datatable(p2_report()$report8_mod2,
                              caption="总市场概述",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  
  
  
  
  
  
  ##phase3
  
  output$p3_total_promotional_budget <- renderText(
    total_promotional_budget$phase3
  )
  
  
  p3_calculator_result <- reactive(calculator(input,3))
  
  output$p3_arranged_promotional_budget <- renderText(p3_calculator_result()[1])
  output$p3_arranged_time_of_sr1 <- renderText(p3_calculator_result()[2])
  output$p3_arranged_time_of_sr2 <- renderText(p3_calculator_result()[3])
  
  
  output$p3_potential_sales_hosp1_1 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==1),]$potential_volume)
  output$p3_potential_sales_hosp1_2 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==2),]$potential_volume)
  output$p3_potential_sales_hosp1_3 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==3),]$potential_volume)
  output$p3_potential_sales_hosp1_4 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==4),]$potential_volume)
  
  output$p3_current_sales_hosp1_1 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                        tmp2()$hospital.no==1&
                        tmp2()$product.no==1),]$real_volume)
  output$p3_current_sales_hosp1_2 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                        tmp2()$hospital.no==1&
                        tmp2()$product.no==2),]$real_volume)
  output$p3_current_sales_hosp1_3 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                        tmp2()$hospital.no==1&
                        tmp2()$product.no==3),]$real_volume)
  output$p3_current_sales_hosp1_4 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                        tmp2()$hospital.no==1&
                        tmp2()$product.no==4),]$real_volume)
  
  output$p3_potential_sales_hosp2_1 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==1),]$potential_volume)
  output$p3_potential_sales_hosp2_2 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==2),]$potential_volume)
  output$p3_potential_sales_hosp2_3 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==3),]$potential_volume)
  output$p3_potential_sales_hosp2_4 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==4),]$potential_volume)
  
  output$p3_current_sales_hosp2_1 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                        tmp2()$hospital.no==2&
                        tmp2()$product.no==1),]$real_volume)
  output$p3_current_sales_hosp2_2 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                        tmp2()$hospital.no==2&
                        tmp2()$product.no==2),]$real_volume)
  output$p3_current_sales_hosp2_3 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                        tmp2()$hospital.no==2&
                        tmp2()$product.no==3),]$real_volume)
  output$p3_current_sales_hosp2_4 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                        tmp2()$hospital.no==2&
                        tmp2()$product.no==4),]$real_volume)
  
  output$p3_potential_sales_hosp3_1 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==1),]$potential_volume)
  output$p3_potential_sales_hosp3_2 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==2),]$potential_volume)
  output$p3_potential_sales_hosp3_3 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==3),]$potential_volume)
  output$p3_potential_sales_hosp3_4 <- renderText(
    volume_info[which(volume_info$phase=="周期3"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==4),]$potential_volume)
  
  output$p3_current_sales_hosp3_1 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                   tmp2()$hospital.no==3&
                   tmp2()$product.no==1),]$real_volume)
  output$p3_current_sales_hosp3_2 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                   tmp2()$hospital.no==3&
                   tmp2()$product.no==2),]$real_volume)
  output$p3_current_sales_hosp3_3 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                   tmp2()$hospital.no==3&
                   tmp2()$product.no==3),]$real_volume)
  output$p3_current_sales_hosp3_4 <- renderText(
    tmp2()[which(tmp2()$phase=="周期2"&
                   tmp2()$hospital.no==3&
                   tmp2()$product.no==4),]$real_volume)
  
  
  
  # output$p3_decison1_summary_hosp1 <- renderText(decision1_summary(input,3,1))
  # output$p3_decison1_summary_hosp2 <- renderText(decision1_summary(input,3,2))
  # output$p3_decison1_summary_hosp3 <- renderText(decision1_summary(input,3,3))
  
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
  output$p3_total_management <- renderText(sum(p3_flm_data(),na.rm=T))
  output$p3_flm_management <- renderText(sum(p3_flm_data(),na.rm=T))
  
  
  
  tmp3 <- reactive({
    pp_data1 <- tmp2() %>% select(hospital,
                                  hospital.no,
                                  product,
                                  product.no,
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
    
    colnames(pp_data1)[5:13] <- paste("pp_",colnames(pp_data1)[5:13],sep="")
    
    pp_data2 <- tmp2() %>% select(sales_rep,
                                  sales_level,
                                  real_revenue_by_sr,
                                  real_volume_by_sr,
                                  sr_acc_revenue,
                                  sales_skills_index,
                                  product_knowledge_index,
                                  motivation_index,
                                  sr_acc_field_work,
                                  target_volume_realization_by_sr) %>%
      distinct()
    
    colnames(pp_data2)[3:10] <- paste("pp_",colnames(pp_data2)[3:10],sep="")
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
      sum(p3_flm_data(),na.rm=T) <=worktime
    ) {
      p3_report <- report_data(tmp3(),p3_flm_data(),p2_report()$report8_mod1)
      return(p3_report)
    } 
    
  })
  
  
  
  observeEvent(input$decision2_phase3_submit, {
    if (
      p3_calculator_result()[1] >100 |
      p3_calculator_result()[2] >worktime |
      p3_calculator_result()[3] >worktime |
      sum(p3_flm_data(),na.rm=T) >worktime
    ) {
      shinyjs::alert("推广预算分配或是时间分配超出最大值！！")
      
    } else{
      shinyjs::show(id="decision1_phase4")
      shinyjs::show(id="decision2_phase4")
      shinyjs::enable(id="phase4_hospital_info")
      shinyjs::enable(id="phase4_WAS_info")  
      # #hosp1
      # disable("p3_discount_hosp1_1")
      # disable("p3_discount_hosp1_2")
      # disable("p3_discount_hosp1_3")
      # disable("p3_discount_hosp1_4")
      # disable("p3_promotional_budget_hosp1")
      # disable("p3_hosp1_sales_target_1")
      # disable("p3_hosp1_sales_target_2")
      # disable("p3_hosp1_sales_target_3")
      # disable("p3_hosp1_sales_target_4")
      # disable("p3_sr_hosp1")
      # disable("p3_hosp1_worktime_1")
      # disable("p3_hosp1_worktime_2")
      # disable("p3_hosp1_worktime_3")
      # disable("p3_hosp1_worktime_4")
      # disable("p3_hosp1_worktime_doc")
      # disable("p3_hosp1_worktime_diet")
      # disable("p3_hosp1_worktime_admin")
      # disable("p3_hosp1_worktime_nurs")
      # ##hosp2
      # disable("p3_discount_hosp2_1")
      # disable("p3_discount_hosp2_2")
      # disable("p3_discount_hosp2_3")
      # disable("p3_discount_hosp2_4")
      # disable("p3_promotional_budget_hosp2")
      # disable("p3_hosp2_sales_target_1")
      # disable("p3_hosp2_sales_target_2")
      # disable("p3_hosp2_sales_target_3")
      # disable("p3_hosp2_sales_target_4")
      # disable("p3_sr_hosp2")
      # disable("p3_hosp2_worktime_1")
      # disable("p3_hosp2_worktime_2")
      # disable("p3_hosp2_worktime_3")
      # disable("p3_hosp2_worktime_4")
      # disable("p3_hosp2_worktime_doc")
      # disable("p3_hosp2_worktime_diet")
      # disable("p3_hosp2_worktime_admin")
      # disable("p3_hosp2_worktime_nurs")
      # ##hosp3
      # disable("p3_discount_hosp3_1")
      # disable("p3_discount_hosp3_2")
      # disable("p3_discount_hosp3_3")
      # disable("p3_discount_hosp3_4")
      # disable("p3_promotional_budget_hosp3")
      # disable("p3_hosp3_sales_target_1")
      # disable("p3_hosp3_sales_target_2")
      # disable("p3_hosp3_sales_target_3")
      # disable("p3_hosp3_sales_target_4")
      # disable("p3_sr_hosp3")
      # disable("p3_hosp3_worktime_1")
      # disable("p3_hosp3_worktime_2")
      # disable("p3_hosp3_worktime_3")
      # disable("p3_hosp3_worktime_4")
      # disable("p3_hosp3_worktime_doc")
      # disable("p3_hosp3_worktime_diet")
      # disable("p3_hosp3_worktime_admin")
      # disable("p3_hosp3_worktime_nurs")
      # disable("p3_sr1_sales_training")
      # disable("p3_sr2_sales_training")
      # disable("p3_sr1_field_work")
      # disable("p3_sr2_field_work")
      # disable("p3_flm_team_meeting")
      # disable("p3_flm_kpi_analysis")
      # disable("p3_flm_strategy_planning")
      # disable("p3_flm_admin_work")
      # disable("p3_sr1_product_training")
      # disable("p3_sr2_product_training")
      }
  })
  
  
  
  output$p3_report1_2 <- 
    renderDataTable(datatable(p3_report()$report1_mod2,
                              caption="时间分配",
                              options = 
                                list(ordering = F, dom = "t",
                                     # autoWidth = TRUE,
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p3_report1_3 <- 
    renderDataTable(datatable(p3_report()$report1_mod3,
                              caption="产品知识",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p3_report1_4 <- 
    renderDataTable(datatable(p3_report()$report1_mod4,
                              caption="经验",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p3_report1_5 <- 
    renderDataTable(datatable(p3_report()$report1_mod5,
                              caption="销售技巧",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p3_report1_6 <- 
    renderDataTable(datatable(p3_report()$report1_mod6,
                              caption="动力值",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p3_report2_1 <- 
    renderDataTable(datatable(p3_report()$report2_mod1,
                              caption="职员成本",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p3_report2_2 <- 
    renderDataTable(datatable(p3_report()$report2_mod2,
                              caption="时间分配",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  p3_report3_mod1 <- reactive({
    if (input$p3_report3_hosp=="ALL") {
      out <- p3_report()$report3_mod1
    } else {
      data <- p3_report()$report3_mod1
      out <- data[which(data$医院==input$p3_report3_hosp),]
    }
    
    out
  })
  
  output$p3_report3 <- 
    renderDataTable(datatable(p3_report3_mod1(),
                              rownames = F,
                              caption="时间分配",
                              options = 
                                list(pageLength = 30,
                                     ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  
  output$p3_report4_3 <- 
    renderDataTable(datatable(p3_report()$report4_mod3,
                              caption="决策质量",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p3_report5_1 <- 
    renderDataTable(datatable(p3_report()$report5_mod1,
                              caption="利润贡献I 每产品(总)",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  
  output$p3_report5_3 <- 
    renderDataTable(datatable(p3_report()$report5_mod3,
                              caption="利润贡献III (总体)",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  p3_report6_mod1 <- reactive({
    if (input$p3_profit3_hosp=="ALL") {
      out <- p3_report()$report6_mod1
    } else {
      data <- p3_report()$report6_mod1
      out <- data[which(data$医院==input$p3_profit3_hosp),]
    }
    
    out
  })
  
  output$p3_report6_1 <- 
    renderDataTable(datatable(p3_report6_mod1(),
                              rownames = F,
                              caption="利润贡献 每客户",
                              options = 
                                list(pageLength = 120,
                                     ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p3_report7_1 <- 
    renderDataTable(datatable(p3_report()$report7_mod1,
                              caption="销售额和数量/客户",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p3_report7_2 <- 
    renderDataTable(datatable(p3_report()$report7_mod2,
                              caption="销售额和数量/客户",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p3_report7_3 <- 
    renderDataTable(datatable(p3_report()$report7_mod3,
                              caption="销售额和数量/产品",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  p3_report8_mod1 <- reactive({
    report8_mod1 <- p3_report()$report8_mod1
    report8_mod1 <- report8_mod1 %>% 
      gather(variable,`值`,-phase) %>%
      spread(phase,`值`)
    
    
    report8_mod1 <- report8_mod1 %>%
      left_join(report8_mod1_rank,by="variable") %>%
      arrange(rank) %>%
      select(-variable,-rank)
    
    rownames(report8_mod1) <- report8_mod1$name
    
    report8_mod1 <- report8_mod1 %>%
      select(-name)
    
    
  })
  
  output$p3_report8_1 <- 
    renderDataTable(datatable(p3_report8_mod1(),
                              caption="商业价值",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p3_report8_2 <- 
    renderDataTable(datatable(p3_report()$report8_mod2,
                              caption="总市场概述",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  
  
  
  
  ##phase4
  output$p4_total_promotional_budget <- renderText(
    total_promotional_budget$phase4
  )
  
  
  p4_calculator_result <- reactive(calculator(input,4))
  
  output$p4_arranged_promotional_budget <- renderText(p4_calculator_result()[1])
  output$p4_arranged_time_of_sr1 <- renderText(p4_calculator_result()[2])
  output$p4_arranged_time_of_sr2 <- renderText(p4_calculator_result()[3])
  
  
  output$p4_potential_sales_hosp1_1 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==1),]$potential_volume)
  output$p4_potential_sales_hosp1_2 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==2),]$potential_volume)
  output$p4_potential_sales_hosp1_3 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==3),]$potential_volume)
  output$p4_potential_sales_hosp1_4 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==1&
                        volume_info$product.no==4),]$potential_volume)
  
  output$p4_current_sales_hosp1_1 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                   tmp3()$hospital.no==1&
                   tmp3()$product.no==1),]$real_volume)
  output$p4_current_sales_hosp1_2 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                        tmp3()$hospital.no==1&
                        tmp3()$product.no==2),]$real_volume)
  output$p4_current_sales_hosp1_3 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                        tmp3()$hospital.no==1&
                        tmp3()$product.no==3),]$real_volume)
  output$p4_current_sales_hosp1_4 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                        tmp3()$hospital.no==1&
                        tmp3()$product.no==4),]$real_volume)
  
  output$p4_potential_sales_hosp2_1 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==1),]$potential_volume)
  output$p4_potential_sales_hosp2_2 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==2),]$potential_volume)
  output$p4_potential_sales_hosp2_3 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==3),]$potential_volume)
  output$p4_potential_sales_hosp2_4 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==2&
                        volume_info$product.no==4),]$potential_volume)
  
  output$p4_current_sales_hosp2_1 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                   tmp3()$hospital.no==2&
                   tmp3()$product.no==1),]$real_volume)
  output$p4_current_sales_hosp2_2 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                   tmp3()$hospital.no==2&
                   tmp3()$product.no==2),]$real_volume)
  output$p4_current_sales_hosp2_3 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                   tmp3()$hospital.no==2&
                   tmp3()$product.no==3),]$real_volume)
  output$p4_current_sales_hosp2_4 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                   tmp3()$hospital.no==2&
                   tmp3()$product.no==4),]$real_volume)
  
  output$p4_potential_sales_hosp3_1 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==1),]$potential_volume)
  output$p4_potential_sales_hosp3_2 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==2),]$potential_volume)
  output$p4_potential_sales_hosp3_3 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==3),]$potential_volume)
  output$p4_potential_sales_hosp3_4 <- renderText(
    volume_info[which(volume_info$phase=="周期4"&
                        volume_info$hospital.no==3&
                        volume_info$product.no==4),]$potential_volume)
  
  output$p4_current_sales_hosp3_1 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                   tmp3()$hospital.no==3&
                   tmp3()$product.no==1),]$real_volume)
  output$p4_current_sales_hosp3_2 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                   tmp3()$hospital.no==3&
                   tmp3()$product.no==2),]$real_volume)
  output$p4_current_sales_hosp3_3 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                   tmp3()$hospital.no==3&
                   tmp3()$product.no==3),]$real_volume)
  output$p4_current_sales_hosp3_4 <- renderText(
    tmp3()[which(tmp3()$phase=="周期3"&
                   tmp3()$hospital.no==3&
                   tmp3()$product.no==4),]$real_volume)
  
  
  
  
  # output$p4_decison1_summary_hosp1 <- renderText(decision1_summary(input,4,1))
  # output$p4_decison1_summary_hosp2 <- renderText(decision1_summary(input,4,2))
  # output$p4_decison1_summary_hosp3 <- renderText(decision1_summary(input,4,3))
  
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
  output$p4_total_management <- renderText(sum(p4_flm_data(),na.rm=T))
  output$p4_flm_management <- renderText(sum(p4_flm_data(),na.rm=T))
  
  
  tmp4 <- reactive({
    pp_data1 <- tmp3() %>% select(hospital,
                                  hospital.no,
                                 product,
                                 product.no,
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
    
    colnames(pp_data1)[5:13] <- paste("pp_",colnames(pp_data1)[5:13],sep="")
    
    pp_data2 <- tmp3() %>% select(sales_rep,
                                 sales_level,
                                 real_revenue_by_sr,
                                 real_volume_by_sr,
                                 sr_acc_revenue,
                                 sales_skills_index,
                                 product_knowledge_index,
                                 motivation_index,
                                 sr_acc_field_work,
                                 target_volume_realization_by_sr) %>%
      distinct()
    
    colnames(pp_data2)[3:10] <- paste("pp_",colnames(pp_data2)[3:10],sep="")
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
      sum(p4_flm_data(),na.rm=T) <=worktime
    ) {
      p4_report <- report_data(tmp4(),p4_flm_data(),p3_report()$report8_mod1)
      return(p4_report)
    } 
    
  })
  
  
  
  observeEvent(input$decision2_phase4_submit, {
    if (
      p4_calculator_result()[1] >100 |
      p4_calculator_result()[2] >worktime |
      p4_calculator_result()[3] >worktime |
      sum(p4_flm_data(),na.rm=T) >worktime
    ) {
      shinyjs::alert("推广预算分配或是时间分配超出最大值！！")
      
    } 
    # else{
    #   
    #   #hosp1
    #   disable("p4_discount_hosp1_1")
    #   disable("p4_discount_hosp1_2")
    #   disable("p4_discount_hosp1_3")
    #   disable("p4_discount_hosp1_4")
    #   disable("p4_promotional_budget_hosp1")
    #   disable("p4_hosp1_sales_target_1")
    #   disable("p4_hosp1_sales_target_2")
    #   disable("p4_hosp1_sales_target_3")
    #   disable("p4_hosp1_sales_target_4")
    #   disable("p4_sr_hosp1")
    #   disable("p4_hosp1_worktime_1")
    #   disable("p4_hosp1_worktime_2")
    #   disable("p4_hosp1_worktime_3")
    #   disable("p4_hosp1_worktime_4")
    #   disable("p4_hosp1_worktime_doc")
    #   disable("p4_hosp1_worktime_diet")
    #   disable("p4_hosp1_worktime_admin")
    #   disable("p4_hosp1_worktime_nurs")
    #   ##hosp2
    #   disable("p4_discount_hosp2_1")
    #   disable("p4_discount_hosp2_2")
    #   disable("p4_discount_hosp2_3")
    #   disable("p4_discount_hosp2_4")
    #   disable("p4_promotional_budget_hosp2")
    #   disable("p4_hosp2_sales_target_1")
    #   disable("p4_hosp2_sales_target_2")
    #   disable("p4_hosp2_sales_target_3")
    #   disable("p4_hosp2_sales_target_4")
    #   disable("p4_sr_hosp2")
    #   disable("p4_hosp2_worktime_1")
    #   disable("p4_hosp2_worktime_2")
    #   disable("p4_hosp2_worktime_3")
    #   disable("p4_hosp2_worktime_4")
    #   disable("p4_hosp2_worktime_doc")
    #   disable("p4_hosp2_worktime_diet")
    #   disable("p4_hosp2_worktime_admin")
    #   disable("p4_hosp2_worktime_nurs")
    #   ##hosp3
    #   disable("p4_discount_hosp3_1")
    #   disable("p4_discount_hosp3_2")
    #   disable("p4_discount_hosp3_3")
    #   disable("p4_discount_hosp3_4")
    #   disable("p4_promotional_budget_hosp3")
    #   disable("p4_hosp3_sales_target_1")
    #   disable("p4_hosp3_sales_target_2")
    #   disable("p4_hosp3_sales_target_3")
    #   disable("p4_hosp3_sales_target_4")
    #   disable("p4_sr_hosp3")
    #   disable("p4_hosp3_worktime_1")
    #   disable("p4_hosp3_worktime_2")
    #   disable("p4_hosp3_worktime_3")
    #   disable("p4_hosp3_worktime_4")
    #   disable("p4_hosp3_worktime_doc")
    #   disable("p4_hosp3_worktime_diet")
    #   disable("p4_hosp3_worktime_admin")
    #   disable("p4_hosp3_worktime_nurs")
    #   
    #   disable("p4_sr1_sales_training")
    #   disable("p4_sr2_sales_training")
    #   disable("p4_sr1_field_work")
    #   disable("p4_sr2_field_work")
    #   disable("p4_flm_team_meeting")
    #   disable("p4_flm_kpi_analysis")
    #   disable("p4_flm_strategy_planning")
    #   disable("p4_flm_admin_work")
    #   disable("p4_sr1_product_training")
    #   disable("p4_sr2_product_training")
    #  }
  })
  
 
  
  output$p4_report1_2 <- 
    renderDataTable(datatable(p4_report()$report1_mod2,
                              caption="时间分配",
                              options = 
                                list(ordering = F, dom = "t",
                                     # autoWidth = TRUE,
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p4_report1_3 <- 
    renderDataTable(datatable(p4_report()$report1_mod3,
                              caption="产品知识",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p4_report1_4 <- 
    renderDataTable(datatable(p4_report()$report1_mod4,
                              caption="经验",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p4_report1_5 <- 
    renderDataTable(datatable(p4_report()$report1_mod5,
                              caption="销售技巧",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p4_report1_6 <- 
    renderDataTable(datatable(p4_report()$report1_mod6,
                              caption="动力值",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p4_report2_1 <- 
    renderDataTable(datatable(p4_report()$report2_mod1,
                              caption="职员成本",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p4_report2_2 <- 
    renderDataTable(datatable(p4_report()$report2_mod2,
                              caption="时间分配",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  p4_report3_mod1 <- reactive({
    if (input$p4_report3_hosp=="ALL") {
      out <- p4_report()$report3_mod1
    } else {
      data <- p4_report()$report3_mod1
      out <- data[which(data$医院==input$p4_report3_hosp),]
    }
    
    out
  })
  
  output$p4_report3 <- 
    renderDataTable(datatable(p4_report3_mod1(),
                              rownames = F,
                              caption="时间分配",
                              options = 
                                list(pageLength = 30,
                                     ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  
  output$p4_report4_3 <- 
    renderDataTable(datatable(p4_report()$report4_mod3,
                              caption="决策质量",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p4_report5_1 <- 
    renderDataTable(datatable(p4_report()$report5_mod1,
                              caption="利润贡献I 每产品(总)",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  
  output$p4_report5_3 <- 
    renderDataTable(datatable(p4_report()$report5_mod3,
                              caption="利润贡献III (总体)",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  p4_report6_mod1 <- reactive({
    if (input$p4_profit3_hosp=="ALL") {
      out <- p4_report()$report6_mod1
    } else {
      data <- p4_report()$report6_mod1
      out <- data[which(data$医院==input$p4_profit3_hosp),]
    }
    
    out
  })
  
  output$p4_report6_1 <- 
    renderDataTable(datatable(p4_report6_mod1(),
                              rownames = F,
                              caption="利润贡献 每客户",
                              options = 
                                list(pageLength = 120,
                                     ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p4_report7_1 <- 
    renderDataTable(datatable(p4_report()$report7_mod1,
                              caption="销售额和数量/客户",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p4_report7_2 <- 
    renderDataTable(datatable(p4_report()$report7_mod2,
                              caption="销售额和数量/客户",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  output$p4_report7_3 <- 
    renderDataTable(datatable(p4_report()$report7_mod3,
                              caption="销售额和数量/产品",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  p4_report8_mod1 <- reactive({
    report8_mod1 <- p4_report()$report8_mod1
    report8_mod1 <- report8_mod1 %>% 
      gather(variable,`值`,-phase) %>%
      spread(phase,`值`)
    
    
    report8_mod1 <- report8_mod1 %>%
      left_join(report8_mod1_rank,by="variable") %>%
      arrange(rank) %>%
      select(-variable,-rank)
    
    rownames(report8_mod1) <- report8_mod1$name
    
    report8_mod1 <- report8_mod1 %>%
      select(-name)
    
    
  })
  
  output$p4_report8_1 <- 
    renderDataTable(datatable(p4_report8_mod1(),
                              caption="商业价值",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  output$p4_report8_2 <- 
    renderDataTable(datatable(p4_report()$report8_mod2,
                              caption="总市场概述",
                              options = 
                                list(ordering = F, dom = "t",
                                     columnDefs = list(list(className = 'dt-center', width = "250px", targets = "_all")),
                                     initComplete = JS(
                                       "function(settings, json) {",
                                       "$(this.api().table().header()).css({'background-color': '#41555D', 'color': '#fff'});",
                                       "}"))))
  
  
  
  
  
  
  
   
  
  
  
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
  
}