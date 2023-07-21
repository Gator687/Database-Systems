--all fields in book table
select *
from book;

select * from author;

--select fields in a table
select title, type, paperback
from book;
--select fields in a table, order is unimportant
select title, Paperback, Type
from book;

select AuthorFirst, AuthorLast
from author;

--where condition
select title, type, paperback
from book
where Paperback = 'Y';

select title, type, paperback
from book
where type ='HOR' or type='SFI';

select title, type, paperback
from book
where (type ='HOR' or type='SFI') and paperback='Y';

--sort by title
select type, title
from book
order by title;

--sort fields by title within type
select type, title
from book
order by type, title;

--standard boolean operators work
select * from copy
where price > 20;

select * from copy
--where price >= 10 and price <= 20
where price between 10 and 20


