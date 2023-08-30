select * from book
where title='The Edge'

create index titleIndex on book(title);
create index typeIndex on book(type);

drop index titleIndex on book;

exec sys.sp_helpindex @objname='book'

select * from branch;

--covering index indexes multiple columns
create index coverIndex on branch(branchname, branchlocation)

--rebuild the index
--done periodically
alter index coverIndex on branch rebuild

create unique index authorFullIndex on
author(authorfirst, authorlast)