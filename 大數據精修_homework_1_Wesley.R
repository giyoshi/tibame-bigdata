library(httr)
library(rvest)
library(magrittr)
res <- GET('http://news.ltn.com.tw/list/BreakingNews')
res
content(res) %>% html_nodes('li.lipic') %>% html_nodes('a')

#Get datetime
datetime <- content(res) %>% html_nodes('li.lipic') %>% html_nodes('span') %>% html_text()
datetime

#Get title
title <- content(res) %>% html_nodes('li.lipic') %>% html_nodes('a.picword') %>% html_text()
title

#GET TAB
tab <- content(res) %>% html_nodes('li.lipic') %>% html_nodes('span') %>% html_nodes('a') %>% html_attr('class') 

#Get URL
url <- 'http://news.ltn.com.tw/list/BreakingNews'
Sys.getlocale()
li <- read_html(url, encoding = 'UTF-8') %>% html_nodes('li.lipic') %>% html_nodes('a') %>% html_attr('href')
li


##Put into data frame

ltn_news <- data.frame(datetime=datetime, title=title, category=tab, url=url)
ltn_news



