library(tidyr)
library(plyr)
library(dplyr)
library(openxlsx)
options(scipen=200)

## sales representative
sr_info <- read.xlsx("pre_info.xlsx",
                     sheet="sales_rep")

sr_info_ui <- sr_info[,1:4]

worktime =100
overhead =2

## product information
product_info <- read.xlsx("pre_info.xlsx",
                          sheet="product")

product_info_ui <- product_info[,-1]

## hospital information
hospital_info <- read.xlsx("pre_info.xlsx",
                           sheet="hospital")
hospital_info<- gather(hospital_info,phase,"潜力",c("周期1","周期2","周期3","周期4"))

hospital_info_ui <- hospital_info[,c(1,3,4,5,7,8)]

## previous period
pp_info <- read.xlsx("pre_info.xlsx",
                     sheet="pp_info")

## weightage
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
                  deployment_quality = list(kpi_report_analysis =0.4,
                                            admin_work = 0.3,
                                            meetings_with_team = 0.3),
                  sales_skills = list(field_work = 0.2,
                                      sales_training = 0.3,
                                      experience = 0.5),
                  motivation = list(admin_work = 0.1,
                                    sales_target_realization =0.4,
                                    meetings_with_team = 0.25,
                                    sales_training = 0.25),
                  success_value = list(total_sales = 0.3,
                                       contribution_margin = 0.35,
                                       average_customer_relationship = 0.15,
                                       team_capability = 0.2)
                  
)

## total promotional budget
total_promotional_budget <- list(phase1 = 2000,
                                 phase2 = 2000,
                                 phase3 = 2000,
                                 phase4 = 2000)

## 

