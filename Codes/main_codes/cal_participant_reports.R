##participant report


## staff report 1

report_data <- function(tmp,flm_data) {
tmp$ith_hospital <- as.numeric(substr(tmp$hospital,9,10))
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
         total_salary=round(basic_salary*incentive_factor+basicSalary),2)

report1_mod1 <- staff_report %>%
  select(sales_rep,
         total_salary) %>%
  spread(sales_rep,total_salary) 

rownames(report1_mod1) <- "总薪酬(元)"
# %>%
#   mutate(rowname="总薪酬(元)")


report1_mod2 <- staff_report %>%
  select(work_time,
         sr_time_total,
         sales_rep,
         product_training,
         sales_training,
         meetings_with_team) 

colnames(report1_mod2) <- c("总工作时间(天)",
                            "医院拜访(天)",
                            "销售代表",
                            "产品培训(天)",
                            "销售培训(天)",
                            "团队会议(天)")

report1_mod2 <- report1_mod2 %>%
  gather(variable,value,-`销售代表`) %>%
  spread(`销售代表`,value) 

rownames(report1_mod2) <- report1_mod2$variable
report1_mod2 <- report1_mod2 %>%select(-variable)


report1_mod3 <- staff_report %>%
  select(sales_rep,
         product_knowledge_index,
         product_training) 

colnames(report1_mod3) <- c("销售代表",
                            "产品知识(指数)",
                            "产品培训(天)")

report1_mod3 <- report1_mod3 %>%
  gather(variable,value,-`销售代表`) %>%
  spread(`销售代表`,value)

rownames(report1_mod3) <- report1_mod3$variable
report1_mod3 <- report1_mod3 %>% select(-variable)

report1_mod4 <- staff_report %>%
  select(experience_index,
         acc_revenue,
         sr_revenue,
         pp_experience_index,
         sales_rep) 
colnames(report1_mod4) <- c("当期经验",
                            "累计总销售(元)",
                            "当期销售(元)",
                            "前期经验",
                            "销售代表")
report1_mod4 <- report1_mod4 %>%
  gather(variable,value,-`销售代表`) %>%
  spread(`销售代表`,value)

rownames(report1_mod4) <- report1_mod4$variable
report1_mod4 <- report1_mod4 %>% select(-variable)



report1_mod5 <- staff_report %>%
  select(sales_rep,
         pp_sales_skills_index,
         sales_skills_index,
         field_work)
colnames(report1_mod5) <- c("销售代表",
                            "前期销售技巧(指数)",
                            "当期销售技巧(指数)",
                            "经理医院随访(天)")
report1_mod5 <- report1_mod5 %>%
  gather(variable,value,-`销售代表`) %>%
  spread(`销售代表`,value)

rownames(report1_mod5) <- report1_mod5$variable
report1_mod5 <- report1_mod5 %>% select(-variable)



## flm report
flm_report <- staff_report %>%
  mutate(all_sr_salary=sum(total_salary,na.rm=T)) %>%
  select(all_sr_salary) %>%
  distinct()

flm_report <- flm_data %>%
  mutate(all_sr_salary = flm_report$all_sr_salary,
         work_time=worktime)

report2_mod1 <- flm_report%>%
  select(all_sr_salary) %>%
  mutate(variable="总薪酬(元)")
rownames(report2_mod1) <- report2_mod1$variable
colnames(report2_mod1)[1] <- "value" 
report2_mod1 <- report2_mod1 %>%
  select(-variable)

report2_mod2 <- flm_report %>%
  select(-all_sr_salary) 

colnames(report2_mod2) <- c("销售培训(天)",
                           "经理随访(天)",
                           "团队会议(天)",
                           "KPI分析(天)",
                           "战略和周期计划(天)",
                           "行政工作(天)",
                           "总工作时间(天)")
report2_mod2 <- report2_mod2 %>%
  gather(variable,value)

rownames(report2_mod2) <- report2_mod2$variable
report2_mod2 <- report2_mod2 %>% select(-variable)


## brief time allocation of hospital report
hospital_report <- tmp %>%
  select(ith_hospital,
         hospital,
         product,
         sales_rep,
         sr_time) %>%
  distinct() 

colnames(hospital_report) <- c("ith_hospital",
                               "医院",
                               "产品",
                               "销售代表",
                               "时间分配(天)") 

hospital_report <- hospital_report %>%
  spread(`产品`,`时间分配(天)`) %>%
  arrange(ith_hospital)

rownames(hospital_report) <- hospital_report$医院

hospital_report <- hospital_report %>%
  select(-ith_hospital,-`医院`)


