fluidRow(
  column(3,
         box(label = "Controls",
             width = 12,
             collapsible = FALSE,
             closable = FALSE,
             
             selectInput('subpath_box', "Select Subpathway",
                         choices = NULL, multiple = TRUE),
             selectInput('subpath_box_treat', "Select Treatment Variable",
                         choices = NULL, multiple = TRUE),
             selectInput('subpath_box_block', "Select Block Variable (Optional)",
                         choices = NULL, selected = NULL),
             
             selectInput("subpath_box_strat", "Select variable to stratify by (Optional)",
                         choices = NULL, selected = NULL),
             actionButton("generateSubpathBox", "Create Plot",
                          icon("paper-plane"),
                          style = "color: #fff; background-color: #CD0000; border-color: #9E0000")
         )),
  column(9,
         bs4Card(width = 12,
                 label = "Metabolites Within Subpathway Box Plot",
                 collapsible = FALSE,
                 closable = FALSE,
                 plotOutput("subpath_box_plot")
         )
  )
)