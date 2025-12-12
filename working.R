# summary of algae coverage coefficients
summary(invert_model_region)$coefficients["total_percent",] %>% kable(format = "html", col.names = c("Coefficient", "Value"), table.attr = 'data-quarto-disable-processing="true"') %>% 
  kableExtra::kable_styling(bootstrap_options = c("basic", "hover"), full_width = FALSE)

confint(invert_model_region, "total_percent") %>% kable(format = "html", col.names = c("Confidence Interval", "Value"), table.attr = 'data-quarto-disable-processing="true"') %>% 
  kableExtra::kable_styling(bootstrap_options = c("basic", "hover"), full_width = FALSE)

```

We will use predictions from our model to estimate a 95% CI for `μ`.

```{r}
#| code-fold: true
#| warning: false
pred_grid <- expand_grid(
  total_percent = seq(min(invert_algae_join$total_percent),
                      max(invert_algae_join$total_percent),
                      length.out = length(invert_algae_join$total_percent))) %>%
  mutate(Year = as.factor("2024"),
         region = c("KEP"),
         Elevation_Position = "Mid (0.5 m MLLW)")

se <- predict(object = invert_model_region, 
              newdata = pred_grid, 
              type = "link",
              se.fit = TRUE)

pred_grid <- pred_grid %>%
  mutate(
    log_mu = se$fit,
    log_mu_se = se$se.fit,
    log_mu_lwr = log_mu - 1.96 * log_mu_se,
    log_mu_upr = log_mu + 1.96 * log_mu_se,
    mu = exp(log_mu),
    mu_lwr = exp(log_mu_lwr),
    mu_upr = exp(log_mu_upr)
  )

ggplot(pred_grid, aes(x = total_percent, y = mu)) +
  geom_line() +
  geom_ribbon(aes(ymin = mu_lwr,
                  ymax = mu_upr), alpha = 0.2, fill = "cornflowerblue") +
  labs(x = "% algae",
       y = "Predicted Invertebrate Count",
       title = "Prediction line") +
  theme_classic()
```

# Conclusion

Based on our model, we did see a significant affect of algae coverage on invertebrate density. We see a negative trend with increasing algae coverage (H~A~), and our algae coverage coefficient is significantly different than 0 (p = 0.00036) and with a 95% confidence interval of [-0.02, -0.009], indicating the pattern we see is likely not due to random chance. We additionally saw a significant affect of region and the algae density + elevation interaction term on invertebrate density, with coefficients significantly different than 0. 

We can predict what's driving the negative trend in invertebrate density is a combination of the affect of Fucus distichus density and elevation position, likely also affected by region. A few reasons we see this trend and interactions could be as follows:

1. We likely see a significant interaction term because, as we know,