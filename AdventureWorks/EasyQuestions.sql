AdventureWorks easy questions

--1.Show the first name and the email address of customer with CompanyName 'Bike World'

SELECT FirstName, emailAddress FROM Customer 
WHERE CompanyName = 'Bike World'

--2.Show the CompanyName for all customers with an address in City 'Dallas'.

SELECT DISTINCT CompanyName FROM Customer 
JOIN CustomerAddress ON Customer.CustomerID = CustomerAddress.CustomerID
JOIN Address ON Address.AddressID = CustomerAddress.AddressID
WHERE City = 'Dallas'

--3. How many items with ListPrice more than $1000 have been sold? 

SELECT Name, OrderQty FROM SalesOrderDetail 
JOIN Product ON SalesOrderDetail.ProductID = Product.ProductID
WHERE ListPrice > 1000

--4. Give the CompanyName of those customers with orders over $100000. Include the subtotal plus tax plus freight

--5. Find the number of left racing socks ('Racing Socks, L') ordered by CompanyName 'Riding Cycles'

SELECT OrderQty FROM SalesOrderDetail sd
JOIN Product pd ON sd.ProductID = pd.ProductID
JOIN SalesOrderHeader sh ON sh.SalesOrderID = sd.SalesOrderID
JOIN Customer ON sh.CustomerID = Customer.CustomerID
WHERE CompanyName = 'Riding Cycles' AND Name = 'Racing Socks, L'
