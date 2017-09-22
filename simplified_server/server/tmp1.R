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







