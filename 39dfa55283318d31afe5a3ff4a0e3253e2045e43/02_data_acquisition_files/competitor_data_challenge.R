
  
  # WEBSCRAPING ----

# 1.0 LIBRARIES ----

library(tidyverse) # Main Package - Loads dplyr, purrr, etc.
library(rvest)     # HTML Hacking & Web Scraping
library(xopen)     # Quickly opening URLs
library(jsonlite)  # converts JSON files to R objects
library(glue)      # concatenate strings
library(stringi)   # character string/text processing
library(purrr)
library(unglue)


# 1.1 COLLECT PRODUCT FAMILIES ----

url_home          <- "https://www.rosebikes.de/fahrr%C3%A4der/gravel"
html_home         <- read_html(url_home)
#xopen(url_home) # Open links directly from RStudio to inspect them

# 01. Get available bike categories ----
bike_category_tbl <- html_home %>%
  
  # Get the nodes for the families ...
  html_nodes(css = "h4.basic-headline__title") |> #("element is h4 .class")
  html_text() |> 
  as_tibble()
  

bike_price_tbl <- html_home %>%
# Get the nodes for the prices ...
html_nodes(css = ".catalog-category-bikes__price-title") |> #(.class)
  html_text() |>
  as_tibble()

  cleaned<-gsub("[^0.-9,-]","",bike_price_tbl)
  cleaned<-str_remove_all(cleaned,",00")
  
  bike_price_cleaned<-as_tibble(cleaned)
  bike_price_cleaned_s<-bike_price_cleaned%>%separate(col    = value,
                    into   = c("1", "2", "3","4"),
                    sep    = ",") %>%
    t
  
  #bike_price_cleaned_t<-t(bike_price_cleaned_s)
  

bike_data_joined_tbl <- cbind(bike_category_tbl, bike_price_cleaned_s)
colnames(bike_data_joined_tbl)<-c("Bike","Price [€]")