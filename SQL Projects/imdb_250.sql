SELECT * FROM public.imdb_250
ORDER BY rank ASC 

select * from imdb_250;

select directors from imdb_250;

select distinct directors from imdb_250;

select * from imdb_250 order by year;

select * from imdb_250 order by year desc;

select * from imdb_250 where 
genre = 'Drama' and rating < 9.0;

select * from imdb_250 where 
genre = 'Drama' and rating > 9.0;

select * from imdb_250 where directors = 'Christopher Nolan';

select * from imdb_250 order by year;

select * from imdb_250 order by year desc;

select * from imdb_250 order by year desc limit 5;

select * from imdb_250 order by year desc limit 5 offset 3;

select * from imdb_250 order by year desc fetch first 3 row only;

select * from imdb_250 order by year desc offset 3 rows fetch first 5 row only;

select name, rating from imdb_250 where name like 'A%';

select name, rating from imdb_250 where name like '%a';

select name, rating from imdb_250 where name like '%a%';

select name, rating from imdb_250 where name like '_a%';

select name, rating from imdb_250 where name like '%ion%';

select sum(rating) from imdb_250;

select avg(rating) from imdb_250;

select sum(rating) as total_rating from imdb_250;

select avg(rating) as average_rating from imdb_250;

select max(rating) as max_salary from imdb_250;

select min(rating) as min_salary from imdb_250;

select count(distinct directors) as total_directors from imdb_250;

select distinct directors from imdb_250;

select avg(rating) as average_rating from imdb_250 order by average_rating desc;

select name, avg(rating) as average_rating from imdb_250 group by name;

select Genre, max(rating) as max_rating from imdb_250 group by genre;

select Genre, count(genre) from imdb_250 group by genre;

select Genre, avg(rating) as avg_rating from imdb_250 group by genre having avg(rating) > 8.5;

select Genre, max(rating) as max_rating from imdb_250 group by genre;

--Case Expression in Postgre SQL:

SELECT name, rating, genre,
       CASE 
           WHEN rating > 8.0 AND rating <= 8.5 THEN 'Watch Later'
           WHEN rating > 8.5 AND rating <= 9.0 THEN 'Watch when time available'
           WHEN rating > 9.0 THEN 'Watch Immediately'
           ELSE 'Not Classified' -- Optional: for ratings that don't match any condition
       END AS watch_list
FROM imdb_250
ORDER BY rating DESC;

select name, rating, genre, directors from imdb_250 where rating > (select avg(rating) from imdb_250); 

/* SQL Functions */ :

select abs(-100);

select greatest(2,54,67,4,90,56.5,70);

select least(2,54,67,4,90,56.5,70);

select mod(54,10);

select power(2,3);

select sqrt(169);

select sin(0);

select sin(90);

select ceil(6.45);

select floor(6.45);

--String Functions:

select char_length('India is a Democracy');

select concat('PostgreSQL ','is ','interesting');

select left('India is a Democracy', 5);

select right('India is a Democracy', 12);

select repeat('Karthik ', 5);

select reverse('India is a Democracy');

--User Functions:

create or replace function
count_directors()
returns integer as $total_directors$
declare 
       total_directors integer;
begin
     select count(directors) into total_directors
     from imdb_250;
     return total_directors;
end;
$total_directors$ language plpgsql;

select count_directors();








 




