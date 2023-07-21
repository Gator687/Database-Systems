--start SSMS
--open Henry Books

--show me the title, type of all FIC or MYS books
--no paperback
--use ( ) to group related conditions
select title, type, paperback
from book
where (type='FIC' or type='MYS') and paperback='N'

--pattern matching
--books that begin with Harry Potter
select * from book
where title like 'Harry Potter%'

--books that end with sky
select * from book
where title like '%sky'

--books with the letter groupings 'of' in the title
select * from book
where title like '%of%'

--books with the word 'of' in the title
select * from book
where title like '% of %'

--select * from receipts
--where saleDate like '7-%-20%'

--calculated fields
--expression in the select statement
select * from copy
--do math on a field
select bookcode, price, price * .07 as tax
from copy

--cannot do this, yet :)
select bookcode, price, price * .07 as tax, price + tax
from copy

select rtrim(authorFirst) + ' ' + rtrim(authorLast) as fullName
from author
--rtrim removes spaces from the right of the field
--there because the data type is char() which fills the field with spaces

--aggregate calculations
--data overall
--not individual records
--sum
--max, min
--avg
--count

--average, min, max price of book, number of records
select avg(price) as avgPrice, count(*) as numRecords,
max (price) as highestPrice, min(price) as lowestPrice
from copy

--average, min, max price of book, number of records combining a where clause
select avg(price) as avgPrice, count(*) as numRecords,
max (price) as highestPrice, min(price) as lowestPrice
from copy
where Quality = 'Excellent'

select type from book
order by type

--how many books of each type?
select type, count(*) as numBooks
from book
group by type
--group by lumps common values together

--query on aggregate value
select type, count(*) as numBooks
from book
group by type
having count(*) >= 3
--having build conditions on aggregate values

--grouping and a where clause
select type, count(*) as numBooks
from book
where PublisherCode='PE'
group by type

--number of books per publisher
select publishercode, count(publishercode)as numBooks from book
group by publishercode