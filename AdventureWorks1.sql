--question 1
select Product.Name, Product.ListPrice
from Production.Product
where Product.ListPrice > 150

--question 2
select Product.Name, Product.Color
from Production.Product
where Product.Color IS NOT NULL

--question 3
select distinct pp.ProductID, sum(ppi.quantity) as total
from production.product pp
join Production.ProductInventory ppi on pp.ProductID = ppi.ProductID
group by pp.ProductID

--question 4
select pp.Name, pr.Comments, pr.ReviewDate
from Production.Product pp
join Production.ProductReview pr on pp.ProductID = pr.ProductID

--question 5
select pp.Name, pp.ProductID, ppi.Quantity
from Production.ProductInventory ppi
join Production.Product pp on ppi.ProductID = pp.ProductID 
order by Quantity

--question 6
select pp.Name, pp.ProductID, ppi.Quantity, ppi.Shelf, ppi.Bin, pl.Name as locationName
from Production.ProductInventory ppi
join Production.Product pp on ppi.ProductID = pp.ProductID 
join Production.Location pl on ppi.LocationID = pl.LocationID
order by Quantity

--question 7
select distinct pl.Name, sum(ppi.quantity) as total
from production.Location pl
join Production.ProductInventory ppi on pl.LocationID = ppi.LocationID
group by pl.Name

--question 8
select pp.Name, pps.Name, pp.ListPrice, ppc.Name
from Production.Product pp
join Production.ProductSubcategory pps on pp.ProductSubcategoryID = pps.ProductSubcategoryID
join Production.ProductCategory ppc on pps.ProductCategoryID = ppc.ProductCategoryID
where ppc.Name = 'Bikes'
order by pp.ListPrice

--question 9
select pp.Name, pp.ListPrice
from Production.Product pp
where pp.ListPrice > (select avg(pp.listprice) from Production.Product pp)

--question 10
select pp.Name, pp.ReorderPoint, pi.Quantity
from Production.Product pp
join Production.ProductInventory pi on pi.ProductID = pp.ProductID
where pp.ReorderPoint > (
select sum(pi.Quantity) from Production.ProductInventory pi where pi.ProductID = pp.ProductID
)