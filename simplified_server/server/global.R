library(shiny)
library(shinydashboard)
library(shinyjs)
library(DT)
library(plyr)
library(dplyr)
library(tidyr)
library(digest)

load("initial_setting2.RData")

## curve funcion
curve <- function(name,input_x){
  data <- name
  if (input_x<=min(data$x)) {
    y <- data$y[which.min(data$x)]
  } else if (input_x>=max(data$x)) {
    y <- data$y[which.max(data$x)]
  } else {
    left <- data[which.min(abs(input_x-data$x)),]
    tmp <- data[-which.min(abs(input_x-data$x)),]
    right <- tmp[which.min(abs(input_x-tmp$x)),]
    y <- ifelse(left$x <= right$x,
                (1-(input_x-left$x)/(right$x-left$x))*left$y + 
                  (1-(right$x-input_x)/(right$x-left$x))*right$y,
                (1-(input_x-right$x)/(left$x-right$x))*right$y + 
                  (1-(left$x-input_x)/(left$x-right$x))*left$y)}
  
  y
}




# contact_fit <- function(input,best){
#   if (input>=best ) {
#     out <- 1
#   } else {
#     out<-round(input/best,2)
#   }
#   out
# }


# decision1_summary <- function(input,phase,hospital){
#   total <- sum(c(
#     as.numeric(input[[paste("p",phase,"_hosp",hospital,"_worktime_doc",sep="")]]),
#     as.numeric(input[[paste("p",phase,"_hosp",hospital,"_worktime_diet",sep="")]]),
#     as.numeric(input[[paste("p",phase,"_hosp",hospital,"_worktime_admin",sep="")]]),
#     as.numeric(input[[paste("p",phase,"_hosp",hospital,"_worktime_nurs",sep="")]])),na.rm=T)
#   total
# }

calculator <- function(input,phase){
  phase1_promotional_budget=0
  phase1_total_time_arrangement1 <- 0 
  phase1_total_time_arrangement2 <- 0 
  
  
  for(i in 1:3){
    phase1_promotional_budget <-
      sum(c(phase1_promotional_budget, 
            as.numeric(input[[paste("p",phase,"_promotional_budget_hosp",i,sep="")]])),
          na.rm = TRUE)
    tmp <- sum(c(as.numeric(input[[paste("p",phase,"_hosp",i,"_worktime_1",sep="")]])/100*worktime,
                 as.numeric(input[[paste("p",phase,"_hosp",i,"_worktime_2",sep="")]])/100*worktime,
                 as.numeric(input[[paste("p",phase,"_hosp",i,"_worktime_3",sep="")]])/100*worktime,
                 as.numeric(input[[paste("p",phase,"_hosp",i,"_worktime_4",sep="")]])/100*worktime),
               na.rm = TRUE)
    if (input[[paste("p",phase,"_sr_hosp",i,sep = "")]]==
        sr_info_initial_value$sales_rep[1]){
      phase1_total_time_arrangement1 <- 
        phase1_total_time_arrangement1 +tmp
    } else if (input[[paste("p",phase,"_sr_hosp",i,sep = "")]]==
               sr_info_initial_value$sales_rep[2]) {
      phase1_total_time_arrangement2 <- 
        phase1_total_time_arrangement2 +tmp
    } 
  }
  
  team_meeting <- as.numeric(input[[paste("p",phase,"_flm_team_meeting",sep="")]])
  
  phase1_total_time_arrangement1 <- sum(c(phase1_total_time_arrangement1,
    as.numeric(input[[paste("p",phase,"_sr1_sales_training",sep="")]]),
    as.numeric(input[[paste("p",phase,"_sr1_product_training",sep="")]]),
    team_meeting),na.rm=T)
  
  phase1_total_time_arrangement2 <- sum(c(phase1_total_time_arrangement2,
    as.numeric(input[[paste("p",phase,"_sr2_sales_training",sep="")]]),
    as.numeric(input[[paste("p",phase,"_sr2_product_training",sep="")]]),
    team_meeting),na.rm=T)
  
  
  
  data <- c(phase1_promotional_budget,
            phase1_total_time_arrangement1,
            phase1_total_time_arrangement2)
  data
  
}

