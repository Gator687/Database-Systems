--functions return a value
--scalar function returna single value
--call functions in queries or in stored procedures
--scalar functions called in selects, where, set
--table valued functions called in joins or from

--scalar functions
--calc avg price of books
GO
--create function name()
--returns datatype
--AS
--BEGIN
----your code here
----return value
--end

create or alter function henry.avgBookPrice()
returns DECIMAL(8,2)
as
BEGIN
    declare @avgPrice decimal(8,2)
    set @avgPrice = avg(price) from Copy
    return @avgPrice;
END

GO
select price - henry.avgBookPrice() as diff, price
from henry.copy

GO
create function henry.custOffer(@retailPrice decimal(8,2), @quality char(20) = 'GOOD')
returns decimal(8,2) AS
BEGIN
    declare @offer decimal(8,2)
    set @quality = upper(@quality)
    set @offer = 0;
    set @offer = 
    case
        when @quality = 'EXCELLENT' then @retailPrice * .2
        when @quality = 'GOOD' then @retailPrice * .15
        when @quality = 'FAIR' then @retailPrice * .1
        when @quality = 'POOR' then @retailPrice * .05
        else @retailPrice *.15
    end

    return @offer;
END

go
select henry.custOffer(100, 'FAIR') as custOffer

go
create or alter function henry.bookStatsFun()
returns table as
return(
select b.bookcode, b.title, onHand, avgPrice, maxPrice, minPrice
from henry.book b join(
    select bookcode, count(*) as onHand, avg(price) as avgPrice,
        max(price) as maxPrice, min(price) as minPrice from henry.copy
        group by bookcode) as bookStats
    on b.bookcode = bookStats.bookcode
)