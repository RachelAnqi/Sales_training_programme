server2 = function(input, output) {
  
  ##phase1
  
  output$p1_total_promotional_budget <- renderText(
    total_promotional_budget$phase1
  )
  
  
  tmp <- eventReactive(input$decision1_phase1_calculator,{
    phase1_promotional_budget=0
    phase1_total_time_arrangement1 <- 0 
    phase1_total_time_arrangement2 <- 0 
    phase1_total_time_arrangement3 <- 0 
    phase1_total_time_arrangement4 <- 0
    phase1_total_time_arrangement5 <- 0
    
    for(i in 1:10){
      phase1_promotional_budget <-
        sum(c(phase1_promotional_budget, 
              as.numeric(input[[paste("p1_promotional_budget_hosp",i,sep="")]])),
            na.rm = TRUE)
      tmp <- sum(c(as.numeric(input[[paste("p1_hosp",i,"_worktime_1",sep="")]]),
                   as.numeric(input[[paste("p1_hosp",i,"_worktime_2",sep="")]]),
                   as.numeric(input[[paste("p1_hosp",i,"_worktime_3",sep="")]]),
                   as.numeric(input[[paste("p1_hosp",i,"_worktime_4",sep="")]])),
                 na.rm = TRUE)
      if (input[[paste("p1_sr_hosp",i,sep = "")]]==
          available_srs[1]){
        phase1_total_time_arrangement1 <- 
          phase1_total_time_arrangement1 +tmp
      } else if (input[[paste("p1_sr_hosp",i,sep = "")]]==
                 available_srs[2]) {
        phase1_total_time_arrangement2 <- 
          phase1_total_time_arrangement2 +tmp
      } else if (input[[paste("p1_sr_hosp",i,sep = "")]]==
                 available_srs[3]) {
        phase1_total_time_arrangement3 <- 
          phase1_total_time_arrangement3 +tmp
      } else if (input[[paste("p1_sr_hosp",i,sep = "")]]==
                 available_srs[4]) {
        phase1_total_time_arrangement4 <- 
          phase1_total_time_arrangement4 +tmp
      } else if (input[[paste("p1_sr_hosp",i,sep = "")]]==
                 available_srs[5]) {
        phase1_total_time_arrangement5 <- 
          phase1_total_time_arrangement5 +tmp
      }
    }
    data <- c(phase1_promotional_budget,
              phase1_total_time_arrangement1,
              phase1_total_time_arrangement2,
              phase1_total_time_arrangement3,
              phase1_total_time_arrangement4,
              phase1_total_time_arrangement5)
    data
    
  })
  
  
  output$p1_arranged_promotional_budget <- renderText(tmp()[1]) 
  output$p1_arranged_time_of_sr1 <- renderText(tmp()[2])
  output$p1_arranged_time_of_sr2 <- renderText(tmp()[3])
  output$p1_arranged_time_of_sr3 <- renderText(tmp()[4])
  output$p1_arranged_time_of_sr4 <- renderText(tmp()[5])
  output$p1_arranged_time_of_sr5 <- renderText(tmp()[6])
  
  
  observeEvent(input$decision1_phase1_submit, {
    disable("p1_discount_hosp1_1")
    disable("p1_discount_hosp1_2")
    output$p1_decison1_summary_hosp1 <- renderText({12})
    output$p1_decison1_summary_hosp2 <- renderText({12})
  })
  
  data1_phase1 <- eventReactive(input$decision1_phase1_submit,{
    data_decision <- data.frame(
      phase = NULL, 
      hospital = NULL,
      sales_rep = NULL,
      product = NULL,
      sales_target = NULL,
      potential_sales = NULL,
      real_sales = NULL,
      discount = NULL,
      promotional_budget = NULL,
      sr_time = NULL,
      time_on_doc = NULL,
      time_on_diet = NULL,
      time_on_admin = NULL,
      time_on_nurs = NULL
    )
    for (j in 1:10) {
      for (q in 1:4){
        name.sales_rep <- input[[paste("p1_sr_hosp",j,sep="")]]
        value.sales_target <- as.numeric(input[[paste("p1_hosp",j,"_sales_target_",q,sep="")]])
        value.discount <- as.numeric(input[[paste("p1_discount_hosp",j,"_",q,sep="")]])
        value.promotional_budget <- as.numeric(input[[paste("p1_promotional_budget_hosp",j,sep="")]])
        value.sr_time <- as.numeric(input[[paste("p1_hosp",j,"_worktime_",q,sep="")]])/100*worktime
        value.time_on_doc <- as.numeric(
          input[[paste("p1_hosp",j,"_worktime_doc",sep="")]])*value.sr_time
        value.time_on_diet <- as.numeric(
          input[[paste("p1_hosp",j,"_worktime_diet",sep="")]])*value.sr_time
        value.time_on_admin <- as.numeric(
          input[[paste("p1_hosp",j,"_worktime_admin",sep="")]])*value.sr_time
        value.time_on_nurs <- as.numeric(
          input[[paste("p1_hosp",j,"_worktime_nurs",sep="")]])*value.sr_time
        
        data_decision <- plyr::rbind.fill(data_decision,data.frame(
          phase = "周期1",
          hospital = hospital_info_initial$name[j],
          sales_rep = as.character(name.sales_rep), 
          product = product_info_initial$product[q],
          sales_target = value.sales_target,
          potential_sales = as.numeric(get(paste("potential_sales_product",q,sep=""))[[j]][[1]]), 
          discount = value.discount, 
          promotional_budget = value.promotional_budget,
          sr_time = value.sr_time,
          time_on_doc = value.time_on_doc,
          time_on_diet = value.time_on_diet,
          time_on_admin = value.time_on_admin,
          time_on_nurs = value.time_on_nurs
        ))
      }
    }
    data_decision
  })
  
  data2_phase1 <- eventReactive(input$decision2_phase1_submit,{
    
    data_decision2 <- data.frame(
      phase = NULL,
      sales_rep = NULL,
      sales_training = NULL,
      product_training = NULL,
      field_work = NULL,
      meetings_with_team = NULL,
      kpi_analysis = NULL,
      strategy_and_cycle_planning = NULL,
      admin_work = NULL
    )
    
    for (j in 1:5) {
      name.sales_rep <- sr_info_initial$sales_name[j]
      value.sales_training <- as.numeric(
        input[[paste("p1_sr",j,"_sales_training",sep="")]])/100*worktime
      value.product_training <- as.numeric(
        input[[paste("p1_sr",j,"_product_training",sep="")]])/100*worktime
      value.field_work <- as.numeric(
        input[[paste("p1_sr",j,"_field_work",sep="")]])/100*worktime
      value.meetings_with_team <- as.numeric(
        input$p1_flm_team_meeting)/100*worktime
      value.kpi_analysis <- as.numeric(
        input$p1_flm_kpi_analysis)/100*worktime
      value.strategy_and_cycle_planning <- as.numeric(
        input$p1_flm_strategy_planning)/100*worktime
      value.admin_work <- as.numeric(
        input$p1_flm_admin_work)/100*worktime
      
      data_decision2 <- plyr::rbind.fill(data_decision2,data.frame(
        phase = "周期1",
        sales_rep = as.character(name.sales_rep),
        sales_training = value.sales_training,
        product_training = value.product_training,
        field_work = value.field_work,
        meetings_with_team = value.meetings_with_team,
        kpi_analysis = value.kpi_analysis,
        strategy_and_cycle_planning = value.strategy_and_cycle_planning,
        admin_work = value.admin_work
      ))
    }
    data_decision2
    
  })
  
  output$report1_table <- renderDataTable(data1_phase1())
  output$report2_table <- renderDataTable(data2_phase1())
  
  sales_training <- reactive({sum(c(
    as.numeric(input$p1_sr1_sales_training),
    as.numeric(input$p1_sr2_sales_training),
    as.numeric(input$p1_sr3_sales_training),
    as.numeric(input$p1_sr4_sales_training),
    as.numeric(input$p1_sr5_sales_training),
    na.rm = T))})
  
  field_work <- reactive({sum(c(
    as.numeric(input$p1_sr1_field_work),
    as.numeric(input$p1_sr2_field_work),
    as.numeric(input$p1_sr3_field_work),
    as.numeric(input$p1_sr4_field_work),
    as.numeric(input$p1_sr5_field_work),
    na.rm = T
  ))})
  
  output$p1_total_sales_training <-renderText(sales_training())
  output$p1_flm_sales_training <- renderText(sales_training())
  output$p1_total_field_work <-renderText(field_work())
  output$p1_flm_field_work <- renderText(field_work())
  output$p1_total_team_meeting <- renderText(input$p1_flm_team_meeting)
  output$p1_total_kpi_analysis <- renderText(input$p1_flm_kpi_analysis)
  output$p1_total_strategy_planning <- renderText(input$p1_flm_strategy_planning)
  output$p1_total_admin_work <- renderText(input$p1_flm_admin_work)
  output$p1_total_management <- renderText(sum(c(
    sales_training(),
    field_work(),
    as.numeric(input$p1_flm_team_meeting),
    as.numeric(input$p1_flm_kpi_analysis),
    as.numeric(input$p1_flm_strategy_planning),
    as.numeric(input$p1_flm_admin_work),
    na.rm = T
  )))
  
  output$report3_table <- renderDataTable({
    data1_phase1
    data2_phase1
    
    data1 <- data1_phase1()
    data2 <- data2_phase1()
    tmp <- left_join(data1,data2,by=c("phase","sales_rep")) %>%
      group_by(phase,sales_rep) %>%
      mutate(no.hospitals = n_distinct(hospital)) %>%
      ungroup %>%
      mutate(experience_index_pp = curve(curve11,acc_revenue_0),
             sales_target_realization = sales_target/real_sales,
             contact_priority_fit_index = sum(c(time_on_doc*0.5,
                                                time_on_diet*0.25,
                                                time_on_admin*0.15,
                                                time_on_nurs*0.1),
                                              na.rm=T),
             field_work_peraccount = field_work/no.hospitals,
             product_knowledge_addition_current_period = curve(curve26,product_training),
             product_knowledge_transfer_value = curve(curve28,product_knowledge_0),
             ss_accumulated_field_work_delta = curve(curve42,field_work),
             ss_accumulated_sales_training_delta = curve(curve43,sales_training),
             ss_experience_index_pp = curve(curve44,experience_index_pp),
             m_meeting_with_team_delta = {if (sales_level == "junior") {
               curve(curve13,meetings_with_team)
             } else if(sales_level=="middle"){
               curve(curve14,meetings_with_team)
             } else {curve(curve15,meetings_with_team)}},
             m_sales_target_realization_delta = curve(curve16,sales_target_realization),
             m_sales_training_delta = curve(curve17,sales_training),
             m_admin_work_delta = curve(curve18,admin_work)) %>%
      mutate(sales_skill_index = sum(c(
        ss_accumulated_field_work_delta*((weightage$sales_skills)$field_work),
        ss_accumulated_sales_training_delta*((weightage$sales_skills)$sales_training),
        ss_experience_index_pp*((weightage$sales_skills)$experience)),na.rm=T),
        product_knowledge_index = sum(c(
          product_knowledge_addition_current_period,
          product_knowledge_transfer_value),na.rm=T),
        motivation_index = sum(c(
          (motivation_0+m_admin_work_delta)*
            ((weightage$motivation)$admin_work),
          (motivation_0+m_sales_target_realization_delta)*
            ((weightage$motivation)$sales_target_realization),
          (motivation_0+m_meeting_with_team_delta)*
            ((weightage$motivation)$meetings_with_team),
          (motivation_0+m_sales_training_delta)*
            ((weightage$motivation)$sales_training)),
          na.rm=T)) %>%
      mutate(srsp_motivation_factor = curve(curve32,motivation_0),
             srsp_sales_skills_factor = curve(curve34,sales_skill_index),
             srsp_product_knowledge_factor = curve(curve33,product_knowledge_index),
             srsp_time_with_account_factor = ({if (product=="product1"){
               curve(curve35,sr_time)} else if(
                 product=="product2"){
                 curve(curve36,sr_time)} else if (
                   product=="product3") {
                   curve(curve37,sr_time)} else {
                     curve(curve38,sr_time)}
             })) %>%
      mutate(sr_sales_performance = sum(c(
        srsp_motivation_factor*pp_sr_sales_performance*
          ((weightage$sr_sales_performance)$motivation),
        srsp_sales_skills_factor*pp_sr_sales_performance*
          ((weightage$sr_sales_performance)$sales_skills),
        srsp_product_knowledge_factor*pp_sr_sales_performance*
          ((weightage$sr_sales_performance)$product_knowledge),
        srsp_time_with_account_factor*pp_sr_sales_performance*
          ((weightage$sr_sales_performance)$time_with_account)),
        na.rm=T)) %>%
      mutate(dq_admin_work_delta = curve(curve5,admin_work),
             dq_priority_fit_delta = curve(curve6,contact_priority_fit_index),
             dq_meetings_with_team_delta =curve(curve7,meetings_with_team),
             dq_kpi_analysis_factor = curve(curve8,kpi_analysis),
             dq_strategy_planning_delta = curve(curve9,strategy_and_cycle_planning))%>%
      mutate(deployment_quality_index = sum(c(
        (pp_deployment_quality+dq_admin_work_delta)*
          ((weightage$deployment_quality)$admin_work),
        (pp_deployment_quality+dq_priority_fit_delta)*
          ((weightage$deployment_quality)$priority_fit),
        (pp_deployment_quality+dq_meetings_with_team_delta)*
          ((weightage$deployment_quality)$meetings_with_team),
        pp_deployment_quality*dq_kpi_analysis_factor*
          ((weightage$deployment_quality)$kpi_report_analysis),
        (pp_deployment_quality+dq_strategy_planning_delta)*
          ((weightage$deployment_quality)$strategy_and_cycle_planning)),
        na.rm=T)) %>%
      mutate(ps_strategy_planning_factor = curve(curve29,strategy_and_cycle_planning),
             ps_promotional_budget_factor = curve(curve30,promotional_budget)) %>%
      mutate(promotional_support_index = sum(c(
        pp_promotional_support*ps_strategy_planning_factor*
          ((weightage$promotional_support)$strategy_and_cycle_planning),
        pp_promotional_support*ps_promotional_budget_factor*
          ((weightage$promotional_support)$promotional_budget)),
        na.rm=T)) %>%
      mutate(sp_field_work_delta = curve(curve40,field_work_peraccount),
             sp_deployment_quality_factor = curve(curve41,deployment_quality_index)) %>%
      mutate(sales_performance = sum(c(
        sr_sales_performance*((weightage$sales_performance)$sr_sales_performance),
        (pp_sales_performance+sp_field_work_delta)*
          ((weightage$sales_performance)$field_work),
        (pp_sales_performance*sp_deployment_quality_factor)*
          ((weightage$sales_performance)$deployment_quality)),
        na.rm=T)) %>%
      mutate(#cr_market_share_delta = curve(curve1,market_share_peraccount),
        cr_product_knowledge_delta = curve(curve2,product_knowledge_index-product_knowledge_0),
        cr_promotional_support_delta = curve(curve3,promotional_support_index/pp_promotional_support),
        cr_pp_customer_relationship_index = curve(curve4,pp_customer_relationship))%>%
      mutate(customer_relationship_index = 
               sum(c((cr_pp_customer_relationship_index+cr_product_knowledge_delta)*
                       (weightage$customer_relaitonship)$product_knowledge,
                     (cr_pp_customer_relationship_index+cr_promotional_support_delta)*
                       (weightage$customer_relaitonship)$promotional_support,
                     cr_pp_customer_relationship_index*
                       (weightage$customer_relaitonship)$past_relationship),
                   na.rm=T)) %>%
      mutate(oa_customer_relationship_factor = ({if (product=="product1"){
        curve(curve19,sr_time)} else if(
          product=="product2"){
          curve(curve20,sr_time)} else if (
            product=="product3") {
            curve(curve21,sr_time)} else {
              curve(curve22,sr_time)}}),
        oa_sales_performance_factor = curve(curve25,sales_performance)) %>%
      mutate(cp_offer_attractiveness = sum(c(
        pp_offer_attractiveness*oa_customer_relationship_factor*
          (weightage$cp_offer_attractiveness)$customer_relationship,
        pp_offer_attractiveness*oa_sales_performance_factor*
          (weightage$cp_offer_attractiveness)$sales_performance
      ))) %>%
      mutate(offer_attractiveness = sum(c(
        cp_offer_attractiveness*(weightage$total_attractiveness)$cp_offer_attractiveness,
        pp_offer_attractiveness*(weightage$total_attractiveness)$pp_offer_attractiveness
      ))) %>%
      select(sales_skill_index,
             product_knowledge_index,
             motivation_index,
             sr_sales_performance,
             deployment_quality_index,
             promotional_support_index,
             sales_performance,
             customer_relationship_index,
             offer_attractiveness)
    
    
  })  
  
  
  
  
  
}