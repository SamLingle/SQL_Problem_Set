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

-- 6d. How many copies of the film Hunchback Impossible exist in the inventory system
select film.title, count(inventory.film id) as 'Number of Copies' from film 
join inventory on film.film_id = inventory.film_id
where film.title == 'Hunchback Impossible';

-- 6e. Using the tables payment and customer and the join command, list the total paid by each customer. List the customers alphabetically by last name.
select customer.first_name , customer.last_name, sum(payment.amount) as 'Total'
from customer left join payment
on customer.customer_id=payment.customer_id
group by first_name, last_name
order by last_name;

-- 7a. the music of Queen and kris kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.alter

select title from film
where title LIKE 'K%' OR title LIKE 'Q%' 
and language_id = (select language_id from language where name='English')

-- 7b. Use subqueries to display all of the actors who appear in the film Alone Trip.
select first_name, last_name from actor
where actor_id 
in (select actor_id from film_actor where film_id
in (select film_id from film where title = 'Alone Trip'));

-- 7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information. 
select first_name, last_name, email  from customer
join address on customer.address_id = address.address_id
join city on address.city_id=city.city_id
join country on city.country_id= country.country_id;

-- 7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
select title from film
join film_category on (film.film_id = film_category.film_id)
join category on (film_category.category_id=category.category_id);

-- 7e. Display the most frequently rented movies in descending order.
select title, count(film_id) as 'Rented_Movie_Count'
from  film
join inventory on (film.film_id= inventory.film_id)
join rental on (inventory.inventory_id=rental.inventory_id)
group by title order by Rented_Movie_Count desc;

-- 7f. Write a query to display how much business, in dollars each store brought in.
select staff.store_id, sum(payment.amount) from payment
join staff on (payment.staff_id=staff.staff_id)
group by store_id;

-- 7g. Write a query to display for each store its store ID, city, and country.
select store_id, city, country from store
join address on store.address_id=address.address_id
join city on address.city_id=city.city_id
join country on city.country_id=country.country_id;

-- 7h. List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)
select category.name as "Top Five", sum(payment.amount) as "Gross" 
from category
join film_category  on category.category_id=film_category.category_id
join inventory on film_category.film_id=inventory.film_id
join rental on inventory.inventory_id=rental.inventory_id
join payment on rental.rental_id=payment.rental_id
group by category.name order by Gross limit 5;

-- 8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view.
select category.name as "Top Five", sum(payment.amount) as "Gross" from category
join film_category on (category.category_id=film_category.category_id)
join inventory on (film_category.film_id=inventory.film_id)
join rental on (inventory.inventory_id=rental.inventory_id)
join payment on (rental.rental_id=payment.rental_id)
group by category.name 
order by Gross limit 5;

-- 8b. How would you display the view that you created in 8a?
select * from TopFive;

-- 8c. You find that you no longer need the view top_five_genres. Write a query to delete it.
drop view TopFive;