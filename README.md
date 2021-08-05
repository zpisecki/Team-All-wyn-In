# Using AI for Labor Market Predictive Analysis

## Abstract
The Federal Acquisition Regulation (FAR) dictates how the government purchases goods and services to meet government objectives. To ensure fair and open competition, the FAR ensures purchasing that meets cost, timeliness, and quality. Due to the complex nature of government contracting and existing competition within the market, companies seeking business with the Federal government need to understand labor market conditions to win contracts, make a profit, and stay competitive. To understand how businesses can leverage open-source data, a machine learning model can provide insights into how data can be leveraged to predict wages and price data. The prediction of these values can help determine how to provide a successful bid with insight from market conditions. Two separate models were developed, one leveraging Contract-Awarded Labor Categories (CALC) data for a span of three years, and National Compensation Survey (NCS) data that spanned four years. Analytical techniques were applied to the CALC tool to extract data from the contracts posted for several schedules and provide meaningful data for labor categories that included education and years of experience associated with the winning contracts, while salary data with associated percentiles were extracted from the NCS data. Using natural language processing to match provided labor categories, while applying machine learning techniques such a linear regression, XGBoost, and random forest techniques, provide an initial pathway into salary and price prediction.  

## File Documentation

[BLS_Data_Analysis.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/BLS%20Data%20Analysis.ipynb) file provides initial data wrangling and data engineering for ingestion into later steps.

[BLS.ACCDB](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/BLS.accdb) access file provides the data augmentation code for adding Education and years of experience per the mapping table in the access application.

[BLS_Models.R](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/BLS_MODELS.R) file contains the R code for developing the linear regression, Regression Tree using recursive binary splitting and Random Forest machine learning models.

[BLS_DC_Area_Comps.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/main/BLS_DC_Area_Comps.ipynb) file is a Jupyter notebook containing the python code for K-means clustering analysis of metropolitan areas by IT job salaries. This shows which US metropolitan areas are most simliar to Washington, D.C. in terms of IT job salaries. 

[CALC_predictive_models.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/CALC_predictive_models.ipynb) is a Jupyter notebook file containing all of the code that performs linear regression, random forest, and XGBoost algorithms on the CALC dataset.

[project_NLP.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/project_NLP.ipynb) contains the NLP model used against the BLS dataset within Python.

[All_CALC_NEW.csv](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/All_CALC_NEW.csv) contains the CSV file with the total CALC data after document and web scraping. This does not include the NLP edits pertaining to assigning to the 10 job buckets.

[calc_mapping.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/calc_mapping.ipynb) contains the code for determining the regions for the CALC data that match with the NCS regions, as well as plotting both datasets on a US map and for the distribution images within the report.

[calc_scrape070421.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/calc_scrape070421.ipynb) is the total program that was written to pull the CALC data and scrape the job descriptions and locations from the GSA contract documents 

[CALC_NLP.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/d9e4506e6f5065975eb0cd080ff46eb835786b58/CALC_NLP.ipynb) contains the SQL database creation and the NLP model Python code used for CALC dataset 

[future_year.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/4eacebef18248c0f46ec97be7043a4a163ac69a1/future_year.ipynb) is the code for projecting the linear regression model first year prediction result into second and third year 

[tableau visualization.twb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/tableau%20visualization.twb) is a Tableau file where we illustrate and visualize the CALC data and create some of the corresponding plots 

[Tableau Connection.R](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/Tableau%20Connection.R) is the bridge between the Tableau models and R

[Regression Model .R](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/Regression%20Model%20.R) is code related to linear and non-linear regression, ANOVA analysis and other comparative analysis on the CALC data

### App Branch
The App branch within our GitHub project contains the web application code developed with Visual Studio 2019 - .Net 5.0 framework. The PWA and master branches can be ignored. Those were draft versions from the UI development.
