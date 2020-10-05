# EES Field Course - Group 1 - Freshwater Invertebrates and Water Quality
# Sophie Rose, s1739832@sms.ed.ac.uk; Emma Gemal, s1758915@sms.ed.ac.uk
# Last edited: 14/9/2020



## Library ----
library(tidyverse)
library(ggplot2)
library(ggpubr)
library(ggsci)


# loading the data
water_q <- read.csv("Data/waterqualityvalues_alldata.csv")
water_q <- water_q %>% 
  slice(-c(17:27))


## Plotting water quality with distance ----
# determining the statistics to be displayed on the ASPT vs distance plot 
ASPT_stats <- lm(ASPT ~ distance_source_km,
                 data = water_q)
summary(ASPT_stats)
# p-value = 0.03859
# R-squared = 0.2712

#ASPT vs Dist
(ASPTreg <- ggplot(water_q, aes(x = distance_source_km, y = ASPT)) +
    labs( x = "Distance from Source (km)", y = "Average Score Per Taxon (ASPT)") +
    stat_smooth(method = "lm", color = "blue") +
    geom_point(size = 2) +
    theme_classic2())

print(ASPTreg)


# determining the statistics to be displayed on the BBWI vs distance plot 
BBWI_stats <- lm(WQ ~ distance_source_km,
                 data = wq_data)
summary(BBWI_stats)
# p-value = 0.09241
# R-squared = 0.189

# plotting BBWI vs distance from source
(BBWIreg <- ggplot(water_q, aes(x = distance_source_km, y = WQ)) +
    labs( x = "Distance from Source (km)", y = "Braid Burn Water Quality Index") +
    stat_smooth(method = "lm", color = "blue") +
    geom_point(size = 2) +
    theme_classic2())

print(BBWIreg)

# Emma: creating the plot of our water quality index (BBWI) vs. distance from source
(wq_plot2 <- ggplot(wq_data, aes(x = distance_source_km, y = WQ)) +
    labs(
      x = "Distance from Source (km)",
      y = "Water Quality Index"
    ) +
    stat_smooth(method = "lm", color = "black", alpha = 0.7) +
    geom_point(size = 7.5) +
    geom_text(x = 5.6, y = 7, label = expression(paste("R"^2, " = 0.189; p = 0.092")),
              parse = TRUE, fontface = "italic", size = 14) +
    theme_pubr() +
    theme(axis.text = element_text(size = 36),
          axis.title = element_text(size = 40),
          axis.title.x = element_text(margin = margin(t = 20)),
          axis.title.y = element_text(margin = margin(r = 20))))

ggsave(file = "BBWIdist_plot.png", width = 14, height = 14, units = c("in"), path = "Figures")





## Plotting relationship between lm vs. ASPT ----
# comparison of our water quality index (BBWI) and ASPT
index_stats <- lm(WQ ~ ASPT,
                  data = water_q)
summary(index_stats)
# p-value = 0.00035
# R-squared = 0.6106

# plotting BBWI to ASPT
(BBWIvASPT <- ggplot(water_q, aes(x = WQ, y = ASPT)) +
    labs( x = "ASPT", y = "BBWI") +
    stat_smooth(method = "lm", color = "blue") +
    geom_point(size = 2) +
    theme_classic2())

print(BBWIvASPT)

# Emma: plotting the index comparison
(wq_aspt_plot <- ggplot(water_q, aes(x = WQ, y = ASPT)) +
    labs(
      x = "BBWI",
      y = "ASPT"
    ) +
    stat_smooth(method = "lm", color = "black", alpha = 0.7) +
    geom_point(size = 7.5) +
    geom_text(x = 5.6, y = 7.7, label = expression(paste("R"^2, " = 0.6106; p = 0.0004")),
              parse = TRUE, fontface = "italic", size = 14) +
    theme_pubr() +
    theme(axis.text = element_text(size = 36),
          axis.title = element_text(size = 40),
          axis.title.x = element_text(margin = margin(t = 20)),
          axis.title.y = element_text(margin = margin(r = 20))))

