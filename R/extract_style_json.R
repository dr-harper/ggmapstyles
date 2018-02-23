#' Extract JSON from snazzyMaps
#' 
#' For a given web page, this function scrapes the JSON files,
#'   carries out minor reformatting, and convert the object into
#'   a list.
#'   
#' @param mapRef the full Snazzymap page URL, or the ID of the map layer
#' @export
#' @author Michael Harper
#' @importFrom magrittr %>%
#' 
extract_style_json <- function(mapRef){
  
  # Find the full URL
  url <- smart_url(mapRef)
  
  json <- xml2::read_html(url) %>%
    rvest::html_nodes("#style-json") %>% 
    stringr::str_replace_all('<pre id="style-json">', "") %>%
    stringr::str_replace_all("[\r]", "") %>%
    stringr::str_replace_all(" ", "")
  
  rList <- rjson::fromJSON(json)
  
  return(rList)  
}