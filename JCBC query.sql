CREATE TABLE [People] (
  [PeopleID] nvarchar(4) primary key,
  [Fname] nvarchar(20),
  [Lname] nvarchar(20)
);

CREATE TABLE [Team] (
  [TeamID] nvarchar(4) primary key,
  [Name] nvarchar(20),
  [City] nvarchar(20)
);

CREATE TABLE [TeamPeople] (
  [TeamPlayerID] nvarchar(4) primary key,
  [peopleID] nvarchar(4),
  [TeamID] nvarchar(4),
  [role] nvarchar(20),
  [number] int,
  CONSTRAINT [FK_TeamPeople.TeamID]
    FOREIGN KEY ([TeamID])
      REFERENCES [Team]([TeamID]),
  CONSTRAINT [FK_TeamPeople.peopleID]
    FOREIGN KEY ([peopleID])
      REFERENCES [People]([PeopleID])
);

CREATE TABLE [Schedule] (
  [ScheduleID] nvarchar(4) primary key,
  [Date] datetime,
  [HomeTeamID] nvarchar(4),
  [AwayTeamID] nvarchar(4),
  [City] nvarchar(20),
  [HomeScore] int,
  [AwayScore] int,
  CONSTRAINT [FK_Schedule.AwayTeamID]
    FOREIGN KEY ([AwayTeamID])
      REFERENCES [Team]([TeamID]),
  CONSTRAINT [FK_Schedule.HomeTeamID]
    FOREIGN KEY ([HomeTeamID])
      REFERENCES [Team]([TeamID])
);

insert into Team (TeamID, Name, city) values ('T103', 'Rats', 'Lamam');
insert into Team (TeamID, Name, city) values ('T213', 'Jackals', 'Binjai');
insert into Team (TeamID, Name, city) values ('T417', 'Snakes', 'Dulolong');
insert into Team (TeamID, Name, city) values ('T592', 'Warriors', 'Nzérékoré');
insert into Team (TeamID, Name, city) values ('T385', 'Trackers', 'Mohelno');


