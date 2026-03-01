library(tidyverse)
library(DHARMa)
library(ggeffects)
library(broom)
library(datawizard)


grit_data <- read_csv("hw7Feb27/data/prelim_test.csv")
#Converting GRIT scores to GRIT_Z scores 
grit_data <- grit_data |> mutate(grit_z = standardize(grit_score))

#Fitting a linear model
m1 <- lm(perf_score~grit_z, data=grit_data)
summary(m1)
plot(m1)

#Diagnostic checks
performance::check_model(m1)
plot(simulateResiduals(m1))

#Prediction plots
pred_1 <- ggpredict(m1, terms = "grit_z")
plot(pred_1)

#Inferential plots 
coef_df <- tidy(m1, conf.int = TRUE)

ggplot(coef_df |> filter(term == "grit_z"), aes(term, estimate, ymin = conf.low, ymax = conf.high)) + 
  geom_pointrange () + geom_hline(yintercept = 0, linetype = "dashed") + labs (x="", y = "Slope estmate (95% CI)", 
                                                                               title = "Infrential plot: Grit (Z) effect on performance")
coef_df
