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


  for (j in 1:10) {
    for (q in 1:4){
      name.sales_rep <- input[[paste("p1_sr_hosp",j,sep="")]]
      value.discount <- input[[paste("p1_discount_hosp",j,"_",q,sep="")]]
      value.promotional_budget <-input[[paste("p1_promotional_budget_hosp",j,sep="")]]
      value.sr_time <- as.numeric(input[[paste("p1_hosp",j,"_worktime_",q,seq="")]])*worktime
      value.time_on_doc <- as.numeric(
        input[[paste("p1_hosp",j,"_worktime_doc",seq="")]])*value.sr_time
      value.time_on_diet <- as.numeric(
        input[[paste("p1_hosp",j,"_worktime_diet",seq="")]])*value.sr_time
      value.time_on_admin <- as.numeric(
        input[[paste("p1_hosp",j,"_worktime_admin",seq="")]])*value.sr_time
      value.time_on_nurs <- as.numeric(
        input[[paste("p1_hosp",j,"_worktime_nurs",seq="")]])*value.sr_time
      
      data_decision1 <- rbind(data_decision1,data.frame(
        phase = "phase1",
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


  for (j in 1:5) {
    name.sales_rep <- sr_info_initial$sales_name[j]
    value.sales_training <- as.numeric(
      input[[paste("p1_sr",j,"_sales_training",sep="")]])/100*worktime
    value.product_training <- as.numeric(
      input[[paste("p1_sr",j,"_product_training",sep="")]])/100*worktime
    value.field_work <- as.numeric(
      input[[paste("p1_sr",j,"_field_work",sep="")]])/100*worktime
    value.meetings_with_team <- as.numeric(
      input[[paste("p1_flm_team_meeting",sep="")]])/100*worktime
    value.kpi_analysis <- as.numeric(
      input[[paste("p1_flm_kpi_analysis",sep="")]])/100*worktime
    value.strategy_and_cycle_planning <- as.numeric(
      input[[paste("p1_flm_strategy_planning",sep="")]])/100*worktime
    value.admin_work <- as.numeric(
      input[[paste("p1_flm_admin_work",sep="")]])/100*worktime
    value.sales_target <- as.numeric(
      input[[paste("p1_sr",j,"_sales_target",sep="")]])/100*worktime
    
    data_decision2 <- rbind(data_decision2,data.frame(
      phase = "周期1",
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
