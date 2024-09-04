Music Store Analysis
This project is an analysis of a music store database using SQL. It includes various queries designed to extract meaningful insights, ranging from simple data retrieval to complex aggregations and joins. The project addresses key business questions, helping the music store make data-driven decisions.

Table of Contents
Introduction
Dataset
Queries Overview
Easy Questions
Moderate Questions
Advanced Questions
Technologies Used
How to Run
Insights
Conclusion
Introduction
The Music Store Analysis project aims to explore various facets of the store's operations, such as identifying top customers, cities with the most revenue, popular artists, and more. The insights derived from the analysis can help the store optimize its operations, marketing strategies, and customer engagement.

Dataset
The dataset consists of tables such as customer, invoice, invoice_line, track, album, artist, and genre. The data includes customer details, sales transactions, music tracks, and artist information.

Queries Overview
Easy Questions
Senior Most Employee: Identifies the most senior employee based on job title.
Country with Most Invoices: Finds the country generating the highest number of invoices.
Top Three Invoice Values: Retrieves the three highest invoice totals.
Best Customer City: Determines which city generates the most revenue, making it ideal for a promotional event.
Best Customer: Identifies the customer who has spent the most money in the store.
Moderate Questions
Rock Music Listeners: Returns the email, first name, last name, and genre of all rock music listeners, ordered by email.
Top Rock Artists: Lists the top 10 artists who have produced the most rock music tracks.
Tracks Longer Than Average: Finds all tracks longer than the average song length, ordered by length.
Advanced Questions
Spending by Artist per Customer: Shows how much each customer has spent on music from specific artists, focusing on top-selling artists.
Technologies Used
PostgreSQL
SQL for querying and data analysis
pgAdmin for running queries and visualizing results
How to Run
Set up PostgreSQL and load the music store database.
Open the SQL file containing the queries.
Run each query sequentially in your preferred SQL environment (e.g., psql, pgAdmin).
Analyze the results displayed.
Insights
Best Customer City: The city contributing the most revenue helps focus marketing efforts on high-value locations.
Top Customers: Identifying the top customers allows for targeted promotions and loyalty rewards.
Popular Genres and Artists: Understanding which genres and artists are most popular can guide inventory and marketing strategies.
Conclusion
The analysis provides valuable insights into customer behavior, sales trends, and artist popularity within the music store. These findings can inform strategic decisions, helping the store optimize its operations and enhance customer satisfaction.
