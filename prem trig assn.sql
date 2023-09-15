--Question 1
Create trigger PreventIndexCreation
On database for create_index
As print 'No index'
ROLLBACK

Go
Create index testIndex
on part(description)

--Question 2
create table partChanges(
changeID int primary key,
partNum char(4),
changeDate datetime,
userName char(100),
oldPrice decimal(6,2),
newPrice decimal(6,2)
)

Go
create trigger priceWatch
on part after update
as if update (price)
begin
	declare @oldPrice decimal(6,2)
	declare @newPrice decimal(6,2)
	declare @partNum char(4)
	declare @changeID int
	select @changeID = next value for changeTracking
	select @oldPrice = price from deleted
	select @newPrice = price from inserted
	select @partNum = partnum from deleted
	insert into partChanges values(@changeID, @partNum, GETDATE(),
		SYSTEM_USER, @oldPrice, @newPrice)
	update part
	set lastChange=@changeID
	where partnum = @partnum
end

select * from part

update part
set price = 29.95
where PartNum = 'at94'

update part
set price = 800.00
where PartNum = 'bv06'

update part
set price = 160.99
where PartNum = 'cd52'

select * from partChanges