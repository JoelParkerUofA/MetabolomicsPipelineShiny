

## Upload Data
dat<- reactive({
  
  if(input$example_data=='yes'){
    data("demoDat", package = "MetabolomicsPipeline")
    
    dat <- demoDat
  } else if(input$example_data == "user_data"){
    
    
    
  }
  
  return(dat)
  
})


## ouput tables -----

output$sampleMetadata <- DT::renderDT({
 samps <-  as.data.frame(SummarizedExperiment::colData(dat()))
 
 datatable(samps, 
           options = list(scrollX = TRUE))
})

output$chemicalAnno <- DT::renderDataTable({
 chem <- as.data.frame(SummarizedExperiment::rowData(dat()))
 
 datatable(chem, 
           options = list(scrollX = TRUE))
 
})


output$standData <- DT::renderDataTable({
  norm <- as.data.frame(dat()@assays@data$normalized) %>%
    tibble::rownames_to_column(var = "chem_ID")
  
  datatable(norm, 
            options = list(scrollX = TRUE))
})
