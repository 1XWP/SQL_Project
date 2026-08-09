-- kwerenda która wyswietla takie ogłoszenia o prace,
-- które oferują ubezpieczenie na życie i były opublikowane w 2 kwartale

/*SELECT
    job.job_health_insurance AS health_insurance,
    company.name 
FROM
    job_postings_fact AS job
LEFT JOIN 
    company_dim AS company ON job.company_id = company.company_id
WHERE
    job.job_health_insurance IS TRUE 
    AND (EXTRACT (MONTH FROM job.job_posted_date) BETWEEN '4' AND '6')
    */ 