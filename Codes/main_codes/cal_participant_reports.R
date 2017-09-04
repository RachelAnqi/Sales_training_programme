##participant report


## staff report 1

report_data <- function(tmp,flm_data) {
staff_report <- tmp %>%
  select(sales_rep,
         incentive_factor,
         product_training,
         sales_training,
         meetings_with_team,
         field_work,
         sr_time,
         sr_time_total,
         product_knowledge_index,
         pp_experience_index,
         experience_index,
         sr_revenue,
         acc_revenue,
         pp_sales_skills_index,
         sales_skills_index) %>%
  distinct() %>%
  mutate(work_time=worktime,
         basic_salary=basicSalary,
         total_salary=basic_salary*incentive_factor+basicSalary)

report1_mod1 <- staff_report %>%
  select(sales_rep,
         total_salary) %>%
  spread(sales_rep,total_salary) %>%
  mutate(rowname="总薪酬(元)")

#row.names(report1_mod1) <- "总薪酬(元)"

report1_mod2 <- staff_report %>%
  select(work_time,
         sr_time_total,
         sales_rep,
         product_training,
         sales_training,
         meetings_with_team) %>%
  gather(variable,value,-sales_rep) %>%
  spread(sales_rep,value) %>% 
  mutate(rowname=paste(c("团队会议",
                         "产品培训",
                         "销售培训",
                         "医院拜访",
                         "总工作时间"),"(天)",sep=""))

# rownames(report1_mod2) <- paste(c("团队会议",
#                             "产品培训",
#                             "销售培训",
#                             "医院拜访",
#                             "总工作时间"),"(天)",sep="")
# 
# report1_mod2 <- report1_mod2 %>% select(-variable)

report1_mod3 <- staff_report %>%
  select(sales_rep,
         product_knowledge_index,
         product_training) %>%
  gather(variable,value,-sales_rep) %>%
  spread(sales_rep,value) %>%
  mutate(rowname=c("产品培训(天)",
                   "产品知识(指数)"))

# rownames(report1_mod3) <- c("产品培训(天)",
#                             "产品知识(指数)")
# 
# report1_mod3 <- report1_mod3 %>% select(-variable)

report1_mod4 <- staff_report %>%
  select(experience_index,
         acc_revenue,
         sr_revenue,
         pp_experience_index,
         sales_rep) %>%
  gather(variable,value,-sales_rep) %>%
  spread(sales_rep,value)

# rownames(report1_mod4) <- c("累计总销售(元)",
#                             "当期经验",
#                             "前期经验",
#                             "当期销售(元)")
# 
# report1_mod4 <- report1_mod4 %>% select(-variable)

report1_mod5 <- staff_report %>%
  select(sales_rep,
         pp_sales_skills_index,
         sales_skills_index,
         field_work) %>%
  gather(variable,value,-sales_rep) %>%
  spread(sales_rep,value)

# rownames(report1_mod4) <- c("经理医院随访(天)",
#                             "前期销售技巧(指数)",
#                             "当期销售技巧(指数)")



## flm report
flm_report <- staff_report %>%
  mutate(all_sr_salary=sum(total_salary,na.rm=T)) %>%
  select(all_sr_salary) %>%
  distinct()

flm_report <- flm_data %>%
  mutate(all_sr_salary = flm_report$all_sr_salary,
         work_time=worktime)

report2_mod1 <- flm_report%>%
  select(all_sr_salary)
 
# rownames(report2_mod1) <-"总薪酬" 

report2_mod2 <- flm_report %>%
  select(-all_sr_salary) %>%
  gather(variable,value)

# rownames(report2_mod2) <-c("销售培训(天)",
#                            "经理随访(天)",
#                            "团队会议(天)",
#                            "KPI分析(天)",
#                            "战略和周期计划(天)",
#                            "行政工作(天)",
#                            "总工作时间(天)")

report2_mod2 <- report2_mod2%>% select(-variable)



## brief time allocation of hospital report
hospital_report <- tmp %>%
  select(hospital,
         product,
         sales_rep,
         sr_time) %>%
  distinct() %>%
  #mutate(total_time_peraccount = sum(sr_time,na.rm=T)) %>%
  spread(product,sr_time)



## evaluation of decision report
eva_decision_report <- tmp %>%
  select(hospital,
         product,
         sales_rep,
         contact_priority_fit_doc,
         contact_priority_fit_diet,
         contact_priority_fit_admin,
         contact_priority_fit_nurs,
         time_on_doc,
         time_on_diet,
         time_on_admin,
         time_on_nurs,
         strategy_and_cycle_planning,
         kpi_analysis,
         meetings_with_team,
         admin_work,
         contact_priority_fit_index,
         deployment_quality_index,
         pp_deployment_quality_index) %>%
  group_by(hospital) %>%
  mutate(total_deployment_quality_index= sum(deployment_quality_index),
         total_pp_deployment_quality_index=sum(pp_deployment_quality_index)) %>%
  ungroup() %>%
  select(-product) %>%
  distinct()

report4_mod1 <- eva_decision_report %>%
  select(hospital,
         sales_rep) 

report4_mod2 <- eva_decision_report %>%
  select(hospital,
         contact_priority_fit_doc,
         contact_priority_fit_diet,
         contact_priority_fit_admin,
         contact_priority_fit_nurs,
         total_deployment_quality_index) %>%
  distinct()

report4_mod3 <- eva_decision_report %>%
  select(hospital,
         total_deployment_quality_index,
         total_pp_deployment_quality_index,
         contact_priority_fit_index,
         strategy_and_cycle_planning,
         kpi_analysis,
         meetings_with_team,
         admin_work) %>%
  distinct()

## report a
offer_attractiveness_report <- tmp %>%
  group_by(hospital) %>%
  mutate(hospital_revenue = sum(real_sales),
         hospital_offer_attractiveness = sum(offer_attractiveness),
         hospital_acc_offer_attractiveness =sum(acc_offer_attractiveness),
         hospital_profit = hospital_revenue-promotional_budget)%>%
  ungroup() %>%
  mutate(hospital_profit = hospital_revenue-promotional_budget) %>%
  select(sales_rep,
         hospital,
         incentive_factor,
         product_knowledge_index,
         sales_skills_index,
         customer_relationship_index,
         motivation_index,
         sr_revenue,
         hospital_revenue,
         hospital_profit,
         hospital_offer_attractiveness,
         hospital_acc_offer_attractiveness) %>%
  distinct() %>%
  mutate(total_revenue =sum(hospital_revenue),
         total_profit = sum(hospital_profit),
         total_offer_attractiveness = sum(hospital_offer_attractiveness),
         total_acc_offer_attractiveness = sum(hospital_acc_offer_attractiveness),
         average_customer_relationship_index = mean(customer_relationship_index),
         average_sales_skills_index = mean(sales_skills_index),
         average_product_knowledge_index = mean(product_knowledge_index),
         average_motivation_index = mean(motivation_index))

market_report <- tmp %>%
  select(hospital,product,real_sales) %>%
  group_by(hospital) %>%
  dplyr::summarise(hospital_revenue = sum(real_sales)) %>%
  ungroup() %>%
  mutate(market_revenue=sum(hospital_revenue),
         market_share=round(hospital_revenue/market_revenue*100),2)
  
## report b
hospital_sales_report <- tmp %>%
  select(hospital,product,real_sales,pp_real_sales) %>%
  group_by(hospital) %>%
  dplyr::summarise(hospital_revenue = sum(real_sales),
                   pp_hospital_revenue = sum(pp_real_sales)) %>%
  ungroup()%>%
  mutate(increase = hospital_revenue - pp_hospital_revenue,
         increase_ratio = round(increase/pp_hospital_revenue*100,2))

  
sr_sales_report <- tmp %>%
  select(hospital,product,sales_rep,real_sales,pp_real_sales) %>%
  group_by(sales_rep) %>%
  dplyr::summarise(sales_rep_revenue = sum(real_sales),
                   pp_sales_rep_revenue = sum(pp_real_sales)) %>%
  ungroup()%>%
  mutate(increase = sales_rep_revenue - pp_sales_rep_revenue,
         increase_ratio = round(increase/pp_sales_rep_revenue*100,2))  


## report c
product_report_peraccount <- tmp %>%
  mutate(promotional_budget_perproduct = 
           promotional_budget/4) %>%
  group_by(hospital,product) %>%
  mutate(profit = real_sales-promotional_budget_perproduct,
         profit_ratio = profit/real_sales)

## report d
product_report <- tmp %>%
  mutate(promotional_budget_perproduct = 
           promotional_budget/4) %>%
  group_by(hospital,product) %>%
  mutate(profit = real_sales-promotional_budget_perproduct) %>%
  ungroup() %>%
  select(product,
         hospital,
         real_sales,
         profit) %>%
  distinct() %>%
  group_by(product) %>%
  dplyr::summarise(real_sales =sum(real_sales),
                   profit = sum(profit))

out<-list("staff_report"=staff_report,
          "flm_report"=flm_report,
          "hospital_report"=hospital_report,
          "eva_decision_report"=eva_decision_report,
          "offer_attractiveness_report"=offer_attractiveness_report,
          "market_report"=market_report,
          "hospital_sales_report"=hospital_sales_report,
          "sr_sales_report"=sr_sales_report,
          "product_report_peraccount"=product_report_peraccount,
          "product_report"=product_report,
          "report1_mod1"=report1_mod1,
          "report1_mod2"=report1_mod2,
          "report1_mod3"=report1_mod3,
          "report1_mod4"=report1_mod4,
          "report1_mod5"=report1_mod5,
          "report2_mod1"=report2_mod1,
          "report2_mod2"=report2_mod2,
          "report4_mod1"=report4_mod1,
          "report4_mod2"=report4_mod2,
          "report4_mod3"=report4_mod3)

out
  
}
  


  
