library(ggplot2)

head(iris)

ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width))

ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species))

ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_vline(mapping = aes(xintercept = 7), color = "red", size = 5)

ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_vline(mapping = aes(xintercept = 7), color = "red", size = 5) +
  labs(title = "The Iris Data",
       subtitle = "I made this really cool plot.")

ggplot(data = iris) +
  geom_point(mapping = aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_vline(mapping = aes(xintercept = 7), color = "red", size = 5) +
  labs(title = "The Iris Data",
       subtitle = "I made this really cool plot.") +
  theme_bw()

