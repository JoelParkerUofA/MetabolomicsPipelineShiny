
## Update options for distribution table ---
observeEvent(dat(),{
  updateSelectInput(inputId = "groupVars",
                    choices  = names(as.data.frame(SummarizedExperiment::colData(dat()))))
})


observeEvent(dat(),{
  updateSelectInput(inputId = "stratVar",
                    choices  = names(as.data.frame(SummarizedExperiment::colData(dat()))))
})


output$heatmap <- renderUI({
  
 heatmat<-  metabolite_heatmap(dat(),
                     top_mets = input$metsNumber,
                     group_vars = unlist(input$groupVars),
                     strat_var = input$stratVar,
                     caption = "Heatmap Arranged By Group",
                     Assay = "normalized",
                     sample_names = "PARENT_SAMPLE_NAME")

 
 do.call(tagList, heatmat)
 
 })