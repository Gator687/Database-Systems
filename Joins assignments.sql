Select Customer.CustomerName, Rep.FirstName, Rep.LastName
From Customer
Inner Join Rep
On Rep.RepNum = Customer.RepNum

Select Customer.CustomerName, Rep.RepNum, Rep.FirstName, Rep.LastName
From Customer
Inner Join Rep
On Rep.RepNum = Customer.RepNum

Select Orders.OrderNum, Rep.FirstName as RepFirstName, Rep.LastName as RepLastName
From Orders
Inner Join Customer
On Orders.CustomerNum = Customer.CustomerNum
Inner Join Rep
On Customer.RepNum = Rep.RepNum

Select Part.Description, part.Price, Orders.OrderDate, Orders.CustomerNum, Customer.CustomerName, Orders.OrderNum, OrderLine.QuotedPrice
From Part
Inner Join OrderLine
On Part.PartNum = OrderLine.PartNum
Inner Join Orders
On Orders.OrderNum = OrderLine.OrderNum
Inner Join Customer
On Orders.CustomerNum = Customer.CustomerNum

Select Part.Description, Rep.FirstName, Rep.LastName
From Part
Inner Join OrderLine
On Part.PartNum = OrderLine.PartNum
Inner Join Orders
On OrderLine.OrderNum = Orders.OrderNum
Inner Join Customer
On Orders.CustomerNum = Customer.CustomerNum
Inner Join Rep
On Customer.RepNum = Rep.RepNum
Where Rep.FirstName = 'Juan' and Rep.LastName = 'Perez'

Select Part. *, OrderNum
From Part Full Outer Join OrderLine
On Part.PartNum = OrderLine.PartNum
Where OrderLine.NumOrdered is Null

Select Customer. *, NumOrdered
From Customer full Outer Join Orders
On Customer.CustomerNum = Orders.CustomerNum
Full outer join OrderLine
On Orders.OrderNum = OrderLine.OrderNum
Where NumOrdered is null