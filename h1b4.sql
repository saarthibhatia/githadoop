use h1b;
select employer_name, count(employer_name) as cnt from h1b_final group by employer_name order by cnt desc limit 5;



