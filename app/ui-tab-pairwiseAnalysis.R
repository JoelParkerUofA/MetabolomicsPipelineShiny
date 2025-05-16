fluidRow(
  column(3,
         box(label = "Controls",
             width = 12,
             collapsible = FALSE,
             closable = FALSE,
             
             selectInput("pair_model_vars", "Select Variables For Model",
                         choices = NULL, multiple = TRUE),
             selectInput("pair_strat_var", "Select Variable To Stratify By (Optional).",
                         choices = NULL, selected = NULL),
             actionButton("generatePairwise", "Run Pairwise Analysis",
                          icon("paper-plane"),
                          style = "color: #fff; background-color: #CD0000; border-color: #9E0000")
             
         )),
  
  column(9,
         bs4Card(width = 12,
                 collapsible = FALSE,
                 closable = FALSE,
                 label = "Fold Change Heatmap",
                 plotlyOutput("pairwise_foldChangeHeatmap")
         )
         
  )
)
