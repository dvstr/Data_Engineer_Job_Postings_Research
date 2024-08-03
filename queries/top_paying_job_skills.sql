-- required skills for the top-paying DE jobs with jobs

WITH top_de_jobs AS (
    SELECT
        job_id,
        name AS company_name,
        job_title,
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
        15
)

SELECT
    top_de_jobs.*,
    skills
FROM
    top_de_jobs
INNER JOIN
    skills_job_dim ON top_de_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id;

-- the list of the required skills for the top-paying DE jobs

WITH top_de_jobs AS (
    SELECT
        job_id
    FROM
        job_postings_fact
    WHERE
        job_title_short = 'Data Engineer'
        AND salary_year_avg IS NOT NULL
        AND job_location = 'Anywhere'
    ORDER BY
        salary_year_avg DESC
    LIMIT
        15
)

SELECT
    COUNT(top_de_jobs.job_id) AS number_of_jobs,
    skills AS skill_name
FROM
    top_de_jobs
INNER JOIN
    skills_job_dim ON top_de_jobs.job_id = skills_job_dim.job_id
INNER JOIN
    skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
GROUP BY
    skill_name
ORDER BY
    number_of_jobs DESC;
LIMIT 10;
