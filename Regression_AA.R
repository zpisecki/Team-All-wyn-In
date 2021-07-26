
install.packages("ggplot2")
install.packages("dplyr")
install.packages("broom")
install.packages("data.table")
install.packages("corrplot")
install.packages("GGally")
install.packages("tidyverse")
install.packages("PerformanceAnalytics")
install.packages("plotly")
install.packages("purrr")
install.packages("reprex")
install.packages("ggcorrplot")

library(data.table)
library(corrplot)
library(GGally)
library(tidyverse)
library(PerformanceAnalytics)
library(plotly)
library(corrplot)
library(ggplot2)
library(augment)
library(dplyr)
library(tidyverse) 
library(broom) 
library(ISLR)
library(purrr)
library(reprex)
library(ggcorrplot)



# loading Dataset 
library(readxl)
Data_Reg_R <- read_excel("Data_Reg_R.xlsx")
View(Data_Reg_R)
head(Data_Reg_R)

library(readxl)
Data_Reg_Title <- read_excel("Data_Reg_Title.xlsx")
View(Data_Reg_Title)
head(Data_Reg_Title)



# select numeric variables
df <- dplyr::select_if(Data_Reg_Title, is.numeric)
View(df)


# calculate the correlations
r <- cor(df, use="complete.obs")
round(r,2)


# Correlation matrix 
corrplot(r, type="upper" ,method="number" ) 



# Regression Modle 
library(mosaicData)
wage_lm <- lm(Avg_Rate ~ year_exp ,  data = Data_Reg_Title)



# conditional plot of wage vs. years of Experience 
library(visreg)

visreg(wage_lm, "year_exp", gg = TRUE)  +
  scale_y_continuous(label = scales::dollar) +
  labs(title = "Relationship between Hourly Rate and Years of Experience",
       y = "Hourly Rate",
       x = "Years of Experience")

summary(wage_lm)

coefficients(wage_lm)        # model coefficients
vcov(wage_lm)                # co variance matrix for model parameters
confint(wage_lm, level=0.95) # CIs for model parameter




# add a year_exp^2 term to account for the non-linearity. This is done with the I() function.
quadratic_fit <-  lm( Avg_Rate ~ year_exp  + I(year_exp^2) , data = df)  

visreg(quadratic_fit, "year_exp", gg = TRUE)  +
  scale_y_continuous(label = scales::dollar) +
  labs(title = "Relationship between Hourly Rate and Years of Experience with Quadratic Fit",
       y = "Hourly Rate",
       x = "Years of Experience")


summary(quadratic_fit)



# anova Modle 
full_model <-   lm(Avg_Rate ~ year_exp + I(year_exp^2), data = df) 
reduced_model <- lm(Avg_Rate~ year_exp , data = df)
anova(reduced_model, full_model)


#Combining Categorical and Quantitative Predictors 

tidy(lm(Avg_Rate ~ year_exp + c_edu_level + year_exp : c_edu_level , data = Data_Reg_Title)) %>% data.frame()

ggplot(data = Data_Reg_Title, mapping = aes(x = year_exp , y = Avg_Rate, color = c_edu_level)) +
  geom_point() + 
  geom_abline(intercept = 79.8812273, slope = 5.7005165 , color = "#F8766D") + 
  # Non-Education leevel 
  geom_abline(intercept = 107.9922273, slope =5.821716, color = "#00BFC4") + 
  # Masters 
  geom_abline(intercept = 137.7282001, slope =6.5536488, color = "Dark Blue") + 
  # Ph.D.
  labs(title = "Quantitative and Categorical Predictor Variables with Interaction") + 
  theme_light()
  

################   Logistic regression  #############























# Modeling Non-Linear Relationships - with simple regression line 
ggplot(data = Data_Reg_R, mapping = aes(x = year_exp , y = Avg_Rate  )) + 
  geom_point(color = "#006EA1") + 
  geom_smooth(method = "lm", se = FALSE, color = "orange") + 
  labs(title = "Years of Experinces vs. Houry Rate", y = "Hourly Rate", x = "Years of Experinces") + 
  theme_light()





# compare models
fit1 <- lm(Avg_Rate ~ year_exp , data = Data_Reg_R)
fit2 <- lm(Avg_Rate ~ Edu_Lev , data = Data_Reg_R)
anova(fit1, fit2) 



    

