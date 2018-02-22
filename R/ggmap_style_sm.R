#' Create a style string for


ggmap_style_sm <- function(url){
  
  a <- extract_json(url)
  style <- create_style_string(a)
  return(style)
}
