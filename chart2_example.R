library("ggplot2")
library("dplyr")

Checkouts <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv")

Ebook_change <- Checkouts %>%
  filter(MaterialType == "EBOOK") %>%
  filter(CheckoutYear == 2022) %>%
  group_by(CheckoutMonth) %>%
  summarize(CheckoutPerMonth = sum(Checkouts))

Audiobook_change <- Checkouts %>%
  filter(MaterialType == "AUDIOBOOK") %>%
  filter(CheckoutYear == 2022) %>%
  group_by(CheckoutMonth) %>%
  summarize(CheckoutPerMonth = sum(Checkouts))

Book_change <- Checkouts %>%
  filter(MaterialType == "BOOK") %>%
  filter(CheckoutYear == 2022) %>%
  group_by(CheckoutMonth) %>%
  summarize(CheckoutPerMonth = sum(Checkouts))

Y <- seq(1, 12)

ggplot(Ebook_change, aes(x = Y, color = MaterialType)) +
  geom_line(aes(y = CheckoutPerMonth, color = "EBOOK")) +
  geom_line(aes(y = Audiobook_change$CheckoutPerMonth, color = "AUDIOBOOK")) +
  geom_line(aes(y = Book_change$CheckoutPerMonth, color = "BOOK")) +
  ggtitle("The number of different material types of book \n checkouts changed over time in 2022") +
  xlab("Month") + ylab("Checkouts") +
  scale_x_discrete(limits=Y)
