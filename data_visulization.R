#Data visuliasation challenge

library(tidyverse)
covid_data_tbl <- read_csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")

covid_data_selected_tbl <- covid_data_tbl  %>% 
  select(continent,location,date,total_cases)

#Date 1

covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2020-02-29"
                                                                        )) #filter by date

covid_data_selected_date_tbl <- covid_data_selected_date_tbl  %>% select(continent,location,total_cases)

covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Feb 20" = total_cases)


#Date 2
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2020-03-31")) #filter by date


covid_data_selected_date_2 <- covid_data_selected_date_tbl %>% 
  rename("Mar 20" = total_cases)

covid_data_selected_date_2 <- covid_data_selected_date_2  %>% 
  select(location,"Mar 20")
#join Date 1&2

covid_data_selected_tbl_2 <- left_join( covid_data_selected_date_1, covid_data_selected_date_2, by = c("location" = "location"))



group_by(location) %>%
  mutate(cumumalated_cases_loc = cumsum(replace_na(new_cases, 0))) %>%
  ungroup()

geom_line(data      = ...),
aes(x     = date,
    y     = total_cases,
    color = location))