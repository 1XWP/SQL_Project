/*
-- January
CREATE TABLE january_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS 
    SELECT *
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

SELECT job_posted_date
FROM march_jobs;

--automatyzacja tego powyżej
DO $$
DECLARE 
    m INT;  -- variable to store month number
BEGIN
    FOR m IN 1..3 LOOP
        EXECUTE format('
            CREATE TABLE month_%s_jobs AS
            SELECT *
            FROM job_postings_fact
            WHERE EXTRACT(MONTH FROM job_posted_date) = %s;
        ', m, m);
        -- Creates tables: month_1_jobs, month_2_jobs, ..., month_X_jobs
    END LOOP;
END $$;
*/

SELECT
   salary_year_avg,
   job_id,
   job_title_short,
    CASE
        WHEN salary_year_avg > 100000 THEN 'HIGH'
        WHEN salary_year_avg BETWEEN 50000 AND 100000  THEN 'MID'
        ELSE 'LOW'
    END AS salary_tiers
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC;
