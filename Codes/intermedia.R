library(plyr)
library(dplyr)

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
    
