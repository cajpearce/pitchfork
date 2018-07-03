library(tidyverse)
library(data.table)
library(xml2)
get.agg.data = function(review) {
  review.url = review %>% xml_find_first("./a") %>% xml_attr("href")
  album.name = review %>% xml_find_first(".//h2[@class='review__title-album']") %>% xml_text()
  reviewer.name = review %>% xml_find_first(".//ul[@class='authors']/li/a") %>% xml_attr("href")
  review.date = as.POSIXct(review %>% xml_find_first(".//time[@class='pub-date']") %>% xml_attr("datetime"))
  genre = review %>% xml_find_first(".//ul[@class='genre-list genre-list--inline review__genre-list']/li/a") %>% xml_attr("href")
  artist = review %>% xml_find_first(".//ul[@class='artist-list review__title-artist']/li") %>% xml_text()
  data.frame(review.url, album.name, reviewer.name, review.date, genre, artist)
}

read.reviews = function(x) {
  reviews = read_html(x) %>% xml_find_all("//div[@class='review']")
  lapply(reviews, get.agg.data)
}

scan.pitchfork = function(page) {
  url = paste("https://pitchfork.com/reviews/albums/?page=",page, sep="")
  possibly(read.reviews,
           NA
  )(url) 
}



# 1672:1200
# 1199:800
# 799:400
# 399:1

# all.reviews = lapply(1672:1, scan.pitchfork)
# saveRDS(all.reviews, "pitchfork5.rds")

# reviews = lapply(list.files(pattern="rds"), readRDS)
# reviews = do.call(c,reviews)
# reviews = do.call(c,reviews)
# 
# 
# keep = grepl("data", sapply(reviews, class))
# 
# reviews = reviews[keep]
# reviews = unique(rbindlist(reviews))
# 
# reviews = reviews %>% mutate(
#   year = year(review.date)
# )
# 
# saveRDS(reviews, "reviews.rds")
