server3 = function(input, output) {
  
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
    calculation(pp_info_by_hosp_product_new,
                sr_info_initial_value,
                data1,
                data2)

    #left_join(data1_phase1(),pp_info_by_hosp_product_new,by=c("hospital","product"))
  })

  
  
  
}


shinyApp(ui=ui,server = server3)


