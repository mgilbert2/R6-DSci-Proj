install.packages("rvest")
library(rvest)
url <- "https://www.ign.com/wikis/rainbow-six-siege/Weapons_and_Equipment"
page <- read_html(url)
table_data <- page %>%
  html_nodes("section.jsx-2191675443.jsx-380427680.jsx-28683165.wiki-section.wiki-html table") %>%
  html_table()
my_table <- table_data[[1]]