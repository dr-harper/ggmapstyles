#' Create a google maps style string
#' 
#' Provided with a SnazzyMap ID, this function will return a formatted stylestring
#'  that can be used within the \code{get_googlemap} function.
#' 
#' @param mapRef the full Snazzymap page URL, or the ID of the map layer
#' @seealso \code{\link[ggmap]{get_googlemap}}
#' @export
#' 
ggmap_style_sm <- function(mapRef){
  
  # Find the full URL
  url <- smart_url(mapRef)
  
  a <- extract_style_json(url)
  style <- ggmap_style_string(a)
  return(style)
}
