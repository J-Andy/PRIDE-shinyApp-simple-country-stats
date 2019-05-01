#ui.r

ui <- fluidPage(
  
  titlePanel("Datasets submitted to PRIDE by country"),
  navbarPage("", id="nav",
             tabPanel("Interactive map", 
  leafletOutput("pxd_map", width = 1000, height = 1000) ),
  
  tabPanel("Data explorer",
           fluidRow(
             titlePanel("Work in progress")
           ))
  
  )
)
