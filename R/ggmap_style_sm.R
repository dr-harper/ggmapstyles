#' Create a style string for
#' 
#' @param mapRef the full Snazzymap page URL, or the ID of the map layer
#' 
#' @export
#' 
ggmap_style_sm <- function(mapRef){
  
  # Find the full URL
  url <- smart_url(mapRef)
  
  a <- extract_style_json(url)
  style <- ggmap_style_string(a)
  return(style)
}
