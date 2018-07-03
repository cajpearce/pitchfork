library(tidyverse)
library(data.table)
library(xml2)
library(parallel)

reviews = readRDS("reviews.rds")

get.score = function(url) {
  temp = read_html(url)
  temp = xml_find_first(temp, "//span[@class='score']")
  xml_text(temp)
}

dl.score = function(review.url) {
  url = paste("https://pitchfork.com",review.url,sep="")
  possibly(get.score,
           NA
  )(url) 
}


clusters = makeCluster(detectCores())


clusterExport(clusters,
              c("get.score",
                "dl.score",
                "possibly",
                "read_html",
                "xml_find_first",
                "xml_text"))

system.time({
  scores = parSapply(clusters
                     ,as.character(reviews$review.url)
                     ,dl.score)
})



stopCluster(clusters)

reviews$score = as.numeric(scores)


saveRDS(reviews, "reviews.rds")
