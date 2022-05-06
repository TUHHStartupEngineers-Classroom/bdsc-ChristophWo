#Data visuliasation challenge

library(tidyverse)
covid_data_tbl <- read_csv("https://covid.ourworldindata.org/data/owid-covid-data.csv")

covid_data_selected_tbl <- covid_data_tbl  %>% 
  select(continent,location,date,total_cases)

# date_format <- covid_data_selected_tbl %>% select(date)
# date_format <- date_format %>% format(date,"%y %b %d")
# 
# date_format <- as.Date(date,format = "%y %b %d")
# 
# date_format <- format(date_format[1], format="%y-%b-%d")
# 
# date_format$newdate <- strptime(as.character(date_format$date), "%y/%b/%d")
# 
# date_format$date <- format(as.Date(date_format$date, format = "%Y-%m-%d"), "%y-%b-%d")
# 
# covid_data_selected_tbl <- covid_data_selected_tbl(dates)

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

covid_data_joined <- left_join( covid_data_selected_date_1, covid_data_selected_date_2, by = c("location" = "location"))

#Date 3
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2020-04-30")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Apr 20" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Apr 20")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 4
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2020-05-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("May 20" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"May 20")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 5
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2020-06-30")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Jun 20" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Jun 20")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 6
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2020-07-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Jul 20" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Jul 20")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 7
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2020-08-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Aug 20" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Aug 20")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 8
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2020-09-30")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Sep 20" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Sep 20")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 9
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2020-10-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Oct 20" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Oct 20")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 10
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2020-11-30")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Nov 20" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Nov 20")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 11
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2020-12-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Dec 20" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Dec 20")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 12
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-01-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Jan 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Jan 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 13
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-02-28")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Feb 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Feb 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 14
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-03-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Mar 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Mar 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 15
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-04-30")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Apr 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Apr 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 16
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-05-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("May 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"May 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 17
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-06-30")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Jun 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Jun 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 18
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-07-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Jul 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Jul 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 19
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-08-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Aug 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Aug 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 20
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-09-30")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Sep 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Sep 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 21
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-10-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Oct 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Oct 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 22
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-11-30")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Nov 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Nov 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 23
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2021-12-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Dec 21" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Dec 21")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 24
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2022-01-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Jan 22" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Jan 22")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 25
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2022-02-28")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Feb 22" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Feb 22")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 26
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2022-03-31")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Mar 22" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Mar 22")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))

#Date 27
covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c("2022-04-30")) #filter by date
covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
  rename("Apr 22" = total_cases)
covid_data_selected_date_1 <- covid_data_selected_date_1  %>% 
  select(location,"Apr 22")
covid_data_joined <- left_join( covid_data_joined, covid_data_selected_date_1, by = c("location" = "location"))


covid_data_joined <- t(covid_data_joined)

covid_data_joined %>% 
  ggplot(x= "Feb 20", aes("Feb 20", location, colour = artist.name)) + 
  #   geom_point()


# last_played_tbl%>%
#   ggplot(x=played_at, aes(played_at, track.name, colour = artist.name)) + 
#   geom_point()


#dates_1 <- c("2020-02-29",
#           "2020-04-30",
#           "2020-06-30",
#           "2020-08-31",
#           "2020-10-31",
#           "2020-12-31",
#           "2021-02-28",
#           "2021-04-30",
#           "2021-06-30",
#           "2021-08-31",
#           "2021-10-31",
#           "2021-12-31",
#           "2022-02-28",
#           "2022-04-30")
#
#dates_2 <- c("2020-03-31",
#            "2020-05-31",
#            "2020-07-31",
#            "2020-09-30",
#            "2020-11-30",
#            "2021-01-31",
#            "2021-03-31",
#            "2021-05-31",
#            "2021-07-31",
#            "2021-09-30",
#            "2021-11-30",
#            "2022-01-31",
#            "2022-03-31")

#months_1 <- c("Feb 20",
#           "Apr 20",
#           "Jun 20",
#           "Aug 20",
#           "Oct 20",
#           "Dec 20",
#           "Feb 21",
#           "Apr 21",
#           "Jun 21",
#           "Aug 21",
#           "Oct 21",
#           "Dec 21",
#           "Feb 22",
#           "Apr 22")

#months_2 <- c("Mar 20",
#              "Mai 20",
#              "Jul 20",
#              "Sep 20",
#              "Nov 20",
#              "Jan 21",
#              "Mar 21",
#              "Mai 21",
#              "Jul 21",
#              "Sep 21",
#              "Nov 21",
#              "Jan 22",
#              "Mar 22")

#j=1
#i=1
#for (i in dates_1) {
#  print(i)
#  print(months_1[j])
#  j<-j+1
#}

#j=1
#for (i in dates_1){
  #Date 1
#  covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c(i)) #filter by date
  
#  covid_data_selected_date_tbl <- covid_data_selected_date_tbl  %>% select(continent,location,total_cases)
  
#  covid_data_selected_date_1 <- covid_data_selected_date_tbl %>% 
#    rename(months_1[j] = total_cases)
  #Date 2
#  covid_data_selected_date_tbl <- covid_data_selected_tbl %>% filter(date == c(dates_2[j])) #filter by date
  
  
#  covid_data_selected_date_2 <- covid_data_selected_date_tbl %>% 
#    rename(months_2[j] = total_cases)
  
#  covid_data_selected_date_2 <- covid_data_selected_date_2  %>% 
#    select(location,months_2[j])
  #join Date 1&2
  
#  covid_data_joined_(j) <- left_join( covid_data_selected_date_1, covid_data_selected_date_2, by = c("location" = "location"))
  
#}

# geom_line(data      = ...),
# aes(x     = date,
#     y     = total_cases,
#     color = location))

# c("2020-02-29",
#   "2020-03-31",
#   "2020-04-30",
#   "2020-05-31",
#   "2020-06-30",
#   "2020-07-31",
#   "2020-08-31",
#   "2020-09-30",
#   "2020-10-31",
#   "2020-11-30",
#   "2020-12-31",
#   "2021-01-31",
#   "2021-02-28",
#   "2021-03-31",
#   "2021-04-30",
#   "2021-05-31",
#   "2021-06-30",
#   "2021-07-31",
#   "2021-08-31",
#   "2021-09-30",
#   "2021-10-31",
#   "2021-11-30",
#   "2021-12-31",
#   "2022-01-31",
#   "2022-02-28",
#   "2022-03-31",
#   "2022-04-30")