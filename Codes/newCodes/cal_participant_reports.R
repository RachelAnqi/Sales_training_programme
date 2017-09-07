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
         sr_acc_revenue,
         pp_sales_skills_index,
         sales_skills_index,
         overhead_time) %>%
  distinct() %>%
  mutate(basic_salary=basicSalary,
         incentive_salary= round(basic_salary*incentive_factor/100,2),
         total_salary=round(incentive_salary+basicSalary,2),
         visit_time=sr_time_total-overhead_time,
         total_time=overhead_time+
           product_training+
           sales_training+
           meetings_with_team+
           visit_time)

report1_mod1 <- staff_report %>%
  select(sales_rep,
         basic_salary,
         incentive_salary,
         total_salary) %>%
  distinct()
  

colnames(report1_mod1) <- c("销售代表",
                            "基本工资(元)",
                            "奖金(元)",
                            "总薪酬(元)")

report1_mod1 <- report1_mod1 %>%
  gather(variable,value,-`销售代表`) %>%
  spread(`销售代表`,value) 

rownames(report1_mod1) <- report1_mod1$variable
report1_mod1 <- report1_mod1 %>% select(-variable)

report1_mod2 <- staff_report %>%
  select(overhead_time,
         product_training,
         sales_training,
         meetings_with_team,
         visit_time,
         total_time,
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
  gather(variable,value,-`销售代表`) %>%
  spread(`销售代表`,value) 

rownames(report1_mod2) <- report1_mod2$variable
report1_mod2 <- report1_mod2 %>%select(-variable)




report1_mod3 <- staff_report %>%
  select(sales_rep,
         product_knowledge_index,
         product_training) %>%
  distinct()

colnames(report1_mod3) <- c("销售代表",
                            "产品知识(指数)",
                            "产品培训(天)")

report1_mod3 <- report1_mod3 %>%
  gather(variable,value,-`销售代表`) %>%
  spread(`销售代表`,value)

rownames(report1_mod3) <- report1_mod3$variable
report1_mod3 <- report1_mod3 %>% select(-variable)

report1_mod4 <- staff_report %>%
  select(pp_experience_index,
         sr_revenue,
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
  gather(variable,value,-`销售代表`) %>%
  spread(`销售代表`,value)

rownames(report1_mod4) <- report1_mod4$variable
report1_mod4 <- report1_mod4 %>% select(-variable)



report1_mod5 <- staff_report %>%
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
         work_time=flm_sales_training+
           flm_field_work+
           flm_meetings_with_team+
           flm_kpi_analysis+
           flm_strategy_planning+
           flm_admin_work)

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
report3_mod1 <- tmp %>%
  select(no.hospitals,
         hospital,
         product,
         sales_rep,
         sr_time,
         overhead_time) %>%
  distinct() %>%
  mutate(real_time = 
           round(sr_time-overhead_time/no.hospitals,2)) %>%
  select(-no.hospitals,-overhead_time)

colnames(report3_mod1) <- c("医院",
                               "产品",
                               "销售代表",
                               "计划时间分配(天)",
                               "实际时间分配(天)") 




## evaluation of decision report
eva_decision_report <- tmp %>%
  select(hospital,
         product,
         sales_rep,
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
  distinct() 

report4_mod1 <- eva_decision_report %>%
  select(hospital,
         sales_rep) %>%
  distinct()

colnames(report4_mod1) <- c("医院",
                            "销售代表")
rownames(report4_mod1) <- report4_mod1$医院
report4_mod1 <- report4_mod1 %>% select(-`医院`)

report4_mod2 <- eva_decision_report %>%
  select(hospital,
         time_on_doc,
         time_on_diet,
         time_on_admin,
         time_on_nurs,
         contact_priority_fit_index) %>%
  distinct()

colnames(report4_mod2) <- c("医院",
                            "A级客户时间分配",
                            "B级客户时间分配",
                            "C级客户时间分配",
                            "D级客户时间分配",
                            "总分级匹配度")
rownames(report4_mod2) <- report4_mod2$医院
report4_mod2 <- report4_mod2 %>% select(-`医院`)

report4_mod3 <- eva_decision_report %>%
  select(hospital,
         total_pp_deployment_quality_index,
         strategy_and_cycle_planning,
         kpi_analysis,
         meetings_with_team,
         admin_work,
         contact_priority_fit_index,
         total_deployment_quality_index) %>%
  distinct()

colnames(report4_mod3) <- c("医院",
                            "上期决策质量(指数)",
                            "战略和周期计划(天)",
                            "KPI分析(天)",
                            "团队会议(天)",
                            "行政工作(天)",
                            "总分级匹配度",
                            "当期决策质量(指数)")
                            
rownames(report4_mod3) <- report4_mod3$医院
report4_mod3 <- report4_mod3 %>% select(-`医院`)

## report d
report5_mod1 <- tmp %>%
  select(hospital,
         product,
         real_revenue,
         real_volume) %>%
  group_by(product) %>%
  mutate(production_cost = sapply(product,function(x)production_price[which(production_price$product==x),]$cost),
         real_revenue_by_product = sum(real_revenue),
         production_fee = real_revenue_by_product*production_cost,
         profit1 = real_revenue_by_product - production_fee,
         production_fee_percent = round(production_fee/real_revenue_by_product*100,2),
         profit1_percent = round(profit1/real_revenue_by_product*100,2)) %>%
  ungroup() %>%
  select(-hospital,
         -real_revenue,
         -real_volume,
         -production_cost) %>%
  distinct() 
colnames(report5_mod1) <- c("产品",
                            "销售金额(元)",
                            "生产成本(元)",
                            "利润贡献I(元)",
                            "生产成本(%)",
                            "利润贡献I(%)")
report5_mod1 <- report5_mod1 %>%
  gather(variable,value,-`产品`) %>%
  spread(`产品`,value)

report5_rank1 <- data.frame(
  variable= c("销售金额(元)",
              "生产成本(元)",
              "生产成本(%)",
              "利润贡献I(元)",
              "利润贡献I(%)"),
  rank=1:length(report5_mod1$variable),
  stringsAsFactors = F
)

report5_mod1 <- report5_mod1 %>%
  left_join(report5_rank1,by="variable") %>%
  distinct() %>%
  arrange(rank) %>%
  select(-rank)

rownames(report5_mod1) <- report5_mod1$variable

report5_mod1 <- report5_mod1 %>% select(-variable)  

report5_mod2 <- tmp %>%
  select(hospital,
         product,
         real_revenue,
         real_volume) %>%
  group_by(product) %>%
  mutate(production_cost = sapply(product,function(x)production_price[which(production_price$product==x),]$cost),
         real_revenue_by_product = sum(real_revenue),
         real_revenue_by_product_per = real_revenue_by_product/real_volume,
         production_fee_per = real_revenue_by_product_per*production_cost,
         profit1 = real_revenue_by_product_per - production_fee_per,
         production_fee_percent = round(production_fee_per/real_revenue_by_product_per*100,2),
         profit1_percent = round(profit1/real_revenue_by_product_per*100,2)) %>%
  ungroup() %>%
  select(-hospital,
         -real_revenue,
         -real_volume,
         -production_cost,
         -real_revenue_by_product) %>%
  distinct() 
colnames(report5_mod2) <- c("产品",
                            "销售金额(元)",
                            "生产成本(元)",
                            "利润贡献I(元)",
                            "生产成本(%)",
                            "利润贡献I(%)")
report5_mod2 <- report5_mod2 %>%
  gather(variable,value,-`产品`) %>%
  spread(`产品`,value)

report5_mod2 <- report5_mod2 %>%
  left_join(report5_rank1,by="variable") %>%
  distinct() %>%
  arrange(rank) %>%
  select(-rank)

rownames(report5_mod2) <- report5_mod2$variable

report5_mod2 <- report5_mod2 %>% select(-variable)  

report5_mod3 <- tmp %>%
  select(hospital,
         product,
         real_revenue,
         real_volume,
         promotional_budget,
         discount) %>%
  mutate(production_cost = sapply(product,function(x)production_price[which(production_price$product==x),]$cost),
         production_fee = production_cost*real_revenue,
         discount_fee = discount/100*real_revenue) %>%
  group_by(hospital) %>%
  mutate(real_revenue_by_hosp = sum(real_revenue),
         total_production_fee_by_hosp =sum(production_fee),
         discount_fee_by_hosp = sum(discount_fee)) %>%
  ungroup() %>%
  select(hospital,
         total_production_fee_by_hosp,
         real_revenue_by_hosp,
         discount_fee,
         promotional_budget) %>%
  distinct() %>%
  mutate(total_revenue =round(sum(real_revenue_by_hosp),2),
         total_production_fee =round(sum(total_production_fee_by_hosp),2),
         total_discount_fee = round(sum(discount_fee),2),
         total_promotional_budget = round(sum(promotional_budget),2),
         total_changeable_fee = total_discount_fee+total_promotional_budget,
         total_salary=round(report2_mod1$value,2),
         total_admin_fee=round(total_revenue*admin_fee_weight,2)) %>%
  select(-hospital,
         -total_discount_fee,
         -total_promotional_budget,
         -total_production_fee_by_hosp,
         -real_revenue_by_hosp,
         -discount_fee,
         -promotional_budget) %>%
  distinct() %>%
  mutate(profit1=total_revenue-total_production_fee,
         profit2=profit1-total_changeable_fee,
         profit3=profit2-total_salary-total_admin_fee)

report5_rank3 <- data.frame(
  variable=c("销售额",
              "生产成本",
              "利润贡献I",
              "其他可变成本",
              "利润贡献II",
              "员工薪酬",
              "总体行政花销",
              "利润贡献III"),
  rank = 1:8,
  stringsAsFactors = F
)



report5_mod3_1 <- report5_mod3 
colnames(report5_mod3_1) <- c("销售额",
                              "生产成本",
                              "其他可变成本",
                              "员工薪酬",
                              "总体行政花销",
                              "利润贡献I",
                              "利润贡献II",
                              "利润贡献III")
report5_mod3_1 <- report5_mod3_1 %>%
  gather(variable,"金额(元)") 
  



report5_mod3_2 <- report5_mod3 %>%
  mutate(total_revenue_percent = round(total_revenue/total_revenue*100,2),
         total_production_fee_percent = round(total_production_fee/total_revenue*100,2),
         profit1_percent = round(profit1/total_revenue*100,2),
         total_changeable_fee_percent = round(total_changeable_fee/total_revenue*100,2),
         profit2_percent = round(profit2/total_revenue*100,2),
         total_salary_percent = round(total_salary/total_revenue*100,2),
         total_admin_fee_percent =round(total_admin_fee/total_revenue*100,2),
         profit3_percent = round(profit3/total_revenue*100,2)) %>%
  select(total_revenue_percent,
         total_production_fee_percent,
         profit1_percent,
         total_changeable_fee_percent,
         profit2_percent,
         total_salary_percent,
         total_admin_fee_percent,
         profit3_percent) 

 colnames(report5_mod3_2) <- c("销售额",
                               "生产成本",
                               "利润贡献I",
                               "其他可变成本",
                               "利润贡献II",
                               "员工薪酬",
                               "总体行政花销",
                               "利润贡献III")
 
 report5_mod3 <- report5_mod3_2 %>%
   gather(variable,"占比") %>%
   left_join(report5_mod3_1,by="variable") %>%
   left_join(report5_rank3,by="variable") %>%
   arrange(rank) %>%
   select(-rank)
 
 rownames(report5_mod3) <- report5_mod3$variable
 report5_mod3 <- report5_mod3 %>% 
   select(-variable) %>%
   select(`金额(元)`,`占比`)
   
 ## report c
 report6_rank <- data.frame(
   variable=c("销售额(元)",
              "生产成本(元)",
              "生产成本(%)",
              "利润贡献I(元)",
              "利润贡献I(%)",
              "其他可变成本(元)",
              "其他可变成本(%)",
              "推广费用预算(元)",
              "推广费用预算(%)",
              "利润贡献I(元)",
              '利润贡献II(%)'),
   rank=1:11,
   stringsAsFactors = F)
 
 product_report_peraccount <- tmp %>%
   select(hospital,
          product,
          real_revenue,
          real_volume,
          promotional_budget,
          discount) %>%
   group_by(hospital,product) %>%
   mutate(no.product=n_distinct(product),
          production_cost = sapply(product,function(x)production_price[which(production_price$product==x),]$cost),
          production_fee = round(production_cost*real_revenue,2),
          profit1 = round(real_revenue - production_fee,2),
          discount_fee = round(discount/100*real_revenue,2),
          promotion_fee = round(promotional_budget/no.product,2),
          profit2 = round(profit1- discount_fee - promotion_fee,2)) %>%
   ungroup() %>%
   select(hospital,
          product,
          real_revenue,
          production_fee,
          profit1,
          discount_fee,
          promotion_fee,
          profit2) %>%
   group_by(hospital) %>%
   do(plyr::rbind.fill(.,data.frame(hospital=first(.$hospital),
                                 product="总体",
                                 real_revenue = sum(.$real_revenue),
                                 production_fee = sum(.$production_fee),
                                 profit1 = sum(.$profit1),
                                 discount_fee = sum(.$discount_fee),
                                 promotion_fee = sum(.$promotion_fee),
                                 profit2 = sum(.$profit2)))) %>%
   ungroup() %>%
   mutate(production_fee_percent = round(production_fee/real_revenue*100,2),
          profit1_percent = round(profit1/real_revenue*100,2),
          discount_fee_percent = round(discount_fee/real_revenue*100,2),
          promotion_fee_percent = round(promotion_fee/real_revenue*100,2),
          profit2_percent = round(profit2/real_revenue*100,2))
 
 colnames(product_report_peraccount) <- c("医院",
                                          "产品",
                                          "销售额(元)",
                                          "生产成本(元)",
                                          "利润贡献I(元)",
                                          "其他可变成本(元)",
                                          "推广费用预算(元)",
                                          "利润贡献II(元)",
                                          "生产成本(%)",
                                          "利润贡献I(%)",
                                          "其他可变成本(%)",
                                          "推广费用预算(%)",
                                          '利润贡献II(%)')
 
 report6_mod1 <- product_report_peraccount %>%
   gather(variable,value,-`医院`,-`产品`) %>%
   spread(`产品`,value) %>%
   left_join(report6_rank,by="variable") %>%
   group_by(hospital) %>%
   arrange(rank) %>%
   select(-rank)
 

 
                    

 ## report b
 report7_mod1 <- tmp %>%
   select(hospital,
          real_revenue,
          pp_real_revenue,
          real_volume,
          pp_real_volume) %>%
   group_by(hospital) %>%
   dplyr::summarise(real_revenue_by_hosp = round(sum(real_revenue),2),
                    pp_real_revenue_by_hosp = round(sum(pp_real_revenue),2),
                    real_revenue_increase = real_revenue_by_hosp - pp_real_revenue_by_hosp,
                    real_volume_by_hosp = round(sum(real_volume),2),
                    pp_real_volume_by_hosp = round(sum(pp_real_volume),2),
                    real_volume_increase = real_volume_by_hosp - pp_real_volume_by_hosp) %>%
   do(plyr::rbind.fill(.,data.frame(hospital="总体",
                                    real_revenue_by_hosp=sum(.$real_revenue_by_hosp),
                                    pp_real_revenue_by_hosp=sum(.$pp_real_revenue_by_hosp),
                                    real_revenue_increase=sum(.$real_revenue_increase),
                                    real_volume_by_hosp=sum(.$real_volume_by_hosp),
                                    pp_real_volume_by_hosp=sum(.$pp_real_volume_by_hosp),
                                    real_volume_increase=sum(.$real_volume_increase)))) %>%
   mutate(real_revenue_increase_ratio = round(real_revenue_increase/pp_real_revenue_by_hosp*100,2),
          real_volume_increase_ratio = round(real_volume_increase/pp_real_volume_by_hosp*100,2)) %>%
   select(hospital,
          pp_real_revenue_by_hosp,
          real_revenue_by_hosp,
          real_revenue_increase,
          real_revenue_increase_ratio,
          pp_real_volume_by_hosp,
          real_volume_by_hosp,
          real_volume_increase,
          real_volume_increase_ratio)
   
 
   
 colnames(report7_mod1) <- c("医院",
                             "上期销售额",
                             "当期销售额",
                             "销售额增长",
                             "销售额增长率",
                             "上期销售量",
                             "当期销售量",
                             "销售量增长",
                             "销售量增长率")
 rownames(report7_mod1) <- report7_mod1$医院
 report7_mod1 <- report7_mod1 %>%
   select(-`医院`)
 
 report7_mod2 <- tmp %>%
   select(sales_rep,
          sr_revenue,
          pp_sr_revenue,
          sr_volume,
          pp_sr_volume) %>%
   mutate(sr_revenue_increase=sr_revenue-pp_sr_revenue,
          sr_volume_increase=sr_volume-pp_sr_volume) %>%
   do(plyr::rbind.fill(.,data.frame(sales_rep="总体",
                                    sr_revenue=sum(.$sr_revenue),
                                    sr_revenue_increase=sum(.$sr_revenue_increase),
                                    sr_volume=sum(.$sr_volume),
                                    sr_volume_increase=sum(.$sr_volume_increase)))) %>%
   mutate(sr_revenue_increase_ratio = round(sr_revenue_increase/pp_sr_revenue*100,2),
          sr_volume_increase_ratio = round(sr_volume_increase/pp_sr_volume*100,2)) %>%
   select(sales_rep,
          pp_sr_revenue,
          sr_revenue,
          sr_revenue_increase,
          sr_revenue_increase_ratio,
          pp_sr_volume,
          sr_volume,
          sr_volume_increase,
          sr_volume_increase_ratio)
 
 
 
 colnames(report7_mod2) <- c("销售代表",
                             "上期销售额",
                             "当期销售额",
                             "销售额增长",
                             "销售额增长率",
                             "上期销售量",
                             "当期销售量",
                             "销售量增长",
                             "销售量增长率")
 rownames(report7_mod2) <- report7_mod2$销售代表
 report7_mod2 <- report7_mod2 %>%
   select(-`销售代表`)
 
 
 report7_mod3 <- tmp %>%
   select(product,
          real_revenue,
          pp_real_revenue,
          real_volume,
          pp_real_volume) %>%
   group_by(product) %>%
   dplyr::summarise(real_revenue_by_product = round(sum(real_revenue),2),
                    pp_real_revenue_by_product = round(sum(pp_real_revenue),2),
                    real_revenue_increase = real_revenue_by_product - pp_real_revenue_by_product,
                    real_volume_by_product = round(sum(real_volume),2),
                    pp_real_volume_by_product = round(sum(pp_real_volume),2),
                    real_volume_increase = real_volume_by_product - pp_real_volume_by_product) %>%
   do(plyr::rbind.fill(.,data.frame(hospital="总体",
                                    real_revenue_by_product=sum(.$real_revenue_by_product),
                                    pp_real_revenue_by_product=sum(.$pp_real_revenue_by_product),
                                    real_revenue_increase=sum(.$real_revenue_increase),
                                    real_volume_by_product=sum(.$real_volume_by_product),
                                    pp_real_volume_by_product=sum(.$pp_real_volume_by_product),
                                    real_volume_increase=sum(.$real_volume_increase)))) %>%
   mutate(real_revenue_increase_ratio = round(real_revenue_increase/pp_real_revenue_by_product*100,2),
          real_volume_increase_ratio = round(real_volume_increase/pp_real_volume_by_product*100,2)) %>%
   select(product,
          pp_real_revenue_by_product,
          real_revenue_by_product,
          real_revenue_increase,
          real_revenue_increase_ratio,
          pp_real_volume_by_product,
          real_volume_by_product,
          real_volume_increase,
          real_volume_increase_ratio)
 
 
 
 colnames(report7_mod3) <- c("产品",
                             "上期销售额",
                             "当期销售额",
                             "销售额增长",
                             "销售额增长率",
                             "上期销售量",
                             "当期销售量",
                             "销售量增长",
                             "销售量增长率")
 rownames(report7_mod3) <- report7_mod3$产品
 report7_mod3 <- report7_mod3 %>%
   select(-`产品`)
 
 

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
  

report8_mod1 <- offer_attractiveness_report %>%
  select(total_revenue,
         total_profit,
         average_customer_relationship_index,
         average_sales_skills_index,
         average_product_knowledge_index,
         average_motivation_index,
         total_offer_attractiveness,
         total_acc_offer_attractiveness) %>%
  distinct()

colnames(report8_mod1) <- c("总销售(元)",
                             "总利润(元)",
                             "客户关系的平均水平(指数)",
                             "平均销售技巧水平(指数)",
                             "平均产品知识水平(指数)",
                             "平均动力值(指数)",
                             "商业价值(指数)",
                             "累计商业价值(指数)") 
report8_mod1 <- report8_mod1 %>% gather(variable,value)
rownames(report8_mod1) <- report8_mod1$variable
report8_mod1 <- report8_mod1 %>% select(-variable)

report8_mod2 <- tmp %>%
  select(ith_hospital,hospital,product,real_sales) %>%
  group_by(ith_hospital,hospital) %>%
  dplyr::summarise(hospital_revenue = round(sum(real_sales),2)) %>%
  ungroup() %>%
  mutate(market_revenue=round(sum(hospital_revenue),2),
         market_share=round(hospital_revenue/market_revenue*100,2)) %>%
  arrange(ith_hospital) %>%
  select(hospital,
         hospital_revenue,
         market_share) %>%
  distinct()

colnames(report8_mod2) <- c("医院",
                            "总销售(元)",
                            "总市场的市场份额(%)")
rownames(report8_mod2) <- report8_mod2$医院
report8_mod2 <- report8_mod2 %>% select(-`医院`)
  





out<-list("report1_mod1"=report1_mod1,
          "report1_mod2"=report1_mod2,
          "report1_mod3"=report1_mod3,
          "report1_mod4"=report1_mod4,
          "report1_mod5"=report1_mod5,
          "report2_mod1"=report2_mod1,
          "report2_mod2"=report2_mod2,
          "report4_mod1"=report4_mod1,
          "report4_mod2"=report4_mod2,
          "report4_mod3"=report4_mod3,
          "report3_mod1"=report3_mod1,
          "report4_mod1"=report4_mod1,
          "report4_mod2"=report4_mod2,
          "report4_mod3"=report4_mod3,
          "report5_mod1"=report5_mod1,
          "report5_mod2"=report5_mod2,
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
  


  
