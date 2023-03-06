library(dplyr)
Checkouts <- read.csv("2022-2023-All-Checkouts-SPL-Data.csv")

Summary <- list()
Summary$average_checkout <- Checkouts %>%
  group_by(CheckoutYear) %>%
  summarize(average_checkout = mean(Checkouts), 0)

Summary$Most_checkout_badAtLove <- Checkouts %>%
  filter(Title == "Bad at Love") %>%
  filter(Checkouts == max(Checkouts, na.rm = T)) %>%
  pull(CheckoutMonth)

Summary$Least_checkout_ebooks <- Checkouts %>%
  filter(MaterialType == "EBOOK") %>%
  filter(Checkouts == max(Checkouts, na.rm = T))%>%
  pull(CheckoutMonth)

Pub <- Checkouts %>%
  group_by(Publisher)

Summary$Publisher <- nrow(Pub)

Summary$Most_popular_book_22Jan <- Checkouts %>%
  filter(CheckoutMonth == 1) %>%
  filter(CheckoutYear == 2022) %>%
  filter(Checkouts == max(Checkouts, na.rm = T)) %>%
  pull(Title)

