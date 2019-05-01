#helper functions 


# clean up the google spread sheet

clean.px.countries <- function(px_countries){
  to <- c("United States", "United Kingdom", "Sweden", "Australia", "China", "Belgium", "United Kingdom", "South Korea", "Brazil")
  from <- c("USA", "UK", "Sweden\n", "Australia\n" , "China\n", "Belgium\n","United Kingdom\n", "Republic of Korea", "Brasil")
  
  
  rename <- matrix(to[match(px_countries$Country,from)], nrow=nrow(px_countries))
  index <- which( !is.na(matrix(to[match(px_countries$Country,from)], nrow=nrow(px_countries))))
  
  
  px_countries$Country[index] <- rename[index]
  return(px_countries)
  
}

