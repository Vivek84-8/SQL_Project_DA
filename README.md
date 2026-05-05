# Data Analyst Job Market Analysis

## Project Overview

This SQL project analyzes Data Analyst job postings to identify high-paying jobs, required skills, in-demand skills, and high-salary skills.

---

## Business Problem

Many beginners do not know which skills are most valuable for Data Analyst jobs.  
This project helps identify the skills and job trends that can improve job preparation and career growth.

---

## Dataset Information

The dataset contains job market data including:

- Job title
- Company name
- Job location
- Salary
- Job schedule type
- Required skills
- Job posted date

---

## Tools Used

- **SQL**
- **PostgreSQL**
- **VS Code**
- **Git**
- **GitHub**

---

## Project Workflow

1. Understand the business problem
2. Explore the job posting dataset
3. Write SQL queries
4. Analyze salary and skill demand
5. Generate insights and recommendations

---

# SQL Analysis

## 1. Top Paying Data Analyst Jobs

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS company_name
FROM
    job_postings_fact
LEFT JOIN company_dim 
    ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'
    AND salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
**Purpose:** Finds the top 10 highest-paying remote Data Analyst jobs.
## 2. Skills Required for Top Paying Jobs

```sql
WITH top_paying_jobs AS (
    SELECT
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim 
        ON job_postings_fact.company_id = company_dim.company_id
    WHERE
        job_title_short = 'Data Analyst'
        AND job_location = 'Anywhere'
        AND salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)

SELECT
    top_paying_jobs.*,
    skills
FROM
    top_paying_jobs
INNER JOIN skills_job_dim 
    ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim 
    ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
    salary_year_avg DESC;
```
**Purpose:** Finds the skills required for the highest-paying Data Analyst jobs.
## Key Insights

- Remote Data Analyst jobs offer strong salary opportunities.
- SQL is one of the most important skills for Data Analyst roles.
- Python, Excel, Tableau, and Power BI are also highly demanded.
- High-paying jobs often require both technical and analytical skills.
- Specialized skills can increase salary potential.

---

## Recommendations

- Learn **SQL** first because it is the core skill for Data Analysts.
- Practice **joins, CTEs, GROUP BY, aggregate functions, and filtering**.
- Learn **Excel** for reporting and basic business analysis.
- Learn **Python** for data cleaning and automation.
- Learn **Power BI or Tableau** for visualization and dashboarding.
- Focus on real projects to show practical skills on GitHub.

---

## Final Conclusion

This project helped analyze the Data Analyst job market using SQL.  
The analysis shows that SQL, Excel, Python, and visualization tools are important for Data Analyst roles.  
The project also helped identify high-paying jobs, in-demand skills, and salary-based skill trends.

