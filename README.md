
# QME-BIO708
BIO708 Repository 
##Assignment 1 
This dataset comes from a previous behavioral study conducted in my lab. Each row represents one participant and they experienced either a win or a loss during a videogame round. Following the loss their preference for switching to a different video game was measured on a 5-point Likert scale.
I am interested in understanding how winner and loser effects influence different adaptive behaviors such as switching or playing the same game again. Specifically whether participants are more likely to switch strategies after experiencing a loss compared to after a win. This question relates to broader biological and behavioral theories of perseverance, winner–loser effects, and adaptive responses to failure.
For this assignment, I used this existing dataset to practice data handling and analysis techniques while framing and translating a biological question into a statistical comparison of switching behavior following wins versus losses.

For this assignment I used, StackOverflow to get tips on using ifelse statements and chi square tests, and then streamlined my understanding on them using ChatGPT. 

##Assignment 2
The two scripts I made for this are located in :/hw2Jan16/scripts/assignment_2.R and :/hw2Jan16/scripts/assignment_2_rdsPlot.R. 
The first script looked at the data structure and examined the data for problems. 
The important things to look for were whether there were any missing values, count the number of data points in each conditions (to ensure the data is not overly biased) and to see the spread of the switching preferences. 
To evaluate the data further, I used a histogram plot to see the spread of switching preferences to ensure the spread did not look concerning. 
The second plot was a scatter plot with the positive baseline mood and post experiment positive mood. 
This ensures there is no discrepancy in the positive mood reports as it is important to ensure that those who have reported higher baseline positive moods are not reporting outlier post positive moods. 

The second script was used to create a boxplot that had the treatment on the x axis with the switching preference on the likert scale across the ya axis. 
This has allowed me to visualize whether there is a any meaningful difference amongst individuals who win or lose and their preference for switching after. 

At the moment, I am hoping I will have collected my own data in the new few months which I can use for my experiment. 
My experiment will be similar to this dataset but will not have different treatments as all particiapnts will be in the losing condition. 
Additionally, the switching preference will not be on a likert scale, but simply a binary yes or no. 
I will also be measuring individuals perseverance levels and we will be looking at whether their perseverance levels has any influence on their desire to switch or keep trying after losing.


For this assignment I used, StackOverflow to get tips on how to check for missing values and ChatGPT to streamline my understanding. 

##Assignment 3
The script I made for this assignment is located in :/hw3Jan23/scripts/assignment_3.R and the main working directory is QMEE folder where all the sub directories are located 

JD: I guess this means it's intended to be run from there, would be clearer to say it that way (since you asked in your email what you should do different; it's a minor point).

For plot 1 I was trying to show how participants' positive and negative affect scores change from baseline to post, in each win and loss conditions. The goal for me was to be able to visualize the changes through the use of the linegraph to show in which direction the data was moving. 
I was hoping to see the patterns and within participant changes across time. 
Converting the data into long format allowed me to manipulate the data in the necessary ways to graph it. I needed each participant to have data for their baseline(negative), post(negative), baseline(positive), and post(positive). The 135 participants were then divided into their assigned treatments respectively. 
Pivot longer allowed me to ensure these important pieces of data could be used to graph. I added the boxplots to be able to summarize the between participants distribution. Jitter allowed to reduce the overlap between the points. 
The observations had lines which emphasized within participant change and it was put on a common y axis, which follows the Cleveland Hierarchy.
Faceting allowed me to place multiple similar graphs in close proximity for comparison. The transparency and jitter also increases how much information is shown at a time while avoiding overlap. 

For plot 2, I had to make another long format data with some new columns. I made a boxplot to show the distribution between the actual Δscores (post-baseline) for both positive and negative affect within each treatment. 
The goal here was to emphasize the magnitude and direction of change. 
Rather than doing a baseline and post values again, I used the pre-calculated change in scores to plot them. The box plots provided a distribution of the scores, and the jitter allowed us to visualize each data point. 
The positive and negative effects were divided to see the two measures distinctly. 

Each plot was put against a common y-axis according to the Cleveland Hierarchy. Faceting once again allowed us to keep the two valences separate and allowed me to follow the proximity of comparisons rule. 

For this assignment, I used some tips from StackOverflow and then finalized my understanding using ChatGPT. 

