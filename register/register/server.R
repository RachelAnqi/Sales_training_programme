server = function(input, output, session) {
  
  # isAdmin <- reactive({
  #   !is.null(session$user) && session$user %in% adminUsers
  # })  
  # 
  # output$adminPanelContainer <- renderUI({
  #   if (!isAdmin()) return()
  #   
  #   wellPanel(
  #     h2("Previous responses (only visible to admins)"),
  #     downloadButton("downloadBtn", "Download responses"), br(), br(),
  #     DT::dataTableOutput("responsesTable")
  #   )
  # }) 
  # 
  # output$responsesTable <- DT::renderDataTable(
  #   loadData(),
  #   rownames = FALSE,
  #   options = list(searching = FALSE, lengthChange = FALSE)
  # )
  # 
  # output$downloadBtn <- downloadHandler(
  #   filename = function() {
  #     sprintf("mimic-google-form_%s.csv", humanTime())
  #   },
  #   content = function(file) {
  #     write.csv(loadData(), file, row.names = FALSE)
  #   }
  # )
  
  observe({
    mandatoryFilled <-
      vapply(fieldsMandatory,
             function(x) {
               !is.null(input[[x]]) && input[[x]] != ""
             },
             logical(1))
    mandatoryFilled <- all(mandatoryFilled)
    
    shinyjs::toggleState(id = "submit",
                         condition = mandatoryFilled & 
                           !(input$user %in% loadData()[["user"]]) &
                           !(input$mobile_phone %in% loadData()[["mobile_phone"]])&
                           !(input$email %in% loadData()[["email"]])
    )
  }) 
  
  observe({
    if (input$pw != input$pw_m) {
      shinyjs::show("password_err")
    } else {
      shinyjs::hide("password_err")
    }
    
    if (input$user %in% loadData()[["user"]]) {
      shinyjs::show("user_name_err")
    } else {
      shinyjs::hide("user_name_err")
    }
    
    if (input$mobile_phone %in% loadData()[["mobile_phone"]]) {
      shinyjs::show("mobile_phone_err")
    } else {
      shinyjs::hide("mobile_phone_err")
    }
    
    if (input$email %in% loadData()[["email"]]) {
      shinyjs::show("email_err")
    } else {
      shinyjs::hide("email_err")
    }
    
  })
  
  
  formData <- reactive({
    data <- sapply(fieldsAll, function(x) input[[x]])
    data <- c(data, timestamp = epochTime(), locked_out = FALSE)
    data["pw"] <- digest(unname(data["pw"]))
    data["pw_m"] <- digest(unname(data["pw_m"]))
    data <- t(data)
    data
  })
  
  observeEvent(input$submit, {
    shinyjs::disable("submit")
    shinyjs::show("submit_msg")
    shinyjs::hide("error")
    
    tryCatch({
      saveData(formData())
      system("cp /srv/shiny-server/register/data/* /srv/shiny-server/stp/credentials/")
      dir_name <- formData()[,1]
      system(paste("mkdir -p /srv/shiny-server/stp/users/",dir_name,sep=""))
      shinyjs::reset("form")
      shinyjs::hide("form")
      shinyjs::show("thankyou_msg")
    },
    error = function(err) {
      shinyjs::html("error_msg", err$message)
      shinyjs::show(id = "error", anim = TRUE, animType = "fade")
    },
    finally = {
      shinyjs::enable("submit")
      shinyjs::hide("submit_msg")
    })
  })
  
  
  observeEvent(input$submit_another, {
    shinyjs::show("form")
    shinyjs::hide("thankyou_msg")
  })
  
}