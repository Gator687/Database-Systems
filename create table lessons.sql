--drop table majors;

create table majors(
	--fieldname type constraints
	majorID tinyint not null constraint prim_major primary key,
	majorName varchar(20) not null,
	creditsNeeded tinyint check(creditsNeeded between 90 and 120)
)

insert into majors values(1, 'Programming', 90)
insert into majors values(2, 'Web UX', 90)
insert into majors values(3, 'Cooking', 110)
select * from majors

create table classes(
	classID int not null primary key,
	className nvarchar(100) not null,
	credits tinyInt check(credits between 1 and 6)
)

insert into classes values(1, 'SQL Server', 6)
insert into classes values(2, 'Data Structures', 5)
select * from classes

create table students(
	studID int not null primary key,
	fname varchar(20) not null,
	lname varchar(50),
	studBirthday date,
	majorID tinyInt,
	constraint fk_stud_major foreign key(majorID) --field in this table
		references majors(majorID)
)

insert into students values(1, 'Lee', 'Cottrell', '1969-12-09', 1) 
insert into students values(2, 'Kate', 'Upton', '1990-6-09', 2)
insert into students values(3, 'Joe', 'Blow', '1969-12-09', 111) 

select * from students