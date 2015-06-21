library(rCharts)

shinyUI(fluidPage( 
  titlePanel("Age of UK Armed Forces - 2014"),
 
  fluidRow(   
    column(6,
             showOutput("ORPlot", "nvd3")
    ),
    
    column(6,          
           showOutput("officerPlot", "nvd3")          
    )
  ),
  
  hr(),

  fluidRow(   
    column(5,
           "The above charts provide information on the age distribution, by gender, of the 
           UK Armed Forces. The selectors below this text allow you to specify whether 
           to view the absolute numbers within each age group, or the percentage of the total 
           population (within each gender) that the age group makes up.",
           
           radioButtons("absOrPerc", label = h3("Display Options"),
                        choices = list("Select here for absolute strengths by age" = 1, 
                                       "Select here for percentage make up within gender" = 2),
                        selected = 1)
    ),

    column(7, 
           br(),
           br(),
           br(),
           br(),
           br(),
           br(),
           br(),
           
           p("Design and code for the age pyramids was drawn heavily from", 
                a("Kyle Walker's blog on the subject", 
                  href = "http://walkerke.github.io/2014/06/rcharts-pyramids/"), 
             align = "right"),
           
           p("The source of this data is the",  
                a("2014 UK Armed Forces Population report", 
                  href = "https://www.gov.uk/government/statistics/uk-armed-forces-annual-personnel-report-2014"),
             align = "right")

           
    )
  )
               
               
))