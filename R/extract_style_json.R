#' Extract JSON from snazzyMaps
#' 
#' For a given web page, this function scrapes the JSON files,
#'   carries out minor reformatting, and convert the object into
#'   a list.
#'   
#' @param mapRef either the full Snazzymap page URL, or the ID of the map layer
#' 
#' @importFrom xml2 read_html
#' @importFrom stringr str_replace_all
#' @importFrom rjson fromJSON
#' @export
#' @author Michael Harper
#' 
extract_style_json <- function(mapRef){
  
  json <- xml2::read_html(url) %>%
    html_nodes("#style-json") %>% 
    str_replace_all('<pre id="style-json">', "") %>%
    str_replace_all("[\r]", "") %>%
    str_replace_all(" ", "")
  
  rList <- rjson::fromJSON(json)
  
  return(rList)  
}