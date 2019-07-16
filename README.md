# SQL_Requests
Using MySQL workbench and SQL to write scripts that will retrieve and update data stored in the Sakila database as an exploration of using SQL for data storage and retrieval. 


## Commands:
1a. Display the first and last names of all actors from the table actor.
![1a](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/1a.png)
1b. Display the first and last name of each actor in a single column in upper case letters. Name the column Actor Name.
![1b](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/1b.png)


2a. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you use to obtain this information?
![2a](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/2a.png)
2b. Find all actors whose last name contain the letters GEN:
![2b](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/2b.png)
2c. Find all actors whose last names contain the letters LI. This time, order the rows by last name and first name, in that order:
![2c](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/2c.png)
2d. Using IN, display the country_id and country columns of the following countries: Afghanistan, Bangladesh, and China:
![2d](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/2d.png)


3a. You want to keep a description of each actor. You don't think you will be performing queries on a description, so create a column in the table actor named description and use the data type BLOB (Make sure to research the type BLOB, as the difference between it and VARCHAR are significant).
![3a](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/3a.png)
3b. Very quickly you realize that entering descriptions for each actor is too much effort. Delete the description column.
![3b](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/3b.png)


4a. List the last names of actors, as well as how many actors have that last name.
![4a](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/4a.png)
4b. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors.
![4b](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/4b.png)
4c. The actor HARPO WILLIAMS was accidentally entered in the actor table as GROUCHO WILLIAMS. Write a query to fix the record.
![4c](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/4c.png)
4d. Perhaps we were too hasty in changing GROUCHO to HARPO. It turns out that GROUCHO was the correct name after all! In a single query, if the first name of the actor is currently HARPO, change it to GROUCHO.
![4d](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/4d.png)


5a. You cannot locate the schema of the address table. Which query would you use to re-create it?
![5a](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/5a.png)


6a. Use JOIN to display the first and last names, as well as the address, of each staff member. Use the tables staff and address:
![6a](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/6a.png)
6b. Use JOIN to display the total amount rung up by each staff member in August of 2005. Use tables staff and payment.
![6b](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/6b.png)
6c. List each film and the number of actors who are listed for that film. Use tables film_actor and film. Use inner join.
![6c](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/6c.png)
6d. How many copies of the film Hunchback Impossible exist in the inventory system?

6e. Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name:
![6e](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/6e.png)


7a. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.
![7a](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/7a.png)
7b. Use subqueries to display all actors who appear in the film Alone Trip.
![7b](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/7b.png)
7c. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers. Use joins to retrieve this information.
![7c](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/7c.png)
7d. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as family films.
![7d](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/7d.png)
7e. Display the most frequently rented movies in descending order.
![6e](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/6e.png)
7f. Write a query to display how much business, in dollars, each store brought in.
![7f](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/7f.png)
7g. Write a query to display for each store its store ID, city, and country.
![7g](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/7g.png)
7h. List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)
![7h](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/7h.png)


8a. In your new role as an executive, you would like to have an easy way of viewing the Top five genres by gross revenue. Use the solution from the problem above to create a view. If you haven't solved 7h, you can substitute another query to create a view.
![8a](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/8a.png)
8b. How would you display the view that you created in 8a?
![8b](https://github.com/SamLingle/SQL_Sakila_Requests/blob/master/Sakila%20requests%20Images/8b.png)
8c. You find that you no longer need the view top_five_genres. Write a query to delete it.


## How to use:
To use this script, you will need to load data from a sample database provided by MySQL named Sakila. You will also need to use MySQL Workbench. Found [here](https://dev.mysql.com/downloads/workbench/) if you do not have it downloaded already.

# Installing the Sakila Sample Database

For these scripts to work you’ll need to load data from a sample database provided by MySQL named [Sakila](https://dev.mysql.com/doc/sakila/en/sakila-installation.html).

All queries noted in the instructions for the homework are tied to this database, so you must complete this step before moving forward.

If you’re on a PC and used MySQL Installer to install MySQL, you may already have the Sakila database loaded. Before you do anything else, open MySQL workbench and examine the list of databases loaded on your computer:

![list of databases](Images/list_of_databases.png)

If the **sakila** DB is on this list, congrats! You can run

```sql
use sakila;
```

and start the homework. Otherwise, read on.

## Download the Sakila DB

Visit [this page](https://dev.mysql.com/doc/index-other.html) and find the "sakila database" under the _Example Databases_ header:

![example databases](Images/example_dbs.png)

Click on the ["Zip" link](http://downloads.mysql.com/docs/sakila-db.zip) to download. This contains a zipped directory of all the files required to load the sample database.

On your computer, open the zip file, and **cd into the sakila-db directory that gets unzipped**. You should see three files:

![three sakila files](Images/three_sakila_files.png)

At this point, you’re ready to load the sample database into MySQL.

## Installing the Sakila DB using the command line

It’s important to get familiar with loading data into MySQL using the command line, _mysql_ utility. This is a bit advanced, but worth getting setup: it’s how most people work with MySQL in the real world.

First, run this command from your terminal (Terminal, Git Bash, etc.):

```
mysql
```

If that yields a "command not found" error, you may have to tell your terminal where to find the `mysql` program. Some of you may have encountered a special variable your terminal uses to look for installed programs, called the _PATH_. Before you can run the `mysql` command, you’ll need to add a directory to your PATH (again, this tells your terminal where to find the mysql command). For Windows, [see this](https://dev.mysql.com/doc/mysql-windows-excerpt/5.7/en/mysql-installation-windows-path.html).

If you’re on a Mac, run these two commands:

```
echo 'export PATH="$PATH:/usr/local/mysql/bin"' >> ~/.bash_profile
source ~/.bash_profile
```

Once resolved, you should see another error when running the \`mysql command:

![access denied error](Images/access_denied_error.png)

Reading this error tells us what’s wrong: we’re not using a password to connect. By default, `mysql` is also trying to use my username (dylan), but you might remember that we’re connecting to MySQL using the "root" user, instead.

Run this command:

```
mysql -u root -p
```

and enter your root user password that you generated as part of class. After you enter the password, you should see a prompt like this:

![mysql prompt](Images/mysql_prompt.png)

The next commands we run assume that you’re in the _sakila-db_ directory you unzipped earlier. If you’re not there, exit `mysql` by running the command:

```
exit
```

`cd` into the sakila-db directory, and run

```
mysql -u root -p
```

Once you’re in the sakila-db directory and have `mysql` running, run the following two commands:

```
SOURCE sakila-schema.sql;
SOURCE sakila-data.sql;
```

`SOURCE` executes all the statements in a given SQL file, as SQL commands. `sakila-schema.sql` contains a number of `CREATE TABLE` statements to create the tables within our sample DB. `sakila-data.sql` contains the actual data that gets loaded into these tables.

Finally, open MySQL Workbench, refresh your list of databases under the _SCHEMAS_ header, and you should see the **sakila** DB:

![list of databases with sakila](Images/list_of_dbs_with_sakila.png)
