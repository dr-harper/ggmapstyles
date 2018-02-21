
read_html("https://snazzymaps.com/explore") %>%
  str_extract_all("style")

read_html("https://snazzymaps.com/explore") %>%
  str_match_all(html, "<a href=\"(.*?)\"")




pg <- read_html("https://snazzymaps.com/explore")

head(html_attr(html_nodes(pg, "a"), "href"))


install.packages("htmlTreeParse")
