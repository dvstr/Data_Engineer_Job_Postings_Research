COPY company_dim
FROM '/Users/antonbykov/projects/for-github-prep/SQL_Project_Data_Job_Analysis/company_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_dim
FROM '/Users/antonbykov/projects/for-github-prep/SQL_Project_Data_Job_Analysis/skills_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY job_postings_fact
FROM '/Users/antonbykov/projects/for-github-prep/SQL_Project_Data_Job_Analysis/job_postings_fact.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');

COPY skills_job_dim
FROM '/Users/antonbykov/projects/for-github-prep/SQL_Project_Data_Job_Analysis/skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');