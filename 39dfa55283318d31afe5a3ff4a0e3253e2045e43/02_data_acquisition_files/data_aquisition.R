library(RSQLite)
con <- RSQLite::dbConnect(drv    = SQLite(), #connects the database
                          dbname = "02_data_acquisition_files/02_chinook/Chinook_Sqlite.sqlite")
dbListTables(con)
tbl(con, "Album") #lists an Album
album_tbl<-tbl(con, "Album")%>% collect() #pulls data into local memory
x <- dbGetQuery(con, 'SELECT * FROM Artist')

dbDisconnect(con)#disconnect from the database
con

library(glue)
name <- "Fred"
glue('My name is {name}.')


library(httr)
GET("https://swapi.dev/api/people/?page=3")

library(httr)
resp <- GET("https://swapi.dev/api/people/1/")

# Wrapped into a function
sw_api <- function(path) {
  url <- modify_url(url = "https://swapi.dev", path = glue("/api{path}"))
  resp <- GET(url)
  stop_for_status(resp) # automatically throws an error if a request did not succeed
}
resp <- sw_api("/people/1")
resp

rawToChar(resp$content)#converts raw unicode to character vector
fromJSON(resp$content)

library(tidyverse) #load pipeline functiont
rawToChar(resp$content) %>% fromJSON #pipelined function to cinvers from JSON
rawToChar(resp$content) %>% fromJSON %>% toJSON #and back to JSON

data_list <- list(strings= c("string1", "string2"), 
                  numbers = c(1,2,3), 
                  TRUE, 
                  100.23, 
                  tibble(
                    A = c(1,2), 
                    B = c("x", "y")
                  )
)

library(jsonlite)
resp %>% 
  .$content %>% 
  rawToChar() %>% 
  fromJSON()

content(resp, as = "text")
content(resp, as = "parsed")
content(resp)#automated parsing 

resp <- GET('https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=WDI.DE')
resp

token    <- "my_individual_token"#we need a indivdual API key to access the data
response <- GET(glue("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=WDI.DE&apikey={token}"))
response

library(RSQLite)
Sys.getenv('userid')#get userID and password
Sys.getenv('pwd')

library(httr)
alphavantage_api_url <- "https://www.alphavantage.co/query"
ticker               <- "WDI.DE"
# You can pass all query parameters as a list to the query argument of GET()
GET(alphavantage_api_url, query = list('function' = "GLOBAL_QUOTE",
                                       symbol     = ticker,
                                       apikey     = Sys.getenv('TOKEN'))
)

library(keyring)
library(httr)
keyring::key_set("token")
GET(alphavantage_api_url, query = list('function' = "GLOBAL_QUOTE",
                                       symbol     = ticker,
                                       apikey     = key_get("token"))
)

library(httr)
library("rstudioapi")#enter credentials in a box that masks input
GET(alphavantage_api_url, query = list('function' = "GLOBAL_QUOTE",
                                       symbol     = ticker,
                                       apikey     = askForPassword("token"))
)

library(rvest)#scrape websites
library(stringr)

# get the URL for the wikipedia page with all S&P 500 symbols
url <- "https://en.wikipedia.org/wiki/List_of_S%26P_500_companies"
# use that URL to scrape the S&P 500 table using rvest
library(rvest)
sp_500 <- url %>%
  # read the HTML from the webpage
  read_html() %>%
  # Get the nodes with the id
  html_nodes(css = "#constituents") %>%
  # html_nodes(xpath = "//*[@id='constituents']"") %>% 
  # Extract the table and turn the list into a tibble
  html_table() %>% 
  .[[1]] %>% 
  as_tibble()

url  <- "https://www.imdb.com/chart/top/?ref_=nv_mv_250" #scrape IMDB list
html <- url %>% 
  read_html()

rank <-  html %>% 
  html_nodes(css = ".titleColumn") %>% 
  html_text() %>% 
  # Extrag all digits between " " and ".\n" The "\" have to be escaped
  # You can use Look ahead "<=" and Look behind "?=" for this
  stringr::str_extract("(?<= )[0-9]*(?=\\.\\n)")%>% 
  # Make all values numeric
  as.numeric()

title <- html %>% 
  html_nodes(".titleColumn > a") %>% 
  html_text()

year <- html %>% 
  html_nodes(".titleColumn .secondaryInfo") %>%
  html_text() %>% 
  # Extract numbers
  stringr::str_extract(pattern = "[0-9]+") %>% 
  as.numeric()

people <- html %>% 
  html_nodes(".titleColumn > a") %>% 
  html_attr("title")

rating <- html %>% 
  html_nodes(css = ".imdbRating > strong") %>% 
  html_text() %>% 
  as.numeric()

num_ratings <- html %>% 
  html_nodes(css = ".imdbRating > strong") %>% 
  html_attr('title') %>% 
  # Extract the numbers and remove the comma to make it numeric values
  stringr::str_extract("(?<=based on ).*(?=\ user ratings)" ) %>% 
  stringr::str_replace_all(pattern = ",", replacement = "") %>% 
  as.numeric()

imdb_tbl <- tibble(rank, title, year, people, rating, num_ratings)#merge into a table


library(purrr)
numbers <- c(1:5)
# purr functional programming approach (for loop)
numbers_list <- map(numbers, print)


library(jsonlite)
bike_data_lst <- fromJSON("02_data_acquisition_files//bike_data.json")
# Open the data by clicking on it in the environment or by running View()
View(bike_data_lst)

#productDetail --> variationAttributes --> values --> [[1]] --> displayValue
#If we go to the right side of the viewer, a button appears. 
#Clicking it will send the code to the console, that extract exactly those values.

bike_data_lst %>%#you can do the same with pluck
  purrr::pluck("productDetail", "variationAttributes", "values", 1, "displayValue")