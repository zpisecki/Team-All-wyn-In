#!/usr/bin/env python
# coding: utf-8

# In[ ]:


# DAEN 690
# Team All(wyn) In
# program to build dataframe with job price, experience, education, and job description

# ORIGINAL FILE 6/6/21 - Jeanine


# In[111]:


import pandas as pd
import html5lib
import bs4
import lxml.html as html
from selenium import webdriver
import requests
import re


# In[83]:


# arbitrary CALC search
url = "https://calc.gsa.gov/?education=BA%2CMA%2CPHD&q=computer%20programmer%2C%20%7C&min_experience=5&max_experience=7"


# In[73]:


# Google Chrome driver - may have to change if you don't have Chrome installed
driver = webdriver.Chrome(executable_path = "/Users/Jeanine/Downloads/chromedriver")
driver.implicitly_wait(30)

# pull html from page
driver.get('https://calc.gsa.gov/?education=BA%2CMA%2CPHD&q=%7C&schedule=736TAPS&min_experience=5&max_experience=7')
df=pd.read_html(driver.find_element_by_id("results-table").get_attribute('outerHTML'))[0]


# In[22]:


# scrape table from page
tab = driver.find_element_by_id("results-table")


# In[74]:


tab_html = tab.get_attribute('outerHTML')


# In[75]:


tab_dfs = pd.read_html(tab_html)


# In[76]:


df = tab_dfs[0]


# In[77]:


df.head(10)


# In[97]:


# pull external links from page
links = driver.find_elements_by_tag_name('a')


# In[99]:


# pull actual url from the list of links
links_list = []
i = 0
while i < len(links):
    links_list.append(links[i].get_attribute('outerHTML'))
    i += 1


# In[127]:


# turn list of links into a string for searching
links_str = ''.join(links_list)


# In[245]:


# get only the https://.....etc links and no other html characters
href_regex = r'href=[\'"]?([^\'" >]+)'


# In[130]:


lo_str = re.findall(href_regex, links_str)


# In[174]:


# keep only links to PDFs we want - may need to change for other pages if the page format is not exactly the same after searching
good_links = lo_str[9:len(lo_str)-7]


# In[172]:


# remove last line ("return to top")
df = df.drop(128)


# In[176]:


# add links list as new column
df['gsa_link'] = good_links


# In[177]:


display(df)


# In[ ]:


# BELOW IS PDF TEXT READING
#
#
#
#
#


# In[239]:


# get pdf url for first dataframe row
pdf_url = df["gsa_link"][0]
print(pdf_url)


# In[267]:


# pull the actual link of PDF - the link redirects after opening, so if we don't do this step, the PDF scrape results in an error
from urllib.request import build_opener, HTTPCookieProcessor
opener = build_opener(HTTPCookieProcessor())
response = opener.open(pdf_url)
rep_final = response.read().decode('utf-8')
print(rep_final)


# In[275]:


# get end of URL that is unique from rep_final string above
url_end = rep_final[rep_final.find('url=')+4:rep_final.find('><title')-1]


# In[336]:


print(df["gsa_link"][0])


# In[291]:


# get the front of the URL that does not change after redirect
url_split = pdf_url.split("/")[0:5]
url_beg = "/".join(url_split)


# In[292]:


print(url_beg)


# In[293]:


# combine to form correct URL for PDF scrape
url_full = url_beg + "/" + url_end


# In[294]:


print(url_full)


# In[295]:


import PyPDF2


# In[297]:


# scrape text from PDF
req = urllib.request.Request(url_full, headers={'User-Agent' : "Magic Browser"})
remote_file = urllib.request.urlopen(req).read()
remote_file_bytes = io.BytesIO(remote_file)
pdfdoc_remote = PyPDF2.PdfFileReader(remote_file_bytes)


# In[337]:


# view scraped first page of doc
info = pdfdoc_remote.getDocumentInfo()
pages = pdfdoc_remote.getNumPages()
page1 = pdfdoc_remote.getPage(0)
print(page1.extractText())


# In[300]:


# create a list of the text from each page - one element of the list is one page
pdf_pages_text = []
j = 0
while j < pdfdoc_remote.getNumPages():
    pdf_pages_text.append(pdfdoc_remote.getPage(j).extractText())
    j += 1


# In[305]:


# search for job title from first row of df - will need to change when automated to be correct job title
k = 0
finder_list = []
while k < pdfdoc_remote.getNumPages():
    finder_list.append(df["Labor category"][0] in pdf_pages_text[k])
    k += 1


# In[308]:


# get pages where the job title exists
res = [i for i, val in enumerate(finder_list) if val]
print(res)


# In[ ]:


# NOTE: page with pricing will have "Labor Category"


# In[341]:


# lowercase page so we don't need to worry about capitalization for keywords
page_text_lower = pdf_pages_text[40].lower()


# In[ ]:


# NOTE: want to get sandwiched text between words like experience, education, years
# pull string chunks between those words
# get string chunk containing the job title


# In[327]:


keywords = ['education', 'experience', 'years']


# In[334]:


# look for specific keywords in the page
check = [word for word in keywords if(word in page_text_lower)]
print(check)


# In[338]:


# split the page on "education" - will need to change based on the keywords that exist in the page
page_text_split = page_text_lower.split("education")


# In[339]:


# get targeted string of text from split page where the job title exists
matching = [s for s in page_text_split if df["Labor category"][0].lower() in s]


# In[343]:


print(matching)


# In[ ]:




