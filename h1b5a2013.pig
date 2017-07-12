h1b = load '/home/hduser/H1B.txt' USING PigStorage(';') AS (s_no:long ,case_status, employee_name, soc_name, job_title, full_time_position, prevailing_wage:long, year, worksite, longitude:double, latitude:double);

filter_DE2013 = filter h1b by (year matches '.*2013.*');

de13 = foreach filter_DE2013 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;

grde13 = group de13 by $4;

cnt13 = foreach grde13 generate group, '2013' , COUNT(de13.year);
ordercnt13 = order cnt13 by $2 desc;
limitcnt13 = limit ordercnt13 10;
dump limitcnt13;

