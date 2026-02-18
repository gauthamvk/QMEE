library(tidyverse)
library(performance)
library(DHARMa)
library(see)
library(emmeans)
library(broom)

grit_scores <- read.csv("hw6Feb13/data/prelim test.csv")

#Converting GRIT scores to GRIT_Z scores 
grit_z <- grit_scores |> mutate(grit_z = as.numeric(scale(GRIT.Score)))

grit_z <- grit_z |> mutate(choice_num = if_else(choice == "Stay", 1, 0))

#Fitting Logisitic regression model
log_model <- glm(choice_num ~ grit_z, data = grit_z, family = binomial())

summary(log_model)

#Provides me with the effect size for my pilot data. The effect size in a logistic model is the odds ratio. Might be an oversimplification. 
#In my case, a 1 SD increase in GRIT results in a 17.6% increase in the odds of an individual staying and trying the same game again. 
odd_ratio <- exp(coef(log_model)["grit_z"])

#This is used to check the confidence intervals with 95% confidence regarding the odds ratio of my model. If there was a clear direction the 
#odds ratio interval would not include. After 1 you it increases the odds of staying. Below 1 it decreases the odds of staying. 
exp(confint(log_model))

#Diagnostic Plot
check_model(log_model)

#Prediction Plot something I learned from this random website online lol
#https://stats.oarc.ucla.edu/r/dae/logit-regression/
newdata1 <- data.frame(
  grit_z = rep(seq(from = min(grit_z$grit_z), to = max(grit_z$grit_z), length.out=100)))
newdata2 <- cbind(newdata1,predict(log_model, newdata = newdata1, type = "link", se.fit = TRUE))
newdata2 <- within(newdata2, {
  PredictedProb <- plogis(fit)
  LL <- plogis(fit - 1.96 * se.fit)
  UL <- plogis(fit + 1.96 * se.fit)
})

ggplot(newdata2, aes(x = grit_z, y = PredictedProb)) +
  geom_ribbon(aes(ymin = LL, ymax = UL), alpha = 0.2) +
  geom_line(linewidth = 1) +
  labs(
    x = "Standardized GRIT (grit_z)",
    y = "Predicted probability of staying",
    title = "Predicted probability of staying across GRIT"
  ) +
  theme_bw()

#Prediction Plot according to class
plot_1 <- emmeans(
  log_model,~ grit_z, at = list(grit_z = c(-1, 0, 1)), type = "response"  
)
plot(plot_1) +
  labs(
    x = "Predicted probability of staying",
    y = "GRIT (z) level"
  )

#Inferential Plot
coef_df <- tidy(log_model, conf.int = TRUE) |> filter(term == "grit_z")

ggplot(coef_df, aes(term, estimate)) + geom_point() + geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.1) + 
  geom_hline(yintercept=0, linetype = "dashed") + coord_flip() +  labs(x = NULL, y = "Log-odds coefficient (95% CI)", title = "Coefficient plot: Effect of GRIT on staying") +theme_bw()
#The Inferential plot showcases the effect previously seen. The effect of GRIT on decision to stay or switch is inconclusive due to the confidence interval passing 0.

