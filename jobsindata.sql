-- after creating an empty table within my PostgreSQL server and importing the CSV file
-- we now have the table with our 'Jobs and Salaies in Data Science' data from Kaggle
SELECT *
FROM public.jobs_in_data;

-- First, with how many variations of job titles there are within the Data Analytics and Science
-- space there are, let's check how many unique job titles there are in this dataset
SELECT COUNT(DISTINCT job_title) AS unique_titles
FROM jobs_in_data;
-- wow, looks like there are 125 unique titles in this data 

--Now, let's look at job_categories
SELECT COUNT(DISTINCT job_category) AS unique_categories
FROM jobs_in_data;
-- there are 10 unique categories - le's break it down even more 
-- and see the unique count per category
SELECT job_category, COUNT(DISTINCT job_title) AS unique_jobs
FROM jobs_in_data
GROUP BY job_category
ORDER BY unique_jobs DESC;
-- looks like Machine Learning and AI is leading the group with the most unique job titles

-- Now we'll look into the questions Jess asked in her challenge
-- First, are there any trends with salary over time? Let's see:
SELECT work_year, ROUND(AVG(salary_in_usd),2) AS avg_salary_usd
FROM jobs_in_data
GROUP BY work_year
ORDER BY work_year ASC;
-- averaging salaries per year across all jobs shows that there is a steady increase over time
-- with the biggest jump in avg salary between 2021 and 2022 where it jumped almost $30k

-- Next: is there any correlation between salary + job title?
-- first, we'll get avg salary by job title, then by job category
SELECT job_title, ROUND(AVG(salary_in_usd),2) AS avg_salary_usd
FROM jobs_in_data
GROUP BY job_title
ORDER BY avg_salary_usd DESC;

SELECT job_category, ROUND(AVG(salary_in_usd),2) AS avg_salary_usd
FROM jobs_in_data
GROUP BY job_category
ORDER BY avg_salary_usd DESC;
