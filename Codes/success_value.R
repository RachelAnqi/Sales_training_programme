## preparation of success value
purchase_volume <- curve(curve31,
                         sales_performance_of_all_companies_previous_period) 
##
success_value <- list(average_customer_relationship = curve(curve45,
                                                            average_customer_relationship),
                      average_motivation = curve(curve46,average_motivation),
                      average_product_knowledge = curve(curve57,average_product_knowledge),
                      average_sales_skills = curve(curve48,average_sales_skills),
                      contribution_margin = curve(curve49,contribution_margin),
                      total_revenue = curve(curve51,total_revenue))