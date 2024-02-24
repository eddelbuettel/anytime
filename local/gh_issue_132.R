#!/usr/bin/env Rscript

## this 'famously' ignored the existence of 'calcUnique'

library(anytime)
library(ggplot2)
library(patchwork)

res <- bench::press(n = c(10000, 20000, 30000, 40000, 50000, 60000, 70000), {
   dat <- paste(sample(1:31, n, TRUE), sample(month.abb, n, TRUE), sample(2000:2024, n, TRUE))
   print(paste("Number of unique obs:", length(unique(dat))))
   bench::mark(orig = anytime::anydate(dat),
               new = {
                  uniques <- unique(dat)
                  converted <- anytime::anydate(uniques)
                  out <- converted[match(dat, uniques)] |> as.Date()
                  attr(out, "tzone") <- "Europe/Paris"
                  out
          })
   })

res$expr <- as.character(res$expression)

time <- res |>
  ggplot(aes(n, median, color = expr)) +
  geom_point() +
  geom_line() +
  labs(title = "Time")

mem <- res |>
  ggplot(aes(n, mem_alloc, color = expr)) +
  geom_point() +
  geom_line() +
  labs(title = "Memory")

time + mem
