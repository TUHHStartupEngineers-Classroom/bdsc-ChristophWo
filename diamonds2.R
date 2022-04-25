library(tidyverse)

diamonds2 <- readRDS("01_tidyverse_files/diamonds2.rds")

diamonds2 %>% 
  pivot_longer(cols      = c("2008", "2009"), 
               names_to  = 'year', 
               values_to = 'price') %>% 
  head(n = 5)
