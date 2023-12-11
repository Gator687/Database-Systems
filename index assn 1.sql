create index partIndex on part(description)
create index customerNameIndex on customer(customerName) with (fillfactor = 20)
create index repName on rep(lastname, firstname)

insert into part values('12AB','Something', 1, 'AP', '1', 100.00)
insert into part values('34CD','Another Thing', 2, 'SG', '2', 50.00)

alter index partIndex on part rebuild

select * from part