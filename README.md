# Pitchfork

I decided it would be interested to webscrape all the reviews from [Pitchfork](https://pitchfork.com/). My primary reason was to find the best albums of recent years in order to widen my listening list. I also wanted to validate some preconceptions I held about certain artists (e.g. is Frank Ocean as good as people claim?)

## Methods

Downloading this data was relatively easy. The webpage structure of Pitchfork is based on a `?page=X` model, allowing for all review pages to be sequentially downloaded. Even more fortunately, all of the interesting data is provided right in the catalog page as opposed to PC Gamer where the individual reviews themselves were needed to be accessed.

The only caveat in this process was that, due to the large number of calls, at times Pitchfork stopped responding for a period of time. To mitigate this, the reviews were downloaded in steps of approximately 400 pages at a time.

## Results

There were numerous reviews successfully scraped and painted a relatively expected picture.

![Total plot](https://raw.githubusercontent.com/cajpearce/pitchfork/master/images/reviews.png)

As can be seen, the average rating for an album centres around 7. Renowned albums are from approximately 8 and above. In looking at this, we can run some basic filters to find the best albums of the current decade (which I have done for myself).

#### Reviewers

As an aside, I thought it would be interested to have a look at the trend of the most prolific reviewers. Surprisingly, most reviewers have stayed consistent over time. Though there are one or two fortunate folk that have had the pleasure of a steadily increasing average rating. See below for results.

![By reviewer](https://github.com/cajpearce/pitchfork/blob/master/images/reviewers.png)


## Shortfalls

The data was relatively robust. However, the major downside is that album _release date_ was not provided on the catalog page, and thus this data can only be obtained by using an outside dataset. It was noted that this data is sometimes provided inside the individual review pages, but it appeared that not all dates existed. Thus, it is difficult to filter out reviews of age-old albums.
