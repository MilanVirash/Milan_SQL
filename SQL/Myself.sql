select first_name, last_name
from actor;

select * 
from city;

select * from country;

select first_name as FNAME, last_name as LNAME
from actor;

select title,length
from film
where length>120;

select title,length
from film
where length<120;

select title,length
from film
where length=46;

select title,length
from film
where length!=46;

select title,rating
from film
where rating='G';

select title,rating
from film
where rating='G' or rating='R';

select title,length, rating
from film
where length>120 and rating='r';

# select
# where: arithmatic operators: < > <=, >=, =, !=
# (like)

select *
from film
where title like "ha%";

select *
from film
where title like "%y";

select *
from film
where title like "w%y";

select *
from film
where title like "__l%";

select *
from film
where title like "c%r_";

select *
from film
where title like "c%rr_";

select *
from film
where rating like "_";

select *
from actor
where last_name like "%o%";

select *
from actor
where last_name like "%!%%" escape "!";

select *
from actor
where first_name like "%!_%" escape "!";

select *
from actor
limit 5;

select * 
from city
order by country_id;

select * 
from city
order by country_id desc
limit 10;

select * 
from film
where length between 100 and 200;

select * 
from film
where rating in ("g", "r", "pg-13");

select * 
from film
where rating not in ("g", "r", "pg-13");

select * 
from address
where address2 is null;

select * 
from address
where address2 is not null;

# aggregate Functions
select avg(length)
from film;

select sum(length)
from film;

select count(length) as abc
from film; # non null count of length values

select count(address2)
from address;

select count(*)
from address;

select min(length) from film;
select max(length) from film;

select *
from film 
where length > 115;

select *
from film
where length > (select avg(length) from film);

describe actor;

# grp by applyable in qualitative columns

select rating, avg(length), count(rating), avg(rental_rate)
from film
group by rating;

select rating, count(replacement_cost)
from film
group by rating;

select city_id, count(address)
from address
group by city_id;

select city_id, count(address) as cid
from address
group by city_id
having cid > 1;

select country_id, count(city)
from city
group by country_id;

select country_id, count(city)
from city
group by country_id
having count(city) > 20;

select category_id, count(film_id)
from film_category
group by category_id;

select rating, avg(length)
from film
where length > 100
group by rating;

select rating, avg(length)
from film
where length > 100
group by rating 
having avg(length) > 140;

select rating, avg(length)
from film
where length > 100
group by rating 
having avg(length) > 140
order by avg(length) desc
limit 2;

select category.name, count(film_id)
from film_category join category
	on film_category.category_id = category.category_id
group by category.name;

select category.name, avg(film.length)
from film join film_category on film.film_id = film_category.film_id
	join category on film_category.category_id = category.category_id
group by category.name;

select address.address, country.country
from address join city on address.city_id = city.city_id
	join country on city.country_id = country.country_id;
    
    
select actor.first_name, actor.last_name, count(film.title)
from film_actor join actor on film_actor.actor_id = actor.actor_id
	join film on film_actor.film_id = film.film_id
group by actor.first_name, actor.last_name;

select actor.first_name, actor.last_name, count(*)
from film_actor join actor on film_actor.actor_id = actor.actor_id
group by actor.first_name, actor.last_name
having count(*) > 20;

select actor.first_name, actor.last_name, count(*)
from film_actor join actor on film_actor.actor_id = actor.actor_id
group by actor.first_name, actor.last_name
having count(*) > 20 and actor.first_name like "N%";