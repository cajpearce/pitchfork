library(tidyverse)
library(s20x)

reviews = readRDS("reviews.rds") %>% 
  mutate(genre = as.factor(gsub("^.+=","",genre))) %>% unique() %>%
  filter(genre %in% c(#'metal', 
                      #'electronic', 
                      #'folk', 
                      'experimental', 
                      #'rock',
                      'pop',
                      'global',
                      #'jazz',
                      'rap'))


best.artists = reviews %>% 
  group_by(artist) %>% 
  summarise(count = n(),score = mean(score,na.rm=TRUE)) %>%
  filter(count < 100,
         count > 2,
         score >= 8.3) %>% #top_n(50, score) %>%
  arrange(desc(score))

best = reviews %>% filter(
  artist %in% best.artists$artist,
  score >= 8.3,
  year >= 2009)



write.csv(best, "bestmusic.csv")
