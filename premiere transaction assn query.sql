begin transaction
go
insert into part
values('VID1', 'Geforce 1080', 100, 'AP', 2, 499.99)

insert into orderline
values(21608, 'VID1', 3, 429.99)

insert into part
values('VID2', 'Geforce 1070', 100, 'AP', 2, 399.99)
insert into part
values('VID3', 'Geforce 1060', 100, 'AP', 2, 209.99)

insert into part
values('CPU1', 'Intel i5', 100, 'AP', 2, 179.99)
insert into part
values('CPU2', 'Intel i7', 100, 'AP', 2, 359.99)