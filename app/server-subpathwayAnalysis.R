# When submit_data is clicked, update subpath_treat, subpath_block, and subpath_strat
# with the selected values from colData(dat()).
#

observeEvent(input$submit_data, {
  req(dat())
  
  # Update the selectInput for subpath_treat with the selected values from colData(dat())
  updateSelectInput(session, "subpath_treat", choices = colnames(colData(dat())))
  
  # Update the selectInput for subpath_block with the selected values from colData(dat())
  updateSelectInput(session, "subpath_block", choices = c("None",colnames(colData(dat()))))
  
  # Update the selectInput for subpath_strat with the selected values from colData(dat())
  updateSelectInput(session, "subpath_strat", choices = c("None",colnames(colData(dat()))))
  
  # Update subpath_subpathway with the selected values from rowData(dat())
  updateSelectInput(session, "subpath_subpathway", choices = colnames(rowData(dat())))
  
  # Update subpath_superpathway with the selected values from rowData(dat())
  updateSelectInput(session, "subpath_superpath", choices = colnames(rowData(dat())))
  
  # Update subpath_metabolite with the selected values from rowData(dat())
  updateSelectInput(session, "subpath_metabolite", choices = colnames(rowData(dat())))
})

# Update subpath_subpathway_plot with the selected values from rowData(dat())
# when subpath_subpathway is updated
observeEvent(input$subpath_subpathway, {
  req(dat())
  
  # Update the selectInput for subpath_subpathway_plot with the selected values from rowData(dat())
  updateSelectInput(session, "subpath_subpathway_plot", choices = rowData(dat())[[input$subpath_subpathway]])
})


# When generateSubpathAnalysis is clicked, run the subpathway analysis
observeEvent(input$generateSubpathAnalysis, {
  req(dat())
  
  # Get the selected values from the inputs
  treat <- input$subpath_treat
  block <- input$subpath_block
  strat <- input$subpath_strat
  superpathway <- input$subpath_superpath
  subpathway <- input$subpath_subpathway
  metabolite <- input$subpath_metabolite
  
  # run subpathway analsysis
  analysis <- subpathway_analysis(dat(),
                                  treat_var = treat,
                                  block_var = block,
                                  strat_var = strat,
                                  Assay = "normalized",
                                  subPathwayName = subpathway,
                                  superPathwayName = superpathway,
                                  chemName = metabolite
  )
  
  output$subpath_by_model <- renderUI({
    req(analysis)
    
    HTML(subpath_by_model(analysis))
  })
  
  output$subpath_within_superpath <- renderUI({
    req(analysis)
    
    HTML(subpath_within_superpath(analysis))
  })
  output$met_within_subpathway <- renderUI({
    req(analysis)
    req(input$subpath_subpathway_plot)
    
    tables <- met_within_sub(analysis,
                             subpathway = input$subpath_subpathway_plot
    )
    # Combine and return as HTML
    HTML(paste(tables, collapse = "<br><br>"))
  })
  
})
  
