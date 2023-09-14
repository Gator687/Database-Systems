exec showOrders '2007-10-21'

exec GetPartsByClass
exec GetPartsByClass @Class = 'HW'

exec InsertPart 'P123', 'Widget', 100, 10.99, 'AP', '2'
exec InsertPart 'P456', 'Gadget', 50, 7.99
exec InsertPart 'P789', 'Tool', 75, 19.99,'HW'
exec InsertPart 'P135', 'Widget', -2, -2.99, 'ZA', '4'

select * from premiere.Part
where PartNum = 'P123'
select * from premiere.Part
where PartNum = 'P456'
select * from premiere.Part
where PartNum = 'P789'
select * from premiere.Part
where PartNum = 'P135'

exec newOrderLine 'O1234', 'P123', 5, 0.1
exec newOrderLine '24568','P456', -5, 0.3
exec newOrderLine '56789','P789', 2, 0.7

select * from premiere.OrderLine