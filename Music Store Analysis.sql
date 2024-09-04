-- Easy Questions
-- Q1: Who is the senior most employee based on job title?
select * from employee 
order by levels desc 
limit 1;

-- Q2: Which country have the most invoices?
select count(*),billing_country from invoice 
group by billing_country
order by count desc
limit 1;

-- Q3: What are top three values of total invoice?
select total from invoice
order by total desc
limit 3

-- Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city 
-- 	we made the most money. Write a query that returns one city that has the highest sum of invoice totals.
Return both the city name & sum of all invoice totals
select billing_city,SUM(total) as invoice_total from invoice 
group by billing_city
order by invoice_total desc
limit 1

-- Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer.
-- 	Write a query that returns the person who has spent the most money.
select customer.first_name, customer.last_name, sum(invoice.total)
from customer join invoice 
on customer.customer_id = invoice.customer_id
group by customer.customer_id
order by sum(invoice.total) desc
limit 1

-- Moderate Questions
-- Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
-- 	Return your list ordered alphabetically by email starting with A
select distinct email, first_name, last_name 
from customer join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice_line.invoice_id = invoice.invoice_id
where track_id in (
	select track_id from track join genre
	on track.genre_id = genre.genre_id
	where genre.name like 'Rock'
)
order by email;

-- Q2: Let's invite the artists who have written the most rock music in our dataset.
-- 	Write a query that returns the Artist name and total track count of the top 10 rock bands
SELECT artist.artist_id, artist.name,COUNT(artist.artist_id) AS number_of_songs
FROM track JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre. name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;

-- Q3: Return all the track names that have a song length longer than the average song length.
	Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.
select name, milliseconds from track
where milliseconds > (
	select avg(milliseconds) from track
)
order by milliseconds desc;

-- Advanced Questions
-- Q1: Find how much amount spent by each customer on artists? 
-- 	Write a query to return customer name, artist name and total spent
WITH best_selling_artist AS (
    SELECT 
        artist.artist_id AS artist_id, 
        artist.name AS artist_name, 
        SUM(invoice_line.unit_price * invoice_line.quantity) AS total_sales
    FROM invoice_line
    JOIN track ON track.track_id = invoice_line.track_id
    JOIN album ON album.album_id = track.album_id
    JOIN artist ON artist.artist_id = album.artist_id
    GROUP BY artist.artist_id, artist.name
    ORDER BY total_sales DESC
    LIMIT 1
)
SELECT c.customer_id, c.first_name, c.last_name, bsa.artist_name,
SUM(il.unit_price * il.quantity) AS amount_spent
FROM invoice i
JOIN customer c ON c.customer_id = i.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t ON t.track_id = il.track_id
JOIN album alb ON alb.album_id = t.album_id
JOIN best_selling_artist bsa ON bsa.artist_id = alb.artist_id
GROUP BY c.customer_id, c.first_name, c.last_name, bsa.artist_name
ORDER BY amount_spent DESC;









