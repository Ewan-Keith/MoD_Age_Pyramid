library(shiny)
library(rCharts)

shinyServer(function(input, output) {
  
  
  ####### Read, clean and organise data ########
  age.data <- read.csv("age structure data.csv")
  age.data$numbers[age.data$gender == "male"] <- age.data$numbers[age.data$gender == "male"]*-1
  age.data$percent[age.data$gender == "male"] <- age.data$percent[age.data$gender == "male"]*-1
  
  officer.data <- age.data[age.data$rank.type == "officer",]
  OR.data <- age.data[age.data$rank.type == "other.rank",]
  
  ####### Plots ########
  ######################
    
    ###### OR Numbers Plot ########
    ####################################
  
  n1 <- nPlot(
    y = 'numbers', 
    x = 'Age.group', 
    group = 'gender', 
    type = 'multiBarHorizontalChart', 
    data = OR.data)
  
  # reorder the age axis
  n1$chart(xDomain = c("50 and over", "45-49", "40-44", "35-39",
                       "30-34", "25-29", "20-24", "18-19", "Under 18"))
  
  # set stacked as default, no major influence
  n1$chart(stacked = TRUE)
  
  # adjust the tooltip message
  n1$chart(tooltipContent = "#! function(key, x, y, e){
           var format = d3.format('0,000');
           return '<h3>' + key + ', age ' + x + '</h3>' + 
           '<p>' + 'Population: ' + y + '</p>'
} !#")
  
  # adjust population axis
  n1$yAxis(axisLabel = "Population",  
           tickFormat = "#! function(d) {
           var format = d3.format('0,000');
           return format(Math.abs(d))
           } !#")
  
  # adjust margins to prevent cutoffs
  n1$chart(margin = list(left = 70, right = 40))
  
  # add title using online template
  n1$templates$script <- "http://timelyportfolio.github.io/rCharts_nvd3_templates/chartWithTitle.html"
  n1$set(title = "Age of Other Ranks")
  
  # set colours
  n1$chart(color = c('darkred', 'silver'))
  
  n1$chart(showControls = FALSE)

  
  ###### OR Percent Plot ########
  ####################################
  
  n3 <- nPlot(
    y = 'percent', 
    x = 'Age.group', 
    group = 'gender', 
    type = 'multiBarHorizontalChart', 
    data = OR.data)
  
  # reorder the age axis
  n3$chart(xDomain = c("50 and over", "45-49", "40-44", "35-39",
                       "30-34", "25-29", "20-24", "18-19", "Under 18"))
  
  # set stacked as default, no major influence
  n3$chart(stacked = TRUE)
  
  # adjust the tooltip message
  n3$chart(tooltipContent = "#! function(key, x, y, e){
           var format = d3.format('0,000');
           return '<h3>' + key + ', age ' + x + '</h3>' + 
           '<p>' + 'Population: ' + y + '</p>'
} !#")
  
  # adjust population axis
  n3$yAxis(axisLabel = "Percentage",  
           tickFormat = "#! function(d) {
           var format = d3.format('%');
           return format(Math.abs(d))  
           } !#")
  
  # adjust margins to prevent cutoffs
  n3$chart(margin = list(left = 70, right = 40))
  
  # add title using online template
  n3$templates$script <- "http://timelyportfolio.github.io/rCharts_nvd3_templates/chartWithTitle.html"
  n3$set(title = "Age of Other Ranks")
  
  # set colours
  n3$chart(color = c('darkred', 'silver'))
  
  n3$chart(showControls = FALSE)
  
  ###### Officer Numbers Plot ########
  ####################################  
  
  n2 <- nPlot(
    y = 'numbers', 
    x = 'Age.group', 
    group = 'gender', 
    type = 'multiBarHorizontalChart', 
    data = officer.data)
  
  # reorder the age axis
  n2$chart(xDomain = c("50 and over", "45-49", "40-44", "35-39",
                       "30-34", "25-29", "20-24", "18-19", "Under 18"))
  
  # set stacked as default, no major influence
  n2$chart(stacked = TRUE)
  
  # adjust the tooltip message
  n2$chart(tooltipContent = "#! function(key, x, y, e){
           var format = d3.format('0,000');
           return '<h3>' + key + ', age ' + x + '</h3>' + 
           '<p>' + 'Population: ' + y + '</p>'
} !#")
  
  # adjust population axis
  n2$yAxis(axisLabel = "Population",  
           tickFormat = "#! function(d) {
           var format = d3.format('0,000');
           return format(Math.abs(d))  
           } !#")
  
  # adjust margins to prevent cutoffs
  n2$chart(margin = list(left = 70, right = 40))
  
  n2$templates$script <- "http://timelyportfolio.github.io/rCharts_nvd3_templates/chartWithTitle.html"
  n2$set(title = "Age of Officers")
  
  n2$chart(showControls = FALSE)
  
  ###### Officer Percent Plot ########
  ####################################
  
  n4 <- nPlot(
    y = 'percent', 
    x = 'Age.group', 
    group = 'gender', 
    type = 'multiBarHorizontalChart', 
    data = officer.data)
  
  # reorder the age axis
  n4$chart(xDomain = c("50 and over", "45-49", "40-44", "35-39",
                       "30-34", "25-29", "20-24", "18-19", "Under 18"))
  
  # set stacked as default, no major influence
  n4$chart(stacked = TRUE)
  
  # adjust the tooltip message
  n4$chart(tooltipContent = "#! function(key, x, y, e){
               var format = d3.format('0,000');
               return '<h3>' + key + ', age ' + x + '</h3>' + 
               '<p>' + 'Population: ' + y + '</p>'
    } !#")
  
  # adjust population axis
  n4$yAxis(axisLabel = "Percentage",  
           tickFormat = "#! function(d) {
               var format = d3.format('%');
               return format(Math.abs(d))  
  } !#")
  
  # adjust margins to prevent cutoffs
  n4$chart(margin = list(left = 70, right = 40))
  
  n4$templates$script <- "http://timelyportfolio.github.io/rCharts_nvd3_templates/chartWithTitle.html"
  n4$set(title = "Age of Officers")
  
  n4$chart(showControls = FALSE)
  
  ########################
    
    output$ORPlot <- renderChart2({
      if(input$absOrPerc == 1){
      
        return(n1)
      
      }else{
        
        return(n3)
      }
    })
    
  ####################################
    
  output$officerPlot <- renderChart2({
    if(input$absOrPerc == 1){
      
      return(n2)
    
    }else{
      
      return(n4)
      
    }
    
  })
    

  })
  
  
  
  
  






