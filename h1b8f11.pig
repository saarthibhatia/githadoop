h1b = load '/home/hduser/H1B.txt' USING PigStorage(';') AS (s_no:long ,case_status, employee_name, soc_name, job_title, full_time_position, prevailing_wage:long, year, worksite, longitude:double, latitude:double);

filter_p11 = filter h1b by (full_time_position matches '.*Y.*' and year matches '.*2011.*');

p11 = foreach filter_p11 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;

grp11 = group p11 by $4;

sumgr = foreach grp11 generate group, '2011', (SUM(p11.prevailing_wage))/(COUNT(p11.year));

ordersum = order sumgr by $2 desc;

dump ordersum;



