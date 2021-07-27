# Team-All-wyn-In
DAEN 690-004 Team All(wyn) In

BLS_Data_Analysis file provides intial data wrangling and data engineering for ingestion into later steps.

BLS.ACCDB access file provides the data augmentation code for adding Education and years of experience per the mappign table in the access application.

BLS_Models.R file contains the R code for developing the linear regression, Regression Tree using recursive binary splitting and Random Forest machine learning models.

CALC_predictive_models.ipynb is a jupyter notebook file containing all of the code that performs linear regression, random forest, and XGBoost algorithms on the CALC dataset.

project_NLP.ipynb contains the NLP model used against the BLS dataset within Python.

The App branch within our GitHub project contains the web application code developed with Visual Studio 2019 - .Net 5.0 framework. The PWA and master branches can be ignored. Those were draft versions from the UI development.

All_CALC_NEW.csv contains the csv file with the total CALC data after document and web scraping. This does not include the NLP edits pertaining to assigning to the 10 job buckets.

calc_mapping.ipynb contains the code for determining the regions for the CALC data that match with the NCS regions, as well as plotting both datasets on a US map and for the distribution images within the report.

calc_scrape070421.ipynb is the total program that was written to pull the CALC data and scrape the job descriptions and locations from the GSA contract documents 

CALC_NLP.ipynb contains the SQL database creation and the NLP model Python code used for CALC dataset. 

tableau visualization.twb It is a Tableau file where we illustrate and visualize and created some of pur plots

Tableau Connection.R  We created this file to connecte our regression model in R to Tableau for further analysis

Regression Model .R  Here we have our coding related to liner and nonlinear regression, ANOVA analysis and other comparison analysis in R
