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
  
  json <- suppressWarnings(
    xml2::read_html(url) %>%
    rvest::html_nodes("#style-json") %>%
    stringr::str_replace_all('<pre id="style-json">', "") %>%
    stringr::str_replace_all("[\r]", "") %>%
    stringr::str_replace_all(" ", "") %>%
    stringr::str_replace_all(":\\&style", "\\&style") %>%
    stringr::str_replace_all("\\&style\\&style", "\\&style")
  )
  
  # bug in Rjson throws error currently
  # https://github.com/dkahle/ggmap/issues/217
  rList <- invisible(rjson::fromJSON(json))
  return(rList)
}