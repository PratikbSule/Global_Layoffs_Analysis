# SQL Layoffs Data Cleaning & Exploratory Data Analysis

## Project Overview

As part of my SQL learning journey, I worked on a real-world layoffs dataset to perform data cleaning and exploratory data analysis (EDA) using MySQL.

The goal was to transform raw data into a clean dataset and generate meaningful business insights using SQL

The objective was to transform raw data into a clean and reliable dataset, then perform exploratory data analysis (EDA) to identify trends, patterns, and business insights related to layoffs across companies, industries, countries, and years

---

## Tools Used

- MySQL
- SQL
- MySQL Workbench
- GitHub

---

## Data Cleaning Steps

The following data cleaning tasks were performed:

- Created a staging table to preserve raw data
- Identified and removed duplicate records
- Standardized company names
- Standardized industry values
- Handled missing industry values
- Standardized country values
- Converted date column from TEXT to DATE datatype
- Removed records with no layoff information

---

## Exploratory Data Analysis

The following analyses were performed:

- Maximum layoffs recorded
- Companies with 100% layoffs
- Top companies by total layoffs
- Top industries by layoffs
- Top countries by layoffs
- Layoffs by year
- Monthly layoff trends
- Top companies by layoffs each year
- Rolling total layoffs over time

---

## Key Insights

- Total layoffs analyzed: **383,159**
- Highest monthly layoffs: **84,714 (January 2023)**
- Country with highest layoffs: **United States (256,559)**
- Industry with highest layoffs: **Consumer (45,182)**
- Company with highest layoffs: **Amazon (18,150)**
- 116 companies laid off 100% of their workforce

---

## SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- UPDATE
- DELETE
- ALTER TABLE
- CASE WHEN
- Aggregate Functions
- Common Table Expressions (CTEs)
- Window Functions
- DENSE_RANK()

---

## Future Improvements

Possible enhancements for this project:

- Create visual dashboards using Power BI or Tableau
- Perform trend forecasting on layoff data
- Build interactive charts for yearly and monthly layoffs
- Analyze layoffs by company stage and funding raised
- Create automated SQL reports using stored procedures
- Integrate the dataset with Python for advanced analysis

---

## Learning Outcomes

This project helped me strengthen my understanding of:

- Data Cleaning using SQL
- Handling Missing Values
- Removing Duplicates
- Data Standardization
- Exploratory Data Analysis (EDA)
- Common Table Expressions (CTEs)
- Window Functions
- Business Insight Generation

As a fresher, this project provided hands-on experience working with real-world data and applying SQL techniques used in data analytics workflows.

## Project File

- `layoffs_project.sql` → Complete Data Cleaning and EDA SQL script
