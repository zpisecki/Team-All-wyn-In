# Using AI for Labor Market Predictive Analysis

## File Documentation

[BLS_Data_Analysis.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/BLS%20Data%20Analysis.ipynb) file provides intial data wrangling and data engineering for ingestion into later steps.

[BLS.ACCDB](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/BLS.accdb) access file provides the data augmentation code for adding Education and years of experience per the mappign table in the access application.

[BLS_Models.R](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/BLS_MODELS.R) file contains the R code for developing the linear regression, Regression Tree using recursive binary splitting and Random Forest machine learning models.

[CALC_predictive_models.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/CALC_predictive_models.ipynb) is a jupyter notebook file containing all of the code that performs linear regression, random forest, and XGBoost algorithms on the CALC dataset.

[project_NLP.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/project_NLP.ipynb) contains the NLP model used against the BLS dataset within Python.

[All_CALC_NEW.csv](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/All_CALC_NEW.csv) contains the csv file with the total CALC data after document and web scraping. This does not include the NLP edits pertaining to assigning to the 10 job buckets.

[calc_mapping.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/calc_mapping.ipynb) contains the code for determining the regions for the CALC data that match with the NCS regions, as well as plotting both datasets on a US map and for the distribution images within the report.

[calc_scrape070421.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/calc_scrape070421.ipynb) is the total program that was written to pull the CALC data and scrape the job descriptions and locations from the GSA contract documents 

[CALC_NLP.ipynb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/CALC_NLP.ipynb) contains the SQL database creation and the NLP model Python code used for CALC dataset. 

[tableau visualization.twb](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/tableau%20visualization.twb) is a Tableau file where we illustrate and visualize the CALC data and create some of the corresponding plots

[Tableau Connection.R](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/Tableau%20Connection.R) is the bridge between the Tableau models and R

[Regression Model .R](https://github.com/zpisecki/Team-All-wyn-In/blob/c7098bf16ac65472b3e0ac461509d741c6fbb3bf/Regression%20Model%20.R) is code related to liner and nonlinear regression, ANOVA analysis and other comparitive analysis on the CALC data

### App Branch
The App branch within our GitHub project contains the web application code developed with Visual Studio 2019 - .Net 5.0 framework. The PWA and master branches can be ignored. Those were draft versions from the UI development.
