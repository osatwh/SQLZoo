--6.A "Single Item Order" is a customer order where only one item is ordered. 
----Show the SalesOrderID and the UnitPrice for every Single Item Order.

SELECT SalesOrderID, UnitPrice FROM SalesOrderDetail
WHERE  OrderQty = '1'

--7.Where did the racing socks go? List the product name and the CompanyName for all Customers who ordered 
----ProductModel 'Racing Socks'.

SELECT DISTINCT pd.Name, CompanyName FROM Product pd
JOIN ProductModel pm ON (pm.productmodelID = pd.productmodelID)
JOIN SalesOrderDetail so ON (so.ProductID = pd.ProductID)
JOIN SalesOrderHeader sh ON (sh.SalesOrderID = so.SalesOrderID
JOIN Customer cu ON (cu.CustomerID = sh.CustomerID)
WHERE pm.name = 'Racing Socks'

--8.Show the product description for culture 'fr' for product with ProductID 736. 

SELECT Description FROM ProductDescription pd
JOIN ProductModelProductDescription pmpd ON (pmpd.productDescriptionID = pd.productDescriptionID)
JOIN productModel pm ON (pm.productModelID = pmpd.productModelID)
JOIN product pr ON (pr.productModelID = pm.productModelID)
WHERE Culture = 'fr' AND ProductID = '736'

--9.Use the SubTotal value in SaleOrderHeader to list orders from the largest to the smallest. 
----For each order show the CompanyName and the SubTotal and the total weight of the order.

SELECT DISTINCT CompanyName, Subtotal, Weight 
FROM SalesOrderHeader so
JOIN Customer cu ON (cu.customerID = so.customerID)
JOIN SalesOrderDetail sd ON (sd.SalesOrderID = so.SalesOrderID)
JOIN Product pd ON (pd.productID = sd.productID)
ORDER BY SubTotal DESC;