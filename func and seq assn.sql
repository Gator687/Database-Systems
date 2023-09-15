--Question 1
alter table Customer
add lastChange int
alter table Guest
add lastChange int
alter table OrderLine
add lastChange int
alter table Orders
add lastChange int
alter table Part
add lastChange int
alter table Rep
add lastChange int
alter table Room
add lastChange int

select * from customer

--Question 2
create sequence changeTracking as int
start with 0
increment by 1

Go
--Question 3
insert into Customer (CustomerNum, CustomerName, Street, City, State, zip, Balance, CreditLimit, RepNum, LastChange)
values (998, 'Gerrilee Frail', '85 Charing Lane', 'Kansas City', 'MO', 53224, 6873.50, 5224.91, 41, next value for changeTracking);
insert into Customer (CustomerNum, CustomerName, Street, City, State, zip, Balance, CreditLimit, RepNum, LastChange)
values (999, 'Marijo MacNeilly', '757 Golf Cross', 'Bloomington', 'IN', 82418, 41794.16, 3912.75, 27, next value for changeTracking);


--Question 4
insert into Part(PartNum, Description, OnHand, Class, Warehouse, Price, lastChange)
values('P998','Tool', 3, 'AP','3', 50.99, next value for changeTracking)
insert into Part(PartNum, Description, OnHand, Class, Warehouse, Price, lastChange)
values('P999','Dumbbell', 5, 'SG','1', 25.99, next value for changeTracking)


--Question 5
select * from Customer
order by CustomerNum
select * from part
order by PartNum


--Question 6
Go
Create Function CalcInvenVal(@partnum char(4))
Returns Decimal(10, 2)
As
BEGIN
	declare @inventoryValue decimal(10,2);
	select @inventoryValue = OnHand * Price
	From Part
	Where PartNum = @partnum
	return @inventoryValue
END
Go
declare @partInventory decimal(10,2)
set @partInventory = dbo.CalcInvenVal('P998')
print 'Inventory Value for P998 ' + cast(@partInventory as varchar(20))

--Question 7
Go
declare @partInventory decimal(10,2)
set @partInventory = dbo.CalcInvenVal('BV06')
print 'Inventory Value for BV06 ' + cast(@partInventory as varchar(20))

--Question 8
Go
create function CalcCredLimit(@creditScore int = 500)
returns decimal(8,2)
AS
BEGIN
	declare @creditLimit decimal(8,2)

	If @creditScore < 550
		set @creditLimit = 1000.00
	Else if @creditScore between 550 and 649
		set @creditLimit = 3000.00
	Else if @creditScore between 650 and 699
		set @creditLimit = 5000.00
	Else if @creditScore between 700 and 749
		set @creditLimit = 7500.00
	Else
		set @creditLimit = 10000.00

	return @creditLimit
END
go
declare @customerCredLimit decimal(8,2)
set @customerCredLimit = dbo.CalcCredLimit(650)

--Question 9
go
declare @newCredLimit decimal(8,2)
set @newCredLimit = dbo.CalcCredLimit(650)

update Customer
set CreditLimit = @newCredLimit
where CustomerNum = '148'

select CustomerNum, CreditLimit
from customer
where CustomerNum = '148'

--Question 10
Go
Create function CustomerOrderDetails(@customerNumber char(3))
returns table
As
Return(
	select OL.PartNum, P.Description, OL.QuotedPrice
	from OrderLine OL
	Join Part P on OL.PartNum = P.PartNum
	Where OL.OrderNum in (Select OrderNum From Orders Where CustomerNum = @customerNumber)
)
go
Select * from dbo.CustomerOrderDetails('148')

--Bonus
Create Sequence EvenSalesRep as int
Start with 1
increment by 1
cycle

Go
insert into Customer (CustomerNum, CustomerName, Street, City, State, Zip, Balance, CreditLimit, RepNum, lastChange)
values ('001', 'Mohandis Crean', '77 Scho Street', 'Nashville', 'TN', 65202, 26030.95, 26513.75, 
next value for EvenSalesRep, next value for changeTracking);

insert into Customer (CustomerNum, CustomerName, Street, City, State, Zip, Balance, CreditLimit, RepNum, lastChange)
values ('002', 'Sheela Thuillier', '4 Spense Circle', 'Omaha', 'NE', 52268, 46846.58, 68916.78, 
next value for EvenSalesRep, next value for changeTracking);

insert into Customer (CustomerNum, CustomerName, Street, City, State, Zip, Balance, CreditLimit, RepNum, lastChange)
values ('003', 'Eduino Hemphall', '660 amak Avenue', 'Washington', 'DC', 98765, 62293.46, 70128.24, 
next value for EvenSalesRep, next value for changeTracking);

insert into Customer (CustomerNum, CustomerName, Street, City, State, Zip, Balance, CreditLimit, RepNum, lastChange)
values ('004', 'Clim Tomaszek', '941 Waube Drive', 'Newport Beach', 'CA', 40338, 501.78, 75571.54, 
next value for EvenSalesRep, next value for changeTracking);

select * from Customer