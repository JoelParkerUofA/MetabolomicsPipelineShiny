fluidRow(
  column(3,
         box(label = "Controls",
           width = 12,
             collapsible = FALSE,
             closable = FALSE,
             
             selectInput('groupVars', "Annotation Variables",
                         choices = NULL, multiple = TRUE),
             selectInput('stratVar', "Variable To Stratifiy The Plots By (Optional)",
                         choices = NULL, selected = NULL),
             numericInput("metsNumber", "Number Of Metabolites To Include", 
                          min = 1, value = 50),
           actionButton("generateHeatmap", "Generate Heatmap",
                        icon("paper-plane"),
                        style = "color: #fff; background-color: #CD0000; border-color: #9E0000")
             
         )),
  
  column(9,
         bs4Card(width = 12,
                 label = "Heatmap",
                 collapsible = FALSE,
                 closable = FALSE,
                 
                 plotOutput("heatmap")
                 
         )
         
  )
)