---
title: ""
params:
  ptitle: true
  pbackground: true
  dtype: "none"
---

<!-----------------------
Note:
want to students to focus on picking a TOPIC and QUESTION,
rather than finding the perfect data right now.

There is a task in a few weeks (task 11???)
that tells them to find the data for their project
-------------------------->

# Welcome to class! {data-background=#e8c35d}

## Practice reading code

<br>

With a partner (or in the Zoom chat), write this code out in an English paragraph.


```r
delays <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")
```

