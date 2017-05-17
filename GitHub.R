mers <- read.csv('CopyOfcases.csv')
mers$hospitalized[890] <- c( 2015-02-20 ) 
mers <- mers[-471,]
library(lubridate)
mers$onset2 <- ymd(mers$onset) 
mers$hospitalized2 <- ymd(mers$hospitalized)
class(mers$onset2)
day0 <- min(na.omit(mers$onset2))
mers$epi.day <- as.numeric(mers$onset2 - day0)
library(ggplot2)
ggplot(data=mers) +
  geom_bar(mapping=aes(x=epi.day)) + labs(x='Epidemic day', y='Case count', title='Global count of MERS cases by date of symptom onset')
