Create Procedure showOrders(@OrderDate Date) As
Select o.OrderNum, o.OrderDate, c.CustomerName, ol.PartNum, p.Description,
ol.QuotedPrice, ol.NumOrdered, (ol.QuotedPrice * ol.NumOrdered) AS TotalPrice
From premiere.Orders o
Join premiere.Customer c On o.CustomerNum = c.CustomerNum
Join premiere.OrderLine ol On o.OrderNum = ol.OrderNum
Join premiere.Part p On ol.PartNum = p.PartNum
Where o.OrderDate = @OrderDate
Order By o.OrderNum;

GO

Create or Alter Procedure GetPartsByClass (@Class Char(2) = 'AP') As
Select * From premiere.Part
Where Class = @Class;

GO
Create or alter procedure InsertPart
    @PartNum Char(4),
    @Description Char(15),
    @OnHand Decimal(4, 0),
    @Price Decimal(6, 2),
    @Class Char(2),
    @Warehouse Char(1)
As
BEGIN

    If @OnHand <= 0
        Set @OnHand = 1;

    If @Price <= 0
        Set @Price = 1.99;

    If @Class not in ('AP', 'HW', 'SG')
        Set @Class = 'AP';

    If @Warehouse not in ('1', '2', '3')
        Set @Warehouse = '1';

    Insert into premiere.part (PartNum, Description, OnHand, Class, Warehouse, Price)
    Values (@PartNum, @Description, @OnHand, @Class, @Warehouse, @Price)
END

GO
Create or alter procedure newOrderLine
    @OrderNum Char(5),
    @PartNum Char(4),
    @NumOrdered Decimal(3, 0),
    @DiscountPercent Decimal(2, 2)
AS
BEGIN
    If @NumOrdered <= 0
        Set @NumOrdered = 1

    If @DiscountPercent < 0 or @DiscountPercent > 0.5
        Return

    Declare @PartPrice Decimal(6, 2)
    Select @PartPrice = Price From premiere.Part Where PartNum = @PartNum
    Declare @QuotedPrice Decimal(6, 2)
    Set @QuotedPrice = @PartPrice - (@DiscountPercent * @PartPrice)

    Insert into premiere.OrderLine (OrderNum, PartNum, NumOrdered, QuotedPrice)
    Values (@OrderNum, @PartNum, @NumOrdered, @QuotedPrice)
END