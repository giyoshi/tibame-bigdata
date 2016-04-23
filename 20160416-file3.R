a <- '       Hi This is a smaple.             '
a
trimws(a)
trimws(a, 'left')
trimws(a, 'le')
trimws(a,'l')
trimws(a, 'r')
trimws(a, 'b')

a %>% trimws()
a
a %>% strsplit(' ')  %>% .[[1]]

paste('hello','world')
paste0('hello', 'world')
paste('hello', 'world', 'ahah', 'eee', 'grat')
paste('hello', 'world', 'ahah', 'eee', 'grat', sep='&')

gsub(x = 'Taiwan v.s. China : 99 v.s. 20', '(\\w+) v.s. \\w+ : \\d+ v.s. \\d+', '\\1')
gsub(x = 'Taiwan v.s. China : 99 v.s. 20', '\\w+ v.s. (\\w+) : \\d+ v.s. \\d+', '\\1')

gsub(x='人氣(123)',pattern = '.{2}\\((\\d+)\\)','\\1')

a <- 'ABD@DFGDFSHG@RETER'
gsub(x=a, pattern = '.+@(.+)@.+','\\1')
