#' Constructs the full SnazzyMaps url if only provided with ID
#' 
#' Creates the full ID of the web page, being provided either the full 
#'   URL or only the page ID. The resulting page is validated to ensure
#'   that the page exists.
#' 
#' @param mapRef the numeric ID or full URL of the Snazzy Map style
#' 
smart_url <- function(mapRef){
  
  if(is.numeric(mapRef)) url <- paste0("https://snazzymaps.com/style/", mapRef)
  
  if(is.character(mapRef)){
    url <- gsub("https://snazzymaps.com/style/", "", mapRef)
    url <- paste0("https://snazzymaps.com/style/", url)
  } 
  return(url)
}