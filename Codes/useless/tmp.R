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




