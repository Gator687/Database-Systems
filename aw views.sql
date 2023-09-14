Create or alter view CustomersInDallas as
Select S.Name
From Sales.Customer as C
join Person.Address as A on C.CustomerID = A.AddressID
join Sales.Store as S on C.CustomerID = S.BusinessEntityID
Where A.City = 'Dallas'

Go
select * from CustomersInDallas


Go
Create or alter view SingleItemOrders as
Select SOH.SalesOrderID, SOD.UnitPrice
From Sales.SalesOrderHeader as SOH
Join Sales.SalesOrderDetail as SOD on SOH.SalesOrderID = SOD.SalesOrderID
Group by SOH.SalesOrderID, SOD.UnitPrice
Having Count(OrderQty) = 1

Go
select * from SingleItemOrders


Go
Create or alter view CustomerOrders as
Select PP.FirstName + ' ' + PP.MiddleName + ' ' + PP.LastName as CustomerName,
P.Name as ProductName
From Sales.Customer as C
Join Sales.SalesOrderHeader as SOH on C.CustomerID = SOH.CustomerID
Join Sales.SalesOrderDetail as SOD on SOH.SalesOrderID = SOD.SalesOrderID
Join Production.Product as P on SOD.ProductID = P.ProductID
Join Person.Person as PP on C.CustomerID = PP.BusinessEntityID

Go
Select CustomerName,
COUNT(ProductName) AS NumberOfItemsOrdered
From CustomerOrders
Group by CustomerName
Order by NumberOfItemsOrdered DESC