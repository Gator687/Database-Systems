Create view CustomerRepresentativeView as
Select c.CustomerName, r.FirstName as RepFirstName, r.LastName as RepLastName
From premiere.Customer c
Left join premiere.Rep r on c.RepNum = r.RepNum

Go
alter view PartOrderLineView as
Select p.Description as PartDescription, p.Price as PartPrice,
ol.NumOrdered, ol.QuotedPrice, o.OrderDate, o.CustomerNum
From premiere.Part p
Inner join premiere.OrderLine ol on p.PartNum = ol.PartNum
Inner join premiere.Orders o on ol.OrderNum = o.OrderNum

Go
Create view AuthorFullName as
Select AuthorNum, Concat(AuthorFirst, ' ', AuthorLast) as AuthorFullName
From henry.Author

Go
Create view SalesTaxView as
Select c.BookCode, b.Title as BookTitle,
(c.Price * 0.07) as SalesTax
From henry.Copy c
Join henry.Book b on c.BookCode = b.BookCode
Where c.Quality <> 'POOR'