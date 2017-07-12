use h1b;
select soc_name,count(soc_name) as cnt from h1b_final where job_title LIKE '%DATA SCIENTIST%' group by soc_name order by cnt desc limit 1;
