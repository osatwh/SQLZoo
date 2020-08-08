AdventureWorks Hard Questions

--12. For each order show the SalesOrderID and SubTotal calculated three ways:
      A) From the SalesOrderHeader
      B) Sum of OrderQty*UnitPrice
      C) Sum of OrderQty*ListPrice 

SELECT soh.SalesOrderID, soh.SubTotal, 

SUM(OrderQty*UnitPrice) AS SumOfUnitPrice,
SUM(sod.OrderQty*ListPrice) AS SumOfListPrice

FROM SalesOrderHeader soh
JOIN SalesOrderDetail sod ON (sod.SalesOrderID = soh.SalesOrderID)

JOIN Product pd ON (pd.ProductID = sod.ProductID)

GROUP BY soh.SalesOrderID, soh.SubTotal
ORDER BY SubTotal DESC;