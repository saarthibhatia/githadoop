h1b = load '/home/hduser/H1B.txt' USING PigStorage(';') AS (s_no:long ,case_status, employee_name, soc_name, job_title, full_time_position, prevailing_wage:long, year, worksite, longitude:double, latitude:double);

filter_DE2014 = filter h1b by (year matches '.*2014.*');

de14 = foreach filter_DE2014 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;

grde14 = group de14 by $4;

cnt14 = foreach grde14 generate group, '2014' , COUNT(de14.year);
ordercnt14 = order cnt14 by $2 desc;
limitcnt14 = limit ordercnt14 10;
dump limitcnt14;

