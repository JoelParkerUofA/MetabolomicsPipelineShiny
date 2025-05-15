## Update options for distribution table ---
observeEvent(dat(),{
  updateSelectInput(session,
                    "pcaColor",
                    choices  = names(as.data.frame(colData(dat()))))
})


observeEvent(input$generatePCA,{
  
  output$PCAPlot <- renderPlot({
    # Run PCA
    pca <- metabolite_pca(dat(),
                          meta_var = input$pcaColor
    )
    
    
    # Show PCA
    pca
  })
  
})


