create schema premiere;
create schema henry;

--add a table to a schema
--alter the schema
alter schema premiere
	transfer dbo.customer;

alter schema premiere
	transfer dbo.orderline;

alter schema premiere
	transfer dbo.orders;

alter schema premiere
	transfer dbo.repo;

alter schema premiere
	transfer dbo.part;

alter schema premiere
	transfer dbo.Rep;

alter schema henry
	transfer dbo.author;

alter schema henry
	transfer dbo.book;

alter schema henry
	transfer dbo.branch;

alter schema henry
	transfer dbo.copy;

alter schema henry
	transfer dbo.wrote;

alter schema henry
	transfer dbo.publisher;

create table premiere.vendor(
	pk int primary key,
	vendorName varchar(100)
)