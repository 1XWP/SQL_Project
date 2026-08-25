/*

-------------SUBQUERY example----------

SELECT *
FROM ( --subquery start
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
     ) AS january_jobs; -- subquery end
*/
/*

------------CTEs Example-------------

WITH january_jobs AS (--cte start
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT (MONTH FROM job_posted_date) = 1
    )--cte end

SELECT * 
FROM january_jobs;

*/

/*

-------------SUBQUERY example----------

SELECT 
    company_id,
    name AS company_name
FROM 
    company_dim
WHERE company_id IN (
    SELECT
        company_id
    FROM 
        job_postings_fact
    WHERE
        job_no_degree_mention = TRUE
)

*/

------------CTEs Example-------------

/*

WITH company_job_count AS (

    SELECT
        company_id,
        COUNT(*) AS total_jobs
    FROM 
        job_postings_fact
    GROUP BY
        company_id

)

SELECT 
    company_dim.name AS company_name,
    company_job_count.total_jobs
FROM company_dim 
LEFT JOIN company_job_count ON company_job_count.company_id = company_dim.company_id
ORDER BY total_jobs DESC;
*/

/*
Identify the top 5 skills that are most frequently mentioned in job postings.
 Use a subquery to find the skill IDs with the highest counts in the 
 skills_job_dim table and then join this result with the skills_dim table 
 to get the skill names.
*/
/*--SUBQUERY
SELECT
    sd.skills,
    top_skills.total_skill
FROM(
    SELECT 
        COUNT(*) AS total_skill,
        skill_id 
    FROM
    skills_job_dim
    GROUP BY skill_id
    ORDER BY total_skill DESC
    LIMIT 5
) AS top_skills

JOIN skills_dim AS sd
    ON top_skills.skill_id = sd.skill_id;

---------------
*/

/*
Determine the size category ('Small', 'Medium' or 'Large') for each company by 
first identifying the number of job postings they have. 
Use a subquery to calculate the total job posting per company. 
A company is considered 'Small' if it has less than 10 job postings,
'Medium' if the number of job postings is between 10 and 50, and
'Large' if it has more than 50 job postings.
Implement a subquery to aggregate job counts per company before classigying them 
based on size

*/
/*

-- Step 1: Subquery calculates total job postings per company
SELECT 
    company_job_counts.company_id,
    
    -- Step 2: Classify companies based on job count
    CASE 
        WHEN company_job_counts.job_count < 10 THEN 'Small'
        WHEN company_job_counts.job_count BETWEEN 10 AND 50 THEN 'Medium'
        ELSE 'Large'
    END AS company_size,
    
    company_job_counts.job_count  -- include count for reference

FROM (
    SELECT 
        company_id,
        COUNT(*) AS job_count   -- count job postings per company
    FROM job_postings_fact
    GROUP BY company_id
) AS company_job_counts;
*/

