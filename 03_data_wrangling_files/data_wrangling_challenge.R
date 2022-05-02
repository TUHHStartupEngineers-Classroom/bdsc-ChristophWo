library(vroom)


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


patent_joined <- left_join( patent_tbl, patent_assignee_tbl, by = c("id" = "patent_id"))
patent_joined <- left_join( patent_joined, assignee_tbl, by = c("assignee_id" = "id"))
patent_joined <- left_join( patent_joined, uspc_tbl, by = c("id" = "patent_id"))
#new_table<-select(continent,date) #for data visualization