--triggers
--run in response to a database event
--use to solve business problems
--two categories DML and DDL
--DML == Data Manipulation Language
----insert, update, delete
--DDL == Data Definition Language
----create table, create index....
----change database or table structure
--types are inserted of trigger, after trigger
--          -----------          -----

--DDL
--prevent dropping tables
create table henry.killMe(
    pk int Primary Key,
    name varchar(20)
)

select * from henry.killMe
drop table henry.killMe

GO
create trigger preventDropTable
on database for drop_table
as print 'You cannot drop a table :('
ROLLBACK

--to disable a trigger
GO
disable trigger preventDropTable on database

--turn in back on
GO
enable trigger preventDropTable on database