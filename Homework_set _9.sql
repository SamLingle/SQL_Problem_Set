use sakila;

-- 1a. You need a list of all the actors who have Display the first and last names of all actors from the table actor.
select first_name, last_name from actor;

-- 1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
select concat(first_name, ' ', last_name) AS 'Actor Name' from actor;




-- 2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
select actor_id, first_name, last_name from actor
where last_name = 'Joe';

-- 2b. Find all actors whose last name contain the letters GEN:
select first_name, last_name from actor
where last_name like '%GEN%';

-- 2c. FInd all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order.
select last_name, first_name from actor
where last_name like '%LI%';

-- 2d. Using IN, display the country_id and country columns of the following countries: Afganistan, Bangladesh, and China.
select country_id, country from country
where country in ('Afganistan', 'Bangladesh', 'China');



-- 3a. You want to keep a description of each actor. You don't think you will be performing queries on a description, so create a column in the table actor named description and use the data type BLOB (Make sure to research the type BLOB, as the difference between it and VARCHAR are significant).
-- BLOB (Binary Large Objects) - A collection of binary data stored as a single entity in a database management system. 
alter table actor
add description blob;

-- 3b. Very quicly you realize that entering descriptions for each actor is too much effort. Delete the description column.
alter table actor
drop column description;

-- 4a. List the last names of actors, as well as how many actors have that last name. 
select last_name, count(*) as 'Count' from actor
group by last_name;

-- 4b. List last names of actors and the number of actors who have that last name. But only for names that are shared by at least two actors.
select last_name, count(*) as 'Count' from actor
group by last_name
having Count >= 2;

-- 4c. The actor Harpo Williams was accidnetally entered in the actor table as Groucho Williams. Write a query to fix the record
update actor 
set first_name = "HARPO"
where first_name = "GROUCHO" and last_name = "WILLIAMS";
-- confirm the data change.
select first_name, last_name from actor
where last_name = 'Williams';


-- 4d. Perhaps we were too hasty in changing Groucho to Harpo. It turns out that Groucho was the correct name aftewr all! In a single query, if the first name of the actor is currently Harpo, change it to Groucho.
update actor
set first_name = "GROUCHO"
where first_name = "HARPO" and last_name = "WILLIAMS";
-- confirm the data change.
select first_name, last_name from actor
where last_name = 'Williams';

-- 5a. You cannot locate the schema of the address table. Which query would you use to re-create it?
show create table address;

-- 6a. Use join to display the first and last names, as well as the address, of each staff member. Use the tables staff and address.
select first_name, last_name, address 
from staff join address
on staff.address_id = address.address_id;

-- 6b. Use join to display the total amount rung up by each staff member in August of 2005. Use tables Staff and payment. 
select first_name, last_name, sum(payment.amount) as 'Total'
from staff join payment
on staff.staff_id = payment.staff_id
group by first_name, last_name;

-- 6c. List each film and the number of actors who are listed for that film. Use the tables film_actor and film. Use inner join. 
select f.title, count(a.actor_id) as 'Total Actors'
from film f inner join film_actor  a on f.film_id = a.film_id
group by f.title;
