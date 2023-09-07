--views
--names a query like a table
--views act like a table
--can join, select...
--views can hide data
--simplify access
--how to
--first get the SQL query to work

--simple view to hide data
drop view henry.titlePaper

create view henry.titlePaper as
select title, type, paperback
from henry.book;

select * from henry.titlePaper;

go; -- need if you get error 'Must be the only statement in the batch'

create view henry.bookPub as
select title, publishername, BookCode	--include a PK for joining later
from henry.book b join henry.publisher p
on b.publisherID = p.publisherCode

select * from henry.bookPub
where title like '[AEIOUY]%'

select *
from henry.wrote w join henry.bookPub bp
on w.BookCode = bp.BookCode

go;
create view henry.authorFullName as
select AuhtorNum, trim(AuthorFirst) + ' ' + trim(AuthorLast) as authorname
from henry.author

select * from henry.authorFullName

select name from sys.views
select * from sys.database_firewallrules