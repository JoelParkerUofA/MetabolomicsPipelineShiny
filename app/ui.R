source("helpers.R")


dashboardPage(
  header = dashboardHeader(
    title = dashboardBrand(
      title = "MetabolomicsPipeline"
    )
  ),
  
  sidebar = dashboardSidebar(
    
    sidebarMenu(
      menuItem("Home", tabName = "home", icon = icon("home")),
      menuItem("Upload Data", tabName = "inputdata", icon = icon("upload")),
      menuItem("Exploratory Analysis", tabName = "exploratoryAnalysis",
               icon = icon("wrench")),
      menuItem("Subpathway Analysis", tabName = "subpathAnalysis",
               icon = icon("pen-nib")),
      menuItem("Pairwise Analysis", tabName = "pairwiseAnalysis",
               icon = icon("brush"))
      
    )
    
  ),
  
  
  body = dashboardBody(
    
    tabItems(
      
      tabItem("inputdata",
              source("ui-tab-inputdata.R", local=TRUE)$value)
      
    )
    
  ),
  
  controlbar = dashboardControlbar(),
  title = "DashboardPage"
)

