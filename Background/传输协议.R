library(RJSONIO)
library(jsonlite)
library(openxlsx)

## screen 1 市场信息
# 1.1 新闻快报
news <- list(
  "周期1" = p1_news,
  "周期2" = p2_news
)
json_news <- toJSON(news, pretty=F)
cat(json_news, file = (con <- file('news_info.txt', "w", encoding = "UTF-8")))

# 1.2 客户信息
hospital_info <- list(
  "周期1" = select(hospital_info_ui[which(hospital_info_ui$phase=="周期1"),],-phase),
  "周期2" = select(hospital_info_ui[which(hospital_info_ui$phase=="周期2"),],-phase)
)
json_hosp_info <- toJSON(hospital_info,pretty =F)
cat(json_hosp_info, file = (con <- file('hosp_info.txt', "w", encoding = "UTF-8")))


## screen 2
json_sr <- toJSON(sr_info,pretty=F)
cat(json_sr, file = (con <- file('sr_info.txt', "w", encoding = "UTF-8")))


## screen 3
json_product <- toJSON(product_info,pretty= F)
cat(json_product, file = (con <- file('product_info.txt', "w", encoding = "UTF-8")))

## screen 4

## screen reports



## flm targets
json_flm_target <- toJSON(flm_target,pretty=F)
cat(json_flm_target, file = (con <- file('flm_target_info.txt', "w", encoding = "UTF-8")))

## promotional budget
json_prom_budget <- toJSON(total_promotional_budget,pretty=F)
cat(json_prom_budget, file = (con <- file('prom_budget_info.txt', "w", encoding = "UTF-8")))

## pp_info
json_pp_info <- toJSON(pp_info,pretty=F)
cat(json_pp_info, file = (con <- file('pp_info.txt', "w", encoding = "UTF-8")))


phase1_decision1 <- read.xlsx("agreement.xlsx",
                              sheet="decision1-phase1")
phase1_decision2 <- read.xlsx("agreement.xlsx",
                              sheet="decision2-phase1")
phase2_decision1 <- read.xlsx("agreement.xlsx",
                              sheet="decision1-phase2")
phase2_decision2 <- read.xlsx("agreement.xlsx",
                              sheet="decision2-phase2")
decision_elements <- list(
  "业务决策" = list(
    "周期1" = phase1_decision1,
    "周期2" = phase2_decision1),
  "管理决策" = list(
    "周期1" = phase1_decision2,
    "周期2" = phase2_decision2)
  )

json_input <- toJSON(decision_elements)
cat(json_input, file = (con <- file('decision_elements.txt', "w", encoding = "UTF-8")))

reports_elements <- list(
  "周期1" = list(
    "市场销售报告" = list(
      "商业价值" = "p1_report1_mod1",
      "销售业绩" = "p1_report1_mod2"
    ),
    "代表报告" = list(
      "时间分配" = "p1_report2_mod1",
      "产品知识" = "p1_report2_mod2",
      "经验" = "p1_report2_mod3",
      "销售技巧" = "p1_report2_mod4",
      "工作积极性" = "p1_report2_mod5"
    ),
    "经理报告" = list(
      "职员成本" = "p1_report3_mod1",
      "时间分配" = "p1_report3_mod2"
    ),
    "分配报告" = "p1_report4_mod1",
    "销售明细" = list(
      "合计" = "p1_report5_mod1",
      "销售明细每客户" = "p1_report5_mod2"
    ),
    "销售报告" = list(
      "销售额/客户" = "p1_report6_mod1",
      "销售额/代表" = "p1_report6_mod2",
      "销售额/产品" = "p1_report6_mod3"
    )
  ),
  "周期2" = list(
    "市场销售报告" = list(
      "商业价值" = "p2_report1_mod1",
      "销售业绩" = "p2_report1_mod2"
    ),
    "代表报告" = list(
      "时间分配" = "p2_report2_mod1",
      "产品知识" = "p2_report2_mod2",
      "经验" = "p2_report2_mod3",
      "销售技巧" = "p2_report2_mod4",
      "工作积极性" = "p2_report2_mod5"
    ),
    "经理报告" = list(
      "职员成本" = "p2_report3_mod1",
      "时间分配" = "p2_report3_mod2"
    ),
    "分配报告" = "p2_report4_mod1",
    "销售明细" = list(
      "合计" = "p2_report5_mod1",
      "销售明细每客户" = "p2_report5_mod2"
    ),
    "销售报告" = list(
      "销售额/客户" = "p2_report6_mod1",
      "销售额/代表" = "p2_report6_mod2",
      "销售额/产品" = "p2_report6_mod3"
    )
  ))

json_reports <- toJSON(reports_elements)
cat(json_reports, file = (con <- file('reports_elements.txt', "w", encoding = "UTF-8")))

output1_1 <- read.xlsx("agreement.xlsx",
                       sheet="output1_1")
output1_2 <- read.xlsx("agreement.xlsx",
                       sheet="output1_2")
output2_1 <- read.xlsx("agreement.xlsx",
                       sheet="output2_1")
output2_2 <- read.xlsx("agreement.xlsx",
                       sheet="output2_2")

output_elements <- list(
  "周期1" = list(
    "业务决策" = output1_1,
    "管理决策" = output1_2
  ),
  "周期2" = list(
    "业务决策" = output2_1,
    "管理决策" = output2_2
  )
)
    
json_output <- toJSON(output_elements)
cat(json_output, file = (con <- file('output_elements.txt', "w", encoding = "UTF-8")))
