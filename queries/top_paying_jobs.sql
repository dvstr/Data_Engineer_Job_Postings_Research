SELECT
    job_id,
    name AS company_name,
    job_title,
    job_schedule_type,
    job_no_degree_mention,
    job_country,
    salary_year_avg
FROM
    job_postings_fact
LEFT JOIN
    company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Engineer'
    AND salary_year_avg IS NOT NULL
    AND job_location = 'Anywhere'
ORDER BY
    salary_year_avg DESC
LIMIT
    15;
