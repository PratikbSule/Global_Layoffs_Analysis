# 📊 Global Layoffs Data Analysis | SQL + Power BI

## 📌 Project Overview

This project analyzes global layoffs data to identify trends across companies, industries, countries, and time periods.

The objective is to clean raw, unstructured data, perform exploratory data analysis (EDA), and build an interactive Power BI dashboard to extract meaningful business insights related to workforce reductions driven by economic conditions, restructuring, and market changes.

The project demonstrates an end-to-end data analytics workflow including SQL data cleaning, transformation, exploratory analysis, and dashboard development to support data-driven decision-making.

---

## 🎯 Problem Statement

Global companies have experienced large-scale layoffs due to economic uncertainty, market slowdown, and organizational restructuring.

This project aims to analyze layoffs data to answer key business questions such as:

* Which companies and industries were most impacted by layoffs?
* How did layoffs trend over time globally?
* Which countries experienced the highest workforce reductions?
* What patterns exist among companies that underwent complete layoffs?

---

## 🛠️ Tools & Technologies

* MySQL
* SQL (Data Cleaning & Analysis)
* Power BI
* MySQL Workbench
* GitHub

---

## 🧹 Data Cleaning Approach

To ensure accurate and reliable analysis, the following data cleaning steps were performed:

* Created a staging table to preserve the original dataset
* Removed duplicate records to prevent incorrect aggregations
* Standardized company names for consistent grouping
* Standardized industry and country values to ensure uniformity
* Handled missing values in industry fields using available contextual data
* Converted date column from text format to proper DATE datatype
* Removed records with no valid layoff information

---

## 📊 Exploratory Data Analysis (EDA)

The cleaned dataset was analyzed to uncover key patterns and trends:

* Identified the highest layoff events recorded in the dataset
* Analyzed companies that laid off 100% of their workforce
* Ranked top companies by total layoffs
* Evaluated industries most affected by workforce reductions
* Examined countries with the highest layoff counts
* Analyzed layoffs trends over time (yearly and monthly)
* Identified top companies affected each year
* Calculated rolling total layoffs using window functions to understand trend progression

---

## 📈 Interactive Dashboard

An interactive two-page Power BI dashboard was developed to visualize the analysis.

### Dashboard Highlights

**Page 1 – Executive Overview**

* KPI Cards (Total Layoffs, Companies, Countries, Companies with 100% Layoffs)
* Monthly Layoff Trend
* Top Companies by Layoffs
* Layoffs by Industry
* Interactive Year and Country slicers

**Page 2 – Regional & Funding Analysis**

* Top Countries by Total Funds Raised
* Top Industries by Total Funds Raised
* Global Layoff Distribution Map

---

## 📈 Key Insights

* Total layoffs analyzed: **383,159**, indicating large-scale global workforce reductions across industries.
* Highest monthly layoffs: **84,714 (January 2023)**, showing peak impact during the economic slowdown.
* United States recorded the highest layoffs (**256,559**), indicating strong concentration in major corporate and technology sectors.
* Consumer industry recorded the highest layoffs (**45,182**), highlighting the impact on consumer-focused businesses.
* Amazon recorded the highest layoffs among companies (**18,150 employees**), contributing significantly to workforce reductions in the Consumer & Retail industry.
* **116 companies** experienced complete workforce layoffs (100%), indicating shutdowns or full business closures.

---

## 🧠 SQL Concepts Used

* Data Cleaning: UPDATE, DELETE, ALTER TABLE
* Data Exploration: SELECT, WHERE, GROUP BY, ORDER BY
* Conditional Logic: CASE WHEN
* Aggregations: SUM, COUNT, MAX
* Common Table Expressions (CTEs)
* Window Functions (DENSE_RANK, Rolling Totals)

---

## 📊 Power BI Features Used

* KPI Cards
* Line Charts
* Bar Charts
* Pie Chart
* Map Visualization
* Slicers
* Interactive Cross-filtering
* Custom Tooltips

---

## 📉 Business Questions Answered

* Which companies had the highest layoffs globally?
* Which industries were most affected by workforce reductions?
* How did layoffs trend over time?
* Which countries experienced the highest impact?
* What proportion of companies had complete layoffs (100%)?
* Which countries and industries received the highest funding before layoffs?

---

## 🚀 Future Improvements

* Perform forecasting analysis on layoff trends
* Analyze layoffs by company funding stage
* Integrate Python for deeper statistical analysis
* Build predictive models using Machine Learning
* Automate reporting using SQL procedures

---

## 📚 Learning Outcomes

This project helped strengthen my understanding of:

* Real-world SQL data cleaning techniques
* Handling missing and inconsistent data
* Performing exploratory data analysis using SQL
* Building interactive Power BI dashboards
* Writing advanced SQL queries using CTEs and Window Functions
* Translating raw data into business insights through data visualization
* Developing an analytical mindset focused on business problem-solving
