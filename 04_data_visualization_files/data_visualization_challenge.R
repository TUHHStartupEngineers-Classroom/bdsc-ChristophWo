#visualization try 2
#Challenge 1

library(tidyverse)
library(ggrepel)
library(ggplot2)
covid_data_tbl <- read_csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")

covid_data_selected_tbl <- covid_data_tbl  %>% 
  select(continent,location,date,total_cases)

covid_data_selected_tbl <- covid_data_selected_tbl %>% filter(location == c("Germany","France","United Kingdom","United States","Spain")) #filter by date


covid_data_selected_tbl%>%
  ggplot(x=date, aes(date, total_cases, colour = location,geom_label("Challenge 1"))) + 
  geom_line()+
  scale_x_date(breaks = "1 month", date_labels = "%b '%y") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  scale_color_manual(values = c("#1b98e0", "#353435","#FF0000", "#00FF00","#FF00FF"))
  


covid_data_selected_tbl <- covid_data_tbl  %>% 
  select(continent,location,date,total_cases)


plot_data %>% ggplot( ... ) +
  geom_map(aes(map_id = ..., ... ), map = world, ... ) +