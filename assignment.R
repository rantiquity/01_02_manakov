#install.packages("gutenbergr")
library(gutenbergr)
library(tidyverse)

works <- gutenberg_works()

# (1) Отберите ряды, в которых gutenberg_author_id равен 65 или 410;
# после этого выберите два столбца: author, title
my_data <- works |>
  filter(gutenberg_author_id == 65 | gutenberg_author_id == 410) |>
  # либо:
  # filter(gutenberg_author_id %in% c(65, 410)) |> 
  select(author, title)

# (2) Используйте функцию separate(), чтобы разделить 
# столбец с именем и фамилией на два новых: author, name. 
# Удалите столбец name
  my_data2 <- my_data |>
    separate(author, into = c("author", "name"), sep = ", ") |> 
    select(-name)
   
# (3) Используйте group_by() и summarise(), чтобы узнать,
# сколько произведений Шекспира и Марлоу хранится в библиотеке Gutenberg
  my_data3 <- my_data2 |>
    group_by(author) |> 
    summarise(n = n())
