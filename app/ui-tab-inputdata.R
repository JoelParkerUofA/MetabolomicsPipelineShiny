fluidRow(
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
                          choices = c("Yes"="yes",
                                      "No, upload my own data"="user_data"),
                          selected = "yes"),
             
             conditionalPanel("input.example_data=='user_data'",
                              fileInput("userDat",
                                        "Upload Metabolon Excel File (.xlsx)",
                                        accept = ".xlsx"),
                              ),
             
             actionButton("submit_data", 
                          "Submit", 
                          icon("paper-plane"),
                          style="color: #fff; background-color: #CD0000; border-color: #9E0000")
             
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
           inputId = "standerdizedData",
           title = "Standardized Data",
           status = "secondary",
           solidHeader = FALSE,
           collapsible = TRUE,
           collapsed = TRUE,
           closable = FALSE,
           DT::dataTableOutput("standData")
         )
         
         )
)