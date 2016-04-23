library(magrittr)
download.file('https://raw.githubusercontent.com/ywchiu/rtibame/master/appledaily.RData', 'appledaily.RData')
View(appledaily)

class(appledaily)
dim(appledaily)
str(appledaily)
appledaily[1,]
appledaily[1,"title"]
appledaily[1:3,'title']
appledaily[1,"content"]
strsplit(appledaily[1,'content'], 'googletag')[[1]][1]
appledaily[1, 'content'] %>% strsplit('googletag') %>% .[[1]] %>% .[1]

#trimws  means trim white space
appledaily[1, 'content'] %>% strsplit('googletag') %>% .[[1]] %>% .[1] %>% trimws()

appledaily[1,"content"] %>% strsplit("googletag") %>% .[[1]] %>% .[1] %>% trimws() %>% strsplit('[ \n\r]+') %>% unlist() %>% paste(collapse=' ')


appledaily
contentclean <- function(news){
  news %>% strsplit("googletag") %>% .[[1]] %>% .[1] %>% trimws() %>% strsplit('[ \n\r]+') %>% unlist() %>% paste(collapse=' ')
}
appledaily$content <- sapply(appledaily$content, contentclean)
appledaily$content
##取出人氣
View(appledaily)
appledaily[1,"clicked"] %>% gsub('.*\\((\\d+)\\)','\\1', x=.)
head(appledaily)

appledaily$view_cnt <- appledaily$clicked %>% gsub('.*\\((\\d+)\\)','\\1', x=.)
View(appledaily)

appledaily$clicked = NULL

appledaily$dt <- strptime(appledaily$dt, "%Y年%m月%d日%H:%M")
appledaily$dt <- as.POSIXct(appledaily$dt)

class(appledaily$dt)
