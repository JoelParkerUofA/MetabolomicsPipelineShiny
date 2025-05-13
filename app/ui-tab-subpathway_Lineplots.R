fluidRow(
  column(3,
         box(label = "Controls",
             width = 12,
             collapsible = FALSE,
             closable = FALSE,
             
             selectInput('subpath_line', "Select Subpathway",
                         choices = NULL, multiple = TRUE),
             selectInput('subpath_treat', "Select Treatment Variable",
                         choices = NULL, multiple = TRUE),
             selectInput('subpath_block', "X Axis (Must by numeric)",
                         choices = NULL, selected = NULL),
             
             selectInput("subpath_strat", "Select variable to stratify by (Optional)",
                         choices = NULL, selected = NULL),
             actionButton("generateSubpathLine", "Create Plot",
                          icon("paper-plane"),
                          style = "color: #fff; background-color: #CD0000; border-color: #9E0000")
         )),
  column(9,
         bs4Card(width = 12,
                 label = "Metabolites Within Subpathway Line Plot",
                 collapsible = FALSE,
                 closable = FALSE,
                 plotOutput("subpath_lineplot")
                 )
         )
)