CREATE TABLE [SalesRep] (
  [SalesRepID] nvarchar(4),
  [Fname] nvarchar(20),
  [Lname] nvarchar(20),
  PRIMARY KEY ([SalesRepID])
);

CREATE TABLE [Customer] (
  [CustomerID] nvarchar(4),
  [Fname] nvarchar(20),
  [Lname] nvarchar(20),
  [Contact] nvarchar(30),
  PRIMARY KEY ([CustomerID])
);

CREATE TABLE [Invoice] (
  [InvoiceID] nvarchar(4),
  [SalesRepID] nvarchar(4),
  [CustomerID] nvarchar(4),
  [Date] Datetime,
  PRIMARY KEY ([InvoiceID]),
  CONSTRAINT [FK_Invoice.CustomerID]
    FOREIGN KEY ([CustomerID])
      REFERENCES [Customer]([CustomerID]),
  CONSTRAINT [FK_Invoice.SalesRepID]
    FOREIGN KEY ([SalesRepID])
      REFERENCES [SalesRep]([SalesRepID])
);

CREATE TABLE [Vendor] (
  [VendorID] nvarchar(4),
  [Name] nvarchar(20),
  [Contact] nvarchar(30),
  [Location] nvarchar(20),
  PRIMARY KEY ([VendorID])
);

CREATE TABLE [Product] (
  [ProductID] nvarchar(4),
  [VendorID] nvarchar(4),
  [Price] money,
  PRIMARY KEY ([ProductID]),
  CONSTRAINT [FK_Product.VendorID]
    FOREIGN KEY ([VendorID])
      REFERENCES [Vendor]([VendorID])
);

CREATE TABLE [Line] (
  [LineID] nvarchar(4),
  [InvoiceID] nvarchar(4),
  [ProductID] nvarchar(4),
  [Desc] nvarchar(50),
  PRIMARY KEY ([LineID]),
  CONSTRAINT [FK_Line.ProductID]
    FOREIGN KEY ([ProductID])
      REFERENCES [Product]([ProductID]),
  CONSTRAINT [FK_Line.InvoiceID]
    FOREIGN KEY ([InvoiceID])
      REFERENCES [Invoice]([InvoiceID])
);

insert into SalesRep (SalesRepID, Fname, Lname) values ('S105', 'Ramon', 'Lakenton');
insert into SalesRep (SalesRepID, Fname, Lname) values ('S319', 'Phillida', 'Scranedge');
insert into SalesRep (SalesRepID, Fname, Lname) values ('S944', 'Bernadette', 'Tuft');
insert into SalesRep (SalesRepID, Fname, Lname) values ('S134', 'Ansel', 'Gianiello');
insert into SalesRep (SalesRepID, Fname, Lname) values ('S349', 'Hillel', 'Dabell');


insert into Customer (CustomerID, Fname, Lname, Contact) values ('C126', 'Jerome', 'Boothe', 'jboothe0@xing.com');
insert into Customer (CustomerID, Fname, Lname, Contact) values ('C361', 'Isabeau', 'Skedgell', 'iskedgell1@japanpost.jp');
insert into Customer (CustomerID, Fname, Lname, Contact) values ('C919', 'Grady', 'Domleo', 'gdomleo2@youtu.be');
insert into Customer (CustomerID, Fname, Lname, Contact) values ('C869', 'Missy', 'Lamblot', 'mlamblot3@networksolutions.com');
insert into Customer (CustomerID, Fname, Lname, Contact) values ('C540', 'Lily', 'Eagar', 'leagar4@mayoclinic.com');


insert into Vendor (VendorID, Name, Contact, Location) values ('V301', 'Bruen Group', '367-384-6392', 'Figueiras');
insert into Vendor (VendorID, Name, Contact, Location) values ('V820', 'Parker Inc', '645-224-1801', 'Velyka Oleksandrivka');
insert into Vendor (VendorID, Name, Contact, Location) values ('V886', 'Simonis and Sons', '340-900-6331', 'Sanhe');
insert into Vendor (VendorID, Name, Contact, Location) values ('V374', 'Bednar Breitenberg', '643-595-4544', 'Hamburg Harvestehude');
insert into Vendor (VendorID, Name, Contact, Location) values ('V876', 'Paucek Inc', '519-103-9119', 'Khu Khan');


insert into Product (ProductID, VendorID, Price) values ('P765', 'V301', '$177.94');
insert into Product (ProductID, VendorID, Price) values ('P705', 'V301', '$159.48');
insert into Product (ProductID, VendorID, Price) values ('P880', 'V820', '$176.99');
insert into Product (ProductID, VendorID, Price) values ('P207', 'V820', '$150.02');
insert into Product (ProductID, VendorID, Price) values ('P779', 'V886', '$163.85');
insert into Product (ProductID, VendorID, Price) values ('P512', 'V886', '$134.25');


insert into Invoice (InvoiceID, SalesRepID, CustomerID, Date) values ('I525', 'S105', 'C126', '1/14/2021');
insert into Invoice (InvoiceID, SalesRepID, CustomerID, Date) values ('I274', 'S319', 'C361', '9/13/2021');
insert into Invoice (InvoiceID, SalesRepID, CustomerID, Date) values ('I517', 'S944', 'C919', '3/13/2021');
insert into Invoice (InvoiceID, SalesRepID, CustomerID, Date) values ('I953', 'S134', 'C869', '2/25/2021');
insert into Invoice (InvoiceID, SalesRepID, CustomerID, Date) values ('I691', 'S349', 'C919', '10/21/2020');
insert into Invoice (InvoiceID, SalesRepID, CustomerID, Date) values ('I936', 'S349', 'C919', '10/22/2020');


insert into Line (LineID, InvoiceID, ProductID, [Desc]) values ('L950', 'I525', 'P765', 'Fridge');
insert into Line (LineID, InvoiceID, ProductID, [Desc]) values ('L376', 'I274', 'P705', 'Microwave');
insert into Line (LineID, InvoiceID, ProductID, [Desc]) values ('L394', 'I517', 'P880', 'Sink');
insert into Line (LineID, InvoiceID, ProductID, [Desc]) values ('L346', 'I953', 'P207', 'Dishwasher');
insert into Line (LineID, InvoiceID, ProductID, [Desc]) values ('L707', 'I691', 'P779', 'Cabinet');
insert into Line (LineID, InvoiceID, ProductID, [Desc]) values ('L706', 'I691', 'P512', 'Drawer');

select * from SalesRep
select * from Customer
select * from Vendor
select * from Invoice
select * from Line