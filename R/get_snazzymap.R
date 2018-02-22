#' Create a stylised google basemap
#' 
#' A wrapper for the \@code{get_googlemap}
#' 
#' @param ... arguments to be supplied to get_googlemap
#' @param map_ref a URL or map ID for the snazzymap style
#' 
#' @seealso get_googlemap
#' 
#' 
#' @export
#' @author Michael Harper
#' 
get_snazzymap <- function(..., url = NULL){
  
  # Extract and format the page style
  style_sm <- ggmapstyleSM(url)
  
  # combine with get_googlemap
  ggmap::get_googlemap(..., style = style_sm)
  
  
  
}


