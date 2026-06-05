-- STEP 1: Explore the dataset structure

SELECT *
FROM layoffs;

SELECT COUNT(*)
FROM layoffs;

DESCRIBE layoffs;

-- STEP 2: Create a staging table for data cleaning

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT INTO layoffs_staging
SELECT *
FROM layoffs;

SELECT COUNT(*)
FROM layoffs_staging;

SELECT * FROM layoffs_staging;

-- STEP 3: Identify duplicate records

SELECT company,
       location,
       industry,
       total_laid_off,
       percentage_laid_off,
       date,
       stage,
       country,
       funds_raised_millions,
       COUNT(*) AS duplicate_count
FROM layoffs_staging
GROUP BY company,
         location,
         industry,
         total_laid_off,
         percentage_laid_off,
         date,
         stage,
         country,
         funds_raised_millions
HAVING COUNT(*) > 1;

-- STEP 3B: Assign row numbers to identify duplicates

CREATE TABLE layoffs_staging2 AS
SELECT *,
       ROW_NUMBER() OVER(
           PARTITION BY company,
                        location,
                        industry,
                        total_laid_off,
                        percentage_laid_off,
                        date,
                        stage,
                        country,
                        funds_raised_millions
           ORDER BY company
       ) AS row_num
FROM layoffs_staging;

SELECT *
FROM layoffs_staging2
WHERE row_num > 1;

-- STEP 3C: Remove duplicate records

DELETE
FROM layoffs_staging2
WHERE row_num > 1;

SELECT COUNT(*)
FROM layoffs_staging2;

-- STEP 4: Check company names for inconsistencies

SELECT DISTINCT company
FROM layoffs_staging2
ORDER BY company;

SELECT company,
       LENGTH(company) AS original_length,
       LENGTH(TRIM(company)) AS trimmed_length
FROM layoffs_staging2
WHERE company <> TRIM(company);

-- STEP 4B: Remove leading and trailing spaces from company names

UPDATE layoffs_staging2
SET company = TRIM(company);

-- STEP 5A: Explore industry values

SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY industry;

SELECT industry,
       COUNT(*) AS record_count
FROM layoffs_staging2
GROUP BY industry
ORDER BY industry;

-- STEP 5B: Standardize Crypto industry values

SELECT DISTINCT industry
FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = 'Crypto'
WHERE industry IN ('Crypto Currency', 'CryptoCurrency');

-- STEP 5C: Investigate missing industry values

SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
   OR industry = '';
   
-- STEP 5D: Find industry values for companies with missing industries

SELECT company,
       industry
FROM layoffs_staging2
WHERE company IN (
    'Airbnb',
    'Bally''s Interactive',
    'Carvana',
    'Juul'
)
ORDER BY company;

-- STEP 5E: Populate missing industry values using existing company records

UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
    ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
  AND t2.industry IS NOT NULL
  AND t2.industry <> '';
  
SELECT *
FROM layoffs_staging2
WHERE industry IS NULL
   OR industry = '';
   
-- STEP 6A: Explore country values

SELECT DISTINCT country
FROM layoffs_staging2
ORDER BY country;

-- STEP 6B: Remove trailing periods from country names

SELECT DISTINCT country
FROM layoffs_staging2
WHERE country LIKE 'United States%';

-- STEP 7A: Inspect date values

SELECT date
FROM layoffs_staging2
LIMIT 20;

-- STEP 7B: Convert date values from TEXT to DATE format

SELECT date,
       STR_TO_DATE(date, '%m/%d/%Y') AS converted_date
FROM layoffs_staging2
LIMIT 10;

-- STEP 7C: Convert text dates to SQL date format

UPDATE layoffs_staging2
SET date = STR_TO_DATE(date, '%m/%d/%Y');

-- STEP 7D: Change date column datatype from TEXT to DATE

ALTER TABLE layoffs_staging2
MODIFY COLUMN date DATE;

-- STEP 8A: Check remaining NULL values

