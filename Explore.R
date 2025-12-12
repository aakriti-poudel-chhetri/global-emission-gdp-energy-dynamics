library(grid)

prediction_plot <- ggplot(prediction_ci, aes(x = avg_gdp_growth, y = avg_emission_reduction, fill = mu)) +
  geom_raster(interpolate = TRUE) +
  scale_fill_stepsn(colors = c('darkgreen', 'hotpink'),
                    breaks = scales::pretty_breaks(n = 5)(prediction_ci$mu),
                    name = 'Predicted Count',
                    guide = guide_coloursteps(title.position = 'right',
                                              title.hjust = 0.5,
                                              title.theme = element_text(size = 9, face = 'bold', angle = 90))) +
  scale_x_continuous(breaks = seq(floor(min(prediction_ci$avg_gdp_growth)),
                                  ceiling(max(prediction_ci$avg_gdp_growth)),
                                  by = 1)) +
  scale_y_continuous(breaks = seq(floor(min(prediction_ci$avg_emission_reduction)),
                                  ceiling(max(prediction_ci$avg_emission_reduction)),
                                  by = 0.5)) +
  labs(title = 'Negative Binomial Model',
       x = 'Average GDP growth',
       y = 'Average emission reduction') +
  theme_minimal() +
  theme(
    plot.title = element_text(size = 12, face = 'bold'),
    axis.title.x = element_text(size = 10, face = 'bold'),
    axis.title.y = element_text(size = 10, face = 'bold'),
    axis.text = element_text(size = 8, face = 'bold'),
    panel.grid = element_blank(),
    axis.line = element_line(color = 'black', linewidth = 0.6),
    legend.key.height = unit(1, "cm"),
    legend.key.width = unit(0.4, "cm"),
    plot.background = element_rect(fill = "white", color = NA),
    panel.background = element_rect(fill = "white", color = NA))

# Add annotations
prediction_plot +
  annotate('point', x = min(prediction_ci$avg_gdp_growth),
           y = median(prediction_ci$avg_emission_reduction),
           color = 'darkgreen', size = 4, shape = 15) +
  annotate('text', x = min(prediction_ci$avg_gdp_growth) + 0.1,
           y = median(prediction_ci$avg_emission_reduction),
           label = 'Low', hjust = 0, size = 2, fontface = 'bold') +
  annotate('point', x = max(prediction_ci$avg_gdp_growth),
           y = median(prediction_ci$avg_emission_reduction),
           color = 'hotpink', size = 4, shape = 15) +
  annotate('text', x = max(prediction_ci$avg_gdp_growth) + 0.1,
           y = median(prediction_ci$avg_emission_reduction),
           label = 'High', hjust = 0, size = 2, fontface = 'bold')
```