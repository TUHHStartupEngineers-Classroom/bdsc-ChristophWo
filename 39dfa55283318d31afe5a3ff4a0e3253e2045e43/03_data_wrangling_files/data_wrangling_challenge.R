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
  select(id,country,date,num_claims,type.y,organization,mainclass_id)

patent_tbl <- patent_tbl %>% filter(type.y %in% c(2)) #filter by type.y =2= US Company
patent_tbl <- patent_tbl %>% separate(col  = date, #seperate date into year,month and day
           into = c("year", "month", "day"),
           sep  = "-", remove = FALSE)

patent_tbl <- patent_tbl %>% filter(year %in% c(2014)) #filter by year =2014

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

#Top 10 companys with new patents in 2014
# A tibble: 10 × 2
#organization                                count
#<chr>                                       <int>
#1 International Business Machines Corporation 20680
#2 Microsoft Corporation                        8126
#3 QUALCOMM Incorporated                        7837
#4 Google Inc.                                  6827
#5 Apple Inc.                                   6090
#6 AT&T INTELLECTUAL PROPERTY I, L.P.           5277
#7 General Electric Company                     5028
#8 Intel Corporation                            4567
#9 GM Global Technology Operations LLC          4208
#10 Hewlett-Packard Development Company, L.P.   4047

patent_tbl_august <- patent_tbl %>% filter(month %in% c("08"))      #filter by month = 08 = August

company_patent_august <- patent_tbl_august %>%   #count patents grouped by company sorted by ascending patent count in august
  group_by(organization) %>%
  summarise(
    count = n()
  ) %>%
  ungroup()%>%
  arrange(desc(count))%>%
  slice(1:10)

# A tibble: 10 × 2
#organization                                count
#<chr>                                       <int>
#1 International Business Machines Corporation  1990
#2 Microsoft Corporation                         878
#3 QUALCOMM Incorporated                         639
#4 Google Inc.                                   630
#5 Apple Inc.                                    568
#6 Intel Corporation                             445
#7 AT&T INTELLECTUAL PROPERTY I, L.P.            427
#8 Hewlett-Packard Development Company, L.P.     378
#9 General Electric Company                      375
#10 Broadcom Corporation                         372



company_patent_groups <- patent_tbl %>%   #Filter for Top 10 companies
  filter(organization %in% c("International Business Machines Corporation", 
                             "Microsoft Corporation","QUALCOMM Incorporated",
                             "Google Inc.",
                             "Apple Inc.",
                             "AT&T INTELLECTUAL PROPERTY I, L.P.",
                             "General Electric Company",
                             "Intel Corporation",
                             "GM Global Technology Operations LLC",
                             "Hewlett-Packard Development Company, L.P."))

company_patent_groups <- company_patent_groups %>%   #count patents grouped by company sorted by ascending patent count
  group_by(mainclass_id) %>%
  summarise(
    count = n()
  ) %>%
  ungroup()%>%
  arrange(desc(count))%>%
  slice(1:6)

# A tibble: 6 × 2
#mainclass_id count
#<chr>        <int>
#  1 NA          6058
#2 455           4868
#3 709           4367
#4 370           4354
#5 707           3321
#6 257           3188
