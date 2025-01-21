

# Data Analytics Power BI Report

In this project I:
- Performed ETL on a 120,000-record e-commerce data-set, extracting data
from Azure Storage and Azure SQL Database accounts into Power BI
- Transformed and cleaned data using Power Query to form a star-based
schema data model including a custom date table, and implemented 25 DAX
measures to support visualisations and time intelligence
- Created a 4-page report in Power BI containing 40 visualisations
- Constructed 5 SQL queries for the same data to generate insights for use
outside of the Power BI environment.

### Step 1. Import Data
<div style="text-align: center"><img src="images\import.png" width=80%></img></div>

To simulate a real-world scenario, I imported data from a variety of data sources, including an Azure SQL DB, an Azure Blob Storage account, and web-hosted .csv files. I then performed data cleaning by removing irrelevant columns, splitting datetime details, concatenating other columns, maintaining data consistency and tidy naming conventions.

### Step 2. Build Data Model
<div style="text-align: center"><img src="images/data_model.png" width=80%></img></div>
I create a star-schema by centring the data around the `Orders` fact table,
and establishing one-to-many relationships with the various dimension tables.

This includes creating a date table from an M query, which dynamically chooses the fact table's earliest date as the start and the last as the end. This means as the data gets updated, so does the date table.

### Step 3. Set Up Report

