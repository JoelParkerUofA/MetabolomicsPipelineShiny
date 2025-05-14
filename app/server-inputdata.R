## Upload data
dat <- eventReactive(input$submit_data, {
  if(input$example_data == 'yes'){
    data("demoSampleMeta", package = "MetabolomicsPipeline")
    data("demoChemAnno", package = "MetabolomicsPipeline")
    data("demoPeak", package = "MetabolomicsPipeline")
    
    dat <- create_met_se(chemical_annotation = demoChemAnno,
                         sample_metadata = demoSampleMeta,
                         peak_data = demoPeak,
                         chemical_id = "CHEM_ID",
                         sample_names = "PARENT_SAMPLE_NAME")
    
    dat <- median_standardization(dat, assay = "peak")
    dat <- min_val_impute(dat, assay = "median_std") 
    dat <- log_transformation(dat, assay = "min_impute")
    
    dat
  }
})



# Update options for distribution table
observeEvent(input$submit_data,{
  req(dat())
  
  choices <- names(colData(dat()))
  
  updateSelectInput(session,
                    inputId = "includedVarsDist",
                    choices = c(choices),
                    selected = NULL)
  
  updateSelectInput(session,
                    inputId = "stratVarDist",
                    choices = c("None", choices),
                    selected = "None")
  
})



## Render Metadata, Chemical Annotation, Peak, and Normalized data tables. 
output$sampleMetadata <- renderDT({
  req(dat())
  datatable(as.data.frame(dat()@colData),
            filter = "top",
            options = list(scrollX = TRUE))
})

output$chemicalAnno <- renderDT({
  req(dat())
  datatable(as.data.frame(rowData(dat())),
            filter = "top",
            options = list(scrollX = TRUE))
})


output$peakData <- renderDT({
  datatable(as.data.frame(assay(dat(), "peak")),
            filter = "top",
            options = list(scrollX = TRUE))
})

output$peakData <- renderDT({
  datatable(as.data.frame(assay(dat(), "peak")),
            filter = "top",
            options = list(scrollX = TRUE))
})


output$normalizedData <- renderDT({
  datatable(as.data.frame(assay(dat(), "normalized")),
            filter = "top",
            options = list(scrollX = TRUE))
})


# Generate distribution table -------------
observeEvent(input$gen_dist_table,{
  form <- as.formula(
    if(input$stratVarDist == "None"){
      paste0("~ ", paste(input$includedVarsDist, collapse = " + "))
    } else {
      paste0("~ ", paste(input$includedVarsDist, collapse = " + "), " | ",
             input$stratVarDist)
    }
    )
  
  output$distTable <- renderUI({
    table1(form, data = colData(dat()))
  })
})


