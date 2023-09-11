--stored procedures
--named queries
--pre-optimaized --> faster overtime than a view
--accept parameters
--allows you to protect data
--speeds up data retrieval
--can be written in SQL, C#, VB, CLR...
--first understand the logic
--if possible, write the SQL
--create procedure XXX as
----your SQL here
--to run them exec procedurename
--				execute procedure

create procedure usp_titlePub as
select title, PublisherName, Paperback, type
from henry.book b join henry.publisher pu
on b.PublisherCode = pu.PublisherCode

GO
--usp that finds books higher than average price

create procedure henry.usp_higherAvg as
declare @avgPrice as decimal(8,2)
SELECT @avgPrice = avg(price) from henry.copy;

select title, price, price - @avgPrice as difference
from henry.book b join henry.copy c
on b.BookCode = c.BookCode
where price > @avgPrice;

GO
--stored procedure to accept a parameter
--find books costing less than parameter

create or alter procedure henry.uspbooksLessThan(@checkPrice decimal(8,2))
as
	select title, price, price - @checkPrice as difference
	from henry.book b join henry.copy c
	on b.BookCode = c.BookCode
	where price > @checkPrice;
	order by price, title, Quality

--multiple parameters, two defaulted
--pass in price, type, warehouse
GO
declare @checkPrice as decimal(8,2) = 10;
declare @desiredType char(3) = 'FIC';
declare @warehouse decimal(2,0) = 1;
create or alter henry.usp_bookTypeWarehousePrice(@checkPrice as decimal(8,2),
												@desiredType char(3),
												@warehouse decimal(2,0)) as
select distinct title, Quality, price, @checkPrice - price as difference, type, branchnum
	from henry.book b join henry.copy c
	on b.BookCode = c.BookCode
	where price <= @checkPrice 
		and @desiredType = type 
		and @warehouse = branchnum;
	order by price, title, Quality;


--use stored procedure to build a new insert method

--insert into copy, check price >0 and set default branch num
--select top * from henry.copy
GO
create or alter procedure henry.usp_newCopy(@bookCode char(4), @branchNum decimal(2,0),
											@copynum decimal(2,0), @quality char(20), @price decimal(8,2))
AS
BEGIN
	--check price, if bad I will set to a default value
	--use a default value that sends a message
	if @price <=0
	BEGIN
		set @price = 2 --default
	END
	ElSE
	BEGIN
		set @price += 2 --add a 2 dollar handling fee
	END
	if @quality not in('Excellent','GOOD','FAIR','POOR')
	BEGIN
		insert into copy values(@bookCode, @branchNum, @copynum, @quality, @price);
	END
	insert into copy values(@bookCode, @branchNum, @copynum, @quality, @price);
END

exec henry.usp_newCopy '180','1','3','awful',-10

--select BookCode from henry.book
select * from henry.copy where price < 0
delete from henry.copy
where price < 0

select * from henry.copy where price = 2