/*
Answer: What are the top skills based on salary?
 - Look at the average salary associated with each skill for DataAnalyst position
 - Focuses on roles with specified salaries in Poland
 - Why? It reveals how different skills impact salary levels for DA and
 helps identify the most financially rewarding skills to acquire or improve
*/
SELECT 
    skills,
    ROUND (AVG(salary_year_avg), 0) AS avg_salary
FROM 
    job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id 
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id 
WHERE  
     job_title_short = 'Data Analyst' 
     AND salary_year_avg IS NOT NULL
     AND job_location = 'Poland'
GROUP BY 
    skills
ORDER BY 
    avg_salary DESC
LIMIT 25
/*
Key trends
 - Cloud and data engineering skills lead the salary rankings. BigQuery and Airflow have the highest average salary at $111K, while Spark, Hadoop, and PySpark also rank relatively highly. This suggests that higher-paying Data Analyst roles increasingly overlap with data engineering and cloud analytics.
- Advanced BI tools are strongly associated with higher salaries. Tableau ($109K) and Looker (~$100K) rank well, suggesting that companies value analysts who can turn complex data into dashboards and business insights.
- Python pays more than SQL, but SQL remains the foundation. Python averages around $96K, compared with $86K for SQL. This may indicate that roles requiring programming and more advanced analysis tend to pay more, while SQL is a more universal baseline skill.
- Traditional office tools are less lucrative. Excel averages around $74K, while PowerPoint and SAP are around $60K, suggesting these skills alone are less associated with the highest-paying analytical roles.
- The highest-paying skill set is becoming more technical. Overall, the strongest salary signals come from a combination of cloud platforms, data pipelines, big data tools, programming, and advanced BI.