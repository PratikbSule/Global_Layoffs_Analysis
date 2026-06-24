# 📊 SQL Layoffs Data Cleaning & Exploratory Data Analysis

📌 Project Overview

This project analyzes global layoffs data to identify trends across companies, industries, countries, and time periods.
The objective is to clean raw, unstructured data and perform exploratory data analysis (EDA) to extract meaningful business insights related to workforce reductions driven by economic conditions, restructuring, and market changes.
The project demonstrates an end-to-end SQL workflow including data cleaning, transformation, and analytical querying to support data-driven decision-making.

---


🎯 Problem Statement

Global companies have experienced large-scale layoffs due to economic uncertainty, market slowdown, and organizational restructuring.
This project aims to analyze layoffs data to answer key business questions such as:
- Which companies and industries were most impacted by layoffs?
- How did layoffs trend over time globally?
- Which countries experienced the highest workforce reductions?
- What patterns exist among companies that underwent complete layoffs?

---


🛠️ Tools & Technologies

- MySQL
- SQL (Data Cleaning & Analysis)
- MySQL Workbench
- GitHub

---


🧹 Data Cleaning Approach

To ensure accurate and reliable analysis, the following data cleaning steps were performed:
- Created a staging table to preserve the original dataset
- Removed duplicate records to prevent incorrect aggregations
- Standardized company names for consistent grouping
- Standardized industry and country values to ensure uniformity
- Handled missing values in industry fields using available contextual data
- Converted date column from text format to proper DATE datatype
- Removed records with no valid layoff information

---

📊 Exploratory Data Analysis (EDA)

The cleaned dataset was analyzed to uncover key patterns and trends:
- Identified the highest layoff events recorded in the dataset
- Analyzed companies that laid off 100% of their workforce
- Ranked top companies by total layoffs
- Evaluated industries most affected by workforce reductions
- Examined countries with the highest layoff counts
- Analyzed layoffs trends over time (yearly and monthly)
- Identified top companies affected each year
- Calculated rolling total layoffs using window functions to understand trend progression

---

📈 Key Insights

- Total layoffs analyzed: 383,159, indicating large-scale global workforce reduction across industries
- Highest monthly layoffs: 84,714 (January 2023), showing peak impact during economic slowdown
- United States recorded the highest layoffs: 256,559, indicating strong concentration in major corporate and tech sectors
- Consumer industry was the most affected with 45,182 layoffs, highlighting sensitivity to demand fluctuations
- Amazon recorded the highest layoffs among companies with 18,150 employees affected, reflecting large-scale restructuring
- 116 companies experienced complete workforce layoffs (100%), indicating shutdowns or full wind-downs

---

🧠 SQL Concepts Used

- Data Cleaning: UPDATE, DELETE, ALTER TABLE
- Data Exploration: SELECT, WHERE, GROUP BY, ORDER BY
- Conditional Logic: CASE WHEN
- Aggregations: SUM, COUNT, MAX
- Advanced SQL Techniques:
Common Table Expressions (CTEs)
Window Functions (DENSE_RANK, rolling totals)

---

📉 Business Questions Answered

- Which companies had the highest layoffs globally?
- Which industries were most affected by workforce reductions?
- How did layoffs trend over time?
- Which countries experienced the highest impact?
- What proportion of companies had complete layoffs (100%)?

---

🚀 Future Improvements

- Build an interactive Power BI dashboard for visual storytelling
- Perform forecasting analysis on layoff trends
- Analyze layoffs by company funding stage
- Integrate Python for deeper statistical analysis
- Automate reporting using SQL procedures

---

📚 Learning Outcomes

This project helped strengthen my understanding of:
- Real-world SQL data cleaning techniques
- Handling missing and inconsistent data
- Performing exploratory data analysis using SQL
- Writing advanced SQL queries using CTEs and window functions
- Translating raw data into structured business insights
- Developing an analytical mindset focused on business problem-solving