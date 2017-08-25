##### decision 1
data_decision1 <- data.frame(
  phase,
  hospital,
  sales_rep,
  product,
  potential_sales,
  current_sales,
  discount,
  promotional_budget,
  sr_time,
  time_on_doc,
  time_on_diet,
  time_on_admin,
  time_on_nurs
  
  
)

#########
# i for phase
# j for hospital
# q for product

for (i in 1:4) {
  for (j in 1:10) {
    for (q in 1:4){
      name.sales_rep <- input[[paste("p",i,"_sr_hosp",j,sep="")]]
      value.discount <- input[[paste("p",i,"_discount_hosp",j,"_",q,sep="")]]
      value.promotional_budget <-input[[paste("p",i,"_promotional_budget_hosp",j,sep="")]]
      value.sr_time <- as.numeric(input[[paste("p",i,"_hosp",j,"_worktime_",q,seq="")]])*worktime
      value.time_on_doc <- as.numeric(
        input[[paste("p",i,"_hosp",j,"_worktime_doc",seq="")]])*value.sr_time
      value.time_on_diet <- as.numeric(
        input[[paste("p",i,"_hosp",j,"_worktime_diet",seq="")]])*value.sr_time
      value.time_on_admin <- as.numeric(
        input[[paste("p",i,"_hosp",j,"_worktime_admin",seq="")]])*value.sr_time
      value.time_on_nurs <- as.numeric(
        input[[paste("p",i,"_hosp",j,"_worktime_nurs",seq="")]])*value.sr_time
      
      data_decision <- rbind(data_decision,data.frame(
        phase = paste("phase", i, sep = ""),
        hospital = hospital_info_initial$name[j],
        sales_rep = name.sales_rep, ##need modification
        product = product_info_initial$product[q],
        potential_sales = unknown, ##need modification
        current_sales = unknown, ##need modification
        discount = value.discount, ##need modification
        promotional_budget = value.promotional_budget,
        sr_time = value.sr_time,
        time_on_doc = value.time_on_doc,
        time_on_diet = value.time_on_diet,
        time_on_admin = value.time_on_admin,
        time_on_nurs = value.time_on_nurs
      ))
    }
  }
}


##### decision 2
data_decision2 <- data.frame(
  phase,
  sales_rep,
  sales_training,
  product_training,
  field_work,
  meetings_with_team,
  kpi_analysis,
  strategy_and_cycle_planning,
  admin_work,
  sales_target
)

#########
# i for phase
# j for sales rep

for (i in 1:4) {
  for (j in 1:5) {
    name.sales_rep <- sr_info_initial$sales_name[j]
    value.sales_training <- as.numeric(
      input[[paste("p",i,"_sr",j,"_sales_training",sep="")]])*worktime
    value.product_training <- as.numeric(
      input[[paste("p",i,"_sr",j,"_product_training",sep="")]])*worktime
    value.field_work <- as.numeric(
      input[[paste("p",i,"_sr",j,"_field_work",sep="")]])*worktime
    value.meetings_with_team <- as.numeric(
      input[[paste("p",i,"_flm_team_meeting",sep="")]])*worktime
    value.kpi_analysis <- as.numeric(
      input[[paste("p",i,"_flm_kpi_analysis",sep="")]])*worktime
    value.strategy_and_cycle_planning <- as.numeric(
      input[[paste("p",i,"_flm_strategy_planning",sep="")]])*worktime
    value.admin_work <- as.numeric(
      input[[paste("p",i,"_flm_admin_work",sep="")]])*worktime
    value.sales_target <- as.numeric(
      input[[paste("p",i,"_sr",j,"_sales_target",sep="")]])*worktime
    
    data_decision2 <- rbind(data_decision2,data.frame(
      phase = paste("phase",i,sep=""),
      sales_rep = name.sales_rep,
      sales_training = value.sales_training,
      product_training = value.product_training,
      field_work = value.field_work,
      meetings_with_team = value.meetings_with_team,
      kpi_analysis = value.kpi_analysis,
      strategy_and_cycle_planning = value.strategy_and_cycle_planning,
      admin_work = value.admin_work,
      sales_target = value.sales_target
    ))
  }
}