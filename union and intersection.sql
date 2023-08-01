--Henry books new Query
--find books costing more than the average
select avg(price) as average
from copy

select * from copy
where price > 11.95

--describe table copy
--declare variables
--declare name as type
declare @avg as decimal(8,2)

select @avg = avg(price) from copy

select * from copy
where price > @avg

--nested queries
--nest inside of ()
--nest in where or from lines

select * from copy
where price > (select avg(price) from copy)
--nest in where when using <, >, ==, the nest must return One value

--nesting that returns multiple values
--use the IN clause
select * from book
--where type = 'FIC' or type = 'MYS' or type = 'SFI'
where type in ('FIC','MYS','SFI')

select publishercode
from Publisher
where city = 'Boston' or city = 'New York';

select title
from book
where PublisherCode not in 
	(select PublisherCode
	from Publisher
	where city = 'Boston' or city = 'New York')

--nest in the front
--need to reuse calculations
--modify or create fields
--if joining - include the primary key
select bookcode, price, price * .07 as tax
from copy

select title, price, price + tax as totalPrice
from book join
	(select bookcode, price, price * .07 as tax
	from copy
	) as priceCalc
on book.BookCode = priceCalc.BookCode

--select blah
--from table1 join (nested query, include FK) as table 2
--on table1.pk = table2.fk

--number of books and VALUE of inventory for each book
select bookCode, count(*) as numBook, avg(price) as avgPrice from copy
group by BookCode

--nest
select title, numBook, avgPrice, numBook * avgPrice as valueOfInventory
from book join
	(select bookCode, count(*) as numBook, avg(price) as avgPrice from copy
	group by BookCode
	) as bookMath
on book.bookCode = bookMath.BookCode

select distinct quality from copy

select distinct title, quality, 
	case
		when quality = 'Excellent' then 'Books in near new condition'
		when quality = 'Good' then 'Books with slight imperfections'
		when quality = 'Fair' then 'Books with significant imperfections'
		when quality = 'Poor' then 'Books in very bad shape'
		else 'Unknown Quality'
	end as qualityDesc
from book join copy
on book.BookCode = copy.BookCode
order by title

--do math and ranges in when
--sale price based on current price
--more expensive books higher discount rate
--0 to 15 10% off
--16 - 25 15% off
--26 - 35 20% off
--36 - 40 25% off
--otherwise 30%
select distinct title, price,
	case
		when price between 0 and 15.99 then price *.9
		when price between 16 and 25.99 then price *.85
		when price between 26 and 40.99 then price *.8
		else price * .75
		end as discountPrice
from book b join copy c on
b.BookCode = c.BookCode

--find books that are in warehouse 1 2 and 3
select bookcode from copy where BranchNum = 1
intersect
select bookcode from copy where BranchNum = 2
intersect
select bookcode from copy where BranchNum = 3

select title, bookcode
from book
where bookcode in
	(select bookcode from copy where BranchNum = 1
	intersect
	select bookcode from copy where BranchNum = 2
	intersect
	select bookcode from copy where BranchNum = 3)

--show books in branch 1 and 3

select distinct title, b.bookcode
from book b join copy
on b.BookCode = copy.BookCode
where BranchNum = 1
union
select distinct title, b.bookcode
from book b join copy
on b.BookCode = copy.BookCode
where BranchNum = 3