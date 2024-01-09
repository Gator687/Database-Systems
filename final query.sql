CREATE TABLE [Employees] (
  [EmployeeID] nvarchar(4),
  [EmployeeName] nvarchar(30),
  PRIMARY KEY ([EmployeeID])
);

CREATE TABLE [Services] (
  [ServiceID] nvarchar(4),
  [Description] nvarchar(50),
  PRIMARY KEY ([ServiceID])
);

CREATE TABLE [Customers] (
  [customerID] nvarchar(4),
  [customerName] nvarchar(30),
  PRIMARY KEY ([customerID])
);

CREATE TABLE [Pools] (
  [PoolID] nvarchar(4),
  [customerID] nvarchar(4),
  [address] nvarchar(30),
  PRIMARY KEY ([PoolID]),
  CONSTRAINT [FK_Pools.customerID]
    FOREIGN KEY ([customerID])
      REFERENCES [Customers]([customerID])
);

CREATE TABLE [PoolServiced] (
  [PoolServicedID] nvarchar(4),
  [PoolID] nvarchar(4),
  [ServiceID] nvarchar(4),
  [EmployeeID] nvarchar(4),
  PRIMARY KEY ([PoolServicedID]),
  CONSTRAINT [FK_PoolServiced.EmployeeID]
    FOREIGN KEY ([EmployeeID])
      REFERENCES [Employees]([EmployeeID]),
  CONSTRAINT [FK_PoolServiced.ServiceID]
    FOREIGN KEY ([ServiceID])
      REFERENCES [Services]([ServiceID]),
  CONSTRAINT [FK_PoolServiced.PoolID]
    FOREIGN KEY ([PoolID])
      REFERENCES [Pools]([PoolID])
);

insert into Employees values('E001','Marianne Nockalls')
insert into Employees values('E002','Devora Emett')
insert into Employees values('E003','Kort Hadfield')
insert into Employees values('E004','Kendall Brodnecke')
insert into Employees values('E005','Skyler Briant')
insert into Employees values('E006','Elizabeth Romanelli')
insert into Employees values('E007','Winifred Haversham')
insert into Employees values('E008','Siffre Kilcoyne')
insert into Employees values('E009','Graham Scamerdine')
insert into Employees values('E010','Gaspar Iveagh')

insert into Services values('S001','Pool skimming')
insert into Services values('S002','Pool vacuuming')
insert into Services values('S003','Clean pool filter')
insert into Services values('S004','Maintenance of water level')
insert into Services values('S005','Heater servicing')
insert into Services values('S006','Pool lining repair')
insert into Services values('S007','Filter repair')
insert into Services values('S008','Heater repair')
insert into Services values('S009','Chlorine check')
insert into Services values('S010','inspection')

insert into Customers values('C001','Pietro Wolfenden')
insert into Customers values('C002','Corabelle Boscott')
insert into Customers values('C003','Torrey Quinn')
insert into Customers values('C004','Rycca Corstan')
insert into Customers values('C005','Renie Philipps')
insert into Customers values('C006','Cornelia Jako')
insert into Customers values('C007','Pincas Tadgell')
insert into Customers values('C008','Barbra Leffek')
insert into Customers values('C009','Wendie Furze')
insert into Customers values('C010','Marie-ann Nanson')

insert into Pools values('P001','C001','3 Lyons Street')
insert into Pools values('P002','C002','60807 Arrowood Drive')
insert into Pools values('P003','C003','2882 Di Loreto Terrace')
insert into Pools values('P004','C004','429 2nd Parkway')
insert into Pools values('P005','C005','325 Toban Street')
insert into Pools values('P006','C006','5952 Anhalt Terrace')
insert into Pools values('P007','C007','84 Carioca Hill')
insert into Pools values('P008','C008','398 5th Terrace')
insert into Pools values('P009','C009','84821 Pierstorff Court')
insert into Pools values('P010','C010','788 Dexter Court')
insert into Pools values('P011','C001','6 Spohn Point')

insert into PoolServiced values('PS01','P001','S001','E001')
insert into PoolServiced values('PS02','P001','S002','E001')

insert into PoolServiced values('PS03','P002','S003','E002')
insert into PoolServiced values('PS04','P002','S004','E002')

insert into PoolServiced values('PS05','P003','S005','E003')

insert into PoolServiced values('PS06','P004','S006','E004')

insert into PoolServiced values('PS07','P005','S007','E005')
insert into PoolServiced values('PS08','P005','S008','E005')

insert into PoolServiced values('PS09','P006','S001','E006')
insert into PoolServiced values('PS10','P006','S001','E007')

insert into PoolServiced values('PS11','P007','S001','E008')

insert into PoolServiced values('PS12','P008','S009','E009')

insert into PoolServiced values('PS13','P009','S010','E010')

insert into PoolServiced values('PS14','P010','S007','E001')
insert into PoolServiced values('PS15','P010','S008','E001')

insert into PoolServiced values('PS16','P011','S010','E009')

SELECT PS.PoolID, S.Description AS ServiceDescription
FROM PoolServiced PS
JOIN Services S ON PS.ServiceID = S.ServiceID
WHERE PS.PoolID = 'P001';


SELECT PS.PoolID, S.Description AS ServiceDescription
FROM PoolServiced PS
JOIN Services S ON PS.ServiceID = S.ServiceID;

SELECT DISTINCT E.EmployeeID, E.EmployeeName
FROM PoolServiced PS
JOIN Employees E ON PS.EmployeeID = E.EmployeeID;

SELECT E.EmployeeID, E.EmployeeName
FROM Employees E
JOIN PoolServiced PS ON E.EmployeeID = PS.EmployeeID
WHERE PS.PoolID = 'P006';

CREATE INDEX IX_PoolID ON Pools(PoolID);
CREATE INDEX IX_ServiceID ON Services(ServiceID);