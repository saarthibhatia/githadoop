h1b = load '/home/hduser/H1B.txt' USING PigStorage(';') AS (s_no:long ,case_status, employee_name, soc_name, job_title, full_time_position, prevailing_wage:long, year, worksite, longitude:double, latitude:double);

filter_DE2016 = filter h1b by (year matches '.*2016.*');

de16 = foreach filter_DE2016 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;

grde16 = group de16 by $4;

cnt16 = foreach grde16 generate group, '2016' , COUNT(de16.year);
ordercnt16 = order cnt16 by $2 desc;
limitcnt16 = limit ordercnt16 10;
dump limitcnt16;

