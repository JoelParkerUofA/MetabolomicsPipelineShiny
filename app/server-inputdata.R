

## Upload Data
dat<- reactive({
  
  if(input$example_data=='yes'){
    data("demoDat", package = "MetabolomicsPipeline")
    
    dat <- demoDat
  } else if(input$example_data == "user_data"){
    
    
    
  }
  
  return(dat)
  
})

## Update options for distribution table ---
observeEvent(dat(),{
  updateVarSelectInput(inputId = "includedVarsDist",
                       data = as.data.frame(SummarizedExperiment::colData(dat())))
})


observeEvent(dat(),{ 
            updateVarSelectInput(inputId = "stratVarDist",
             data = as.data.frame(SummarizedExperiment::colData(dat())))
  } )

## output tables -----

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


output$distTable <- renderPrint({
  
    
  
   #charForm <- do.call(paste,c(X, sep="+"))
   
   #form <- as.formula(paste0("~",charForm))
   
   
   tabTest <- table1(~,
                    data = as.data.frame(colData(dat())))

  

})
