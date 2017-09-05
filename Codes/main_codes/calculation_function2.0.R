library(plyr)
library(dplyr)

calculator <- function(input,phase){
  phase1_promotional_budget=0
  phase1_total_time_arrangement1 <- 0 
  phase1_total_time_arrangement2 <- 0 
  phase1_total_time_arrangement3 <- 0 
  phase1_total_time_arrangement4 <- 0
  phase1_total_time_arrangement5 <- 0
  
  for(i in 1:10){
    phase1_promotional_budget <-
      sum(c(phase1_promotional_budget, 
            as.numeric(input[[paste("p",phase,"_promotional_budget_hosp",i,sep="")]])),
          na.rm = TRUE)
    tmp <- sum(c(as.numeric(input[[paste("p",phase,"_hosp",i,"_worktime_1",sep="")]]),
                 as.numeric(input[[paste("p",phase,"_hosp",i,"_worktime_2",sep="")]]),
                 as.numeric(input[[paste("p",phase,"_hosp",i,"_worktime_3",sep="")]]),
                 as.numeric(input[[paste("p",phase,"_hosp",i,"_worktime_4",sep="")]])),
               na.rm = TRUE)
    if (input[[paste("p",phase,"_sr_hosp",i,sep = "")]]==
        available_srs[1]){
      phase1_total_time_arrangement1 <- 
        phase1_total_time_arrangement1 +tmp
    } else if (input[[paste("p",phase,"_sr_hosp",i,sep = "")]]==
               available_srs[2]) {
      phase1_total_time_arrangement2 <- 
        phase1_total_time_arrangement2 +tmp
    } else if (input[[paste("p",phase,"_sr_hosp",i,sep = "")]]==
               available_srs[3]) {
      phase1_total_time_arrangement3 <- 
        phase1_total_time_arrangement3 +tmp
    } else if (input[[paste("p",phase,"_sr_hosp",i,sep = "")]]==
               available_srs[4]) {
      phase1_total_time_arrangement4 <- 
        phase1_total_time_arrangement4 +tmp
    } else if (input[[paste("p",phase,"_sr_hosp",i,sep = "")]]==
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
  
}

sales_training <- function(input,phase){sum(c(
  as.numeric(input[[paste("p",phase,"_sr1_sales_training",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_sr2_sales_training",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_sr3_sales_training",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_sr4_sales_training",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_sr5_sales_training",sep = "")]]),
  na.rm = T))}

field_work <- function(input,phase){sum(c(
  as.numeric(input[[paste("p",phase,"_sr1_field_work",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_sr2_field_work",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_sr3_field_work",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_sr4_field_work",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_sr5_field_work",sep = "")]]),
  na.rm = T))}

total_management <- function(input,phase){sum(c(
  sales_training(input,phase),
  field_work(input,phase),
  as.numeric(input[[paste("p",phase,"_flm_team_meeting",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_flm_kpi_analysis",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_flm_strategy_planning",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_flm_admin_work",sep = "")]])),
  na.rm = T
)}

calculation <- function(pp_data1,
                        pp_data2,
                        cp_data1,
                        cp_data2){
  #
  #
  #
  #
  tmp1 <- left_join(cp_data1,pp_data1,by=c("hospital","product"))
  tmp2 <- left_join(cp_data2,pp_data2,by=c("sales_rep"))
  
  tmp <- left_join(tmp1,tmp2,by=c("phase","sales_rep")) %>%
    distinct() %>%
    group_by(phase,sales_rep) %>%
    mutate(no.hospitals = n_distinct(hospital),
           sr_revenue = sum(real_sales,na.rm=T),
           sr_sales_target = sum(sales_target,na.rm=T),
           sr_time_total=sum(sr_time,na.rm=T)) %>%
    ungroup %>%
    dplyr::mutate(acc_revenue = sr_revenue+pp_acc_revenue,
                  experience_index = sapply(acc_revenue, function(x) round(curve(curve11,x),2)),
                  acc_field_work = pp_acc_field_work+field_work,
                  overhead_factor = sapply(pp_motivation_index,function(x) curve(curve12,x)),
                  overhead_time = overhead_factor*overhead,
                  pp_experience_index = sapply(pp_acc_revenue,function(x) round(curve(curve11,x),2)),
                  sales_target_realization = sr_sales_target/sr_revenue*100,
                  incentive_factor = sapply(sales_target_realization,function(x) curve(curve10,x)),
                  contact_priority_fit_doc = time_on_doc*0.5,
                  contact_priority_fit_diet = time_on_diet*0.25,
                  contact_priority_fit_admin = time_on_admin*0.15,
                  contact_priority_fit_nurs = time_on_nurs*0.1,
                  contact_priority_fit_index = contact_priority_fit_doc+
                                                     contact_priority_fit_diet+
                                                     contact_priority_fit_admin+
                                                     contact_priority_fit_nurs,
                  field_work_peraccount = field_work/no.hospitals,
                  product_knowledge_addition_current_period = sapply(product_training,function(x)curve(curve26,x)),
                  product_knowledge_transfer_value = sapply(pp_product_knowledge_index,function(x)curve(curve28,x)),
                  ss_accumulated_field_work_delta = sapply(acc_field_work,function(x)curve(curve42,x)),
                  ss_accumulated_sales_training_delta = sapply(sales_training,function(x)curve(curve43,x)),
                  ss_experience_index_pp = sapply(pp_experience_index,function(x)curve(curve44,x)),
                  
                  m_meeting_with_team_delta =  mapply(function(x,y){
                    if (x == "junior") {
                      curve(curve13,y)
                    } else if(x=="middle"){
                      curve(curve14,y)
                    } else {curve(curve15,y)}
                  },sales_level,
                  meetings_with_team,SIMPLIFY=T),
                  m_sales_target_realization_delta = sapply(sales_target_realization,function(x)curve(curve16,x)),
                  m_sales_training_delta = sapply(sales_training,function(x)curve(curve17,x)),
                  m_admin_work_delta = sapply(admin_work,function(x)curve(curve18,x)))%>%
                  
               
    
    
    
    
    
    
    mutate(sales_skills_index = 
      ss_accumulated_field_work_delta*((weightage$sales_skills)$field_work)+
      ss_accumulated_sales_training_delta*((weightage$sales_skills)$sales_training)+
      ss_experience_index_pp*((weightage$sales_skills)$experience),
      product_knowledge_index = 
        product_knowledge_addition_current_period+
        product_knowledge_transfer_value,
      motivation_index = 
        (pp_motivation_index+m_admin_work_delta)*
          ((weightage$motivation)$admin_work)+
        (pp_motivation_index+m_sales_target_realization_delta)*
          ((weightage$motivation)$sales_target_realization)+
        (pp_motivation_index+m_meeting_with_team_delta)*
          ((weightage$motivation)$meetings_with_team)+
        (pp_motivation_index+m_sales_training_delta)*
          ((weightage$motivation)$sales_training)) %>%
    mutate(srsp_motivation_factor = sapply(pp_motivation_index,function(x)curve(curve32,x)),
           srsp_sales_skills_factor = sapply(sales_skills_index,function(x)curve(curve34,x)),
           srsp_product_knowledge_factor = sapply(product_knowledge_index,function(x)curve(curve33,x)),
           srsp_time_with_account_factor = 
             mapply(function(x,y){if (x=="product1"){
             curve(curve35,y)} else if(
               x=="product2"){
               curve(curve36,y)} else if (
                 x=="product3") {
                 curve(curve37,y)} else {
                   curve(curve38,y)}},
             product,sr_time)) %>%
    mutate(sr_sales_performance = 
      srsp_motivation_factor*pp_sr_sales_performance*
        ((weightage$sr_sales_performance)$motivation)+
      srsp_sales_skills_factor*pp_sr_sales_performance*
        ((weightage$sr_sales_performance)$sales_skills)+
      srsp_product_knowledge_factor*pp_sr_sales_performance*
        ((weightage$sr_sales_performance)$product_knowledge)+
      srsp_time_with_account_factor*pp_sr_sales_performance*
        ((weightage$sr_sales_performance)$time_with_account))%>%
    mutate(dq_admin_work_delta = sapply(admin_work,function(x)curve(curve5,x)),
           dq_priority_fit_delta = sapply(contact_priority_fit_index,function(x)curve(curve6,x)),
           dq_meetings_with_team_delta =sapply(meetings_with_team,function(x)curve(curve7,x)),
           dq_kpi_analysis_factor = sapply(kpi_analysis,function(x)curve(curve8,x)),
           dq_strategy_planning_delta = sapply(strategy_and_cycle_planning,function(x)curve(curve9,x)))%>%
    mutate(deployment_quality_index = 
      (pp_deployment_quality_index+dq_admin_work_delta)*
        ((weightage$deployment_quality)$admin_work)+
      (pp_deployment_quality_index+dq_priority_fit_delta)*
        ((weightage$deployment_quality)$priority_fit)+
      (pp_deployment_quality_index+dq_meetings_with_team_delta)*
        ((weightage$deployment_quality)$meetings_with_team)+
      pp_deployment_quality_index*dq_kpi_analysis_factor*
        ((weightage$deployment_quality)$kpi_report_analysis)+
      (pp_deployment_quality_index+dq_strategy_planning_delta)*
        ((weightage$deployment_quality)$strategy_and_cycle_planning))%>%
    mutate(ps_strategy_planning_factor = sapply(strategy_and_cycle_planning,function(x) curve(curve29,x)),
           ps_promotional_budget_factor = sapply(promotional_budget,function(x)curve(curve30,x))) %>%
    mutate(promotional_support_index = 
      pp_promotional_support_index*ps_strategy_planning_factor*
        ((weightage$promotional_support)$strategy_and_cycle_planning)+
      pp_promotional_support_index*ps_promotional_budget_factor*
        ((weightage$promotional_support)$promotional_budget)) %>%
    mutate(sp_field_work_delta = sapply(field_work_peraccount,function(x)curve(curve40,x)),
           sp_deployment_quality_factor = sapply(deployment_quality_index,function(x)curve(curve41,x))) %>%
    mutate(sales_performance = 
      sr_sales_performance*((weightage$sales_performance)$sr_sales_performance)+
      (pp_sales_performance+sp_field_work_delta)*
        ((weightage$sales_performance)$field_work)+
      (pp_sales_performance*sp_deployment_quality_factor)*
        ((weightage$sales_performance)$deployment_quality))%>%
    mutate(#cr_market_share_delta = curve(curve1,market_share_peraccount),
      cr_product_knowledge_delta = sapply(product_knowledge_index-pp_product_knowledge_index,function(x)curve(curve2,x)),
      cr_promotional_support_delta = sapply(promotional_support_index/pp_promotional_support_index,function(x)curve(curve3,x)),
      cr_pp_customer_relationship_index = sapply(pp_customer_relationship_index,function(x)curve(curve4,x)))%>%
    mutate(customer_relationship_index =
             (cr_pp_customer_relationship_index+cr_product_knowledge_delta)*
                     (weightage$customer_relaitonship)$product_knowledge+
                   (cr_pp_customer_relationship_index+cr_promotional_support_delta)*
                     (weightage$customer_relaitonship)$promotional_support+
                   cr_pp_customer_relationship_index*
                     (weightage$customer_relaitonship)$past_relationship) %>%
    mutate(oa_customer_relationship_factor = 
             mapply(function(x,y){if (x=="product1"){
      curve(curve19,y)} else if(
        x=="product2"){
        curve(curve20,y)} else if (
          x=="product3") {
          curve(curve21,y)} else {
            curve(curve22,y)}},
      product,customer_relationship_index),
      oa_sales_performance_factor = sapply(sales_performance,function(x)curve(curve25,x))) %>%
    mutate(cp_offer_attractiveness = 
      pp_offer_attractiveness*oa_customer_relationship_factor*
        (weightage$cp_offer_attractiveness)$customer_relationship+
      pp_offer_attractiveness*oa_sales_performance_factor*
        (weightage$cp_offer_attractiveness)$sales_performance) %>%
    mutate(offer_attractiveness = 
      cp_offer_attractiveness*(weightage$total_attractiveness)$cp_offer_attractiveness+
      pp_offer_attractiveness*(weightage$total_attractiveness)$pp_offer_attractiveness,
    acc_offer_attractiveness = pp_acc_offer_attractiveness+offer_attractiveness)
  
  tmp
}



get.data1 <- function(input,phase){
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
      name.sales_rep <- input[[paste("p",phase,"_sr_hosp",j,sep="")]]
      value.sales_target <- as.numeric(input[[paste("p",phase,"_hosp",j,"_sales_target_",q,sep="")]])
      value.discount <- as.numeric(input[[paste("p",phase,"_discount_hosp",j,"_",q,sep="")]])
      value.promotional_budget <- as.numeric(input[[paste("p",phase,"_promotional_budget_hosp",j,sep="")]])
      value.sr_time <- as.numeric(input[[paste("p",phase,"_hosp",j,"_worktime_",q,sep="")]])/100*worktime
      value.time_on_doc <- as.numeric(
        input[[paste("p",phase,"_hosp",j,"_worktime_doc",sep="")]])*value.sr_time
      value.time_on_diet <- as.numeric(
        input[[paste("p",phase,"_hosp",j,"_worktime_diet",sep="")]])*value.sr_time
      value.time_on_admin <- as.numeric(
        input[[paste("p",phase,"_hosp",j,"_worktime_admin",sep="")]])*value.sr_time
      value.time_on_nurs <- as.numeric(
        input[[paste("p",phase,"_hosp",j,"_worktime_nurs",sep="")]])*value.sr_time
      
      data_decision <- plyr::rbind.fill(data_decision,data.frame(
        phase = as.character(paste("phase",phase,sep="")),
        hospital = as.character(hospital_info_initial$name[j]),
        sales_rep = as.character(name.sales_rep), 
        product = as.character(product_info_initial$name2[q]),
        sales_target = value.sales_target,
        potential_sales = as.numeric(get(paste("potential_sales_product",q,sep=""))[[j]][[phase]]),
        real_sales = as.numeric(get(paste("real_sales_product",q,sep=""))[[j]][[phase]]),
        discount = value.discount,
        promotional_budget = value.promotional_budget,
        sr_time = value.sr_time,
        time_on_doc = as.numeric(
          input[[paste("p",phase,"_hosp",j,"_worktime_doc",sep="")]]),
        time_on_diet = as.numeric(
          input[[paste("p",phase,"_hosp",j,"_worktime_diet",sep="")]]),
        time_on_admin = as.numeric(
          input[[paste("p",phase,"_hosp",j,"_worktime_admin",sep="")]]),
        time_on_nurs = as.numeric(
          input[[paste("p",phase,"_hosp",j,"_worktime_nurs",sep="")]])
        # time_on_doc = value.time_on_doc,
        # time_on_diet = value.time_on_diet,
        # time_on_admin = value.time_on_admin,
        # time_on_nurs = value.time_on_nurs
      ))
    }}
  data_decision
}


get.data2 <- function(input,phase){
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
      input[[paste("p",phase,"_sr",j,"_sales_training",sep="")]])/100*worktime
    value.product_training <- as.numeric(
      input[[paste("p",phase,"_sr",j,"_product_training",sep="")]])/100*worktime
    value.field_work <- as.numeric(
      input[[paste("p",phase,"_sr",j,"_field_work",sep="")]])/100*worktime
    value.meetings_with_team <- as.numeric(
      input[[paste("p",phase,"_flm_team_meeting",sep="")]])/100*worktime
    value.kpi_analysis <- as.numeric(
      input[[paste("p",phase,"_flm_kpi_analysis",sep="")]])/100*worktime
    value.strategy_and_cycle_planning <- as.numeric(
      input[[paste("p",phase,"_flm_strategy_planning",sep="")]])/100*worktime
    value.admin_work <- as.numeric(
      input[[paste("p",phase,"_flm_admin_work",sep="")]])/100*worktime
    
    data_decision2 <- plyr::rbind.fill(data_decision2,data.frame(
      phase = as.character(paste("phase",phase,sep="")),
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
}

get.data3 <- function(input,phase){
  flm_decision <- data.frame(
    flm_sales_training = sales_training(input,phase),
    flm_field_work = field_work(input,phase),
    flm_meetings_with_team = as.numeric(input[[paste("p",phase,"_flm_team_meeting",sep = "")]]),
    flm_kpi_analysis = as.numeric(input[[paste("p",phase,"_flm_kpi_analysis",sep = "")]]),
    flm_strategy_planning = as.numeric(input[[paste("p",phase,"_flm_strategy_planning",sep = "")]]),
    flm_admin_work = as.numeric(input[[paste("p",phase,"_flm_admin_work",sep = "")]]))
  flm_decision
  
}


