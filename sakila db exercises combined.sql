USE sakila;

-- 1) You are helping the casting director create a contact list of all actors. 
-- Retrieve the first and last names of all actors.

SELECT first_name, last_name
FROM actor
ORDER BY first_name, last_name;


-- 2) A colleague remembers meeting an actor named “Joe” but not the last name. 
-- Find all actors with the first name “Joe”.

SELECT first_name, last_name
FROM actor
WHERE first_name = "Joe";


-- 3) The theater manager wants a list of films that run for 3 hours or more. 
-- Show relevant film details.

SELECT film_id, title, description, release_year, length, rating
FROM film
WHERE length >= 180
ORDER BY film_id;


-- 4) While verifying account details, retrieve customers whose last name starts with "S" 
-- and first name ends with "N".

SELECT customer_id, first_name, last_name 
FROM customer
WHERE last_name LIKE "S%" AND first_name LIKE "%N"
ORDER BY first_name;

-- 5) The accounting team needs a list of all payments made on or after May 27, 2005. 
-- Return relevant payment records.

SELECT payment_id, customer_id, staff_id, rental_id, amount, payment_date
FROM payment
WHERE payment_date >= "2005-05-27"
ORDER BY payment_date;


-- 6) Marketing is planning campaigns in Afghanistan, Bangladesh, and China. 
-- Display the country_id and country names for these.

SELECT country_id, country
FROM country
WHERE country IN("Afghanistan", "Bangladesh", "China")
ORDER BY country;


-- 7) The media team is interested in actors with "GEN" in their last names. 
-- Find such actors.

SELECT first_name, last_name
FROM actor
WHERE last_name LIKE "%GEN%"
ORDER BY first_name, last_name;


-- 8) You’re compiling a list of actors whose last names include "LI", 
-- ordered alphabetically by last name and first name.

SELECT first_name, last_name
FROM actor
WHERE last_name LIKE "%LI%"
ORDER BY last_name, first_name;


-- 9) The director remembers working with an actress named "Scarlett". 
-- Retrieve actors with that first name.

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = "Scarlett";


-- 10) A staff member recalls an actor with the last name “Johansson”. 
-- List all actors with that surname.

SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name="Johansson";


-- 11) A partner wants movies where the description ends in "Boat" and rental duration is over 6. 
-- Return title, description, and rental duration.

SELECT title, description, rental_duration
FROM film
WHERE description LIKE "%Boat" AND rental_duration > 6;


-- 12) Management wants to know how many unique actor last names exist. 
-- Provide a count of distinct last names.

SELECT COUNT(DISTINCT last_name)
FROM actor;


-- 13) A customer wants to know when the movie “Academy Dinosaur” is due back. 
-- Find the due date from rental data.

SELECT r.rental_id, f.title, r.return_date, r.rental_date AS due_date
FROM rental AS r
JOIN inventory AS i
ON r.inventory_id = i.inventory_id
JOIN film as F
ON i.film_id = f.film_id
WHERE f.title = "Academy Dinosaur"
ORDER BY due_date DESC, r.return_date DESC;


-- 14) A distributor is reviewing average film lengths. 
-- Calculate the average running time of all films.

SELECT AVG(length) AS AverageRunningTimeMinutes
FROM film;


-- 15) HR needs a list of staff members with their addresses. 
-- Use a join to retrieve staff names and address.

SELECT staff.first_name, staff.last_name, address.address, address.postal_code, address.district 
FROM staff 
INNER JOIN address 
ON staff.address_id = address.address_id;

SELECT s.first_name, s.last_name, a.address, a.address2, a.district, c.city, a.postal_code, a.phone
FROM staff AS s
JOIN address AS a
ON s.address_id = a.address_id
JOIN city AS c
ON a.city_id = c.city_id;

-- 16) Management wants to track staff performance. 
-- Show each staff member's name and the payment amounts they processed.

SELECT s.first_name, s.last_name, p.payment_id, p.amount, p.payment_date
FROM staff AS s
JOIN payment AS p
ON s.staff_id = p.staff_id
ORDER BY s.last_name, s.first_name, p.payment_date;


-- 17) HR is auditing August 2005. 
-- List staff and payments processed during that month.

SELECT s.first_name, s.last_name, p.amount
FROM staff as s
INNER JOIN payment p 
ON s.staff_id = p.staff_id
WHERE MONTH(p.payment_date) = 8 AND YEAR(p.payment_date) = 2005;


-- 18) Summarize the total payment amounts processed by each staff member in August 2005.

SELECT s.first_name, s.last_name, SUM(p.amount) AS total_amount
FROM staff as s
INNER JOIN payment as p 
ON s.staff_id = p.staff_id
WHERE MONTH(p.payment_date) = 8 
    AND YEAR(p.payment_date) = 2005
GROUP BY s.staff_id, s.first_name, s.last_name;


-- 19) A film historian wants to know how many actors are in each film. 
-- Provide film titles and the number of associated actors.

SELECT f.title, COUNT(fa.actor_id) AS number_of_actors
FROM film as f
INNER JOIN film_actor as fa 
ON f.film_id = fa.film_id
GROUP BY f.film_id, f.title;


-- 20) Inventory is checking how many copies of “Hunchback Impossible” are in stock. 
-- Count the copies using film and inventory tables.

SELECT COUNT(i.inventory_id) AS number_of_copies
FROM inventory  as i
INNER JOIN film as f 
ON i.film_id = f.film_id
WHERE f.title = 'Hunchback Impossible';


-- 21) Generate a report listing all payments by each customer, 
-- sorted alphabetically by last name.

SELECT c.first_name, c.last_name, (p.amount) AS total_paid
FROM customer as c
INNER JOIN payment as p 
ON c.customer_id = p.customer_id;


-- 22) Provide the total amount paid by each customer, 
-- ordered alphabetically by last name.

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_paid
FROM customer as c
INNER JOIN payment as p 
ON c.customer_id = p.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY c.last_name, c.first_name;


-- 23) Find out which actor has appeared in the most films.

SELECT a.first_name, a.last_name, COUNT(fa.film_id) AS film_count
FROM actor as a
INNER JOIN film_actor as fa 
ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY film_count DESC
LIMIT 1;


-- 24) Identify the most common actor last name in the database.

SELECT last_name, COUNT(*) AS frequency
FROM actor
GROUP BY last_name
ORDER BY frequency DESC
LIMIT 1;


-- 25) List all actor last names and how many actors have each one.

SELECT last_name, COUNT(*) AS actor_count
FROM actor
GROUP BY last_name
ORDER BY actor_count DESC;


-- 26) Identify which actor last names are used only once in the database.

SELECT last_name
FROM actor 
GROUP BY last_name
HAVING COUNT(*) = 1;


-- 27) Find actor last names that are shared by more than one actor.

SELECT last_name, COUNT(*) AS occurrence
FROM actor
GROUP BY last_name
HAVING COUNT(*) > 1;

