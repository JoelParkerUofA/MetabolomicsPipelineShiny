

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
  updateSelectInput(inputId = "includedVarsDist",
                       choices  = names(as.data.frame(SummarizedExperiment::colData(dat()))))
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


output$distTable <- renderUI({
  
    #X <- list("GROUP_NAME","TIME1")
  
   charForm <- do.call(paste,c(as.list(input$includedVarsDist), sep="+"))
   
   if(!is.null(input$stratVarDist)){
     charForm = paste0(charForm,"|",input$stratVarDist)
     }
   
   form <- as.formula(paste0("~",charForm))
   
   
   tabTest <- table1(form,
                    data = as.data.frame(colData(dat())))

  tabTest

})


output$Test <- renderPrint({
 class( input$includedVarsDist)
})

