fluidRow(
  column(3,
         box(label = "Controls",
             width = 12,
             collapsible = FALSE,
             closable = FALSE,
             
             selectInput('subpath_treat', "Select Treatment Variable",
                         choices = NULL, multiple = FALSE),
             selectInput('subpath_block', "Select Block Variable (Optional)",
                         choices = NULL, selected = NULL),
             selectInput('subpath_strat', "Select Stratification Variable (Optional)",
                         choices = NULL, selected = NULL),
             selectInput('subpath_superpath', "Select Superpathway Variable Name",
                         choices = NULL, selected = NULL),
             selectInput('subpath_subpathway', "Select Subpathway Variable Name",
                         choices = NULL, selected = NULL),
             selectInput('subpath_metabolite', "Select Metabolite ID Name",
                         choices = NULL, selected = NULL),
             
             actionButton("generateSubpathAnalysis", "Run Subpathway Analysis",
                          icon("paper-plane"),
                          style = "color: #fff; background-color: #CD0000; border-color: #9E0000")
             
         )),
  
  column(9,
         bs4Card(width = 12,
                 label = "Significant Subpathways by Model",
                 collapsible = FALSE,
                 closable = FALSE,
                 
                 uiOutput("subpath_by_model")
                 ),
         bs4Card(width = 12,
                 collapsible = FALSE,
                 closable = FALSE,
                 label = "Subpathways within superpathways",
                 uiOutput("subpath_within_superpath")
                ),
         bs4Card(width = 12,
                 collapsible = FALSE,
                 closable = FALSE,
                 label = "Metabolites Within Subpathway",
                 selectInput("subpath_subpathway_plot", "Select Subpathway",
                             choices = NULL, selected = NULL),
                 uiOutput("met_within_subpathway")
                 )
                
        )
) 