sales_training <- function(input,phase){sum(c(
  as.numeric(input[[paste("p",phase,"_sr1_sales_training",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_sr2_sales_training",sep = "")]])),
  na.rm = T)}

field_work <- function(input,phase){sum(c(
  as.numeric(input[[paste("p",phase,"_sr1_field_work",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_sr2_field_work",sep = "")]])),
  na.rm = T)}

total_management <- function(input,phase){sum(c(
  sales_training(input,phase),
  field_work(input,phase),
  as.numeric(input[[paste("p",phase,"_flm_team_meeting",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_flm_kpi_analysis",sep = "")]]),
  as.numeric(input[[paste("p",phase,"_flm_admin_work",sep = "")]])),
  na.rm = T
)}

calculation <- function(pp_data1,
                        pp_data2,
                        cp_data1,
                        cp_data2){
  #
  #
  tmp1 <- left_join(cp_data1,pp_data1,by=c("hospital","product"))
  tmp2 <- left_join(cp_data2,pp_data2,by=c("sales_rep"))
  
  tmp <- left_join(tmp1,tmp2,by=c("phase","sales_rep")) %>%
    mutate(product_price = sapply(product,function(x) production_price[which(production_price$product==x),]$price),
           target_revenue= sales_target*product_price) %>%
    group_by(phase,sales_rep) %>%
    mutate(no.hospitals = n_distinct(hospital),
           sr_time_total=sum(sr_time,na.rm=T)) %>%
    ungroup %>%
    dplyr::mutate(sr_acc_field_work = pp_sr_acc_field_work+field_work,
                  overhead_factor = sapply(pp_motivation_index,function(x) curve(curve12,x)),
                  overhead_time = round(overhead_factor*overhead,0),
                  real_sr_time = round(sr_time-overhead_time/no.hospitals/4,2),
                  pp_experience_index = sapply(pp_sr_acc_revenue,function(x) round(curve(curve11,x),2)),
                  field_work_peraccount = field_work/no.hospitals,
                  product_knowledge_addition_current_period = sapply(product_training,function(x)curve(curve26,x)),
                  product_knowledge_transfer_value = sapply(pp_product_knowledge_index,function(x)curve(curve28,x)),
                  ss_accumulated_field_work_delta = sapply(sr_acc_field_work,function(x)curve(curve42,x)),
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
                  m_sales_target_realization_delta = sapply(pp_target_volume_realization_by_sr,function(x)curve(curve16,x)),
                  m_sales_training_delta = sapply(sales_training,function(x)curve(curve17,x)),
                  m_admin_work_delta = sapply(admin_work,function(x)curve(curve18,x)))%>%
    mutate(sales_skills_index = round(
      ss_accumulated_field_work_delta*((weightage$sales_skills)$field_work)+
        ss_accumulated_sales_training_delta*((weightage$sales_skills)$sales_training)+
        ss_experience_index_pp*((weightage$sales_skills)$experience)),
      product_knowledge_index = round(
        product_knowledge_addition_current_period+
          product_knowledge_transfer_value),
      motivation_index = round(
        (pp_motivation_index+m_admin_work_delta)*
          ((weightage$motivation)$admin_work)+
          (pp_motivation_index+m_sales_target_realization_delta)*
          ((weightage$motivation)$sales_target_realization)+
          (pp_motivation_index+m_meeting_with_team_delta)*
          ((weightage$motivation)$meetings_with_team)+
          (pp_motivation_index+m_sales_training_delta)*
          ((weightage$motivation)$sales_training))) %>%
    mutate(srsp_motivation_factor = sapply(pp_motivation_index,function(x)curve(curve32,x)),
           srsp_sales_skills_factor = sapply(sales_skills_index,function(x)curve(curve34,x)),
           srsp_product_knowledge_factor = sapply(product_knowledge_index,function(x)curve(curve33,x)),
           srsp_time_with_account_factor = 
             mapply(function(x,y){if (x==as.character(product_code$product[1])){
               curve(curve35,y)} else if(
                 x==as.character(product_code$product[2])){
                 curve(curve36,y)} else if (
                   x==as.character(product_code$product[3])) {
                   curve(curve37,y)} else {
                     curve(curve38,y)}},
               product,real_sr_time)) %>%
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
           dq_meetings_with_team_delta =sapply(meetings_with_team,function(x)curve(curve7,x)),
           dq_kpi_analysis_factor = sapply(kpi_analysis,function(x)curve(curve8,x)))%>%
    mutate(deployment_quality_index = round(
      (pp_deployment_quality_index+dq_admin_work_delta)*
        ((weightage$deployment_quality)$admin_work)+
        (pp_deployment_quality_index+dq_meetings_with_team_delta)*
        ((weightage$deployment_quality)$meetings_with_team)+
        pp_deployment_quality_index*dq_kpi_analysis_factor*
        ((weightage$deployment_quality)$kpi_report_analysis)))%>%
    mutate(ps_promotional_budget_factor = sapply(promotional_budget,function(x)curve(curve30,x))) %>%
    mutate(promotional_support_index = 
             pp_promotional_support_index*ps_promotional_budget_factor) %>%
    mutate(sp_field_work_delta = sapply(field_work_peraccount,function(x)curve(curve40,x)),
           sp_deployment_quality_factor = sapply(deployment_quality_index,function(x)curve(curve41,x))) %>%
    mutate(sales_performance = 
             sr_sales_performance*((weightage$sales_performance)$sr_sales_performance)+
             (pp_sales_performance+sp_field_work_delta)*
             ((weightage$sales_performance)$field_work)+
             (pp_sales_performance*sp_deployment_quality_factor)*
             ((weightage$sales_performance)$deployment_quality))%>%
    mutate(cr_product_knowledge_delta = 
             sapply(product_knowledge_index-pp_product_knowledge_index,function(x)curve(curve2,x)),
           cr_promotional_support_delta = 
             sapply(promotional_support_index/pp_promotional_support_index,function(x)curve(curve3,x)),
           cr_pp_customer_relationship_index = 
             sapply(pp_customer_relationship_index,function(x)curve(curve4,x)))%>%
    mutate(customer_relationship_index = round(
      (cr_pp_customer_relationship_index+cr_product_knowledge_delta)*
        (weightage$customer_relaitonship)$product_knowledge+
        (cr_pp_customer_relationship_index+cr_promotional_support_delta)*
        (weightage$customer_relaitonship)$promotional_support+
        cr_pp_customer_relationship_index*
        (weightage$customer_relaitonship)$past_relationship)) %>%
    mutate(oa_customer_relationship_factor = 
             mapply(function(x,y){if (x==as.character(product_code$product[1])){
               curve(curve19,y)} else if(
                 x==as.character(product_code$product[2])){
                 curve(curve20,y)} else if (
                   x==as.character(product_code$product[3])) {
                   curve(curve21,y)} else {
                     curve(curve22,y)}},
               product,customer_relationship_index),
           oa_sales_performance_factor = sapply(sales_performance,function(x)curve(curve25,x))) %>%
    mutate(cp_offer_attractiveness = 
             pp_offer_attractiveness*oa_customer_relationship_factor*
             (weightage$cp_offer_attractiveness)$customer_relationship+
             pp_offer_attractiveness*oa_sales_performance_factor*
             (weightage$cp_offer_attractiveness)$sales_performance) %>%
    mutate(offer_attractiveness = round(cp_offer_attractiveness*(weightage$total_attractiveness)$cp_offer_attractiveness+
                                          pp_offer_attractiveness*(weightage$total_attractiveness)$pp_offer_attractiveness),
           acc_offer_attractiveness = round(pp_acc_offer_attractiveness+offer_attractiveness),
           market_share = sapply(offer_attractiveness, function(x) curve(curve51,x)),
           real_volume = round(market_share*potential_volume),
           real_revenue = round(real_volume*product_price)) %>%
    group_by(sales_rep) %>%
    mutate(target_revenue_by_sr = sum(target_revenue,na.rm=T),
           real_revenue_by_sr = sum(real_revenue,na.rm=T),
           target_revenue_realization_by_sr = round(real_revenue_by_sr/target_revenue_by_sr*100,2),
           target_volume_by_sr = sum(sales_target,na.rm=T),
           real_volume_by_sr = sum(real_volume,na.rm=T),
           target_volume_realization_by_sr = round(real_volume_by_sr/target_volume_by_sr*100,2),
           incentive_factor = sapply(target_volume_realization_by_sr, function(x) curve(curve10,x)),
           bonus = round(incentive_factor*0.03*target_revenue_by_sr),
           sr_acc_revenue = real_revenue_by_sr+pp_sr_acc_revenue,
           experience_index = sapply(sr_acc_revenue, function(x) round(curve(curve11,x),2))) %>%
    ungroup()
             
  
  tmp
}



get.data1 <- function(input,phase){
  data_decision <- data.frame(
    phase = NULL, 
    hospital = NULL,
    sales_rep = NULL,
    product = NULL,
    sales_target = NULL,
    potential_volume = NULL,
    promotional_budget = NULL,
    sr_time = NULL,
    stringsAsFactors = F)
  
  for (j in 1:3) {
    for (q in 1:4){
      name.phase = as.character(paste("周期",phase,sep=""))
      name.hospital = as.character(hospital_info$hospital[j])
      name.product = as.character(product_info_initial$product[q])
      name.sales_rep <- as.character(input[[paste("p",phase,"_sr_hosp",j,sep="")]])
      value.sales_target <- as.numeric(input[[paste("p",phase,"_hosp",j,"_sales_target_",q,sep="")]])
      value.discount <- as.numeric(input[[paste("p",phase,"_discount_hosp",j,"_",q,sep="")]])
      value.promotional_budget <- as.numeric(input[[paste("p",phase,"_promotional_budget_hosp",j,sep="")]])/100*
        total_promotional_budget[[paste("phase",phase,sep="")]]
      value.sr_time <- as.numeric(input[[paste("p",phase,"_hosp",j,"_worktime_",q,sep="")]])/100*worktime
      
      
      data_decision <- plyr::rbind.fill(data_decision,data.frame(
        phase = name.phase,
        hospital = name.hospital,
        sales_rep = name.sales_rep, 
        product = name.product,
        sales_target = value.sales_target,
        potential_volume = volume_info[which(volume_info$phase==name.phase&
                                               volume_info$hospital==name.hospital&
                                               volume_info$product==name.product),]$potential_volume,
        promotional_budget = value.promotional_budget,
        sr_time = value.sr_time
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
    admin_work = NULL,
    stringsAsFactors = F
  )
  
  for (j in 1:2) {
    name.sales_rep <- as.character(sr_info_initial_value$sales_rep[j])
    value.sales_training <- as.numeric(
      input[[paste("p",phase,"_sr",j,"_sales_training",sep="")]])
    value.product_training <- as.numeric(
      input[[paste("p",phase,"_sr",j,"_product_training",sep="")]])
    value.field_work <- as.numeric(
      input[[paste("p",phase,"_sr",j,"_field_work",sep="")]])
    value.meetings_with_team <- as.numeric(
      input[[paste("p",phase,"_flm_team_meeting",sep="")]])
    value.kpi_analysis <- as.numeric(
      input[[paste("p",phase,"_flm_kpi_analysis",sep="")]])
    value.admin_work <- as.numeric(
      input[[paste("p",phase,"_flm_admin_work",sep="")]])
    
    data_decision2 <- plyr::rbind.fill(data_decision2,data.frame(
      phase = as.character(paste("周期",phase,sep="")),
      sales_rep = name.sales_rep,
      sales_training = value.sales_training,
      product_training = value.product_training,
      field_work = value.field_work,
      meetings_with_team = value.meetings_with_team,
      kpi_analysis = value.kpi_analysis,
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
    flm_admin_work = as.numeric(input[[paste("p",phase,"_flm_admin_work",sep = "")]]),
    stringsAsFactors = F)
  flm_decision
  
}




## staff report 1

report_data <- function(tmp,flm_data,null_report) {
  report1_mod2 <- tmp %>%
    group_by(sales_rep) %>%
    mutate(visit_time=sum(real_sr_time)) %>%
    ungroup() %>%
    select(overhead_time,
           product_training,
           sales_training,
           meetings_with_team,
           visit_time,
           sr_time_total,
           sales_rep) %>%
    distinct()
  
  
  
  colnames(report1_mod2) <- c("日常事物(天)",
                              "产品培训(天)",
                              "销售培训(天)",
                              "团队会议(天)",
                              "医院拜访(天)",
                              "总工作时间(天)",
                              "销售代表")
  
  report1_mod2 <- report1_mod2 %>%
    gather(variable,`值`,-`销售代表`) %>%
    spread(`销售代表`,`值`) 
  
  report1_rank2 <- data.frame(
    variable=c("日常事物(天)",
               "产品培训(天)",
               "销售培训(天)",
               "团队会议(天)",
               "医院拜访(天)",
               "总工作时间(天)"),
    rank=1:6,
    stringsAsFactors = F
  )
  
  report1_mod2 <- report1_mod2 %>%
    left_join(report1_rank2,by="variable") %>%
    arrange(rank) 
  
  rownames(report1_mod2) <- report1_mod2$variable
  
  report1_mod2 <- report1_mod2 %>% select(-variable,-rank)
  
  
  
  
  report1_mod3 <- tmp %>%
    select(sales_rep,
           product_knowledge_index,
           product_training) %>%
    distinct()
  
  colnames(report1_mod3) <- c("销售代表",
                              "产品知识(指数)",
                              "产品培训(天)")
  
  report1_mod3 <- report1_mod3 %>%
    gather(variable,`值`,-`销售代表`) %>%
    spread(`销售代表`,`值`)
  
  rownames(report1_mod3) <- report1_mod3$variable
  report1_mod3 <- report1_mod3 %>% select(-variable)
  
  report1_mod4 <- tmp %>%
    select(pp_experience_index,
           real_revenue_by_sr,
           sr_acc_revenue,
           experience_index,
           sales_rep) %>%
    distinct()
  colnames(report1_mod4) <- c("前期经验",
                              "当期销售(元)",
                              "累计总销售(元)",
                              "当期经验",
                              "销售代表")
  report1_mod4 <- report1_mod4 %>%
    gather(variable,`值`,-`销售代表`) %>%
    spread(`销售代表`,`值`)
  
  rownames(report1_mod4) <- report1_mod4$variable
  report1_mod4 <- report1_mod4 %>% select(-variable)
  
  
  
  report1_mod5 <- tmp%>%
    select(sales_rep,
           pp_sales_skills_index,
           sales_skills_index,
           field_work) %>%
    distinct()
  colnames(report1_mod5) <- c("销售代表",
                              "前期销售技巧(指数)",
                              "当期销售技巧(指数)",
                              "经理医院随访(天)")
  report1_mod5 <- report1_mod5 %>%
    gather(variable,`值`,-`销售代表`) %>%
    spread(`销售代表`,`值`)
  
  rownames(report1_mod5) <- report1_mod5$variable
  report1_mod5 <- report1_mod5 %>% select(-variable)
  
  report1_mod6 <- tmp %>%
    select(sales_rep,
           pp_motivation_index,
           motivation_index) %>%
    distinct()  
  colnames(report1_mod6) <- c("销售代表",
                              "前期动力值(指数)",
                              "当期动力值(指数)")
  report1_mod6 <- report1_mod6 %>%
    gather(variable,`值`,-`销售代表`) %>%
    spread(`销售代表`,`值`)
  
  rownames(report1_mod6) <- report1_mod6$variable
  report1_mod6 <- report1_mod6 %>% select(-variable)
  
  
  
  
  
  ## flm report
  flm_report <- tmp %>%
    select(sales_rep,
           bonus) %>%
    distinct() %>%
    mutate(all_sr_bonus=sum(bonus,na.rm=T)) %>%
    select(all_sr_bonus) %>%
    distinct()
  
  flm_report <- flm_data %>%
    mutate(all_sr_bonus = flm_report$all_sr_bonus,
           work_time=flm_sales_training+
             flm_field_work+
             flm_meetings_with_team+
             flm_kpi_analysis+
             flm_admin_work)
  
  report2_mod1 <- flm_report%>%
    select(all_sr_bonus) %>%
    mutate(variable="绩效奖金(元)")
  rownames(report2_mod1) <- report2_mod1$variable
  colnames(report2_mod1)[1] <- "值" 
  report2_mod1 <- report2_mod1 %>%
    select(-variable)
  
  report2_mod2 <- flm_report %>%
    select(-all_sr_bonus) 
  
  colnames(report2_mod2) <- c("销售培训(天)",
                              "经理随访(天)",
                              "团队会议(天)",
                              "KPI分析(天)",
                              "行政工作(天)",
                              "总工作时间(天)")
  report2_mod2 <- report2_mod2 %>%
    gather(variable,`值`)
  
  rownames(report2_mod2) <- report2_mod2$variable
  report2_mod2 <- report2_mod2 %>% select(-variable)
  
  
  ## brief time allocation of hospital report
  report3_rank1 <- data.frame(
    "因素"=c("销售代表",
           "计划时间分配(天)",
           "实际时间分配(天)"),
    rank=1:3,
    stringsAsFactors =F
  )
  
  report3_mod1 <- tmp %>%
    select(hospital,
           product,
           sales_rep,
           sr_time,
           real_sr_time) %>%
    distinct() 
  
  
  colnames(report3_mod1) <- c("医院",
                              "产品",
                              "销售代表",
                              "计划时间分配(天)",
                              "实际时间分配(天)") 
  
  report3_mod1 <- report3_mod1 %>%
    gather(`因素`,value,-`医院`,-`产品`) %>%
    spread(`产品`,value) %>%
    left_join(report3_rank1,by="因素") %>%
    arrange(`医院`,rank) %>%
    select(-rank)
  
  
  
  
  
  
  ## evaluation of decision report
  report4_mod3 <- tmp %>%
    group_by(hospital) %>%
    mutate(total_deployment_quality_index= round(sum(deployment_quality_index),2),
           total_pp_deployment_quality_index=round(sum(pp_deployment_quality_index),2)) %>%
    ungroup() %>%
    select(hospital,
           total_pp_deployment_quality_index,
           kpi_analysis,
           meetings_with_team,
           admin_work,
           total_deployment_quality_index) %>%
    distinct()
  
  colnames(report4_mod3) <- c("医院",
                              "上期决策质量(指数)",
                              "KPI分析(天)",
                              "团队会议(天)",
                              "行政工作(天)",
                              "当期决策质量(指数)")
  
  rownames(report4_mod3) <- report4_mod3$医院
  report4_mod3 <- report4_mod3 %>% select(-`医院`)
  
  ## report d
  report5_mod1 <- tmp %>%
    select(hospital,
           product,
           real_revenue) %>%
    group_by(product) %>%
    mutate(real_revenue_by_product=round(sum(real_revenue)),
           production_cost = sapply(product,function(x)production_price[which(production_price$product==x),]$cost),
           production_fee = real_revenue_by_product*production_cost,
           profit = real_revenue_by_product - production_fee,
           production_fee_percent = round(production_fee/real_revenue_by_product*100,2),
           profit_percent = round(profit/real_revenue_by_product*100,2)) %>%
    ungroup() %>%
    select(-hospital,
           -production_cost,
           -real_revenue) %>%
    distinct() 
  
  
  colnames(report5_mod1) <- c("产品",
                              "销售金额(元)",
                              "生产成本(元)",
                              "利润贡献(元)",
                              "生产成本(%)",
                              "利润贡献(%)")
  report5_mod1 <- report5_mod1 %>%
    gather(`因素`,value,-`产品`) %>%
    spread(`产品`,value)
  
  report5_rank1 <- data.frame(
    "因素"= c("销售金额(元)",
            "生产成本(元)",
            "生产成本(%)",
            "利润贡献(元)",
            "利润贡献(%)"),
    rank=1:length(report5_mod1$因素),
    stringsAsFactors = F
  )
  
  report5_mod1 <- report5_mod1 %>%
    left_join(report5_rank1,by="因素") %>%
    distinct() %>%
    arrange(rank) %>%
    select(-rank)
  
  rownames(report5_mod1) <- report5_mod1$因素
  
  report5_mod1 <- report5_mod1 %>% select(-`因素`)  
  
  
  
  report5_mod3 <- tmp %>%
    select(real_revenue,
           real_volume,
           promotional_budget,
           product) %>%
    mutate(production_cost = sapply(product,function(x)production_price[which(production_price$product==x),]$cost),
           production_fee = production_cost*real_revenue,
           total_revenue =round(sum(real_revenue)),
           total_production_fee =round(sum(production_fee)),
           total_promotional_budget = round(sum(promotional_budget)),
           total_salary=round(report2_mod1$值))  %>%
    select(total_revenue,
           total_production_fee,
           total_promotional_budget,
           total_salary) %>%
    distinct() %>%
    mutate(profit=total_revenue-
             total_production_fee-
             total_promotional_budget-
             total_salary)
  
  report5_rank3 <- data.frame(
    variable=c("销售额",
               "生产成本",
               "推广费用",
               "员工薪酬",
               "利润贡献"),
    rank = 1:5,
    stringsAsFactors = F
  )
  
  
  
  report5_mod3_1 <- report5_mod3 
  colnames(report5_mod3_1) <- c("销售额",
                                "生产成本",
                                "推广费用",
                                "员工薪酬",
                                "利润贡献")
  report5_mod3_1 <- report5_mod3_1 %>%
    gather(variable,"金额(元)") 
  
  
  
  
  report5_mod3_2 <- report5_mod3 %>%
    mutate(total_revenue_percent = round(total_revenue/total_revenue*100,2),
           total_production_fee_percent = round(total_production_fee/total_revenue*100,2),
           total_promotional_budget_percent = round(total_promotional_budget/total_revenue*100,2),
           total_salary_percent = round(total_salary/total_revenue*100,2),
           profit_percent = round(profit/total_revenue*100,2)) %>%
    select(total_revenue_percent,
           total_production_fee_percent,
           total_promotional_budget_percent,
           total_salary_percent,
           profit_percent) 
  
  colnames(report5_mod3_2) <- c("销售额",
                                "生产成本",
                                "推广费用",
                                "员工薪酬",
                                "利润贡献")
  
  report5_mod3 <- report5_mod3_2 %>%
    gather(variable,"占比(%)") %>%
    left_join(report5_mod3_1,by="variable") %>%
    left_join(report5_rank3,by="variable") %>%
    arrange(rank) %>%
    select(-rank)
  
  rownames(report5_mod3) <- report5_mod3$variable
  report5_mod3 <- report5_mod3 %>% 
    select(-variable) %>%
    select(`金额(元)`,`占比(%)`)
  
  ## report c
  report6_rank <- data.frame(
    variable=c("销售额(元)",
               "生产成本(元)",
               "生产成本(%)",
               "推广费用预算(元)",
               "推广费用预算(%)",
               "利润贡献(元)",
               '利润贡献(%)'),
    rank=1:7,
    stringsAsFactors = F)
  
  product_report_peraccount <- tmp %>%
    select(hospital,
           product,
           real_revenue,
           real_volume,
           promotional_budget) %>%
    group_by(hospital,product) %>%
    mutate(no.product=n_distinct(product),
           production_cost = sapply(product,function(x)production_price[which(production_price$product==x),]$cost),
           production_fee = round(production_cost*real_revenue),
           promotion_fee = round(promotional_budget/no.product),
           profit = round(real_revenue-production_fee-promotion_fee)) %>%
    ungroup() %>%
    select(hospital,
           product,
           real_revenue,
           production_fee,
           promotion_fee,
           profit) %>%
    group_by(hospital) %>%
    do(plyr::rbind.fill(.,data.frame(hospital=first(.$hospital),
                                     product="总体",
                                     real_revenue = sum(.$real_revenue),
                                     production_fee = sum(.$production_fee),
                                     promotion_fee = sum(.$promotion_fee),
                                     profit = sum(.$profit)))) %>%
    ungroup() %>%
    mutate(production_fee_percent = round(production_fee/real_revenue*100,2),
           promotion_fee_percent = round(promotion_fee/real_revenue*100,2),
           profit_percent = round(profit/real_revenue*100,2))
  
  colnames(product_report_peraccount) <- c("医院",
                                           "产品",
                                           "销售额(元)",
                                           "生产成本(元)",
                                           "推广费用预算(元)",
                                           "利润贡献(元)",
                                           "生产成本(%)",
                                           "推广费用预算(%)",
                                           '利润贡献(%)')
  
  report6_mod1 <- product_report_peraccount %>%
    gather(variable,value,-`医院`,-`产品`) %>%
    spread(`产品`,value) %>%
    left_join(report6_rank,by="variable") %>%
    arrange(`医院`,rank) %>%
    select(-rank)
  
  
  
  
  
  ## report b
  report7_mod1 <- tmp %>%
    select(hospital,
           real_revenue,
           pp_real_revenue,
           real_volume,
           pp_real_volume,
           sales_target,
           target_revenue)%>%
    group_by(hospital) %>%
    dplyr::summarise(real_revenue_by_hosp = round(sum(real_revenue),2),
                     pp_real_revenue_by_hosp = round(sum(pp_real_revenue),2),
                     real_revenue_increase = round(real_revenue_by_hosp - pp_real_revenue_by_hosp,2),
                     real_volume_by_hosp = round(sum(real_volume),2),
                     pp_real_volume_by_hosp = round(sum(pp_real_volume),2),
                     real_volume_increase = round(real_volume_by_hosp - pp_real_volume_by_hosp,2),
                     target_revenue_by_hosp = sum(target_revenue,na.rm=T),
                     target_volume_by_hosp =sum(sales_target,na.rm=T)) %>%
    do(plyr::rbind.fill(.,data.frame(hospital="总体",
                                     real_revenue_by_hosp=sum(.$real_revenue_by_hosp),
                                     pp_real_revenue_by_hosp=sum(.$pp_real_revenue_by_hosp),
                                     real_revenue_increase=sum(.$real_revenue_increase),
                                     real_volume_by_hosp=sum(.$real_volume_by_hosp),
                                     pp_real_volume_by_hosp=sum(.$pp_real_volume_by_hosp),
                                     real_volume_increase=sum(.$real_volume_increase),
                                     target_revenue_by_hosp = sum(.$target_revenue_by_hosp,na.rm=T),
                                     target_volume_by_hosp = sum(.$target_volume_by_hosp,na.rm=T)))) %>%
    mutate(real_revenue_increase_ratio = round(real_revenue_increase/pp_real_revenue_by_hosp*100,2),
           real_volume_increase_ratio = round(real_volume_increase/pp_real_volume_by_hosp*100,2),
           target_revenue_realization_by_hosp = round(real_revenue_by_hosp/target_revenue_by_hosp*100,2),
           target_volume_realization_by_hosp = round(real_volume_by_hosp/target_volume_by_hosp*100,2)) %>%
    select(hospital,
           pp_real_revenue_by_hosp,
           real_revenue_by_hosp,
           real_revenue_increase,
           real_revenue_increase_ratio,
           target_revenue_realization_by_hosp,
           pp_real_volume_by_hosp,
           real_volume_by_hosp,
           real_volume_increase,
           real_volume_increase_ratio,
           target_volume_realization_by_hosp)
  
  
  
  colnames(report7_mod1) <- c("医院",
                              "上期销售额",
                              "当期销售额",
                              "销售额增长",
                              "销售额增长率",
                              "销售额达成率",
                              "上期销售量",
                              "当期销售量",
                              "销售量增长",
                              "销售量增长率",
                              "销售量达成率")
  
  rownames(report7_mod1) <- report7_mod1$医院
  report7_mod1 <- report7_mod1 %>%
    select(-`医院`)
  
  report7_mod2 <- tmp %>%
    select(sales_rep,
           real_revenue_by_sr,
           pp_real_revenue_by_sr,
           real_volume_by_sr,
           pp_real_volume_by_sr,
           target_revenue_by_sr,
           target_volume_by_sr) %>%
    distinct() %>%
    mutate(sr_revenue_increase=real_revenue_by_sr-pp_real_revenue_by_sr,
           sr_volume_increase=real_volume_by_sr-pp_real_volume_by_sr) %>%
    do(plyr::rbind.fill(.,data.frame(sales_rep="总体",
                                     real_revenue_by_sr=sum(.$real_revenue_by_sr),
                                     pp_real_revenue_by_sr =sum(.$pp_real_revenue_by_sr),
                                     sr_revenue_increase=sum(.$sr_revenue_increase),
                                     real_volume_by_sr=sum(.$real_volume_by_sr),
                                     pp_real_volume_by_sr=sum(.$pp_real_volume_by_sr),
                                     sr_volume_increase=sum(.$sr_volume_increase),
                                     target_revenue_by_sr=sum(.$target_revenue_by_sr),
                                     target_volume_by_sr=sum(.$target_volume_by_sr)))) %>%
    mutate(sr_revenue_increase_ratio = round(sr_revenue_increase/pp_real_revenue_by_sr*100,2),
           sr_volume_increase_ratio = round(sr_volume_increase/pp_real_volume_by_sr*100,2),
           sr_target_revenue_realization = round(real_revenue_by_sr/target_revenue_by_sr*100,2),
           sr_target_volume_realization = round(real_volume_by_sr/target_volume_by_sr*100,2)) %>%
    select(sales_rep,
           pp_real_revenue_by_sr,
           real_revenue_by_sr,
           sr_revenue_increase,
           sr_revenue_increase_ratio,
           sr_target_revenue_realization,
           pp_real_volume_by_sr,
           real_volume_by_sr,
           sr_volume_increase,
           sr_volume_increase_ratio,
           sr_target_volume_realization)
  
  
  
  colnames(report7_mod2) <- c("销售代表",
                              "上期销售额",
                              "当期销售额",
                              "销售额增长",
                              "销售额增长率",
                              "销售额达成率",
                              "上期销售量",
                              "当期销售量",
                              "销售量增长",
                              "销售量增长率",
                              "销售量达成率")
  
  rownames(report7_mod2) <- report7_mod2$销售代表
  report7_mod2 <- report7_mod2 %>%
    select(-`销售代表`)
  
  
  report7_mod3 <- tmp %>%
    select(product,
           real_revenue,
           pp_real_revenue,
           real_volume,
           pp_real_volume,
           target_revenue,
           sales_target) %>%
    group_by(product) %>%
    dplyr::summarise(real_revenue_by_product = round(sum(real_revenue)),
                     pp_real_revenue_by_product = round(sum(pp_real_revenue)),
                     real_revenue_increase = round(real_revenue_by_product - pp_real_revenue_by_product),
                     real_volume_by_product = round(sum(real_volume)),
                     pp_real_volume_by_product = round(sum(pp_real_volume)),
                     real_volume_increase = round(real_volume_by_product - pp_real_volume_by_product),
                     target_revenue_by_product = round(sum(target_revenue.na.rm=T)),
                     target_volume_by_product = round(sum(sales_target,na.rm=T))) %>%
    do(plyr::rbind.fill(.,data.frame(product="总体",
                                     real_revenue_by_product=round(sum(.$real_revenue_by_product)),
                                     pp_real_revenue_by_product=round(sum(.$pp_real_revenue_by_product)),
                                     real_revenue_increase=sum(.$real_revenue_increase),
                                     real_volume_by_product=round(sum(.$real_volume_by_product)),
                                     pp_real_volume_by_product=round(sum(.$pp_real_volume_by_product)),
                                     real_volume_increase=round(sum(.$real_volume_increase)),
                                     target_revenue_by_product=round(sum(.$target_revenue_by_product)),
                                     target_volume_by_product=round(sum(.$target_volume_by_product))))) %>%
    mutate(real_revenue_increase_ratio = round(real_revenue_increase/pp_real_revenue_by_product*100,2),
           real_volume_increase_ratio = round(real_volume_increase/pp_real_volume_by_product*100,2),
           target_revenue_realization_by_product = round(real_revenue_by_product/target_revenue_by_product*100,2),
           target_volume_realization_by_product = round(real_volume_by_product/target_volume_by_product*100,2)) %>%
    select(product,
           pp_real_revenue_by_product,
           real_revenue_by_product,
           real_revenue_increase,
           real_revenue_increase_ratio,
           target_revenue_realization_by_product,
           pp_real_volume_by_product,
           real_volume_by_product,
           real_volume_increase,
           real_volume_increase_ratio,
           target_volume_realization_by_product)
  
  
  
  colnames(report7_mod3) <- c("产品",
                              "上期销售额",
                              "当期销售额",
                              "销售额增长",
                              "销售额增长率",
                              "销售额达成率",
                              "上期销售量",
                              "当期销售量",
                              "销售量增长",
                              "销售量增长率",
                              "销售量达成率")
  rownames(report7_mod3) <- report7_mod3$产品
  report7_mod3 <- report7_mod3 %>%
    select(-`产品`)
  
  
  
  ## report a
  report8_mod1 <- tmp %>%
    select(phase,
           sales_rep,
           hospital,
           incentive_factor,
           product_knowledge_index,
           sales_skills_index,
           customer_relationship_index,
           motivation_index,
           real_revenue,
           offer_attractiveness,
           acc_offer_attractiveness) %>%
    distinct() %>%
    mutate(total_revenue = round(sum(real_revenue),2),
           total_offer_attractiveness = round(sum(offer_attractiveness),2),
           total_acc_offer_attractiveness = round(sum(acc_offer_attractiveness),2),
           average_customer_relationship_index = round(mean(customer_relationship_index),2),
           average_sales_skills_index = round(mean(sales_skills_index),2),
           average_product_knowledge_index = round(mean(product_knowledge_index),2),
           average_motivation_index = round(mean(motivation_index),2),
           team_capability = average_motivation_index +
             average_product_knowledge_index +
             average_sales_skills_index) %>%
    select(phase,
           total_revenue,
           total_offer_attractiveness,
           total_acc_offer_attractiveness,
           average_customer_relationship_index,
           team_capability) %>%
    dplyr::mutate(profit=as.numeric(report5_mod3[5,1]),
                  inter1=sapply(total_revenue,function(x)(weightage$success_value)$total_sales*curve(curve50,x)),
                  inter2=sapply(profit,function(x)(weightage$success_value)$contribution_margin*curve(curve49,x)),
                  inter3=sapply(average_customer_relationship_index,function(x)(weightage$success_value)$average_customer_relationship*curve(curve45,x)),
                  inter4=sapply(team_capability,function(x)(weightage$success_value)$team_capability*curve(curve46,x)),
                  success_value = round(inter1+inter2+inter3+inter4)) %>%
    select(phase,
           total_revenue,
           profit,
           average_customer_relationship_index,
           team_capability,
           total_offer_attractiveness,
           total_acc_offer_attractiveness,
           success_value) %>%
    distinct()
  
  colnames(report8_mod1) <- c("phase",
                              "总销售(元)",
                              "总利润(元)",
                              "客户关系的平均水平(指数)",
                              "团队能力(指数)",
                              "商业价值(指数)",
                              "累计商业价值(指数)",
                              "得分") 
  report8_mod1_tmp <- null_report
  
  report8_mod1_tmp[which(report8_mod1_tmp$phase==report8_mod1$phase),2:8] <- report8_mod1[1,2:8]
  
  report8_mod1 <- report8_mod1_tmp
  
  
  report8_mod2 <- tmp %>%
    select(hospital,product,real_revenue) %>%
    group_by(hospital) %>%
    dplyr::summarise(hospital_revenue = round(sum(real_revenue))) %>%
    ungroup() %>%
    mutate(market_revenue=round(sum(hospital_revenue)),
           market_share=round(hospital_revenue/market_revenue*100,2)) %>%
    select(hospital,
           hospital_revenue,
           market_share) %>%
    distinct()
  
  colnames(report8_mod2) <- c("医院",
                              "总销售(元)",
                              "总市场的市场份额(%)")
  rownames(report8_mod2) <- report8_mod2$医院
  report8_mod2 <- report8_mod2 %>% select(-`医院`)
  
  
  
  
  
  
  out<-list("report1_mod2"=report1_mod2,
            "report1_mod3"=report1_mod3,
            "report1_mod4"=report1_mod4,
            "report1_mod5"=report1_mod5,
            "report1_mod6"=report1_mod6,
            "report2_mod1"=report2_mod1,
            "report2_mod2"=report2_mod2,
            "report3_mod1"=report3_mod1,
            "report4_mod3"=report4_mod3,
            "report5_mod1"=report5_mod1,
            "report5_mod3"=report5_mod3,
            "report6_mod1"=report6_mod1,
            "report7_mod1"=report7_mod1,
            "report7_mod2"=report7_mod2,
            "report7_mod3"=report7_mod3,
            "report8_mod1"=report8_mod1,
            "report8_mod2"=report8_mod2
            
  )
  
  out
  
}







