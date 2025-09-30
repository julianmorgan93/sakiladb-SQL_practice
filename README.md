🎬 Sakila Database SQL Exercises

This repository contains SQL practice queries using the MySQL Sakila Sample Database.

The sakila db exercises combined.sql file includes 27 exercises that cover SQL fundamentals such as filtering, sorting, grouping, and joins, while working with the Sakila database’s movie rental data.

📂 Contents

sakila.sql – script to create and populate the Sakila Database (not included, can be downloaded from MySQL sample databases
)

sakila db exercises combined.sql – SQL exercises and solutions

README.md – description and usage instructions

🗂 Database Overview

The Sakila Database represents a fictional DVD rental store. It contains tables such as:

Actor, Film, Film_Actor – movie and actor information

Customer, Staff – customer and employee details

Rental, Payment – rental transactions and payments

Inventory – available copies of films

Store, Address, City, Country – store and location details

📝 Exercises Summary

The practice queries demonstrate how to:

Retrieve and filter records (WHERE, LIKE, IN)

Sort and limit results (ORDER BY, LIMIT)

Use aggregate functions (COUNT, SUM, AVG)

Work with text matching and pattern searches

Join multiple tables to combine data (INNER JOIN, LEFT JOIN)

Group results (GROUP BY, HAVING)

Create reports (e.g., payments per customer, staff performance, actors per film)

Explore actor name patterns, film inventories, and customer payments

<img width="646" height="509" alt="image" src="https://github.com/user-attachments/assets/1ed6210d-dd21-4fd2-bf63-6f128575d70c" />

🚀 Usage

Import the Sakila database:

mysql -u root -p < sakila.sql


Open MySQL Workbench or CLI:

USE sakila;


Run queries from sakila db exercises combined.sql.

📚 Reference

MySQL Sakila Sample Database

# sakiladb-SQL_practice
This repository contains SQL practice queries using the MySQL Sakila Sample Database.
