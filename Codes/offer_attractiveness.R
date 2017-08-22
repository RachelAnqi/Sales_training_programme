####------------------step one--------------------------------------
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








####------------------step two--------------------------------------
## preparatioin of sales skills
input_experience_index <- curve(curve11,input_employee_accumulated_revenue)

## preparation of product knowledge
product_knowledge_addition_current_period <- curve(curve26,input_product_training)

product_knowledge_transfer_value <- curve(curve28,product_knowledge_index_previous_period)

## preparation of sales representative sales performance
sales_skill_index <- list(accumulated_field_work = curve(curve42,input_accumulated_field_work),
                          accumulated_sales_training = curve(curve43,input_accumulated_sales_training),
                          experience_index_previous_period = curve(curve44,
                                                                   input_experience_index_previous_period))

product_knowledge <- list(product_knowledge_addition_current_period,
                          product_knowledge_transfer_value)

motivation_index <- list(meeting_with_team = ({if (junior) {
  curve(curve13,input_meeting_with_team)
} else if(middle){
  curve(curve14,input_meeting_with_team)
} else {curve(curve15,input_meeting_with_team)}}),
sales_target_realization = curve(curve16,input_sales_target_realization),
sales_training = curve(curve17,input_sales_training),
administration_work = curve(curve18,input_administration_work))

employee_time_with_account_factor <- curve(curve35,input_employee_time_with_account) ## by products

## preparation of deployment quality
contact_priority_fit_index ##????











####------------------step three--------------------------------------
## preparation of sales performance
sr_sales_performance <- list(motivation_previous_period = curve(curve32,motivation_index_previous_period),
                             product_knowledge = curve(curve33,product_knowledge),
                             sales_skill = curve(curve34,sales_skill_index),
                             time_with_account = curve(curve35,employee_time_with_account_factor))

deployment_quality_index <- list(administration_work = curve(curve5,input_administration_work),
                                 contact_priority_fit_index = curve(curve6,contact_priority_fit_index),
                                 meeting_with_team = curve(curve7,input_meeting_with_team),
                                 kpi_reporting_analysis = curve(curve8,input_kpi_reporting_analysis),
                                 strategy_and_cycle_planning = curve(curve9,input_strategy_and_cycle_planning))

## preparation of customer relationship
product_knowledge <- list(product_knowledge_addition_current_period,
                          product_knowledge_transfer_value)

promotional_support <- list(strategy_and_cycle_planning = curve(curve29,
                                                                input_strategy_and_cycle_planning),
                            promotional_budget_per_account = curve(curve30,
                                                                   input_promotional_budget_per_account))




####------------------step four--------------------------------------
sales_performance <- list(sr_sales_performance,
                          field_work_per_account = curve(curve40,
                                                         input_field_work_per_account),
                          deployment_quality_index = curve(curve41,
                                                           deployment_quality_index))

customer_relationship <- list(market_share_per_customer = curve(curve1,
                                                                input_market_share_per_customer),
                              product_knowledge = curve(curve2,
                                                        product_knowledge),
                              promotional_support = curve(curve3,
                                                          promotional_support),
                              customer_relationship_previous_period = curve(curve4,
                                                                            customer_relationship_previous_period))

####------------------step five--------------------------------------
offer_attractiveness <- list(customer_relationship_previous_period =
                               curve(curve19,customer_relationship_previous_period),  ##区分product
                             discount = curve(curve24,input_discount),
                             total_sales_performance = curve(curve25,sales_performance))



