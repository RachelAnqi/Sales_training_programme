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
         sales_target_realization = sales_target/real_sales,
         m_sales_target_realization_delta = curve(curve16,sales_target_realization),
         m_sales_training_delta = curve(curve17,sales_training),
         m_admin_work_delta = curve(curve18,admin_work),
         contact_priority_fit_index = sum(c(time_on_doc*0.5,
                                            time_on_diet*0.25,
                                            time_on_admin*0.15,
                                            time_on_nurs*0.1),
                                          na.rm=T),
         sr_time_factor = curve(curve35,sr_time)) %>%
  select(experience_index,
         product_knowledge_addition_current_period,
         product_knowledge_transfer_value,
         ss_accumulated_field_work_delta,
         ss_accumulated_sales_training_delta,
         ss_experience_index_pp,
         m_meeting_with_team_delta,
         sales_target_realization,
         m_sales_training_delta,
         m_admin_work_delta,
         contact_priority_fit_index
  ) %>%
  mutate(sales_skill_index = sum(c(
           ss_accumulated_field_work_delta*((weightage$sales_skills)$field_work),
           ss_accumulated_sales_training_delta*((weightage$sales_skills)$sales_training),
           ss_experience_index_pp*((weightage$sales_skills)$field_work)$experience),na.rm=T),
         product_knowledge_index = sum(c(
           product_knowledge_addition_current_period,
           product_knowledge_transfer_value),na.rm=T),
         motivation_index = sum(c(
           motivation_0,
           m_admin_work_delta*((weightage$motivation)$admin_work),
           m_sales_target_realization_delta*((weightage$motivation)$sales_target_realization),
           m_meeting_with_team_delta*((weightage$motivation)$meetings_with_team),
           m_sales_training_delta*((weightage$motivation)$sales_training)),
           na.rm=T)) %>%
  mutate(sr_sales_performance = sum(c(
           curve(curve32,motivation_0)*((weightage$sr_sales_performance)$motivation),
           curve(curve34,sales_skill_index)*((weightage$sr_sales_performance)$sales_skills),
           curve(curve33,product_knowledge_index)*((weightage$sr_sales_performance)$product_knowledge),
           curve(curve35,sr_time_factor)*((weightage$sr_sales_performance)$time_with_account)),
           na.rm=T)) %>%
  mutate(deployment_quality_index = sum(c(
           curve(curve5,admin_work)*((weightage$deployment_quality)$admin_work),
           curve(curve6,contact_priority_fit_index)*((weightage$deployment_quality)$priority_fit),
           curve(curve7,meetings_with_team)*((weightage$deployment_quality)$meetings_with_team),
           curve(curve8,kpi_analysis)*((weightage$deployment_quality)$kpi_report_analysis),
           curve(curve9,strategy_and_cycle_planning)*((weightage$deployment_quality)$strategy_and_cycle_planning)),
           na.rm=T)) %>%
  mutate(promotional_support = sum(c(
           curve(curve29,strategy_and_cycle_planning)*((weightage$promotional_support)$strategy_and_cycle_planning),
           curve(curve30,promotional_budget)*((weightage$promotional_support)$promotional_budget)),
           na.rm=T)) %>%
  mutate(sales_performance = sum(c(
           sr_sales_performance*((weightage$sales_performance)$sr_sales_performance),
           curve(curve40,field)
  )))
