library(tidyverse)
library(GGally)

rm(list = ls())
cancer <- readxl::read_xlsx("./breast_tennis.xlsx",sheet="breast.test")
summary(cancer)

cancer %>%
  gather(variable, value, -classe) %>%
  ggplot(aes(x = value)) +
  geom_histogram() +
  facet_wrap(~ variable, scales = "free") +
  theme_bw()


ggpairs(cancer, aes(color = classe))


cancer %>%
  gather(variable, value, -classe) %>%
  ggplot(aes(x = classe, y = value, fill = classe)) +
  geom_boxplot() +
  facet_wrap(~ variable, scales = "free") +
  theme_bw()


