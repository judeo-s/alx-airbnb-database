# Database Advanced Scripting

This repository contains advanced database scripting examples and exercises.

## Subqueries

* [subqueries.sql](subqueries.sql): Examples of subqueries and correlated subqueries.
	+ Retrieve all properties with an average rating greater than 4.0
	+ Retrieve all users who have made more than 3 bookings

## Partitioning

* [partitioning.sql](partitioning.sql): Example of partitioning a table by range on a date column.
* [partition_performance.md](partition_performance.md): Performance comparison before and after partitioning.
	+ Retrieve all bookings for a specific year (e.g. 2025)
	+ Retrieve all bookings for a specific range of dates (e.g. 2025-01-01 to 2025-12-31)

## Joins and Queries

* [joins_queries.sql](joins_queries.sql): Examples of INNER JOIN, LEFT JOIN, and FULL OUTER JOIN.
	+ Retrieve all bookings with user, property, and payment details
	+ Retrieve all users who have made at least one booking
	+ Retrieve all properties with at least one booking
* [perfomance.sql](perfomance.sql): Example of a query that retrieves bookings with user, property, and payment details.

## Aggregations and Window Functions

* [aggregations_and_window_functions.sql](aggregations_and_window_functions.sql): Examples of aggregations and window functions (ROW_NUMBER, RANK).
	+ Retrieve the top 10 highest rated properties
	+ Retrieve the top 10 most booked properties
	+ Retrieve the top 10 users who have made the most bookings

## Performance Monitoring

* [perfomance_monitoring.md](perfomance_monitoring.md): Example of monitoring query performance using the pg_stat_statements extension.
	+ Retrieve the top 10 most executed queries
	+ Retrieve the top 10 most time-consuming queries

## Optimizations

* [optimization_report.md](optimization_report.md): Example of an optimization report using EXPLAIN ANALYZE.
	+ Retrieve the query plan for a specific query
	+ Retrieve the query plan for a specific range of dates (e.g. 2025-01-01 to 2025-12-31)