#visualization try 2
#Challenge 1

library(tidyverse)
library(ggrepel)
library(ggplot2)
library(maps)
library(maptools)
library(mapdata)
library(ggthemes)
library(tibble)
library(viridis)
library(mapproj)


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
  

#Challenge 2

covid_data_selected_tbl <- covid_data_tbl  %>% 
  select(continent,location,date,total_cases, total_deaths,population)

covid_data_selected_tbl <- covid_data_selected_tbl %>%
  mutate(mortality_rate = (total_deaths/population)*100)

covid_data_selected_tbl <- covid_data_selected_tbl %>% filter(date == c("2022-05-07")) #filter by date
covid_data_selected_tbl <- covid_data_selected_tbl %>%  rename("region" = location)
covid_data_selected_tbl <- covid_data_selected_tbl %>%  select(region,mortality_rate)

plot_data <- data_frame(region=unique(world$region))
plot_data <- left_join( plot_data, covid_data_selected_tbl, by = c("region" = "region"))

world <- map_data("world")


gg <- ggplot()
gg <- gg + geom_map(data=world, map=world,
                    aes(long, lat, map_id=region),
                    color="#2b2b2b", fill=NA, size=0.15)
gg <- gg + geom_map(data=plot_data, map=world,
                    aes(fill=mortality_rate,
                        map_id=region),
                    color="white", size=0.15)
gg <- gg + scale_fill_viridis(name="Mortality Rate")
gg <- gg + coord_map("polyconic")
gg <- gg + theme_map()
gg <- gg + theme(plot.margin=margin(20,20,20,20))
gg <- gg + theme(legend.position=c(0.85, 0.2))
gg