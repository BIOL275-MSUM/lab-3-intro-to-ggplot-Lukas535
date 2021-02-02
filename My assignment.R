
# load packages -----------------------------------------------------------

library(tidyverse)

# fireflies data ----------------------------------------------------------

fireflies_data<-read_csv("https://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter02/chap02q19FireflySpermatophoreMass.csv")

ggplot(data=fireflies_data)+
  geom_histogram(mapping=aes(x=spermatophoreMass),binwidth=.01,
                 boundary=0,closed="left",
                 fill="#C5351B",color="black")+
  labs(x="spermatophoreMass",y="Frequency (number of eggs)")+
  scale_y_continuous(breaks=seq(0,11,5), limits=c(0,11),
                     expand=expansion(mult=0))+
  theme_classic()+
  theme(
    axis.title=element_text(face="bold"),
    axis.text=element_text(color="black",size=rel(1))
  )

# bird order data ---------------------------------------------------------

library(auk)
birds<-ebird_taxonomy%>%
  as_tibble()%>%
  filter(category=="species")
birds
count(birds)
count(birds,order)
distinct(birds,order)
ggplot(data=birds)+
  geom_bar(mapping=aes(x=fct_infreq(order)), fill="#C5351B",
           width=.5)+
  labs(x="Orders",y="Number of Species")+
  theme(
    axis.title=element_text(face="bold"),
    axis.text=element_text(color="black",size=rel(.5)),
    axis.text.x=element_text(angle=45,hjust=1),
    axis.ticks.x=element_blank()
  )

           