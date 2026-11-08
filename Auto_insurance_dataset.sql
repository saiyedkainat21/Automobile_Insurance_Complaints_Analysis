---------------------------------------------------------
-- Database Selection

use  project_automobile_insurance;

select * from auto_table;

show tables;

-- Data exploration

desc auto_table;

select * from auto_table
limit 10;

select count(*) total_rows
from auto_table;

-- Null values checking
select 
sum(case when company_name is null then 1 else 0 end) as null_company,
sum(case when ratio is null then 1 else 0 end) as null_ratio,
sum(case when total_complaints is null then 1 else 0 end) as null_complaints
from auto_table;

-- Find top 10 companies with highest complaints
select company_name,total_complaints
from auto_table
order by total_complaints desc
limit 10;

select * from auto_table;

-- Companies With Highest Complaint Ratio

select company_name, ratio, total_complaints
from auto_table
order by ratio desc
limit 10; 

-- Premium vs Complaints

select company_name,premiums_written,total_complaints
from auto_table
order by premiums_written desc
limit 10;

select sum(total_complaints) as overall_complaints,
	   avg(total_complaints) as avg_complaints,
       min(total_complaints) as min_complaints,
       max(total_complaints) as max_complaints
       from auto_table;
       
-- Total Complaints by Filing Year  

select filing_year,
sum(total_complaints) as yearly_complaints
from auto_table
group by filing_year
order by filing_year;     

-- Average Ratio by Year

select filing_year,
avg(ratio) as avg_ratio
from auto_table
group by filing_year
order by avg_ratio desc;

-- Top 5 Companies by Premiums

select company_name,
premiums_written
from auto_table
order by premiums_written desc
limit 5;

-- Companies With More Than 500 Complaints

select company_name,
sum(total_complaints) as total_complaints_count
from auto_table
group by company_name
having sum(total_complaints) > 500
order by total_complaints_count desc;

-- Companies With Highest Average Ratio

select company_name,
avg(ratio) as avg_ratio
from auto_table
group by company_name
having avg(ratio) > 1
order by avg_ratio desc
limit 10;

-- Best Performing Companies 

select company_name,
sum(total_complaints) as complaints
from auto_table
group by company_name
order by complaints asc
limit 10;

-- Complaint Efficiency Analysis

select company_name,
       total_complaints,
       premiums_written,
       ROUND(total_complaints / premiums_written,2) AS complaint_efficiency
from auto_table
where premiums_written > 0
order by complaint_efficiency DESC
limit 10;

-- Yearly Complaint Trend

select filing_year,
sum(total_complaints) as yearly_total
from auto_table
group by filing_year
order by filing_year;

select company_name,
total_complaints,
ratio,
premiums_written,
filing_year
from auto_table;

