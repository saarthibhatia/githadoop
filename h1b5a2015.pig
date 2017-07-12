h1b = load '/home/hduser/H1B.txt' USING PigStorage(';') AS (s_no:long ,case_status, employee_name, soc_name, job_title, full_time_position, prevailing_wage:long, year, worksite, longitude:double, latitude:double);

filter_DE2015 = filter h1b by (year matches '.*2015.*');

de15 = foreach filter_DE2015 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;

grde15 = group de15 by $4;

cnt15 = foreach grde15 generate group, '2015' , COUNT(de15.year);
ordercnt15 = order cnt15 by $2 desc;
limitcnt15 = limit ordercnt15 10;
dump limitcnt15;

