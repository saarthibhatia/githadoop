h1b = load '/home/hduser/H1B.txt' USING PigStorage(';') AS (s_no:long ,case_status, employee_name, soc_name, job_title, full_time_position, prevailing_wage:long, year, worksite, longitude:double, latitude:double);

filter_DE2012 = filter h1b by (year matches '.*2012.*');

de12 = foreach filter_DE2012 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;

grde12 = group de12 by $1;

cnt12 = foreach grde12 generate group, COUNT(de12.year);

dump cnt12;

