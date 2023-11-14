Create table tblManager(
    mgrID Nvarchar(4) Primary key not null,
    mgrFname Nvarchar(25) not null,
    mgrLname Nvarchar(50),
    mgrLevel Int check (mgrLevel between 1 and 10)
)

Create table tblCategory(
    catID Int Primary key not null,
    catName Nvarchar(100)not null,
    catManager Nvarchar(4) References tblManager(mgrID)
)

Create table tblProduct(
    productID Int primary key not null,
    productName Nvarchar(50) not null,
    productPrice Money check (productPrice between 0.01 and 10000),
    productCategory Int references tblCategory(catID)
)

insert into tblManager (mgrID, mgrFname, mgrLname, mgrLevel) values ('M694', 'Terrye', 'Wroe', 6);
insert into tblManager (mgrID, mgrFname, mgrLname, mgrLevel) values ('M717', 'Edik', 'Dagnall', 9);
insert into tblManager (mgrID, mgrFname, mgrLname, mgrLevel) values ('M931', 'Steffen', 'Cufley', 10);
insert into tblManager (mgrID, mgrFname, mgrLname, mgrLevel) values ('M904', 'Alika', 'Bretherick', 8);
insert into tblManager (mgrID, mgrFname, mgrLname, mgrLevel) values ('M707', 'Mona', 'Quincey', 10);

insert into tblCategory (catID, catName, catManager) values (868, 'Kitchen', 'M694');
insert into tblCategory (catID, catName, catManager) values (456, 'Kitchen', 'M717');
insert into tblCategory (catID, catName, catManager) values (882, 'Kitchen', 'M931');
insert into tblCategory (catID, catName, catManager) values (935, 'Kitchen', 'M904');
insert into tblCategory (catID, catName, catManager) values (531, 'Kitchen', 'M707');


insert into tblProduct (productID, productName, productPrice, productCategory) values (526, 'Toaster', '$42.36', 868);
insert into tblProduct (productID, productName, productPrice, productCategory) values (200, 'Air fryer', '$85.95', 456);
insert into tblProduct (productID, productName, productPrice, productCategory) values (498, 'Blender', '$63.40', 882);
insert into tblProduct (productID, productName, productPrice, productCategory) values (134, 'Microwave', '$48.06', 935);
insert into tblProduct (productID, productName, productPrice, productCategory) values (891, 'Coffee maker', '$33.72', 531);

select * from tblManager
select * from tblCategory
select * from tblProduct