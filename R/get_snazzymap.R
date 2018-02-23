#' Create a stylised google basemap
#' 
#' A wrapper for the \@code{get_googlemap}
#' 
#' @param ... arguments to be supplied to get_googlemap
#' @param mapRef a URL or map ID for the snazzymap style
#' 
#' @seealso get_googlemap
#'  
#' @export
#' @author Michael Harper
#' 
get_snazzymap <- function(..., mapRef = NULL){
  
  # Find the full URL
  url <- smart_url(mapRef)
  
  # Extract and format the page style
  style_sm <- ggmap_style_sm(url)
  
  # combine with get_googlemap
  ggmap::get_googlemap(..., style = style_sm)
  
  
  
}


