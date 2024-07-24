# select
#where : (arithmetic operators < > <= >= != =)(and, or)
# (like)

select first_name, last_name 
from actor;

select * 
from city;

select * from country;

#aliasing
select first_name as FNAME, last_name as LNAME 
from actor;

#conditional extraction 

select title,length 
from film
where length<120;


select title,length 
from film
where length=46;

select title,length 
from film
where length!=46

select title,length 
from film
where length<>46

select title, rating
from film 
where rating = "G";

select title, rating
from film 
where rating = "G" or rating = "R";


select *  
from film 
where length > 120 and rating = "R"

select *  
from film 
where title like "ha%"


select *  
from film 
where title like "%y"

select *  
from film 
where title like "w%y"


select * 
from film 
where title like "__L%"

select * 
from film
where title like "c%r_"

select * 
from film
where title like "c%rr_"


insert into actor (first_name, last_name) values ("bhagi_rath", "pan%choli")
insert into actor (first_name, last_name) values ("bhagi_rath_", "pancholi")

#actors with _ in lastname

select * 
from actor
where last_name like "%o%"

select * 
from actor
where last_name like "%oo%"

select * 
from actor
where last_name like "%!%%" escape "!";


select * 
from actor
where first_name like "%!_%" escape "";

select * 
from actor
where first_name like "%!_%!_%" escape "!";

select * 
from actor
limit 5;

select * 
from city
order by country_id desc
limit 10

select * 
from film
where length between 100 and 200

select * 
from film 
where rating in ("G", "R", "PG-13")

select * 
from film 
where rating not in ("G", "R", "PG-13")

select * 
from address 
where address2 is null

select * 
from address 
where address2 is not null

#aggregate function
select avg(length) as "avg" from film
select sum(length) from film
#non null count of length values
select count(length) as abc from film

select count(address2)
from address 

select count(*)
from address 

select min(length) from film

select max(length) from film

# movies having length >avg length

select avg(length) from film

select * 
from film
where length > (select avg(length) from film)

describe actor;

#rating wise avg length
select rating, avg(length) as AVG_LEN, count(rating)
from film 
group by rating

#city wise how many addresses are there?
select country_id, count(city)
from city 
group by country_id 
having count(city) > 20

#category wise movie count
select category_id, count(film_id) as abc
from film_category
group by category_id

select rating, avg(length)
from film 
group by rating


select rating, avg(length)
from film 
where length > 100
group by rating 
having avg(length) > 140
order by avg(length) desc
limit 2


create database temp;
use temp;
create table members(mid int, name varchar(20), primary key(mid));
create table committee(cid int, name varchar(20), primary key(cid));

INSERT INTO members
VALUES(1,'hirva'),(2,'janardan'),(3,'meera'),(4,'meena'),(5,'maharshi');

INSERT INTO committee
VALUES(1, 'hirva'),(2, 'meera'),(3, 'maharshi'),(4, 'bhagirath');


select *
from members join committee on members.name = committee.name

select * 
from members left join committee on members.name = committee.name

select mid, cid, members.name
from members right join committee on members.name = committee.name


select category.name, count(film_id)
from film_category join category 
	on film_category.category_id = category.category_id
group by category.name


