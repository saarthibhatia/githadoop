h1b = load '/home/hduser/H1B.txt' USING PigStorage(';') AS (s_no:long ,case_status, employee_name, soc_name, job_title, full_time_position, prevailing_wage:long, year, worksite, longitude:double, latitude:double);

filter_DE2011 = filter h1b by (case_status == 'CERTIFIED' and year matches '.*2016.*');

de11 = foreach filter_DE2011 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;

grde11 = group de11 by $4;

cnt11 = foreach grde11 generate group, '2016' , COUNT(de11.year);
ordercnt11 = order cnt11 by $2 desc;
limitcnt11 = limit ordercnt11 10;
dump limitcnt11;

