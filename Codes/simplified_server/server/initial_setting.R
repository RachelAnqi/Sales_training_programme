library(tidyr)
library(plyr)
library(dplyr)
library(openxlsx)
options(scipen=200)

sr_info_initial <-
  data.frame("姓名" = c("销售代表1",
                        "销售代表2"),
             "销售技巧" = c("有丰富经验",
                            "有一定经验"),
             "产品知识" = c("丰富产品知识",
                            "丰富产品知识"),
             "动力值" = c("低",
                          "高")
             )

sr_info_initial_value <-
  data.frame(sales_rep = c("销售代表1",
                            "销售代表2"),
             sales_level = c("middle",
                             "junior"),
             pp_sr_revenue =c(250000,
                              90000),
             pp_sr_volume =c(2500,
                             900),
             pp_sr_acc_revenue = c(250000,
                                   90000),
             pp_sales_skills_index = c(3,2),
             pp_product_knowledge_index = c(20,15),
             pp_motivation_index = c(20,60),
             pp_sr_acc_field_work = rep(0,2),
             stringsAsFactors=F)

# sr_info_initial_value$sales_rep <- as.character(sr_info_initial_value$sales_rep)
# sr_info_initial_value$sales_level <- as.character(sr_info_initial_value$sales_level)

product_info_initial_ui <-
  data.frame("名称" = c("Tube Feed",
                         "Oral Nutritional Supplement(ONS)",
                         "Disease Specific Product1",
                         "Pediatric product"),
             "剂量" = c("中高",
                        "高",
                        "中低",
                        "低"),
             "利润" = c("低",
                        "低",
                        "高",
                        "高"),
             stringsAsFactors = F)

product_info_initial <-
  data.frame(product = c("Tube Feed",
                         "Oral Nutritional Supplement(ONS)",
                         "Disease Specific Product1",
                         "Pediatric product"),
             Volume = c("High Volume",
                        "High Volume",
                        "Low-Middle Volume",
                        "Low Volume"),
             margin = c("Low Margin",
                        "Low Margin",
                        "High Margin",
                        "High Margin"),
             stringsAsFactors = F)

product_code <- data.frame(product.no=1:length(product_info_initial$product),
                           product=product_info_initial$product,
                           stringsAsFactors = F)




hospital_info <- data.frame(hospital = c("北京大学人民医院",
                                         "北京军区总医院",
                                         "卫生部中日友好医院"),
                            stringsAsFactors = F)

hospital_code <- data.frame(hospital.no=1:length(hospital_info$hospital),
                            hospital=hospital_info$hospital,
                            stringsAsFactors = F)

weightage <- list(total_attractiveness = list(pp_offer_attractiveness = 0.35,
                                              cp_offer_attractiveness = 0.65),
                  cp_offer_attractiveness = list(sales_performance = 0.6,
                                                 customer_relationship = 0.4),
                  sales_performance = list(sr_sales_performance = 0.6,
                                           field_work = 0.05,
                                           deployment_quality = 0.35),
                  customer_relaitonship = list(product_knowledge = 0.05,
                                               promotional_support = 0.15,
                                               past_relationship = 0.8),
                  sr_sales_performance = list(motivation = 0.15,
                                              sales_skills = 0.3,
                                              product_knowledge = 0.05,
                                              time_with_account = 0.5),
                  deployment_quality = list(strategy_and_cycle_planning = 0.15,
                                            kpi_report_analysis =0.1,
                                            admin_work = 0.1,
                                            meetings_with_team = 0.1,
                                            priority_fit = 0.55),
                  promotional_support = list(promotional_budget = 0.65,
                                             strategy_and_cycle_planning = 0.35),
                  sales_skills = list(field_work = 0.2,
                                      sales_training = 0.3,
                                      experience = 0.5),
                  motivation = list(admin_work = 0.1,
                                    sales_target_realization =0.4,
                                    meetings_with_team = 0.25,
                                    sales_training = 0.25),
                  success_value = list(total_sales = 0.3,
                                       contribution_margin = 0.4,
                                       average_customer_relationship = 0.09,
                                       average_sales_skills = 0.07,
                                       average_product_knowledge = 0.07,
                                       average_motivaiton = 0.07),
                  contact_priority = list(a=0.5,
                                          b=0.2,
                                          c=0.15,
                                          d=0.15)
                  )

total_promotional_budget <- list(phase1 = 2000,
                                 phase2 = 2000,
                                 phase3 = 2000,
                                 phase4 = 2000)






###
production_price = data.frame(
  product=product_code$product,
  price=c(50,50,50,50),
  cost=c(0.6,0.6,0.6,0.6),
  stringsAsFactors = F
)


worktime =100
overhead =2
basicSalary = 15000
admin_fee_weight =0.1



contact_priority_info <- read.xlsx("contact_priorty_info.xlsx", 
                                   sheet = "contact")
contact_priority_info <- contact_priority_info %>%
  left_join(hospital_code,by="hospital.no") 

contact_priority_info <- contact_priority_info[which(!is.na(contact_priority_info$hospital)),]




volume_info <- read.xlsx("contact_priorty_info.xlsx",
                         sheet="volume") 
volume_info <- volume_info %>% 
  left_join(hospital_code,by="hospital.no") %>%
  left_join(product_code,by="product.no")
volume_info <- volume_info[which(!is.na(volume_info$hospital)),]
volume_info$potential_volume <- round(volume_info$potential_volume)
volume_info$current_volume <- round(volume_info$current_volume)
  

pp_info_by_hosp_product <-read.xlsx("contact_priorty_info.xlsx",
                                    sheet="pp_hospital")
pp_info_by_hosp_product <- pp_info_by_hosp_product %>%
  left_join(hospital_code,by="hospital.no") %>%
  left_join(product_code,by="product.no") 

pp_info_by_hosp_product <- pp_info_by_hosp_product[which(!is.na(pp_info_by_hosp_product$hospital)),]
pp_info_by_hosp_product$pp_real_volume <- round(pp_info_by_hosp_product$pp_real_volume)

hospital_info_initial_ui <- 
  data.frame(hospital = c("北京大学人民医院",
                      "北京军区总医院",
                      "卫生部中日友好医院"),
             "区域" = c("北京市区",
                      "北京市区",
                      "北京市区"),
             "类型" = c("综合医院",
                      "综合医院",
                      "综合医院"),
             stringsAsFactors = F)

hospital_info_initial_ui <- hospital_info_initial_ui %>%
  left_join(volume_info[,c(1,4,6,7)],by="hospital") %>%
  select(phase,hospital,`区域`,`类型`,product,potential_volume)
colnames(hospital_info_initial_ui)[c(2,5,6)] <- c("医院","产品","销售潜力")
  




