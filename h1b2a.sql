use h1b;
select split(worksite,'[,]')[1] as state, count(split(worksite,'[,]')[1]) as job_cnt from h1b_final where job_title LIKE '%DATA ENGINEER%' group by split(worksite,'[,]')[1] order by job_cnt desc limit 1;


