#########################
# 183. Customers Who Never Order
#
# Write an SQL query to report all customers who never order anything.
#
# Return the result table in any order.
#
# The query result format is in the following example.
#
# SQL Schema >
#
# Table: Customers
#
# +-------------+---------+
# | Column Name | Type    |
# +-------------+---------+
# | id          | int     |
# | name        | varchar |
# +-------------+---------+
# id is the primary key column for this table.
# Each row of this table indicates the ID and name of a customer.
#
# Table: Orders
#
# +-------------+------+
# | Column Name | Type |
# +-------------+------+
# | id          | int  |
# | customerId  | int  |
# +-------------+------+
# id is the primary key column for this table.
# customerId is a foreign key of the ID from the Customers table.
# Each row of this table indicates the ID of an order and the ID of the customer who ordered it.
#########################

SELECT name AS Customers FROM customers
LEFT JOIN orders ON orders.customerId=customers.id
WHERE orders.customerId IS NULL;

#########################
# Beats 100% Runtime
#########################
# LeetCode posted solution using a subquery
# Runtime 998 ms
#   SELECT name AS Customers FROM customers
#   WHERE customers.id NOT IN (
#       SELECT customerId FROM orders
#   );
#
# My solution uses a join
# Runtime 447 ms
#
# My solution has a faster runtime because joins are
# more optimized than subqueries in MYSQL.