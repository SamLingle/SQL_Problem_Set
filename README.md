# SQL_Requests
Using MySQL workbench and SQL to write scripts that will retrieve and update data stored in the Sakila database as an exploration of using SQL for data storage and retrieval. 


## How to use:
To use this script, you will need to load data from a sample database provided by MySQL named Sakila. You will also need to use MySQL Workbench. Found [here](https://dev.mysql.com/downloads/workbench/) if you do not have it downloaded already.

### Downloading the needed files
If you’re on a PC and used MySQL Installer to install MySQL, you may already have the Sakila database loaded. Before you do anything else, open MySQL workbench and examine the list of databases loaded on your computer. If the sakila DB is on the list, run the command: use sakila; in MySqlWorkbench. 
If you do not see the sakila DB, visit [this page](https://dev.mysql.com/doc/index-other.html) and find the "sakila database" under the Example Databases header. Click on the "Zip" link to download. This contains a zipped directory of all the files required to load the sample database.
### loading data into MySQL using the command line
First, run this command from your terminal (Terminal, Git Bash, etc.): mysql
If that yields a "command not found" error, you may have to tell your terminal where to find the `mysql` program. Some of you may have encountered a special variable your terminal uses to look for installed programs, called the _PATH_. Before you can run the `mysql` command, you’ll need to add a directory to your PATH (again, this tells your terminal where to find the mysql command). For Windows, [see this](https://dev.mysql.com/doc/mysql-windows-excerpt/5.7/en/mysql-installation-windows-path.html).

If you are using a Mac, run these two commands:

```
echo 'export PATH="$PATH:/usr/local/mysql/bin"' >> ~/.bash_profile
source ~/.bash_profile
```

Once resolved, you may see another error when running the \`mysql command:

![access denied error](Images/access_denied_error.png)

Reading this error tells us what’s wrong: we’re not using a password to connect. By default, `mysql` is also trying to use my username (dylan), but you might remember that we’re connecting to MySQL using the "root" user, instead.

Run this command:

```
mysql -u root -p
```

and enter your root user password that you generated as part of class. After you enter the password a prompt will show up.

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
