h1b = load '/home/hduser/H1B.txt' USING PigStorage(';') AS (s_no:long ,case_status, employee_name, soc_name, job_title, full_time_position, prevailing_wage:long, year, worksite, longitude:double, latitude:double);
filter2011 = filter h1b by (year matches '.*2011.*');
final2011 = foreach filter2011 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;
groupbyjob2011 = group final2011 by $4;
countofgr2011 = foreach groupbyjob2011 generate group as key, COUNT(final2011.job_title) as count2011;
--dump countofgr2011;
filter2012 = filter h1b by (year matches '.*2012.*');
final2012 = foreach filter2012 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;
groupbyjob2012 = group final2012 by $4;
countofgr2012 = foreach groupbyjob2012 generate group as key, COUNT(final2012.job_title) as count2012;

filter2013 = filter h1b by (year matches '.*2013.*');
final2013 = foreach filter2013 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;
groupbyjob2013 = group final2013 by $4;
countofgr2013 = foreach groupbyjob2013 generate group as key, COUNT(final2013.job_title) as count2013;

filter2014 = filter h1b by (year matches '.*2014.*');
final2014 = foreach filter2014 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;
groupbyjob2014 = group final2014 by $4;
countofgr2014 = foreach groupbyjob2014 generate group as key, COUNT(final2014.job_title) as count2014;

filter2015 = filter h1b by (year matches '.*2015.*');
final2015 = foreach filter2015 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;
groupbyjob2015 = group final2015 by $4;
countofgr2015 = foreach groupbyjob2015 generate group as key, COUNT(final2015.job_title) as count2015;

filter2016 = filter h1b by (year matches '.*2016.*');
final2016 = foreach filter2016 generate $0,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10;
groupbyjob2016 = group final2016 by $4;
countofgr2016 = foreach groupbyjob2016 generate group as key, COUNT(final2016.job_title) as count2016;

joindata = join countofgr2011 by key, countofgr2012 by key, countofgr2013 by key, countofgr2014 by key, countofgr2015 by key, countofgr2016 by key;
--dump joindata;
finaljoin = foreach joindata generate $0, $1, $3, $5, $7, $9, $11, ($3-$1) as a, ($5-$3) as b, ($7-$5) as c, ($9-$7) as d, ($11-$9) as e;
--dump finaljoin;
avggrowth = foreach finaljoin generate $0, (a+b+c+d+e)/5;
--dump avggrowth;
orderavggrowth = order avggrowth by $1 desc;
limitgr = limit orderavggrowth 5;
dump limitgr;

