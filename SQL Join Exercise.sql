/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */

/* joins: find the name of the department, and the name of the category for Appliances and Games */

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */

SELECT * FROM products as p
INNER JOIN categories as c
ON p.CategoryID = c.CategoryID
WHERE c.Name = "Computers";

SELECT products.Name, products.Price, reviews.Rating FROM products
INNER JOIN reviews ON reviews.ProductID = products.ProductID
WHERE reviews.Rating = 5;

SELECT employees.FirstName, employees.LastName, Sum(sales.Quantity) AS TotalSales FROM sales
INNER JOIN employees ON employees.EmployeeID = sales.EmployeeID
GROUP BY employees.EmployeeID
ORDER BY TotalSales DESC
LIMIT 3;

SELECT d.DepartmentID, d.Name as "Department Name", c.Name as "Category Name" from departments as d
INNER JOIN categories as c
ON d.DepartmentID = c.DepartmentID
WHERE c.Name = "Appliances" OR c.Name = "Games";

SELECT p.Name, Sum(s.Quantity) as "Total Sales", Sum(s.Quantity * s.PricePerUnit) as "Total Price" FROM sales as s
INNER JOIN products as p
ON s.ProductID = p.ProductID
Where p.Name LIKE "%California%"
GROUP BY Name;

SELECT p.Name, r.Reviewer, r.Rating, r.COMMENT FROM reviews as r
INNER JOIN products as p
ON r.ProductID = p.ProductID
WHERE p.Name LIKE "%Visio%" AND r.Rating = 1;