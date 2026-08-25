# Introduction
Focusing on Data Analyst roles in Poland this project explores top-paying jobs, in-demand skills, and where high demand meets high salary in data analytics.

SQL quieries can be found here: [project_files folder](/SQL_Project/project_files/)

# Background
### The questions I wanted to answear through SQL queries:

1. What are the top-paying data analyst jobs?

2. What skills are required for the top-paying data analyst jobs?

3. What are the most in-demand skills for data analyst?

4. What are the top skills based on salary?

5. What are the most optimal skills to learn?

# Tools I used
For the analysis I used several key tools:
 - **SQL** - for base of analysis, allowing me to query the database and discover critical insight
 - **PostgreSQL** - chosen database managemnet system for handling data
 - **Visual Studio Code** - IDE for database management and executing SQL queries
 - **Git & GitHub** - for version control, project tracking, sharing scripts and analysis

# The Analysis
Each query for this project invastigate specific aspect of the data analyst job market. Here's how I approached each question:

### 1. Top paying Data Analyst jobs

To identify the top paying roles I filtered data analyst position by average yearly salary and location focusing on jobs in Poland. This query recieve top 10 high paying opportunities in Data Analytics in Poland.

```sql
SELECT
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS comapny_name
FROM
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND 
    job_location = 'Poland' AND
    salary_year_avg IS NOT NULL
ORDER BY 
    salary_year_avg DESC
LIMIT 10
```
Here are the breakdown of the top data analyst jobs in 2023:
- Allegro dominates the highest-paying Data Analyst roles
7 out of the 10 highest-paying positions are at Allegro. The company also offers the highest salaries in the dataset, reaching $111,175 per year.
- Higher salaries are concentrated in experienced/specialized roles
The highest salaries are associated with specialized positions such as Financial Services, Delivery Experience Technology & Product, and CX Tech. Junior positions have noticeably lower salaries, mostly between $53,014 and $75,068.
- There is a significant salary gap between the top and bottom roles
The highest salary is $111,175, while the lowest among these 10 jobs is $53,014. That's a difference of about $58,161, meaning the highest salary is more than 2× the lowest.

### 2. Top paying job skills for Data Analyst roles
To understand what skills are required for the top-paying jobs, I joined job postings with the skills data, providing insights into what skill is valued the most.

Here are the key insights:

|Skill   | Mentions | % of top 10 roles|
|--------|----------|------------------|
|sql | 9 | 90% |
| gcp | 7 |  70% |
| python | 5 | 50%| 
|looker | 4 | 40% |
| tableau | 4 | 40% |
*Table of how many times skill is mentioned and % of it total*   

- SQL is by far the most important skill
Appears in 9 out of 10 roles (90%)
This makes SQL the most essential core skill in this dataset.

- Cloud skills are highly valued
GCP appears in 7 roles (70%)
BigQuery also appears, which reinforces the importance of the Google Cloud ecosystem.

- Python is the next major technical skill
Appears in 5 roles (50%)
Suggests that these higher-paying roles expect more than basic dashboarding and SQL.

- BI and visualization tools are also important
Looker: 40%
Tableau: 40%
This suggests visualization/reporting skills remain valuable, but employers use different BI platforms.

- More advanced data engineering / big data skills appear less frequently
Skills such as PySpark, Spark, Airflow, Hadoop, and BigQuery appear in some roles, indicating that the highest-paying analyst positions often overlap with data engineering or analytics engineering.

### 3. In-demand skills for data analyst.
This query identify skills most frequently mentioned in jobs postings in Poland.
Here are the results:

|skills  |demand_count|
|--------|------------|
|sql     |131         |
|python  |85          |
|excel   |73          |
|tableau |56          |
|power bi|46          |
*Table of demand for the top 5 skills*

SQL, Python and Excel and also BI tools are necessity funtamentals.

### 4. Top skills based on salary.
These query reveals skills that are associated with higher-paying Data Analyst roles.

|skills  |avg_salary|
|--------|----------|
|bigquery|111175    |
|airflow |111175    |
|tableau |109006    |
|windows |108283    |
|spark   |102500    |
|flow    |102500    |
|git     |102500    |
|hadoop  |102500    |
|scikit-learn|102500    |
|looker  |99979     |
*Table of average salary for top 10 paying skills*

Key trends:
- Cloud and data engineering skills lead the salary rankings. 
- Advanced BI tools are strongly associated with higher salaries. Tableau ($109K) and Looker (~$100K) rank well, suggesting that companies value analysts who can turn complex data into dashboards and business insights.
- The highest-paying skill set is becoming more technical. Overall, the strongest salary signals come from a combination of cloud platforms, data pipelines, big data tools, programming, and advanced BI.

### 5. Most optimal skills.
Combining insights from demand and salary data, this query pinpoint skills that are both in high demand and have high salaries, offering a strategic focus for skill development.

|skill_id|skills |demand_count|avg_salary|
|--------|-------|------------|----------|
|182     |tableau|4           |109006    |
|185     |looker |4           |99979     |
|1       |python |5           |96073     |
|0       |sql    |9           |86347     |
|81      |gcp    |7           |80492     |
*Table of most optimal skills sorted by salary*

SQL looks like the most important foundational skill because it has the highest demand. Python is a strong second skill because it combines reasonable demand with a higher average salary. Tableau and Looker appear to be associated with higher salaries, but their lower number of postings means the result is less reliable.

| Skill       | Demand |   Salary | Interpretation                      |
| ----------- | -----: | -------: | ----------------------------------- |
| **SQL**     |   🥇 9 |     $86k | Most important for job availability |
| **GCP**     |      7 |     $80k | High demand, but lower salary       |
| **Python**  |    🥈 5 |     $96k | Good combination of demand + salary |
| **Tableau** |      4 | 🥇 $109k | Highest salary, but small sample    |
| **Looker**  |      4 |    $100k | High salary, but small sample       |
*Final conclusion table*

# What I learned

Refreshed programming skills and SQL after few years including complex queries creation, IDE workaround, git and github workflow. 
Get to know what analitic job looks like.

# Conclusions

1. **Top-Paying Data Analyst Jobs** Higher salaries are concentrated in experienced/specialized roles and there is a significant salary gap between the top and bottom roles.
2. **Skills for top paying jobs**  SQL is by far the most important skill.
3. **Most in-demand skills** SQL, Python and Excel and also BI tools are necessity funtamentals.
4. **Skills with higher salaries** The highest-paying skill set is becoming more technical, but not necessary most popular skill.
5. **Optimal skills for job market value** SQL looks like the most important foundational skill because it has the highest demand.

### Closing Thoughts
This project enhanced my SQL skills and provided insight into data analyst job market. The findings will help me prioritize skill development and job search.