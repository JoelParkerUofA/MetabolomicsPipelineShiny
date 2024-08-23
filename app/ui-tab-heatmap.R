fluidRow(
  column(3,
         box(label = "Controls",
           width = 12,
             collapsible = FALSE,
             closable = FALSE,
             
             selectInput('groupVars', "Column annotation variables", choices = NULL),
             selectInput('stratVar', "Variable to stratifiy the plots by", choices = NULL),
             numericInput("metsNumber", "Number of Metabolites to include", min = 1),
             
         )),
  
  column(9,
         bs4Card(width = 12,
                 label = "Heatmap",
                 collapsible = FALSE,
                 closable = FALSE,
                 
                 plotOutput("PCAPlot")
                 
         )
         
  )
)