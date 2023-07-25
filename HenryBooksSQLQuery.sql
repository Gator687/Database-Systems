--pattern matching
--like operator
--wildcard is %
select * from book where title like '%potter%'

--book end with sky
select * from book where title like '%sky'

--start with harry
select * from book where title like 'harry%'

--books with word and in title
select * from book where title like '% and %'

--select books that begin with a-h
select * from book where title not like '[a-h]%' order by title

--calculations fields
--build expression in the select clause
--expression becomes another field in the output
select * from copy
--calc tax on price
select bookcode, quality, price, price * .07 as tax, price * .07 + price as total from copy



--aggregate operators
--select line operator(field) as nameIt
--return One value
--avg cost of a book
select avg(price) as avgPrice, count(*) as number, sum(price) as totalPrice, max(price) as maxPrice, min(price) as minPrice 
from copy 
where quality = 'Excellent'

select distinct quality from copy

--get stats on the distinct qualities
select quality, avg(price) as avgPrice, count(*) as number, sum(price) as totalPrice, max(price) as maxPrice, min(price) as minPrice 
from copy 
group by quality

select distinct type from book

select type, count(*) as bookCount
from book
--where publishercode='PE'
group by type
having count(*) >= 3
--having queries the aggregate column