JD: All seems very sensible. Plots look good. I added suggested code to label the facets for one of your plots. I don't follow the science 100% (probably my fault because I'm a bit overworked right now), but am wondering if the y-axis label on the second plot could simpler and/or clearer. You could complement it with a brief plot title.

Grade 2.1/3

##Assignment 4
I have submitted the PDF version of my assignment on Github. I hope it is in the format you wanted. 

It is in the directory:
:/hw4Jan30/assignment_4.pdf

##Assignment 5
I have submitted the PDF version of my assignment on Github. Thank you! It is in the directory 
:/hw5Feb6/Assignment_5.pdf

#### JD comments

I'm not sure why you say (more than once) that your interval variables are going to be used as continuous variables; I'm assuming you understand that an interval variable is a type of continuous variable, in the broad sense – if anything, the emphasis implies that your scores are not integers, but of course they are. Similarly you say that your motivation questions are ordinal, and then later categorical, which is either redundant or confusing.

The t test is an unusual choice here. It's not terrible, but it comes down to treat the variable you think is causative GRIT as the response variable. This will make it difficult to control for confounders (it's also interesting that you mention several possible confounders, but seem to exclude them from your analysis). The more common thing to do here would be a logistic regression with the decision as the response variable (also, avoid calling the decision a “preference”, better to be concrete that you mean the binary outcome).

You provide some valid context for issues surrounding how to decide what an important effect size would be, but in the end you don't talk about values, or how you would pick a value.

Grade: 1.85/3

##Assignment 6
Hypothesis: We hypothesize that perseverance (GRIT scores) buffers the affective impact
of a loss, thus reducing the expression of loser effects. 
Individuals who have higher GRIT will be more likely to stay in the same game following a loss.

Diagnostic plot: I am running a logistic regression model for my data. 
My data is set up in a manner that participants are all forced to lose in a video game,
following which they are given a choice to either keep playing the same game or
switch to a different one. A logistic regression model was fit predicting binary decision
to stay (1) versus switch (0) from standardized GRIT scores. Model diagnostic plots do not
showcase any violations worth fixing. 

Prediction plot: My prediction plot shows the estimated probability of choosing to stay
as a function of standardized GRIT. The slight increase in the line indicates that with an
increase in GRIT, the probability of staying increases. However, with the wide confidence
interval, it showcases uncertainty in my pilot data. 

Inferential plot:  The coefficient plot shows the estimated log-odds effect of
standardized GRIT scores on the probability of individuals staying with the same game after
a loss. The coefficient for GRIT is around β = 0.16. Although it is positive, it is not
possible to make any statements regarding this value since the confidence intervals cross 0.
This means that the effect of GRIT is unclear and the study needs further data. 
Currently, I have about 88 participants and after conducting a power analysis,
I will need around 179 to get a fully powered study. 

##Assignment 7
Hypothesis: We hypothesize that perseverance (GRIT scores) positively predicts performance outcomes.
Individuals who have higher GRIT scores will perform better and have higher performance scores due to their sustained effort which yields better outcomes.

Diagnostic Plots: A linear regression model was fit predicting performance scores from standardized GRIT scores.
The Residuals vs. Fitted plot shows the red smoothing line close to zero with no real predictable pattern, which suggests that the linearity assumption has been reasonably met.
The Q-Q plot shows residuals tracking moving reasonably fitted along the diagnonal reference line. However, it does show deviations that could be slightly concerning at the tails.
Regardless, it showcases normality within the data. Overall, the diagnostic plots do not reveal any major concerns that would require model adjustments.

Prediction Plot: The prediction plot shows the estimated performance score as a function of standardized GRIT.
Unexpectadely, the slope is slightly negative, suggesting that higher GRIT scores are associated with lower performance scores. If I was to think of some sort of explanation it might be how failure and losing is necessary for GRIT to showcase within individuals.
However, the confidence interval is wide and crosses 0, hinting at uncertainty in the inferences. 
Given the overlap and the wide band, no strong conclusions can be drawn from this trend alone.

Inferential Plot: The coefficient plot shows the estimated slope for the effect of standardized GRIT on performance (β = −0.422, 95% CI [−1.65, 0.80]).
Although the point estimate is negative, the confidence interval crosses zero on both sides, indicating that the effect of GRIT on performance is statistically not clear (p = 0.495).
This means we cannot conclude a reliable relationship between GRIT and performance scores. This once again reflects the need for a higher sample size (which is being done right now).




