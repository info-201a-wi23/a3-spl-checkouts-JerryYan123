library("ggplot2")
library("dplyr")
library("scales")

Checkouts <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv")

Top_pub <- Checkouts %>%
  filter(CheckoutYear == 2022) %>%
  group_by(Publisher) %>%
  summarise(num = sum(Checkouts)) %>%
  arrange(desc(num)) %>%
  slice(1:5)

Top_one <- Top_pub  %>%
  arrange(desc(num)) %>%
  slice(1:1)

ggplot(data = Top_pub)+
  geom_col(aes(x = Publisher, y = num, fill = Publisher)) +
  ggtitle("Top five publisher with the \n highest total number of checkouts in 2022")+
  ylab("Number of checked out books")+
  theme(axis.text.x=element_blank()) +
  scale_y_continuous(labels = comma)
