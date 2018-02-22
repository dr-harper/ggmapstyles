library(rvest)

b <- read_html("https://snazzymaps.com/press") %>%
  html_nodes(xpath = '//*[@class="figure-stat-value"]') %>%
  .[2] %>%
  str_replace('<div class="figure-stat-value">', "") %>%
  str_replace('\r\n</div>', "")



