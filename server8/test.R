input <- readRDS("phase2_test1.RDS")  

## phase 0
pp_data1 <- pp_info
pp_data2 <- sr_info_list
cp_data1 <- get.data1(input,0)
cp_data2 <- get.data2(input,0)
tmp0 <- calculation(pp_data1,
                    pp_data2,
                    cp_data1,
                    cp_data2)
p0_flm_data <- get.data3(input,0)
p0_report <- report_data(tmp0,p0_flm_data,null_report8)


## phase 1
pp_data1 <- tmp0 %>% select(hospital,
                              hosp_code,
                              product,
                              prod_code,
                              real_revenue,
                              real_volume,
                              sr_sales_performance,
                              deployment_quality_index,
                              customer_relationship_index,
                              promotional_support_index,
                              sales_performance,
                              offer_attractiveness,
                              acc_offer_attractiveness) %>%
  mutate(acc_success_value = ifelse(p0_report$acc_success_value=="",0,p0_report$acc_success_value))%>%
  distinct()

colnames(pp_data1)[5:14] <- paste("pp_",colnames(pp_data1)[5:14],sep="")

pp_data2 <- tmp0 %>% select(sales_rep,
                              sales_level,
                              real_revenue_by_sr,
                              real_volume_by_sr,
                              sr_acc_revenue,
                              sales_skills_index,
                              product_knowledge_index,
                              motivation_index,
                              sr_acc_field_work,
                              target_revenue_realization_by_sr) %>%
  distinct()

colnames(pp_data2)[3:10] <- paste("pp_",colnames(pp_data2)[3:10],sep="")
cp_data1 <- get.data1(input,1)
cp_data2 <- get.data2(input,1)
tmp <- calculation(pp_data1,
                   pp_data2,
                   cp_data1,
                   cp_data2)

p1_flm_data <- get.data3(input,1)
p1_report <- report_data(tmp,p1_flm_data,p0_report$report8_mod1)


report8_mod1 <- p1_report$report8_mod1
report8_mod1 <- report8_mod1 %>% 
  gather(variable,`值`,-phase) %>%
  spread(phase,`值`)


report8_mod1 <- report8_mod1 %>%
  left_join(report8_mod1_rank,by="variable") %>%
  arrange(rank) %>%
  select(-variable,-rank)

rownames(report8_mod1) <- report8_mod1$name

report8_mod1 <- report8_mod1 %>%
  select(-name)


