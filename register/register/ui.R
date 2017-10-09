ui = dashboardPage(
  dashboardHeader(title = "注册页面"),
  dashboardSidebar(
    # br(),
    sidebarMenu(
      id = "tabs",
      menuItem("注册", tabName = "signup", icon = icon("table")),
      menuItem("帮助", tabName = "help",  icon = icon("list-alt"))
    )
  ),
  
  dashboardBody( 
    shinyjs::useShinyjs(),
    shinyjs::inlineCSS(appCSS),
    tabItems(
      tabItem(
        "signup",
        fluidRow(box( div(id = "form",
                 style = "margin-left:100px",
                 fluidRow(
                   column(width = 8,
                          br(),br(),br(),br(),
                          img(src='sales_training.jpg', align = "center")
                   ),
                   column(width = 4, 
                          div(style = "display:inline-block;width:50%;
                              vertical-align:middle;margin-left:20px;
                              text-align:left;",
                              textInput("user", labelMandatory("用户名"), "")),
                          div(style = "display:inline-block;width:30%;
                              vertical-align:middle;margin-left:20px;
                              text-align:left;",
                              shinyjs::hidden(
                                div(
                                  id = "user_name_err",
                                  h6(strong("该用户名已经被注册！！", style = "color:red"))
                                ))), 
                          
                          div(style = "display:inline-block;width:50%;
                              vertical-align:middle;margin-left:20px;
                              text-align:left;",
                              passwordInput("pw", labelMandatory("密码"), "")),
                          div(style = "display:inline-block;width:30%;
                              vertical-align:middle;margin-left:20px;
                              text-align:left;",
                              shinyjs::hidden(
                                div(
                                  id = "password_err",
                                  h6(strong("前后密码不一致！！", style = "color:red"))
                                ))),  
                          
                          div(style = "display:inline-block;width:50%;
                              vertical-align:middle;margin-left:20px;
                              text-align:left;",
                              passwordInput("pw_m", labelMandatory("再次输入密码"), "")),
                          # textInput("pw", labelMandatory("密码"), ""),
                          # textInput("pw_m", labelMandatory("再次输入密码"), ""),
                          div(style = "display:inline-block;width:50%;
                              vertical-align:middle;margin-left:20px;
                              text-align:left;",
                         textInput("name", labelMandatory("姓名"), "")),
                     # textInput("name", labelMandatory("姓名"), ""),
                     div(style = "display:inline-block;width:50%;
                         vertical-align:middle;margin-left:20px;
                         text-align:left;",
                         textInput("corperation", labelMandatory("公司"), "")),
                     # textInput("corperation", labelMandatory("公司"), ""),
                     div(style = "display:inline-block;width:50%;
                         vertical-align:middle;margin-left:20px;
                         text-align:left;",
                         textInput("department", labelMandatory("部门"), "")),
                     # textInput("department", labelMandatory("部门"), ""),
                     div(style = "display:inline-block;width:50%;
                         vertical-align:middle;margin-left:20px;
                         text-align:left;",
                         # textInput("title", labelMandatory("职务"), "")
                         selectInput("title", labelMandatory("职务"), 
                                     choices = c("地区经理",
                                                 "大区经理",
                                                 "区域销售总监",
                                                 "全国销售总监"
                                                 ),
                                     selected = "地区经理")
                         ),
                     # textInput("title", labelMandatory("职务"), ""),
                     div(style = "display:inline-block;width:50%;
                         vertical-align:middle;margin-left:20px;
                         text-align:left;",
                         textInput("mobile_phone", labelMandatory("手机号码"), "")),
                     div(style = "display:inline-block;width:30%;
                         vertical-align:middle;margin-left:20px;
                         text-align:left;",
                         shinyjs::hidden(
                           div(
                             id = "mobile_phone_err",
                             h6(strong("该手机号已经被注册！！", style = "color:red"))
                           )
                         )),
                     # textInput("mobile_phone", labelMandatory("手机号码"), ""),
                     div(style = "display:inline-block;width:50%;
                         vertical-align:middle;margin-left:20px;
                         text-align:left;",
                         textInput("email", labelMandatory("电子邮件"), "")),
                     div(style = "display:inline-block;width:30%;
                         vertical-align:middle;margin-left:20px;
                         text-align:left;",
                         shinyjs::hidden(
                           div(
                             id = "email_err",
                             h6("该邮箱已经被注册！！")
                           )
                         )),  
                     # textInput("email", labelMandatory("电子邮件"), ""),
                     div(style = "display:inline-block;width:50%;
                         vertical-align:middle;margin-left:20px;
                         text-align:left;",
                         textInput("boarding_date", labelMandatory("入职时间"), ""))
                     # textInput("boarding_date", labelMandatory("入职时间"), "")
              )
            ),
            br(), 
            fluidRow(column(width = 3, offset = 9,
                                actionButton("submit", "提交")))),
            
            title = "区域管理培训模拟平台注册页面",
            width = 12,
            status = "primary",
            solidHeader = TRUE
       
        ))
        ,
        
        # div( 
        #   shinyjs::hidden(
        #     div(
        #       id = "password_err",
        #       h3("前后密码不一致！！")
        #     )
        #   ), 
        #   
        #   shinyjs::hidden(
        #     div(
        #       id = "user_name_err",
        #       h3("该用户名已经被注册！！")
        #     )
        #   ),
        #   
        #   shinyjs::hidden(
        #     div(
        #       id = "mobile_phone_err",
        #       h3("该手机号已经被注册！！")
        #     )
        #   ),
        #   
        #   shinyjs::hidden(
        #     div(
        #       id = "email_err",
        #       h3("该邮箱已经被注册！！")
        #     )
        #   ),
          
          shinyjs::hidden(
            div(
              id = "thankyou_msg",
              h3("注册成功!"),
              actionButton("submit_another", "返回注册页面"),
              actionButton(inputId = "submit_another1", 
                           label = "返回登录页面",
                           icon = icon("th"),
                           onclick ="location.href='http://59.110.31.215:3838/sales_training_platform_beta1/';"
                           # onclick ="window.open('http://59.110.31.215:3838/sales_training_platform_beta1/')"
                           ))
            # )
          ),  
          
          shinyjs::hidden(
            span(id = "submit_msg", "Submitting..."),
            div(id = "error",
                div(br(), tags$b("Error: "), span(id = "error_msg"))
            )
          )
        ),
      
      tabItem("help")
    )
  )
)
