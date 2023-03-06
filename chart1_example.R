library("ggplot2")
library("dplyr")

Checkouts <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv")
  
Physical_book_change <- Checkouts %>%
  filter(UsageClass == "Physical") %>%
  filter(CheckoutYear == 2022) %>%
  group_by(CheckoutMonth) %>%
  summarize(CheckoutPerMonth = sum(Checkouts))

Digital_book_change <- Checkouts %>%
  filter(UsageClass == "Digital") %>%
  filter(CheckoutYear == 2022) %>%
  group_by(CheckoutMonth) %>%
  summarize(CheckoutPerMonth = sum(Checkouts))

year <- seq(1, 12)

ggplot(Physical_book_change, aes(x = year, color = UsageClass)) +
  geom_line(aes(y = CheckoutPerMonth, color = "Physical")) +
  geom_line(aes(y = Digital_book_change$CheckoutPerMonth, color = "Digital")) +
  ggtitle("The number of physical and digital \n checkouts changed over time in 2022") +
  xlab("Month") + ylab("Number of checked out books") +
  scale_x_discrete(limits = year)