insert into People (PeopleID, Fname, Lname) values ('P100', 'Gun', 'Slite');
insert into People (PeopleID, Fname, Lname) values ('P101', 'Ogden', 'Paolicchi');
insert into People (PeopleID, Fname, Lname) values ('P102', 'Farris', 'Biscomb');
insert into People (PeopleID, Fname, Lname) values ('P103', 'Vlad', 'Evennett');
insert into People (PeopleID, Fname, Lname) values ('P104', 'Shaughn', 'Prendeguest');
insert into People (PeopleID, Fname, Lname) values ('P105', 'Dun', 'Burt');
insert into People (PeopleID, Fname, Lname) values ('P106', 'Vladimir', 'Syer');
insert into People (PeopleID, Fname, Lname) values ('P107', 'Erny', 'Cornillot');
insert into People (PeopleID, Fname, Lname) values ('P108', 'Teodor', 'Worling');
insert into People (PeopleID, Fname, Lname) values ('P109', 'Ermanno', 'Pietzner');
insert into People (PeopleID, Fname, Lname) values ('P110', 'Wendel', 'Clayson');
insert into People (PeopleID, Fname, Lname) values ('P111', 'Arvie', 'Daynter');
insert into People (PeopleID, Fname, Lname) values ('P112', 'Xever', 'Labdon');
insert into People (PeopleID, Fname, Lname) values ('P113', 'Eliot', 'Gabbett');
insert into People (PeopleID, Fname, Lname) values ('P114', 'Amery', 'McFadden');
insert into People (PeopleID, Fname, Lname) values ('P115', 'Evin', 'Tallent');
insert into People (PeopleID, Fname, Lname) values ('P116', 'Maddie', 'Watkins');
insert into People (PeopleID, Fname, Lname) values ('P117', 'Ingra', 'Stooders');
insert into People (PeopleID, Fname, Lname) values ('P118', 'Maje', 'Gatfield');
insert into People (PeopleID, Fname, Lname) values ('P119', 'Ellwood', 'Aikman');
insert into People (PeopleID, Fname, Lname) values ('P120', 'Any', 'Durston');
insert into People (PeopleID, Fname, Lname) values ('P121', 'Kalle', 'Williams');
insert into People (PeopleID, Fname, Lname) values ('P122', 'Niki', 'Meegin');
insert into People (PeopleID, Fname, Lname) values ('P123', 'Karl', 'Shimwell');
insert into People (PeopleID, Fname, Lname) values ('P124', 'Alfy', 'Exposito');
insert into People (PeopleID, Fname, Lname) values ('P125', 'Tadd', 'Skellen');
insert into People (PeopleID, Fname, Lname) values ('P126', 'Sheffield', 'Guillem');
insert into People (PeopleID, Fname, Lname) values ('P127', 'Abba', 'Squirrell');
insert into People (PeopleID, Fname, Lname) values ('P128', 'Parke', 'Hugues');
insert into People (PeopleID, Fname, Lname) values ('P129', 'Patrizius', 'Wither');
insert into People (PeopleID, Fname, Lname) values ('P130', 'Morton', 'Penney');
insert into People (PeopleID, Fname, Lname) values ('P131', 'Lannie', 'Scohier');
insert into People (PeopleID, Fname, Lname) values ('P132', 'Fair', 'Jaqueme');
insert into People (PeopleID, Fname, Lname) values ('P133', 'Cliff', 'Alldread');
insert into People (PeopleID, Fname, Lname) values ('P134', 'Ive', 'Strafford');
insert into People (PeopleID, Fname, Lname) values ('P135', 'Iain', 'Grenville');
insert into People (PeopleID, Fname, Lname) values ('P136', 'Padraig', 'Bulpitt');
insert into People (PeopleID, Fname, Lname) values ('P137', 'Denver', 'Ciccerale');
insert into People (PeopleID, Fname, Lname) values ('P138', 'Farley', 'Lohde');
insert into People (PeopleID, Fname, Lname) values ('P139', 'Baudoin', 'Allery');
insert into People (PeopleID, Fname, Lname) values ('P140', 'Eziechiele', 'Verbruggen');
insert into People (PeopleID, Fname, Lname) values ('P141', 'Decca', 'Weaving');
insert into People (PeopleID, Fname, Lname) values ('P142', 'Hershel', 'Puttock');
insert into People (PeopleID, Fname, Lname) values ('P143', 'Feodor', 'Boxe');
insert into People (PeopleID, Fname, Lname) values ('P144', 'Marcel', 'Serris');
insert into People (PeopleID, Fname, Lname) values ('P145', 'Rabi', 'Kisar');
insert into People (PeopleID, Fname, Lname) values ('P146', 'Angie', 'Attrey');
insert into People (PeopleID, Fname, Lname) values ('P147', 'Mervin', 'Lethibridge');
insert into People (PeopleID, Fname, Lname) values ('P148', 'Clevey', 'Steven');
insert into People (PeopleID, Fname, Lname) values ('P149', 'Thurstan', 'Hair');
insert into People (PeopleID, Fname, Lname) values ('P150', 'Humbert', 'Lamblot');
insert into People (PeopleID, Fname, Lname) values ('P151', 'Reed', 'Hourican');
insert into People (PeopleID, Fname, Lname) values ('P152', 'Bradan', 'Smiz');
insert into People (PeopleID, Fname, Lname) values ('P153', 'Wayland', 'Boodle');
insert into People (PeopleID, Fname, Lname) values ('P154', 'Cory', 'Birds');
insert into People (PeopleID, Fname, Lname) values ('P155', 'Colby', 'Gaynes');
insert into People (PeopleID, Fname, Lname) values ('P156', 'Barnett', 'Heamus');
insert into People (PeopleID, Fname, Lname) values ('P157', 'Bourke', 'Arminger');
insert into People (PeopleID, Fname, Lname) values ('P158', 'Brody', 'Cockson');
insert into People (PeopleID, Fname, Lname) values ('P159', 'Pasquale', 'Maginot');


insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1000', 'P100', 'T103', 'player', 33);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1001', 'P101', 'T103', 'player', 17);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1002', 'P102', 'T103', 'player', 77);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1003', 'P103', 'T103', 'player', 94);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1004', 'P104', 'T103', 'player', 93);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1005', 'P105', 'T103', 'player', 60);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1006', 'P106', 'T103', 'player', 92);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1007', 'P107', 'T103', 'player', 1);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1008', 'P108', 'T103', 'player', 43);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1009', 'P109', 'T103', 'player', 24);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1010', 'P110', 'T213', 'player', 31);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1011', 'P111', 'T213', 'player', 76);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1012', 'P112', 'T213', 'player', 30);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1013', 'P113', 'T213', 'player', 41);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1014', 'P114', 'T213', 'player', 47);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1015', 'P115', 'T213', 'player', 53);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1016', 'P116', 'T213', 'player', 3);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1017', 'P117', 'T213', 'player', 90);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1018', 'P118', 'T213', 'player', 89);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1019', 'P119', 'T213', 'player', 90);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1020', 'P120', 'T417', 'player', 6);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1021', 'P121', 'T417', 'player', 66);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1022', 'P122', 'T417', 'player', 3);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1023', 'P123', 'T417', 'player', 28);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1024', 'P124', 'T417', 'player', 93);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1025', 'P125', 'T417', 'player', 73);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1026', 'P126', 'T417', 'player', 98);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1027', 'P127', 'T417', 'player', 20);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1028', 'P128', 'T417', 'player', 15);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1029', 'P129', 'T417', 'player', 21);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1030', 'P130', 'T592', 'player', 50);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1031', 'P131', 'T592', 'player', 85);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1032', 'P132', 'T592', 'player', 7);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1033', 'P133', 'T592', 'player', 54);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1034', 'P134', 'T592', 'player', 51);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1035', 'P135', 'T592', 'player', 9);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1036', 'P136', 'T592', 'player', 9);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1037', 'P137', 'T592', 'player', 2);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1038', 'P138', 'T592', 'player', 25);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1039', 'P139', 'T592', 'player', 20);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1040', 'P140', 'T385', 'player', 35);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1041', 'P141', 'T385', 'player', 50);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1042', 'P142', 'T385', 'player', 20);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1043', 'P143', 'T385', 'player', 50);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1044', 'P144', 'T385', 'player', 83);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1045', 'P145', 'T385', 'player', 95);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1046', 'P146', 'T385', 'player', 39);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1047', 'P147', 'T385', 'player', 87);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1048', 'P148', 'T385', 'player', 60);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1049', 'P149', 'T385', 'player', 76);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1050', 'P150', 'T103', 'coach', 66);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1051', 'P151', 'T103', 'coach', 20);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1052', 'P152', 'T213', 'coach', 6);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1053', 'P153', 'T213', 'coach', 54);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1054', 'P154', 'T417', 'coach', 87);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1055', 'P155', 'T417', 'coach', 44);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1056', 'P156', 'T592', 'coach', 41);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1057', 'P157', 'T592', 'coach', 31);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1058', 'P158', 'T385', 'coach', 31);
insert into TeamPeople (TeamPlayerID, PeopleID, TeamID, role, number) values ('1059', 'P159', 'T385', 'coach', 55);


insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S100', '2023-08-23 6:00:00', 'T103', 'T213', 'Lamam', 72, 49);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S101', '2023-08-24 8:00:00', 'T417', 'T592', 'Dulolong', 79, 12);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S102', '2023-08-25 6:00:00', 'T103', 'T417', 'Lamam', 86, 146);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S103', '2023-08-26 8:00:00', 'T213', 'T385', 'Binjai', 56, 126);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S104', '2023-08-27 6:00:00', 'T103', 'T592', 'Lamam', 38, 39);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S105', '2023-08-28 8:00:00', 'T417', 'T385', 'Dulolong', 100, 85);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S106', '2023-08-29 6:00:00', 'T103', 'T385', 'Lamam', 31, 129);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S107', '2023-08-30 8:00:00', 'T213', 'T417', 'Binjai', 37, 34);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S108', '2023-09-01 6:00:00', 'T213', 'T103', 'Binjai', 70, 18);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S109', '2023-09-02 8:00:00', 'T592', 'T417', 'Nzérékoré', 19, 5);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S110', '2023-09-03 6:00:00', 'T417', 'T103', 'Dulolong', 48, 147);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S111', '2023-09-04 8:00:00', 'T385', 'T213', 'Mohelno', 93, 90);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S112', '2023-09-05 6:00:00', 'T592', 'T103', 'Nzérékoré', 42, 94);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S113', '2023-09-06 8:00:00', 'T385', 'T417', 'Mohelno', 75, 12);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S114', '2023-09-07 6:00:00', 'T385', 'T103', 'Mohelno', 53, 49);
insert into Schedule (ScheduleID, Date, HomeTeamID, AwayTeamID, City, HomeScore, AwayScore) values ('S115', '2023-09-08 8:00:00', 'T417', 'T213', 'Dulolong', 5, 143);

select * from Schedule
select * from TeamPeople
select * from People
select * from Team