h1b = load '/home/hduser/H1B.txt' USING PigStorage(';') AS (s_no:long ,case_status, employee_name, soc_name, job_title, full_time_position, prevailing_wage:long, year, worksite, longitude:double, latitude:double);

gr = group h1b by $4;

cnt = foreach gr generate group,COUNT(h1b.year);
ordercnt = order cnt by $1 desc;
limitcnt = limit ordercnt 10;
dump limitcnt;

