Select count(*) from person.person

select * from person.person

select pp.FirstName, pp.LastName, pe.EmailAddress 
from person.person pp
join person.EmailAddress pe on pp.BusinessEntityID = pe.BusinessEntityID
where pp.FirstName = 'Zoe' and pp.LastName = 'Bell'

select pp.FirstName, pp.LastName, adr.AddressLine1, adr.AddressLine2, adr.City, stp.Name, adr.PostalCode
from person.person pp
join person.BusinessEntityAddress bea on pp.BusinessEntityID = bea.BusinessEntityID
join person.address adr on bea.AddressID = adr.AddressID
join person.StateProvince stp on stp.StateProvinceID = adr.StateProvinceID
where pp.FirstName = 'Zoe' and pp.LastName = 'Bell'

select vend.BusinessEntityID, vend.Name
from Purchasing.Vendor vend
where vend.Name like '%bicy%'
--1496

select vend.name as vendorName, ppp.Name as productName
from Purchasing.Vendor vend join Purchasing.ProductVendor ppv
on vend.BusinessEntityID = ppv.BusinessEntityID
join Production.Product ppp on ppv.ProductID = ppp.ProductID
where vend.BusinessEntityID = '1496'