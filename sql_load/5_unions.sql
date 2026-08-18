
/*Get the corresponding skill and skill type for each job posting in q1. 
Includes those without any skills, too. 
Look at the skills and the type for each dob in the first quater that has a salary <70000.*/
WITH quater_jobs AS (

SELECT 
    *
FROM january_jobs

--UNION -- bez duplikatow
UNION ALL

SELECT 
   *
FROM february_jobs

--UNION --bez duplikatow
UNION ALL

SELECT 
   *
FROM march_jobs
)

SELECT 
 quater_jobs.salary_year_avg,
 quater_jobs.job_title_short,
 skills_job_dim.job_id,
 skills_dim.skills

FROM quater_jobs
LEFT JOIN skills_job_dim ON quater_jobs.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE salary_year_avg > 70000;

/*

SELECT 
 quater_jobs.salary_year_avg,
 quater_jobs.job_title_short,
 skills_job_dim.job_id,
 skills_dim.skills

FROM (
    SELECT 
    *
    FROM january_jobs

    UNION ALL

    SELECT 
    *
    FROM february_jobs

    UNION ALL

    SELECT 
    *
    FROM march_jobs

) AS quater_jobs

LEFT JOIN skills_job_dim ON quater_jobs.job_id = skills_job_dim.job_id
LEFT JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

WHERE salary_year_avg > 70000;

*/

---
/* test */
