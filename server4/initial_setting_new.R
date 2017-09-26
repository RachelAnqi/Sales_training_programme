library(tidyr)
library(plyr)
library(dplyr)
library(openxlsx)
options(scipen=200)

## sales representative
sr_info <- read.xlsx("pre_info_new.xlsx",
                     sheet="sales_rep")

sr_info_ui <- sr_info[,1:4]

sr_info_list <- data.frame(
  sales_rep = sr_info$业务代表,
  sr_info[,5:13],
  stringsAsFactors = F
)

worktime =100
overhead =2

## product information
product_info <- read.xlsx("pre_info_new.xlsx",
                          sheet="product")

product_info_ui <- product_info[,-1]

product_info_list <- data.frame(
  product = product_info$类别,
  prod_code = product_info$prod_code,
  stringsAsFactors = F
)

## hospital information
hospital_info <- read.xlsx("pre_info_new.xlsx",
                           sheet="hospital")
hospital_info<- gather(hospital_info,phase,"潜力",c("周期0","周期1","周期2","周期3","周期4"))

hospital_info_ui <- hospital_info[,c(1,3,4,5,7,8)]

hospital_info_list <- unique(data.frame(
  hospital = hospital_info$名称,
  hosp_code = hospital_info$hosp_code,
  stringsAsFactors = F
))



## previous period
pp_info <- read.xlsx("pre_info_new.xlsx",
                     sheet="pp_info")

pp_info <- pp_info %>%
  left_join(hospital_info_list,by="hosp_code") %>%
  left_join(product_info_list,by="prod_code")

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
total_promotional_budget <- list(phase0 = 2000,
                                 phase1 = 2000,
                                 phase2 = 2000,
                                 phase3 = 2000,
                                 phase4 = 2000)

## 
null_report8 <- data.frame(
  phase=c("周期0","周期1","周期2","周期3","周期4"),
  "total_revenue"=rep("",5),
  "profit"=rep("",5),
  "average_customer_relationship_index"=rep("",5),
  "team_capability"=rep("",5),
  "total_offer_attractiveness"=rep("",5),
  "total_acc_offer_attractiveness"=rep("",5),
  "success_value"=rep("",5),
  stringsAsFactors = F
)

report8_mod1_rank <- data.frame(
  variable=c("total_revenue",
             "profit",
             "average_customer_relationship_index",
             "team_capability",
             "total_offer_attractiveness",
             "total_acc_offer_attractiveness",
             "success_value"),
  name = c("总销售(元)",
           "总利润(元)",
           "客户关系的平均水平(指数)",
           "团队能力(指数)",
           "商业价值(指数)",
           "累计商业价值(指数)",
           "得分"),
  rank=1:7
  
)

## news import
news <- read.xlsx("pre_info_new.xlsx",
                  sheet="news")
colnames(news)[1] <- ""

