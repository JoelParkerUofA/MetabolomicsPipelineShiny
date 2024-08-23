## Update options for distribution table ---
observeEvent(dat(),{
  updateSelectInput(inputId = "pcaColor",
                    choices  = names(as.data.frame(SummarizedExperiment::colData(dat()))))
})


output$PCAPlot <- renderPlot({
  
  metabolite_pca(dat(),
                 meta_var = input$pcaColor
  )
  
})