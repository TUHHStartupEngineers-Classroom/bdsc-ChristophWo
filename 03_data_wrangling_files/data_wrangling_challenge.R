library(vroom)
library(tidyverse)
library(dplyr)

#getting patent data
col_types_patent <- list(
  id = col_character(),
  type = col_character(),
  number = col_character(),
  country = col_character(),
  date = col_date("%Y-%m-%d"),
  abstract = col_character(),
  title = col_character(),
  kind = col_character(),
  num_claims = col_double(),
  filename = col_character(),
  withdrawn = col_double()
)

patent_tbl <- vroom(
  file       = "C:/Users/CWolt/Documents/patent_data/patent.tsv", 
  delim      = "\t", 
  col_types  = col_types_patent,
  na         = c("", "NA", "NULL")
)

#getting assignee data
col_types_assignee <- list(
  id = col_character(),
  type = col_character(),
  organization = col_character()
  )

assignee_tbl <- vroom(
  file       = "C:/Users/CWolt/Documents/patent_data/assignee.tsv", 
  delim      = "\t", 
  col_types  = col_types_assignee,
  na         = c("", "NA", "NULL")
)

#getting patent assignee data to connect patent and assignee data

col_types_patent_assignee <- list(
  patent_id = col_character(),
  assignee_id = col_character()
)

patent_assignee_tbl <- vroom(
  file       = "C:/Users/CWolt/Documents/patent_data/patent_assignee.tsv", 
  delim      = "\t", 
  col_types  = col_types_patent_assignee,
  na         = c("", "NA", "NULL")
)

col_types_uspc <- list(
  patent_id = col_character(),
  mainclass_id = col_character()
)

uspc_tbl <- vroom(
  file       = "C:/Users/CWolt/Documents/patent_data/uspc.tsv", 
  delim      = "\t", 
  col_types  = col_types_uspc,
  na         = c("", "NA", "NULL")
)


patent_tbl <- left_join( patent_tbl, patent_assignee_tbl, by = c("id" = "patent_id"))
patent_tbl <- left_join( patent_tbl, assignee_tbl, by = c("assignee_id" = "id"))
patent_tbl <- left_join( patent_tbl, uspc_tbl, by = c("id" = "patent_id"))

patent_tbl <- patent_tbl %>% 
  select(id,country,date,num_claims,type.y,organization,mainclass_id) %>%
  filter(type.y %in% c(2))%>% #filter by type.y =2= US Company
  separate(col  = date, #seperate date into year,month and day
           into = c("year", "month", "day"),
           sep  = "-", remove = FALSE) %>%
  filter(year %in% c(2014)) #filter by year =2014


#patent_tbl_test_part <- patent_tbl %>%  #sort by xerox company patents (used to evaluate sorting and counting)
 # filter(organization %in% c("Xerox Corporation"))

company_patent_count <- patent_tbl %>%   #count patents grouped by company sorted by ascending patent count
  group_by(organization) %>%
  summarise(
    count = n()
  ) %>%
  ungroup()%>%
  arrange(desc(count))%>%
  slice(1:10)
