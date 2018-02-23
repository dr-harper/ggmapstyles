#' Create style from JSON
#' 
#' Creates a google maps style URL string from the formatted JSON table. 
#'   The output of this function can be used within the style argument of
#'   get_googlemap.
#'   
#' @param style_list A formatted JSON object within R, as loaded by the
#'   extract_style_json function.
#'   
#' @export
ggmap_style_string <- function(style_list){
  style_string <- ""
  for(i in 1:length(style_list)){
    if("featureType" %in% names(style_list[[i]])){
      style_string <- paste0(style_string, "feature:", 
                             style_list[[i]]$featureType, "|")      
    }
    
    if("elementType" %in% names(style_list[[i]])){
      style_string <- paste0(style_string, "element:", 
                             style_list[[i]]$elementType, "|")      
    }
    elements <- style_list[[i]]$stylers
    a <- lapply(elements, function(x)paste0(names(x), ":", x)) %>%
      unlist() %>%
      paste0(collapse="|")
    style_string <- paste0(style_string, a)
    if(i < length(style_list)){
      style_string <- paste0(style_string, "&style=")       
    }
  }  
  # google wants 0xff0000 not #ff0000
  style_string <- gsub("#", "0x", style_string)
  
  # symbols are converted within the string
  style_string <- gsub("[|]", "%7C", style_string)
  
  return(style_string)
}