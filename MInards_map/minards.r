library(tidyverse)
library(lubridate)
library(ggmap)
library(ggrepel)
library(gridExtra)
library(pander)

cities <- read.table("C:/Users/jabez/Git_Projects/DataViz/input/minard/cities.txt", header = TRUE, stringsAsFactors = FALSE)


troops <- read.table("C:/Users/jabez/Git_Projects/DataViz/input/minard/troops.txt", header = TRUE, stringsAsFactors = FALSE)

temps <- read.table("C:/Users/jabez/Git_Projects/DataViz/input/minard/temps.txt", header = TRUE, stringsAsFactors = FALSE) %>%
  
mutate(date = dmy(date))  # Convert string to actual date

troops %>% head() %>% pandoc.table(style = "rmarkdown")

ggplot() +
  geom_path(data = troops, aes(x = long, y = lat, group = group, 
                               color = direction, size = survivors),
            lineend = "round") +
  geom_point(data = cities, aes(x = long, y = lat),
             color = "#DC5B44") +
  geom_text_repel(data = cities, aes(x = long, y = lat, label = city),
                  color = "#DC5B44", family = "Open Sans Condensed Bold") +
  scale_size(range = c(0.5, 15)) + 
  scale_colour_manual(values = c("#FFE933", "#252523")) +
  labs(x = NULL, y = NULL) + 
  guides(color = FALSE, size = FALSE)




