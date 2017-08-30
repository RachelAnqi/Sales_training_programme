library(plyr)
library(dplyr)

data1_phase1
data2_phase1

data1 <- data1_phase1()
data2 <- data2_phase1()
tmp <- left_join(data1,data2,by=c("phase","sales_rep")) %>%
  mutate(sales = *,
         experience_index = curve(curve11,employee_accumulated_revenue)
         product_knowledge_addition_current_period = curve(curve26,product_training),
         product_knowledge_transfer_value = curve(curve28,product_knowledge_0),
         ss_accumulated_field_work_delta = curve(curve42,field_work),
         ss_accumulated_sales_training_delta = curve(curve43,sales_training),
         ss_experience_index = curve(curve44,experience_index)，
         m_meeting_with_team_delta = {if (junior) {
           curve(curve13,team_meeting)
         } else if(middle){
           curve(curve14,team_meeting)
         } else {curve(curve15,team_meeting)}},
         sales_target_realization = sales_target/sales,
         m_sales_target_realization_delta = curve(curve16,sales_target_realization),
         m_sales_training_delta = curve(curve17,sales_training),
         m_admin_work_delta = curve(curve18,admin_work)
         ) %>%
  mutate(sales_skill_index = 
           ss_accumulated_field_work_delta +
           ss_accumulated_sales_training_delta +
           ss_experience_index,
         product_knowledge_index =
           product_knowledge_addition_current_period +
           product_knowledge_transfer_value,
         employee_time_with_account_factor = 
           curve(curve35,sr_time)
           
           )