SELECT
    SUM(CASE WHEN company IS NULL THEN 1 ELSE 0 END) AS company_nulls,
    SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS location_nulls,
    SUM(CASE WHEN industry IS NULL THEN 1 ELSE 0 END) AS industry_nulls,
    SUM(CASE WHEN total_laid_off IS NULL THEN 1 ELSE 0 END) AS total_laid_off_nulls,
    SUM(CASE WHEN percentage_laid_off IS NULL THEN 1 ELSE 0 END) AS percentage_laid_off_nulls,
    SUM(CASE WHEN date IS NULL THEN 1 ELSE 0 END) AS date_nulls,
    SUM(CASE WHEN stage IS NULL THEN 1 ELSE 0 END) AS stage_nulls,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS country_nulls,
    SUM(CASE WHEN funds_raised_millions IS NULL THEN 1 ELSE 0 END) AS funds_raised_nulls
FROM layoffs_staging2;

-- STEP 8B: Investigate missing date values

SELECT *
FROM layoffs_staging2
WHERE date IS NULL;

-- STEP 8C: Identify records with no layoff information

SELECT *
FROM layoffs_staging2
WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;
  
-- STEP 8D: Remove records with no layoff information

DELETE
FROM layoffs_staging2
WHERE total_laid_off IS NULL
  AND percentage_laid_off IS NULL;
  
SELECT COUNT(*)
FROM layoffs_staging2;

-- ==========================================
-- DATA CLEANING COMPLETE
-- Final Row Count: 1995
-- Dataset Ready for Analysis
-- ==========================================

-- EDA STEP 1: Find the maximum layoffs recorded

SELECT MAX(total_laid_off) AS max_layoffs
FROM layoffs_staging2;

-- EDA STEP 2: Companies with 100% layoffs

SELECT company,
       total_laid_off,
       percentage_laid_off
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

-- EDA STEP 3: Top companies by total layoffs

SELECT company,
       SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY company
ORDER BY total_layoffs DESC;

-- EDA STEP 4: Industries with the highest layoffs

SELECT industry,
       SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY industry
ORDER BY total_layoffs DESC;

-- EDA STEP 5: Countries with the highest layoffs

SELECT country,
       SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
GROUP BY country
ORDER BY total_layoffs DESC;

-- EDA STEP 6: Total layoffs by year

SELECT YEAR(date) AS layoff_year,
       SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
WHERE date IS NOT NULL
GROUP BY YEAR(date)
ORDER BY layoff_year;

-- EDA STEP 7: Monthly layoff trend

SELECT DATE_FORMAT(date, '%Y-%m') AS month,
       SUM(total_laid_off) AS total_layoffs
FROM layoffs_staging2
WHERE date IS NOT NULL
GROUP BY DATE_FORMAT(date, '%Y-%m')
ORDER BY total_layoffs DESC;

-- EDA STEP 8: Top 5 companies by layoffs each year

WITH company_year AS (
    SELECT YEAR(date) AS layoff_year,
           company,
           SUM(total_laid_off) AS total_layoffs
    FROM layoffs_staging2
    WHERE date IS NOT NULL
    GROUP BY YEAR(date), company
),
company_rank AS (
    SELECT layoff_year,
           company,
           total_layoffs,
           DENSE_RANK() OVER (
               PARTITION BY layoff_year
               ORDER BY total_layoffs DESC
           ) AS ranking
    FROM company_year
)
SELECT *
FROM company_rank
WHERE ranking <= 5
ORDER BY layoff_year, ranking;

-- EDA STEP 9: Rolling total layoffs by month

WITH monthly_layoffs AS (
    SELECT DATE_FORMAT(date, '%Y-%m') AS month,
           SUM(total_laid_off) AS total_layoffs
    FROM layoffs_staging2
    WHERE date IS NOT NULL
    GROUP BY DATE_FORMAT(date, '%Y-%m')
)
SELECT month,
       total_layoffs,
       SUM(total_layoffs) OVER (
           ORDER BY month
       ) AS rolling_total
FROM monthly_layoffs;
