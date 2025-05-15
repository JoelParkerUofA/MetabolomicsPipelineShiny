source("helpers.R")
shinyServer(function(input, output, session) {
  
  #source("server-rightsidebar.R",local = TRUE)
  source("server-inputdata.R",local = TRUE)
  
  source("server-pca.R", local = TRUE)
 
   source("server-heatmap.R",local = TRUE)
  
  source("server-subpathwayAnalysis.R", local = TRUE)

}
)
