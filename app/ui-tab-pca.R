fluidRow(
  column(3,
         box(label = "Controls",
             width = 12,
             collapsible = FALSE,
             closable = FALSE,
             
             selectInput('pcaColor', "PCA label variable", choices = NULL,
                         selected = NULL),
             
             actionButton("generatePCA", "Generate PCA Plot",
                          icon("paper-plane"),
                          style = "color: #fff; background-color: #CD0000; border-color: #9E0000")
             
             )),
  
  column(9,
         bs4Card(width = 12,
                 label = "Principal Component Analysis",
                 collapsible = FALSE,
                 closable = FALSE,
                 
                 plotOutput("PCAPlot")
                 
                 )
         
         )
)