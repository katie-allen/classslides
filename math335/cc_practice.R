dd <- read_csv("https://raw.githubusercontent.com/ktoutloud/classslides/master/math335/We%20Tried%20EVERY%20Flavor.csv")
View(dd)

dd <- read_csv("https://raw.githubusercontent.com/ktoutloud/classslides/master/math335/We%20Tried%20EVERY%20Flavor.csv", skip = 1)
View(dd)

dd %>% 
  ggplot(aes(x = Rhett, y = Link, color = X1)) +
  geom_point() +
  theme_bw() +
  labs(title = "We Tried EVERY Flavor!",
       subtitle = "How do Rhett and Link compare on flavor scores?",
       color = "Food") +
  scale_x_continuous(limits = c(0,100)) +
  scale_y_continuous(limits = c(0,100))
