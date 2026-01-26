library(tidyverse);theme_set(theme_bw(base_size = 15))

switch_data <- read_csv("hw3Jan23/data/raw/WL_switching_df.csv") #loading in the data set I will be using for creating my plots 

long_switch_data <- switch_data |> select( #switching the data set I have into long format so that I can have one row per participant x (pos/neg) x (baseline/post) (PANAS scale consists of positive and negative emotions). 
  participant.ID, treatment, pos.baseline, pos.post, neg.baseline, neg.post) |> #piping these columns
  pivot_longer(cols = -c(participant.ID, treatment), names_to = c("change_type", "time"), names_sep = "\\.", values_to = "value") |>
  mutate(change_type = recode(change_type, pos = "Positive", neg = "Negative"), #changing the positive and negative values in the columns 
         time = recode(time, baseline = "Baseline", post = "Post"), #changing the values within the columns to different values
         treatment = factor(treatment, levels = c("win", "loss")) #converting the treatment into a factor 
         )
  
  
  
plot_one <- ggplot(long_switch_data, aes(time, value,group = participant.ID)) + #creating a boxplot and lime graph showing the mood values at each time point
        geom_boxplot(aes(group = time), fill = "grey", outlier.shape = NA, alpha = 0.3) + geom_line(alpha=0.15, linewidth = 0.4) + 
                       geom_point(aes(color=time), position = position_jitter(width=0.06, height = 0), size=2, alpha = 0.4) + 
  facet_grid(change_type ~ treatment) + #made the graph into a facet grid to show the different treatments and different mood values at baseline and post 
         labs(x = NULL, y = "Affect score") + theme(legend.position = "none")
plot_one

change_data <- switch_data |> select(participant.ID, treatment, pos.change, neg.change) |> #changed the data to a different type of long data using pivot longer. 
  pivot_longer(cols = c(pos.change, neg.change), names_to="change_type", values_to = "change_value") |> #the data is formatted with the actual change from Post - Baseline. 
  mutate(change_type = recode(change_type, "pos.change" = "Positive", "neg.change" = "Negative"), 
         treatment = factor(treatment, levels = c("win", "loss"))
         )
plot_two <- ggplot(change_data, aes(x = treatment, y = change_value)) + geom_hline(yintercept = 0, linewidth = 0.4, alpha = 0.6) + #geomhline adds a clearer line at the described y intercept spot
  geom_boxplot(outlier.shape = NA, alpha = 0.35) + geom_jitter(width=0.12, alpha = 0.4, size = 2) + #creating a boxplot that helps visualize the quantitative mood change 
  facet_wrap( ~ change_type, nrow = 1) + labs(x=NULL, y = "Change Score (Post - Baseline)") + theme(legend.position = "none") 
plot_two

