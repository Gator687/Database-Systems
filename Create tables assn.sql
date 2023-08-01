create table Room(
	roomNum Int not null constraint roomNum Primary Key,
	pricePerNight Decimal,
	floorNum Int,
	maxPersons Tinyint,
	hasBabyBed Tinyint,
	hasShower Tinyint,
	hasBath Tinyint,
	hasSeeview Tinyint
)

create table Guest(
	guestID Int constraint guestID primary key,
	firstName Varchar(45),
	lastName Varchar(45),
	phone Varchar(45),
	email Varchar(45),
	address Varchar(45),
	city Varchar(45),
	country Varchar(45)
)

create table Booking(
	bookingID Int not null constraint bookingId Primary Key,
	startDate Datetime,
	endDate Datetime,
	roomNum Int foreign key (roomNum) references Room(roomNum),
	guestID Int foreign key (guestID) references Guest(guestID)
)



create table Users(
	userID Int constraint userID Primary Key,
	userName Varchar(30),
	password Varchar(100),
	email Varchar(100),
	profilePic Varchar(200),
	friendCount Int,
	status Int,
	fullName Varchar(150)
)

create table messages(
	msgID Int constraint msgID Primary Key,
	message Varchar(200),
	userID int,
	constraint fk_user foreign key(userID)
	references Users(userID),
	ip Varchar(30),
	created int,
	uploads Varchar(30),
	likeCount int,
	commentCount int,
	shareContent int
)

create table message_like(
	likeID Int constraint likeId Primary key,
	msgID Int,
	constraint fk_msg foreign key(msgID)
	references messages(msgID),
	uID int,
	constraint fk_user_msg foreign key(uID)
	references Users(userID),
	created int
)


create table address(
	addressID numeric constraint addressID Primary key,
	street Varchar,
	city Varchar,
	province Varchar,
	country Varchar,
	pCode Varchar
)

create table employee(
	empID numeric constraint empID Primary key,
	firstName Varchar,
	lastName Varchar,
	salary numeric,
	addressID numeric,
	constraint fk_address foreign key(addressID)
	references address(addressID)
)
