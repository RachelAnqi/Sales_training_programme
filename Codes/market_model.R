## offer attractiveness by account by product
## curve funcion
curve <- function(name,input_x){
  data <- get(name)
  left <- data[which.min(abs(input_x-data$x)),]
  tmp <- data[-which.min(abs(input_x-data$x)),]
  right <- tmp[which.min(abs(input_x-tmp$x)),]
  y <- ifelse(left$x <= right$x,
              (1-(input_x-left$x)/(right$y-left$y))*left$y + 
                (1-(right$x-input_x)/(right$y-left$y))*right$y,
              (1-(input_x-right$x)/(left$y-right$y))*right$y + 
                (1-(left$x-input_x)/(left$y-right$y))*left$y)
  y
}

## sales performance
# 
input_experience_index <- input_employee_revenue


##
sales_skill_index <- list(accumulated_field_work = curve(curve42,input_accumulated_field_work),
                          accumulated_sales_training = curve(curve43,input_accumulated_sales_training),
                          experience_index_previous_period = curve(curve44,
                                                                   input_experience_index_previous_period))

motivation_index <- list(meeting_with_team = ({if (junior) {
  curve(curve13,input_meeting_with_team)
} else if(middle){
  curve(curve14,input_meeting_with_team)
} else {curve(curve15,input_meeting_with_team)}}),

sales_target_realization = curve(curve16,input_sales_target_realization),
sales_training = curve(curve17,input_sales_training),
administration_work = curve(curve18,input_administration_work))
contact_priority_fit_index ##????
motivation_index_previous_period
product_knowledge
employee_time_with_account_factor <- curve(curve35,input_employee_time_with_account) ## by products


###
deployment_quality_index <- list(administration_work = curve(curve5,input_administration_work),
                                 contact_priority_fit_index = curve(curve6,contact_priority_fit_index),
                                 meeting_with_team = curve(curve7,input_meeting_with_team),
                                 kpi_reporting_analysis = curve(curve8,input_kpi_reporting_analysis),
                                 strategy_and_cycle_planning = curve(curve9,input_strategy_and_cycle_planning))

sr_sales_performance <- list(motivation_previous_period = curve(curve32,motivation_index_previous_period),
                             product_knowledge = curve(curve33,product_knowledge),
                             sales_skill = curve(curve34,sales_skill_index),
                             time_with_account = curve(curve35,employee_time_with_account_factor))