## evaluation of decision report
eva_decision_report <- tmp %>%
  select(ith_hospital,
         hospital,
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
  mutate(total_deployment_quality_index= round(sum(deployment_quality_index),2),
         total_pp_deployment_quality_index=round(sum(pp_deployment_quality_index),2)) %>%
  ungroup() %>%
  select(-product) %>%
  distinct() %>%
  arrange(ith_hospital)

report4_mod1 <- eva_decision_report %>%
  select(hospital,
         sales_rep) 

colnames(report4_mod1) <- c("医院",
                            "销售代表")
rownames(report4_mod1) <- report4_mod1$医院
report4_mod1 <- report4_mod1 %>% select(-`医院`)

report4_mod2 <- eva_decision_report %>%
  select(hospital,
         contact_priority_fit_doc,
         contact_priority_fit_diet,
         contact_priority_fit_admin,
         contact_priority_fit_nurs,
         total_deployment_quality_index) %>%
  distinct()

colnames(report4_mod2) <- c("医院",
                            "医生时间分配",
                            "营养师时间分配",
                            "行政时间分配",
                            "护士时间分配",
                            "总分级匹配度")
rownames(report4_mod2) <- report4_mod2$医院
report4_mod2 <- report4_mod2 %>% select(`医院`)

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

colnames(report4_mod3) <- c("医院",
                            "当期决策质量(指数)",
                            "上期决策质量(指数)",
                            "总分级匹配度",
                            "战略和周期计划(天)",
                            "KPI分析(天)",
                            "团队会议(天)",
                            "行政工作(天)")
rownames(report4_mod3) <- report4_mod3$医院
report4_mod3 <- report4_mod3 %>% select(-`医院`)

## report a
offer_attractiveness_report <- tmp %>%
  arrange(ith_hospital) %>%
  group_by(hospital) %>%
  mutate(hospital_revenue = round(sum(real_sales),2),
         hospital_offer_attractiveness = round(sum(offer_attractiveness),2),
         hospital_acc_offer_attractiveness =round(sum(acc_offer_attractiveness),2),
         hospital_profit = round(hospital_revenue-promotional_budget,2))%>%
  ungroup() %>%
  mutate(hospital_profit = round(hospital_revenue-promotional_budget,2)) %>%
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
  mutate(total_revenue = round(sum(hospital_revenue),2),
         total_profit = round(sum(hospital_profit),2),
         total_offer_attractiveness = round(sum(hospital_offer_attractiveness),2),
         total_acc_offer_attractiveness = round(sum(hospital_acc_offer_attractiveness),2),
         average_customer_relationship_index = round(mean(customer_relationship_index),2),
         average_sales_skills_index = round(mean(sales_skills_index),2),
         average_product_knowledge_index = round(mean(product_knowledge_index),2),
         average_motivation_index = round(mean(motivation_index),2))
  

report5_mod1 <- offer_attractiveness_report %>%
  select(total_revenue,
         total_profit,
         average_customer_relationship_index,
         average_sales_skills_index,
         average_product_knowledge_index,
         average_motivation_index,
         total_offer_attractiveness,
         total_acc_offer_attractiveness) %>%
  distinct()

colnames(report5_mod1) <- c("总销售(元)",
                             "总利润(元)",
                             "客户关系的平均水平(指数)",
                             "平均销售技巧水平(指数)",
                             "平均产品知识水平(指数)",
                             "平均动力值(指数)",
                             "商业价值(指数)",
                             "累计商业价值(指数)") 
report5_mod1 <- report5_mod1 %>% gather(variable,value)
rownames(report5_mod1) <- report5_mod1$variable
report5_mod1 <- report5_mod1 %>% select(-variable)

report5_mod2 <- tmp %>%
  arrange(ith_hospital) %>%
  select(hospital,product,real_sales) %>%
  group_by(hospital) %>%
  dplyr::summarise(hospital_revenue = round(sum(real_sales),2)) %>%
  ungroup() %>%
  mutate(market_revenue=round(sum(hospital_revenue),2),
         market_share=round(hospital_revenue/market_revenue*100,2)) %>%
  select(hospital,
         hospital_revenue,
         market_share) %>%
  distinct()

colnames(report5_mod2) <- c("医院",
                            "总销售(元)",
                            "总市场的市场份额(%)")
rownames(report5_mod2) <- report5_mod2$医院
report5_mod2 <- report5_mod2 %>% select(-`医院`)
  
## report b
hospital_sales_report <- tmp %>%
  select(hospital,product,real_sales,pp_real_sales) %>%
  group_by(hospital) %>%
  dplyr::summarise(hospital_revenue = round(sum(real_sales),2),
                   pp_hospital_revenue = round(sum(pp_real_sales),2)) %>%
  ungroup()%>%
  mutate(increase = hospital_revenue - pp_hospital_revenue,
         increase_ratio = round(increase/pp_hospital_revenue*100,2))

  
sr_sales_report <- tmp %>%
  select(hospital,product,sales_rep,real_sales,pp_real_sales) %>%
  group_by(sales_rep) %>%
  dplyr::summarise(sales_rep_revenue = round(sum(real_sales),2),
                   pp_sales_rep_revenue = round(sum(pp_real_sales),2)) %>%
  ungroup()%>%
  mutate(increase = sales_rep_revenue - pp_sales_rep_revenue,
         increase_ratio = round(increase/pp_sales_rep_revenue*100,2))  


## report c
product_report_peraccount <- tmp %>%
  mutate(promotional_budget_perproduct = 
           promotional_budget/4) %>%
  group_by(hospital,product) %>%
  mutate(profit = round(real_sales-promotional_budget_perproduct,2),
         profit_ratio = round(profit/real_sales,2))

## report d
product_report <- tmp %>%
  mutate(promotional_budget_perproduct = 
           promotional_budget/4) %>%
  group_by(hospital,product) %>%
  mutate(profit = round(real_sales-promotional_budget_perproduct,2)) %>%
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
          "report5_mod1"=report5_mod1,
          "report5_mod2"=report5_mod2,
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
  


  
