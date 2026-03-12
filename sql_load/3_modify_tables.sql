TRUNCATE TABLE company_dim,
skills_dim,
job_postings_fact,
skills_job_dim
CASCADE; 

COPY company_dim 
FROM 'C:\SQL_Project_DA\csv_files\company_dim.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim 
FROM 'C:\SQL_Project_DA\csv_files\skills_dim.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact 
FROM 'C:\SQL_Project_DA\csv_files\job_postings_fact.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim 
FROM 'C:\SQL_Project_DA\csv_files\skills_job_dim.csv' 
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

SELECT * 
FROM company_dim
LIMIT 100;