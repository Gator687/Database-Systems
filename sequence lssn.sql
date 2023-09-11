--sequences
--create sequence BLAH as datatype start with # increment by #
create sequence globalCounter as int start with 10 increment by 5

create table person(
    personID int primary key,
    fname varchar(50),
    lname varchar(100)
)

create table jobs(
    jobID int primary key,
    jobName varchar(100)
)

insert into person values(next value for globalCounter,'James','Bond');
insert into person values(next value for globalCounter,'Austin','Powers');

insert into jobs values(next value for globalCounter, 'Spy');
insert into jobs values(next value for globalCounter, 'Hero');

insert into person values(next value for globalCounter,'Katness','Everdeen');

select * from person;
select * from jobs;

