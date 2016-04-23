library(rvest)
res <- read_html('http://news.ltn.com.tw/list/BreakingNews')
res
lipic <- res %>% html_nodes('.lipic') 
title <- lipic %>% html_nodes('a.picword') %>% html_text() %>%  iconv(from='UTF-8', to='UTF-8')
link <- lipic %>% html_nodes('a.picword') %>% html_attr('href') 
datetime <- lipic %>% html_nodes('span') %>% html_text() %>%  iconv(from='UTF-8', to='UTF-8') 
category <- lipic %>% html_nodes('span > a') %>% html_attr('class') 
ltn_news <- data.frame(title = title, link = link, datetime=datetime)

View(ltn_news)
css <-  read_html('http://news.ltn.com.tw/css/news/style.css?201509', encoding='UTF-8')
library(stringr)
map_table <- css   %>%  iconv(from='UTF-8', to='UTF-8') %>% str_match_all(pattern='.list span a.(.*?):after\\{content:"(.*?)";\\}', string =.)   
map_list = list()
map_list[map_table[[1]][,2]] = map_table[[1]][,3]
cat = sapply(category, function(e)map_list[e]) %>% unlist()
cat
map_list
map_table
map_table[[1]][,3]
map_list['tab7']
map_list$tab2
map_table

may <- list(hat = "black", height=167, weight=55)
may
may %>% unlist()
may
ltn_news <- data.frame(title = title, link = link, datetime=datetime, category=cat)
View(ltn_news)


a <- 'aaa@bbb@ccc'
a

a %>% strsplit('@') %>% .[[1]] %>% .[1]

strsplit(a,'@')
a
b <- strsplit(a,'@')
b
