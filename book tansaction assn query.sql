begin transaction
go
insert into author
values(30, 'Upton', 'Kate')

select * from author
where authornum=30

rollback

DELETE FROM author
WHERE authornum = 30

--original author with 
--authornum = 30
--AuthorLast = Gamus
--AuthorFirst = Bonnie