library(tidyr)
library(plyr)
library(dplyr)
library(openxlsx)
options(scipen=200)


available_srs <- c("销售代表1",
                   "销售代表2",
                   "销售代表3",
                   "销售代表4",
                   "销售代表5")


# pp_info_by_hosp_product <- data.frame(
#   hospital = rep(hospital_info_initial$name,each=4),
#   product = rep(product_info_initial$name2,times=10),
#   pp_acc_revenue = rep(100000,280),
#   #pp_real_sales = rep(100000,40),
#   pp_sr_sales_performance = rep(60,40),
#   pp_deployment_quality_index = rep(50,40),
#   pp_customer_relationship_index = rep(50,40),
#   pp_promotional_support_index = rep(50,40),
#   pp_sales_performance = rep(50,40),
#   pp_offer_attractiveness = rep(0.5,40),
#   pp_acc_offer_attractiveness = rep(0,40),
#   stringsAsFactors = F)
# 
# 






sr_info_initial <-
  data.frame("姓名" = c("销售代表1",
                            "销售代表2",
                            "销售代表3",
                            "销售代表4",
                            "销售代表5"),
             "销售技巧" = c("Advanced/Experienced",
                              "skilled",
                              "skilled",
                              "Advanced",
                              "Expert"),
             "产品知识" = c("Advanced/Expert",
                                   "Advanced",
                                   "Fundamental",
                                   "Skilled",
                                   "Advanced"),
             "利润" = c("low",
                            "high",
                            "high",
                            "middle",
                            "high")
             )

sr_info_initial_value <-
  data.frame(sales_rep = c("销售代表1",
                            "销售代表2",
                            "销售代表3",
                            "销售代表4",
                            "销售代表5"),
             sales_level = c("middle",
                             "junior",
                             "junior",
                             "middle",
                             "senior"),
             pp_sr_revenue =c(500000,
                              500000,
                              500000,
                              500000,
                              500000),
             pp_sr_volume =c(5000,
                             5000,
                             5000,
                             5000,
                             5000),
             pp_sr_acc_revenue = c(1800000,
                             1000000,
                             1200000,
                             1500000,
                             2500000),
             pp_sales_skills_index = c(3,2,2,3,5),
             pp_product_knowledge_index = c(20,15,5,10,15),
             pp_motivation_index = c(20,60,60,40,60),
             pp_sr_acc_field_work = rep(0,5))

sr_info_initial_value$sales_rep <- as.character(sr_info_initial_value$sales_rep)
sr_info_initial_value$sales_level <- as.character(sr_info_initial_value$sales_level)

product_info_initial_ui <-
  data.frame("名称" = c("Tube Feed",
                         "Oral Nutritional Supplement(ONS)",
                         "Disease Specific Product1",
                         "Pediatric product"),
             "剂量" = c("High Volume",
                        "High Volume",
                        "Low-Middle Volume",
                        "Low Volume"),
             "利润" = c("Low Margin",
                        "Low Margin",
                        "High Margin",
                        "High Margin"),
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
                           product=product_info_initial$product)


hospital_info_initial_ui <- 
  data.frame("名称" = c("北京大学人民医院",
                      "北京军区总医院",
                      "卫生部中日友好医院",
                      "中国人民武装警察部队总医院",
                      "北京大学第三医院",
                      "北京积水潭医院",
                      "北京市宣武区中医医院",
                      "北京市丰台区解放军第307医院",
                      "中国人民解放军总医院",
                      "北京市隆福医院"),
             "区域" = c("北京市区",
                      "北京市区",
                      "北京市区",
                      "北京市区",
                      "北京市区",
                      "北京市区",
                      "北京市区",
                      "北京市区",
                      "北京市区",
                      "北京市区"),
             "类型" = c("children",
                      "university",
                      "community",
                      "community",
                      "children",
                      "university",
                      "community",
                      "university",
                      "children",
                      "university"),
             "床位数" = c(150,
                      510,
                      375,
                      250,
                      110,
                      770,
                      385,
                      415,
                      200,
                      425),
             stringsAsFactors = F)

hospital_info <- data.frame(hospital = c("北京大学人民医院",
                                         "北京军区总医院",
                                         "卫生部中日友好医院",
                                         "中国人民武装警察部队总医院",
                                         "北京大学第三医院",
                                         "北京积水潭医院",
                                         "北京市宣武区中医医院",
                                         "北京市丰台区解放军第307医院",
                                         "中国人民解放军总医院",
                                         "北京市隆福医院"))

hospital_code <- data.frame(hospital.no=1:length(hospital_info$hospital),
                            hospital=hospital_info$hospital)

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

total_promotional_budget <- list(phase1 = 10000,
                                 phase2 = 10000,
                                 phase3 = 10000,
                                 phase4 = 10000)






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

setwd("D:\\Rachel\\WorkMaterial\\git\\Sales_training_programme\\Codes\\newCodes")

contact_priority_info <- read.xlsx(".\\contact_priorty_info.xlsx", 
                                   sheet = "contact")
contact_priority_info <- contact_priority_info %>%
  left_join(hospital_code,by="hospital.no") 




volume_info <- read.xlsx(".\\contact_priorty_info.xlsx",
                         sheet="volume") 
volume_info <- volume_info %>% 
  left_join(hospital_code,by="hospital.no") %>%
  left_join(product_code,by="product.no")

pp_info_by_hosp_product <-read.xlsx(".\\contact_priorty_info.xlsx",
                                    sheet="pp_hospital")
pp_info_by_hosp_product <- pp_info_by_hosp_product %>%
  left_join(hospital_code,by="hospital.no") %>%
  left_join(product_code,by="product.no") %>%
  select(-hospital.no,-product.no)
  




