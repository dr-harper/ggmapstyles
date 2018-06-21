
#' Access built-in map styles
#' 
#' A selection of themes included within the ggmapstyles package. These will 
#'  potentially be more robust to future changes in the Snazzymaps interface.
#'  
#' @param name a character string of the internal style. Examples include "apple-like", "Avocado World" and "darkdetail".
#' @param ID a character string of the ID.
#' @param random TRUE/FALSE. Select a random style from the stored values.
#' @return a googlemap stylestring which can be used within the `style` argument of get_googlemap
#' 
#' @seealso \code{\link[ggmap]{get_googlemap}}
#' @seealso \code{\link{list_styles}}
#' @examples
#'  map_style("Apple Like") 
#'  map_style(ID = "98")
#'  map_style(random = TRUE)
#' @export
#' 
map_style <- function(name = NULL, ID = NULL, random = FALSE){
  
  if(!is.null(name) & !is.null(ID)){
    stop("Please only specify either 'name' or 'ID', not both.")
    }
  
  # Load the CSV containing styles
  styles <- utils::read.csv(file = system.file("mapStyles.csv", package = "ggmapstyles"),
                     stringsAsFactors = FALSE)
  
  # Select a style at random if random = TRUE
  if(isTRUE(random)){
    
    number <- sample(1:nrow(styles), 1)
    style <- styles[number, ]
    
    # Message and return
    message("Selected style ", style$ID, ": ", style$Name)
    
  }
  
  # Return if name selected
  if(is.character(name)){
    style <- styles[styles$Name == name,]
  }
  
  # Return if name selected
  if(is.character(ID)){
    style <- styles[styles$ID == ID, ]
  }
  
  return(style$string)
  
}



#' List all the ggmap styles available
#' 
#' Shows the names, ID and description of the cached ggmap styles.
#' 
#' @param ... additional arguments
#' 
#' @export
#' @example list_styles()
#' 
list_styles <- function(...){
  
  styles <- utils::read.csv(file = system.file("mapStyles.csv", package = "ggmapstyles"), stringsAsFactors = FALSE)
  
  # Print a table of the styles
  return(styles[,1:3])
  
}


