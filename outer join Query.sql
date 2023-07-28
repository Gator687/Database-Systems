--henry books
select * from book

select publishercode, count(*) as bookCount from book 
group by PublisherCode

select * from publisher

select * from book

--join book to publisher
select title, PublisherName
from book join publisher
on book.PublisherCode = Publisher.PublisherCode

select BranchName, BookCode, Quality
from Branch join copy
on branch.BranchNum = copy.BranchNum

--join book to author
select title, AuthorFirst, AuthorLast
from book join wrote on book.BookCode = Wrote.BookCode
join author on author.AuthorNum = wrote.AuthorNum
join Publisher on Publisher.PublisherCode = book.PublisherCode

--mistakes were made
select BranchName, BookCode, Quality, Branch.BranchNum
from Branch join copy
on branch.BranchNum = copy.BranchNum

--cross multiplication
select BranchName, BookCode, Quality, Branch.BranchNum
from Branch, copy, author

select * from book
select * from copy

select BranchName, count(*) bookCount, avg(price) as avgPrice
from copy join Branch
on copy.BranchNum = branch.BranchNum
group by BranchName

select title, AuthorLast
from book join wrote on book.BookCode = wrote.BookCode
join author on author.AuthorNum = wrote.AuthorNum
where AuthorLast = 'King'

select title, AuthorFirst, AuthorLast
from book join wrote on book.BookCode = Wrote.BookCode
join author on author.AuthorNum = wrote.AuthorNum
join Publisher on Publisher.PublisherCode = book.PublisherCode

select title, publishername
from book b join publisher p
on b.PublisherCode = p.PublisherCode

--inner joins are used to link tables based on a common field
--inner joins are 'normal'
--pull records from the tables that match a common field
--PK --> FK
--typically 1 to many relationships
--a one to many relationship called lookup table
--junction tables
--multiple 1 to many relationships
--used to solve many to many relationships

--outer joins
--find unmatched records in a PK-FK link

--find publishers without books
--list table to with data in first, table wihtout matches on the right of join
select publishername, bookcode
from book right outer join Publisher
on book.PublisherCode = Publisher.PublisherCode
where bookcode is null

--authors without books
select authorLast, bookCode
from wrote w right outer join author a
on w.AuthorNum = a.AuthorNum
where bookcode is null

select * from wrote
select * from Author
where AuthorLast like 'Cast%'

insert into wrote values('0200','21','1')

delete from wrote
where AuthorNum = '21'