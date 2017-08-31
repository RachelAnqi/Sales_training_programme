##participant report


## staff report 1
staff_report <- tmp %>%
  select(sales_rep,
         incentive_factor,
         product_training,
         sales_training,
         meetings_with_team,
         field_work,
         sr_time,
         product_knowledge_index,
         pp_experience_index,
         experience_index,
         sr_sales,
         acc_revenue,
         pp_sales_skills_index,
         sales_skills_index) %>%
  distinct() %>%
  mutate(work_time=worktime,
         basic_salary=basicSalary,
         total_salary=basic_salary*incentive_factor+basicSalary)

## flm report
flm_report <- staff_report %>%
  mutate(all_sr_salary=sum(total_salary,na.rm=T)) %>%
  select(all_sr_salary) %>%
  distinct()

flm_report <- flm_data %>%
  mutate(all_sr_salary = flm_report$all_sr_salary)


## brief time allocation of hospital report
hospital_report1 <- tmp %>%
  select(hospital,
         product,
         sales_rep,
         sr_time) %>%
  distinct() %>%
  mutate(total_time_peraccount = sum(sr_time,na.rm=T))

## time allocation of hospital report
hospital_report1 <- tmp %>%
  select(hospital,
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
         contact_priority_fit_index)

## report a


  
