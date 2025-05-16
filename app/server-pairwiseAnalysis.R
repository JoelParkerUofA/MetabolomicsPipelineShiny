# When
observeEvent(input$submit_data,{
  req(dat())
  
  choices <- names(colData(dat()))
  
  updateSelectInput(session,
                    inputId = "pair_model_vars",
                    choices = c(choices),
                    selected = NULL)
  
  updateSelectInput(session,
                    inputId = "pair_strat_var",
                    choices = c("None", choices),
                    selected = "None")
  
})


# When user clicks "generatePairwise" button create plotlyOutput for
# pairwise_foldChangeHeatmap
observeEvent(input$generatePairwise, {
  req(dat())
  req(input$pair_model_vars)
  

  # Create the plotlyOutput for pairwise_foldChangeHeatmap
  output$pairwise_foldChangeHeatmap <- renderPlotly({
    req(dat())
    req(input$pair_model_vars)
    
    # creating formula using inputs from pair_model_vars
    pair_form <- paste(input$pair_model_vars, collapse = "*")
   
    # Set strat_var to NULL if "None" is selected
    if (input$pair_strat_var == "None") {
      strat_var <- NULL
    } else {
      strat_var <- input$pair_strat_var
    }
    
    
    
     # Call the function to create the heatmap
    analysis <-  metabolite_pairwise(dat(),
                                    form = pair_form,
                                    strat_var = strat_var
    )
    
    # Create the heatmap
    met_p_heatmap(analysis, dat,
                  interactive = TRUE, show_rownames = FALSE,
                  plotlyTitle = "",
                  main = ""
    )
    
    })
})