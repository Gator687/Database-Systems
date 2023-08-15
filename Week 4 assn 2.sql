insert into Author values(26,'Patchett','Ann')
insert into Author values(27,'Yarros','Rebecca')
insert into Author values(28,'Brown','Sandra')
insert into Author values(29,'Hoover','Colleen')
insert into Author values(30,'Garmus','Bonnie')
insert into Author values(31,'Verghese','Abraham')
insert into Author values(32,'McFadden','Freida')

insert into Publisher values('HP','Harper','New York')
insert into Publisher values('RT','Red Tower','New York')
insert into Publisher values('GC','Grand Central','New York')
insert into Publisher values('AT','Atria','New York')
insert into Publisher values('DD','Doubleday','New York')
insert into Publisher values('GR','Grove','New York')

insert into Book values('9990','Tom Lake','HP','FIC','Y')
insert into Book values('9991','Fourth Wing','RT','FIC','Y')
insert into Book values('9992','Out of Nowhere','GC','FIC','Y')
insert into Book values('9993','Too Late','GC','FIC','N')
insert into Book values('9994','It Ends With Us','AT','FIC','N')
insert into Book values('9995','Lessons in Chemistry','DD','FIC','Y')
insert into Book values('9996','The Covenant of Water','GR','FIC','N')
insert into Book values('9997','The Housemaid','GC','FIC','N')
insert into Book values('9998','It Starts With Us','AT','FIC','Y')
insert into Book values('9999','Verity','GC','FIC','Y')

insert into Wrote values('9990','26','1')
insert into Wrote values('9991','27','1')
insert into Wrote values('9992','28','1')
insert into Wrote values('9993','29','1')
insert into Wrote values('9994','29','1')
insert into Wrote values('9995','30','1')
insert into Wrote values('9996','31','1')
insert into Wrote values('9997','32','1')
insert into Wrote values('9998','29','1')
insert into Wrote values('9999','29','1')

insert into Copy values('9990','1','1','Excellent','7.19')
insert into Copy values('9991','1','1','Excellent','7.19')
insert into Copy values('9992','1','1','Excellent','7.19')

Select B.Title as BookTitle,
Concat(A.AuthorFirst, ' ', A.AuthorLast) AS AuthorName, 
P.PublisherName
From Book as B
Join Wrote as W on B.BookCode = W.BookCode
Join Author as A on W.AuthorNum = A.AuthorNum
Join Publisher as P on B.PublisherCode = P.PublisherCode

select publishername, title from Publisher
full outer join book
on publisher.PublisherCode = book.PublisherCode
where title is null

select * from Author
select * from Publisher
select * from Book
select * from Wrote
select * from Copy