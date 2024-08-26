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
               icon = icon("wrench"),
               menuSubItem("PCA",tabName = "pca", icon = icon("figma")),
               menuSubItem("Heatmaps",tabName = "heatmaps", icon = icon("stroopwafel"))),
      
      menuItem("Subpathway Analysis", tabName = "subpathAnalysis",
               icon = icon("pen-nib")),
      menuItem("Pairwise Analysis", tabName = "pairwiseAnalysis",
               icon = icon("brush"))
      
    ),
    
  collapsed = TRUE),
  
  
  body = dashboardBody(
    
    tabItems(
      
      tabItem("inputdata",
              source("ui-tab-inputdata.R", local=TRUE)$value),
      
      tabItem("pca",
              source("ui-tab-pca.R", local=TRUE)$value), 
      
      tabItem("heatmaps", 
              source("ui-tab-heatmap.R", local = TRUE)$value)
      
    )
    
  ),
  
  controlbar = dashboardControlbar(),
  title = "DashboardPage"
)

