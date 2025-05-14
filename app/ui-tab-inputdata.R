fluidRow(
  
  # Include CSS for table formatting
  includeCSS(system.file(package = "table1", "table1_defaults_1.0/table1_defaults.css")),
  
  column(3,
         
         box(width = 12,
             inputid = "input_card",
             title = "Upload Metabolon Data",
             status = "primary",
             collapsible = FALSE,
             closable = FALSE,
             collapsed = FALSE,
             solidHeader = FALSE,
             
             uiOutput("report_button"),
             uiOutput("space"),
             
             radioButtons("example_data","Do you want to use our example data?",
                          choices = c("Yes" = "yes",
                                      "No, upload my own data" = "user_data"),
                          selected = "yes"),
             
             conditionalPanel("input.example_data=='user_data'",
                              fileInput("sample_metadata",
                                        "Upload Sample Metadata",
                                        accept = ".csv"),
                              selectInput("sample_names",
                                          "Select Sample Name Column",
                                          choices = c(NULL),
                                          selected = NULL),
                              
                              fileInput("chemAnno",
                                        "Upload Chemical Annotation Data",
                                        accept = ".csv"),
                              selectInput("chem_id", "Select Chemical ID",
                                          choices = NULL, 
                                          selected = NULL),
                              fileInput("peak_data",
                                        "Upload Peak Data",
                                        accept = ".csv"),
                              radioButtons("preprocessing", 
                                           "Would you like to use MetabolomicsPipelines preprocessing?",
                                           choices = c("Yes" = "Yes", "No" = "No")),

                              
                              conditionalPanel("input.preprocessing=='No'",
                                               fileInput("normalizedData",
                                                         "Upload Normalized Data",
                                                         accept = ".csv"))
                              ),
             
             actionButton("submit_data", 
                          "Submit", 
                          icon("paper-plane"),
                          style = "color: #fff; background-color: #CD0000; border-color: #9E0000")
             
             )
         
         ),
  
  
  column(9,
         
         box(
           width = 12,
           inputId = "sampleMeta",
           title = "Sample Metadata",
           status = "secondary",
           solidHeader = FALSE,
           collapsible = TRUE,
           collapsed = TRUE,
           closable = FALSE,
           
           DT::dataTableOutput("sampleMetadata")
         ),
         
         box(
           width = 12,
           inputId = "chemAnno",
           title = "Chemical Annotation",
           status = "secondary",
           solidHeader = FALSE,
           collapsible = TRUE,
           collapsed = TRUE,
           closable = FALSE,
           DT::dataTableOutput("chemicalAnno")
         ),
         
         box(
           width = 12,
           inputId = "peakData",
           title = "Peak Data",
           status = "secondary",
           solidHeader = FALSE,
           collapsible = TRUE,
           collapsed = TRUE,
           closable = FALSE,
           DT::dataTableOutput("peakData")
         ),
         
         box(
           width = 12,
           inputId = "normalizedData",
           title = "Normalized Data",
           status = "secondary",
           solidHeader = FALSE,
           collapsible = TRUE,
           collapsed = TRUE,
           closable = FALSE,
           DT::dataTableOutput("normalizedData")
         ),
         
         bs4Card(
           width = 12,
           inputID = "descriptiveTable",
           title = "Sampling Distribution",
           
           column(width = 6,
                  selectInput("includedVarsDist","Select Which Variables to Include",
                              choices = NULL,
                              multiple = TRUE)),
         
           column(width = 4,
                  varSelectInput("stratVarDist","Stratify By (Optional)",
                              data = NULL,
                              multiple = FALSE)),
           
           column(width = 12,
                  actionButton("gen_dist_table", 
                               "Generate Distribution Table", 
                               icon("paper-plane"),
                               status = "success"
                               )
           ),
         
           htmlOutput("distTable")
           )
         
    )
)
