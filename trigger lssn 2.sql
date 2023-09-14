select * from henry.Book
create sequence pkBook as int start with 10 increment by 1 maxvalue 99

insert into henry.book(title) values('jaws')--do not pass in what is calculated
insert into henry.book(title) values('Three Body Problem')

delete from henry.book
where bookcode = 'ja11'

--instead of trigger for insert
--generate our own primary key

go
create or alter trigger newBookPK
on henry.book
instead of INSERT
AS
BEGIN
    --variable from insert
    declare @bookPK char(4)
    declare @bookTitle char(40)
    --logic here
    declare @pkNum int --fill from sequence
    select @pkNum = next value for pkBook --holds next value from trigger
    select @bookTitle = (select title from inserted)    --inserted is a temp table
                                                        --holds the values inserted
    set @bookPK = concat(upper(left(@bookTitle, 2)), @pkNum)

    insert into henry.book(bookcode, title) values(@bookPK, @bookTitle)
    --insert into henry.book select @bookPK, @bookTitle, publisherCode, type, paperback
        --from inserted    
END