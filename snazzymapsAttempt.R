library(rvest)    # For web scraping
library(stringr)  # 
library(jsonlite)



#https://www.r-bloggers.com/creating-styled-google-maps-in-ggmap/

create_style_string<- function(style_list){
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
  return(style_string)
}



url <- "https://snazzymaps.com/style/141976/rsa"

webpage <- read_html(url)

json <- 
  webpage %>%
  html_nodes("#style-json") %>% 
  str_replace_all('<pre id="style-json">', "") %>%
  str_replace_all("[\r]", "") %>%
  str_replace_all(" ", "")


a <- rjson::fromJSON(json)

style <- create_style_string(a) %>%
  str_replace_all("[|]", "%7C")

style

ggmap(get_googlemap("Southampton, UK", style = style, maptype = "roadmap"))
