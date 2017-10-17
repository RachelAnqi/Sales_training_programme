rsd_sheet_names <- c("市场销售报告",
                        "代表报告",
                        "经理报告",
                        "分配报告",
                        "利润贡献总体报告",
                        "利润贡献客户报",
                        "销售报告")



## 报告入表
writeDown <- function(phase,report,report8){
  
wb <- createWorkbook()

## 1
addWorksheet(wb, rsd_sheet_names[1])
writeDataTable(wb, sheet = rsd_sheet_names[1],withFilter = F, tibble(商业价值 = " "),
               startRow = 1,rowNames = F,colNames = T)
report8_1 <- cbind(` `= rownames(report8),report8)
writeDataTable(wb, sheet = rsd_sheet_names[1],withFilter = F, report8_1,
               startCol = 2,rowNames = F,colNames = T)
writeDataTable(wb, sheet = rsd_sheet_names[1],withFilter = F, tibble(销售业绩 = " "),
               startCol = 1,startRow = 8,rowNames = F,colNames = T)
report8_2 <- cbind(` `= rownames(report$report8_mod2),report$report8_mod2)
writeDataTable(wb, sheet = rsd_sheet_names[1],withFilter = F, report8_2,
               startCol = 2,startRow = 8,rowNames = F,colNames = T)

## 2
addWorksheet(wb, rsd_sheet_names[2])
writeDataTable(wb, sheet = rsd_sheet_names[2],withFilter = F, tibble(时间分配 = " "),
               startRow = 1,rowNames = F,colNames = T)
report1_1 <- cbind(` `= rownames(report$report1_mod2),report$report1_mod2)
writeDataTable(wb, sheet = rsd_sheet_names[2],withFilter = F, report1_1,
               startCol = 2,rowNames = F,colNames = T)
writeDataTable(wb, sheet = rsd_sheet_names[2],withFilter = F, tibble(各项指标 = " "),
               startCol = 1,startRow = 8,rowNames = F,colNames = T)
report8_2 <- rbind(report$report1_mod3,
                   report$report1_mod4,
                   report$report1_mod5,
                   report$report1_mod6)
report8_2 <- cbind(` `= rownames(report8_2),report8_2)
writeDataTable(wb, sheet = rsd_sheet_names[2],withFilter = F, report8_2,
               startCol = 2,startRow = 8,rowNames = F,colNames = T)

## 3
addWorksheet(wb, rsd_sheet_names[3])
writeDataTable(wb, sheet = rsd_sheet_names[3],withFilter = F, tibble(职员成本 = " "),
               startRow = 1,rowNames = F,colNames = T)
report1_1 <- cbind(` `= rownames(report$report2_mod1),report$report2_mod1)
writeDataTable(wb, sheet = rsd_sheet_names[3],withFilter = F, report1_1,
               startCol = 2,rowNames = F,colNames = T)
writeDataTable(wb, sheet = rsd_sheet_names[3],withFilter = F, tibble(时间分配 = " "),
               startCol = 1,startRow = 4,rowNames = F,colNames = T)
report1_2 <- cbind(` `= rownames(report$report2_mod2),report$report2_mod2)
writeDataTable(wb, sheet = rsd_sheet_names[3],withFilter = F, report1_2,
               startCol = 2,startRow = 4,rowNames = F,colNames = T)

## 4 
addWorksheet(wb, rsd_sheet_names[4])
writeDataTable(wb, sheet = rsd_sheet_names[4],withFilter = F, tibble(时间分配 = " "),
               startRow = 1,rowNames = F,colNames = T)
report3_1 <- report$report3_mod1
writeDataTable(wb, sheet = rsd_sheet_names[4],withFilter = F, report3_1,
               startCol = 2,rowNames = F,colNames = T)

## 5 
addWorksheet(wb, rsd_sheet_names[5])
writeDataTable(wb, sheet = rsd_sheet_names[5],withFilter = F, tibble("利润贡献 每产品(总)" = " "),
               startRow = 1,rowNames = F,colNames = T)
report5_1 <- cbind(` `= rownames(report$report5_mod1),report$report5_mod1)
writeDataTable(wb, sheet = rsd_sheet_names[5],withFilter = F, report5_1,
               startCol = 2,rowNames = F,colNames = T)
writeDataTable(wb, sheet = rsd_sheet_names[5],withFilter = F, tibble("利润贡献 (总体)" = " "),
               startCol = 1,startRow = 8,rowNames = F,colNames = T)
report5_3 <- cbind(` `= rownames(report$report5_mod3),report$report5_mod3)
writeDataTable(wb, sheet = rsd_sheet_names[5],withFilter = F, report5_3,
               startCol = 2,startRow = 8,rowNames = F,colNames = T)

## 6 
addWorksheet(wb, rsd_sheet_names[6])
writeDataTable(wb, sheet = rsd_sheet_names[6],withFilter = F, tibble("利润贡献 每客户 " = " "),
               startRow = 1,rowNames = F,colNames = T)
report6_1 <- report$report6_mod1
writeDataTable(wb, sheet = rsd_sheet_names[6],withFilter = F, report6_1,
               startCol = 2,rowNames = F,colNames = T)

## 7 
addWorksheet(wb, rsd_sheet_names[7])
writeDataTable(wb, sheet = rsd_sheet_names[7],withFilter = F, tibble("销售额和数量/客户" = " "),
               startRow = 1,rowNames = F,colNames = T)
report7_1 <- cbind(` `= rownames(report$report7_mod1),report$report7_mod1)
writeDataTable(wb, sheet = rsd_sheet_names[7],withFilter = F, report7_1,
               startCol = 2,rowNames = F,colNames = T)
writeDataTable(wb, sheet = rsd_sheet_names[7],withFilter = F, tibble("销售额和数量/代表" = " "),
               startCol = 1,startRow = 14,rowNames = F,colNames = T)
report7_2 <- cbind(` `= rownames(report$report7_mod2),report$report7_mod2)
writeDataTable(wb, sheet = rsd_sheet_names[7],withFilter = F, report7_2,
               startCol = 2,startRow = 14,rowNames = F,colNames = T)
writeDataTable(wb, sheet = rsd_sheet_names[7],withFilter = F, tibble("销售额和数量/产品" = " "),
               startCol = 1,startRow = 22,rowNames = F,colNames = T)
report7_3 <- cbind(` `= rownames(report$report7_mod3),report$report7_mod3)
writeDataTable(wb, sheet = rsd_sheet_names[7],withFilter = F, report7_3,
               startCol = 2,startRow = 22,rowNames = F,colNames = T)
return(wb)}

## 报告保存
saveWorkbook(writeDown("phase1",p1_report,report8_mod1),
             file = "test.xlsx",
             overwrite = TRUE)




