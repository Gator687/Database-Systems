--Question 1
Select C.CustomerID, P.FirstName, P.LastName
From Sales.Customer as C
Join Person.Person as P on C.PersonID = P.BusinessEntityID

--Question 2
Select C.CustomerID, P.FirstName, P.LastName
From Sales.Customer as C
left join Person.Person as P on C.PersonID = P.BusinessEntityID
Where P.BusinessEntityID is null

--Question 3
Select P.Name AS ProductName, PLPH.StartDate, PLPH.EndDate, PLPH.ListPrice
From Production.Product as P
Join Production.ProductListPriceHistory as PLPH on P.ProductID = PLPH.ProductID
Where P.Name Like '%frame%'
Order By P.Name ASC, PLPH.EndDate ASC

--Question 4
Select distinct P.FirstName, P.LastName, PP.PhoneNumber, EP.EmailAddress, SP.SalesYTD, SP.SalesLastYear
From Sales.SalesPerson as SP
Join Sales.SalesOrderHeader as SOH on SP.BusinessEntityID = SOH.SalesPersonID
Join Person.Person as P on SP.BusinessEntityID = P.BusinessEntityID
Join Person.PersonPhone as PP on SP.BusinessEntityID = PP.BusinessEntityID
Join Person.EmailAddress as EP on SP.BusinessEntityID = EP.BusinessEntityID
Where SP.SalesLastYear > 0 and SP.SalesYTD > SP.SalesLastYear
Order by P.LastName

--Question 5
Select SOH.OrderDate, P.Name as ProductName, PS.Name as SubcategoryName
From Sales.SalesOrderHeader as SOH
Join Sales.SalesOrderDetail as SOD on SOH.SalesOrderID = SOD.SalesOrderID
Join Production.Product as P on SOD.ProductID = P.ProductID
Join Production.ProductSubcategory as PS on P.ProductSubcategoryID = PS.ProductSubcategoryID
Join Person.Address as A on SOH.ShipToAddressID = A.AddressID
Join Production.ProductCategory as PC on PS.ProductCategoryID = PC.ProductCategoryID
Where A.City = 'Seattle' and PC.Name like '%Clothing%' and P.Name not like '%Socks%'
Order by SOH.OrderDate

--Question 6
Select A.City, SP.CountryRegionCode, Count(SOH.SalesOrderID) as TotalOrders
From Person.Address as A
Join Sales.SalesOrderHeader as SOH on A.AddressID = SOH.ShipToAddressID
Join Person.StateProvince as SP on A.StateProvinceID = SP.StateProvinceID
Where SP.CountryRegionCode IN ('CA', 'MX', 'US')
Group by A.City, SP.CountryRegionCode
Having Count(SOH.SalesOrderID) < 100
Order by SP.CountryRegionCode, A.City

--Question 7
Select Name, StateProvinceCode,
Case 
	When StateProvinceCode = 'CO' Then '7.5%'
	When StateProvinceCode = 'OH' Then '7.14%'
	When StateProvinceCode = 'NY' Then '8.49%'
	Else '-1'
	End as SalesTax
From Person.StateProvince

--Question 8
Select SOH.SalesOrderID, SOH.TotalDue as OrderAmount,
Case
	When StateProvinceCode in ('CO', 'OH', 'NY') Then
    CASE
		When StateProvinceCode = 'CO' Then Round(TotalDue * 0.075, 2)
        When StateProvinceCode = 'OH' Then Round(TotalDue * 0.0714, 2)
        When StateProvinceCode = 'NY' Then Round(TotalDue * 0.0849, 2)
        End
        Else NULL
    End as CalculatedSalesTax
From Sales.SalesOrderHeader as SOH
Join Person.Address as A on SOH.BillToAddressID = A.AddressID
Join Person.StateProvince as SP on A.StateProvinceID = SP.StateProvinceID
Where StateProvinceCode in ('CO', 'OH', 'NY')

--Question 9
Select Name = Concat(P.FirstName, ' ', P.LastName), HireDate, YearsOfService = Datediff(Year, HireDate, Getdate())
From HumanResources.Employee as E
join Person.Person as P on E.BusinessEntityID = P.BusinessEntityID

--Question 10
Select Concat(P.FirstName, ' ', P.LastName) as EmployeeName, Format(EPH.Rate * 40 * 52, 'C', 'en-US') as AnnualSalary
From HumanResources.Employee as E
join Person.Person as P on E.BusinessEntityID = P.BusinessEntityID
join HumanResources.EmployeePayHistory as EPH on E.BusinessEntityID = EPH.BusinessEntityID