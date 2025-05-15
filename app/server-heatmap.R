

# Update selectInput groupVars, stratVar choices based on the input data
observeEvent(dat(), {
  # Check if the input data is available
  req(dat())
  
  choices <- colnames(colData(dat()))
  
  # Update the choices for groupVars and stratVar based on the input data
  updateSelectInput(session, "groupVars", 
                    choices = choices, 
                    selected = choices[1])
  
  updateSelectInput(session, "stratVar", 
                    choices = c("None", choices), 
                    selected = "None")
})



# Make heatmap after generateHeatmap button is pushed using metabolite_heatmap
observeEvent(input$generateHeatmap, {
  # Check if the input data is available
  req(dat())
  
  # Get the selected variables for grouping and stratification
  stratVar <- if(input$stratVar == "None") NULL else input$stratVar
  
  # Get the number of metabolites to include
  metsNumber <- input$metsNumber
  
  # Call the metabolite_heatmap function with the selected parameters
  output$heatmap <- renderPlot({
     heat<- metabolite_heatmap(dat(),
                               top_mets = 50,
                               group_vars = input$groupVars,
                               strat_var = stratVar,
                               caption = "",
                               Assay = "normalized"
            )
   heat
  })
})