#server.R

server <- function(input,output, session){
  
  output$pxd_map <- renderLeaflet(
    {
      # code for a basic plot with leaflet
      # m <- leaflet(px_countries) %>%  addTiles() %>% addMarkers(
      #  lng = ~Long,
      # lat= ~Lat,
      # popup = paste("Number of datasets", px_countries$Freq, "<br>")
        # , clusterOptions = markerClusterOptions()
      
      pal <- colorNumeric(heat.colors(5,alpha =0.71), px_countries$Freq, n = 50)
      
      
      m <- leaflet(px_countries) %>%  
        addTiles() %>% 
        addCircleMarkers(radius= 9, color = pal(px_countries$Freq), stroke = FALSE, fillOpacity = 0.5) %>% 
        addMarkers(popup = paste("Number of datasets", px_countries$Freq, "<br>"), 
                   clusterOptions = markerClusterOptions() ) %>% 
        setView(lng = 13.4 , lat = 52.5, zoom = 4) %>% 
        addLegend("topright", pal = pal, values = ~Freq, title = "Datasets", opacity = 7)
      
      
      m
    }
  )
}