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
The script I made for this assignment are located in :/hw3Jan23/scripts/assignment_3.R and the main working directory is QMEE folder where all the sub directories are locations 

So for plot 1 I was trying to show how participants' positive and negative affect scores change from baseline to post, in each win and loss conditions. The goal for me was to be able to visualize the changes through the use of the linegraph to show in which direction the data was moving. 
I was hoping to see the patterns and within participant changes across time. 
Converting the data into long format allowed me to manipulate in the necessary ways to graph. I needed each participant to have data for their baseline(negative), post(negative), baseline(positive), and post positive. The 135 participants were then divided into whether they were assigned into the losing or winning condition. 
Pivot longer allowed me to ensure these important pieces of data could be used to graph. I added the boxplots to be able to summarize the between participants distribution. Jitter allowed to reduce the overlap between the points. 
The observations had lines which emphasized within participant change and it was put on a common y axis, which follows the Cleveland Hierarchy.
Faceting allowed me to place multiple similar graphs in close proximity for comparison. The transparency and jitter also increases how much information is shown at a time while avoiding overlap. 

For plot 2, I had to make another long format data with some new columns. I made a boxplot to show the distribution between the actual Δscores (post-baseline) for both positive and negative affect within each treatment. 
The goal here was to emphasize the magnitude and direction of change. 
Rather than doing a baseline and post values again, I used the pre calculated change in scores to plot them. The box plots provided a the distribution of the scores and the jitter allowed us to visualize each data point. 
The positive and negative affects were divided two see the two measures distinctly. 

Each plot was put against a common y axis according to the Cleveland Hierarchy, Faceting once again allowed to keep the two valences separate and allowed me to follow the proximity of comparisons rule. 

For this assignment, I used some tips from StackOverflow and then finalized my understanding using ChatGPT. 
