## Field Trials ANOVA  data ####
## Who: JW Collins 
## what:  
## Last edited: 2022-09-20


## CONTENTS ####
## 00 Setup ##
## 01 Data ##
## 02 Graph ##
## 03 Stats ##


## 00 Setup ####

getwd()


#setwd
setwd("/Users/u1764794/OneDrive - Harper Adams University/Data/Shapefiles/CRS84/")

# The following commands will install these packages if they are not already installed:


if(!require(car)){install.packages("car")}
if(!require(psych)){install.packages("psych")}
if(!require(multcomp)){install.packages("multcomp")}
if(!require(emmeans)){install.packages("emmeans")}
if(!require(FSA)){install.packages("FSA")}
if(!require(ggplot2)){install.packages("ggplot2")}
if(!require(phia)){install.packages("phia")}


# Load packages
library(tidyverse)
library(ggplot2)
library(dplyr)
library(ggsci)
library(sjPlot)
library(sjmisc)
library(sjlabelled)
library(viridis)
library(psych)
library(ggpubr)
library(lme4)
library(MuMIn)
library(ggdensity)




## 01 Data ##

# Read Data
data <- read.csv(file = "OMNIA RESULTS/F1_BOTH_OMNIA_SCAN_CRS84.csv", header = TRUE)

# Organise factors in data
data$Treat <- as.factor(data$Treat)




## 02 Visual tests ####

### 02.1 Desity plot ####

# Density plot and Q-Q plot can be used to check normality visually.
# 
# Density plot: the density plot provides a visual judgment about whether the distribution is bell shaped.

ggdensity(data$OrganicC, 
          main = "OrganicC",
          xlab = "OrganicC")

### 02.2 Q plot ####

# Q-Q plot: Q-Q plot (or quantile-quantile plot) draws the correlation between a 
# given sample and the normal distribution. A 45-degree reference line is also plotted.

ggqqplot(data$OrganicC)

### 02.3 Normality test ####

# Visual inspection, described in the previous section, is usually unreliable. 
# It’s possible to use a significance test comparing the sample distribution to a 
# normal one in order to ascertain whether data show or not a serious deviation from normality.
# 
# There are several methods for normality test such as Kolmogorov-Smirnov (K-S)
# normality test and Shapiro-Wilk’s test.

# Shapiro-Wilk’s method is widely recommended for normality test and it provides 
# better power than K-S. It is based on the correlation between the data and the corresponding normal scores.


shapiro.test(data$OrganicC)

# From the output, the p-value > 0.05 implying that the distribution of the data 
# are not significantly different from normal distribution. In other words, we can assume the normality.

### 02.4 Histogram ####

gghistogram(data$OrganicC)




## 03 Summary Table ####

# Calculates mean, sd, se and IC - block
my_sum <- data %>%
  group_by(Treatment) %>%
  summarise( 
    n=n(),
    mean=mean(OrganicC),
    sd=sd(OrganicC)
  ) %>%
  mutate( se=sd/sqrt(n))  %>%
  mutate( ic=se * qt((1-0.05)/2 + .5, n-1))

capture.output(my_sum, file = "/Users/u1764794/OneDrive - Harper Adams University/Shavington & Cloverley/Farm Trials/Data Analysis/HH yield/sumstats-hhyield_block.txt")


# Organise factors
my_sum$Treatment <- as.factor(my_sum$Treatment)





## 04 Graphs ####

title_exp <- expression(Hand~harvest~yield~(Mg~ha^{-1}))  # this is the legend title with correct notation


# Error bars represent standard error of the mean
f <- ggplot(my_sum, aes(x=Treatment, y=mean)) + 
  geom_bar(position=position_dodge(), stat="identity") + labs(title= title_exp,x="Treatment", y = title_exp) +
  geom_errorbar(aes(ymin=mean-se, ymax=mean+se),
                width=.2,                    # Width of the error bars
                position=position_dodge(.9))
f <- f + scale_fill_grey(start = 0.9, end = 0.3) + theme_bw() + theme(legend.position="bottom") + ylim(0,5)

f


## 05 Stats ####

### 05.1 ANOVA ####

# Two-way ANOVA with interaction effect

# These two calls are equivalent
res.aov3 <- aov(OrganicC ~ Treatment, data = data)
summary(res.aov3)
res.aov3

capture.output(res.aov3, file = "hhyield_anova.txt")

### 05.2 Tukey ####


# Tukey multiple pairwise-comparisons for interaction effect 
TukeyHSD(res.aov3, which = "treat_ac")
TukeyHSD(res.aov3, which = "block")

p_value_interaction <- TukeyHSD(res.aov3, which = "treat_ac:block")
p_value_interaction

capture.output(p_value_interaction, file = "treat:block_hhyield.txt")


t.test(bean_t_ha ~ treat_ac, data = data)


### 05.3 Lmer ####-------------------------------------------------------------------------------------------

l.test <- lmer(bean_t_ha ~ treat_ac)

#Mixed effect model with random effect blcok and interaction effect. If you are interested
#in interaction only consider this one

lme1 <- lmer(bean_t_ha ~ treat_ac + (1|block)+ (1|sz), data = data)
summary(lme1)
plot(lme1)
anova(lme1)
r.squaredGLMM(lme1)
plot_model(lme1, show.values = TRUE, show.p = TRUE)

m <- lm(bean_t_ha ~ treat_ac, data=data)
m

plot(data$bean_t_ha, col='blue', pch='*', cex=2)
abline(m, col='red', lwd=2)


#post hoc test tukey mixed effects with interaction 
lsmeans(lme1, pairwise~Tillage*Traffic, adjust="tukey")

## 04 JOE EDITS ####

# P Values for just Traffic 

lsmeans(lme1, pairwise~Traffic, adjust="tukey") #Maybe run this without the interaction as the ANOVA shows that Tillage has no sig difference? 

# For all

library(lmerTest)
difflsmeans(lme1, test.effs = "Group", adjust = "tukey")
# OR USE: ??????????
difflsmeans(lme1, test.effs = "Group", ddf="Kenward-Roger")



# Compute some summary statistics

require("dplyr")
sum_stats <- group_by(data, block, treat_name) %>%
  summarise(
    count = n(),
    mean = mean(crop_dm_ha, na.rm = TRUE),
    sd = sd(bean_t_ha, na.rm = TRUE)
  )

sum_stats

# Tukey multiple pairwise-comparisons
TukeyHSD(res.aov3, which = "Soil")
TukeyHSD(res.aov3, which = "Nutrition")

ggHSD(tukey, no = 1, digits = 2, interactive = FALSE)

require(ggplot2)
result=TukeyHSD(res.aov3, which = "Soil")
str(result)
ggHSD(tukey, no = 1, digits = 2, interactive = FALSE)

ggHSD(result)
ggHSD(result,interactive=TRUE)

# 1. Homogeneity of variances
plot(res.aov3, 1)

# 2. Normality
plot(res.aov3, 2)

# Extract the residuals
aov_residuals <- residuals(object = res.aov3)

# Run Shapiro-Wilk test
shapiro.test(x = aov_residuals )
