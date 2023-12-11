CREATE TABLE [labCustomer] (
  [name] nvarchar(20),
  [address] nvarchar(20),
  PRIMARY KEY ([name])
);

CREATE TABLE [labTicket] (
  [ticketID] nvarchar(4),
  [name] nvarchar(20),
  PRIMARY KEY ([ticketID]),
  CONSTRAINT [FK_labTicket.name]
    FOREIGN KEY ([name])
      REFERENCES [labCustomer]([name])
);

CREATE TABLE [labFood] (
  [food] nvarchar(20),
  [cost] decimal(6,2),
  PRIMARY KEY ([food])
);

CREATE TABLE [labOrderedFood] (
  [foodID] nvarchar(4),
  [ticketID] nvarchar(4),
  [food] nvarchar(20),
  PRIMARY KEY ([foodID]),
  CONSTRAINT [FK_labOrderedFood.ticketID]
    FOREIGN KEY ([ticketID])
      REFERENCES [labTicket]([ticketID]),
  CONSTRAINT [FK_labOrderedFood.food]
    FOREIGN KEY ([food])
      REFERENCES [labFood]([food])
);

insert into labCustomer (name, address) values ('Archibold', '17 Old Shore Drive');
insert into labCustomer (name, address) values ('Lynette', '17424 Hoard Trail');
insert into labCustomer (name, address) values ('Zacherie', '0 Namekagon Circle');
insert into labCustomer (name, address) values ('Perl', '3563 Westridge Hill');
insert into labCustomer (name, address) values ('Abdul', '6 Harper Circle');
insert into labCustomer (name, address) values ('Brittani', '92 Evergreen Circle');
insert into labCustomer (name, address) values ('Maurita', '5 Golf View Alley');
insert into labCustomer (name, address) values ('Prinz', '19752 Florence Plaza');
insert into labCustomer (name, address) values ('Charleen', '1 Independence Alley');
insert into labCustomer (name, address) values ('Verine', '55 John Wall Parkway');

insert into labFood (food, cost) values ('burger', 8.01);
insert into labFood (food, cost) values ('chicken tenders', 6.23);
insert into labFood (food, cost) values ('wings', 4.34);
insert into labFood (food, cost) values ('chicken nuggets', 7.50);
insert into labFood (food, cost) values ('hoagie', 7.82);
insert into labFood (food, cost) values ('taco', 9.86);
insert into labFood (food, cost) values ('fish', 5.54);
insert into labFood (food, cost) values ('sandwich', 6.06);
insert into labFood (food, cost) values ('hotdog', 5.94);
insert into labFood (food, cost) values ('chilidog', 6.48);
insert into labFood (food, cost) values ('chips', 5.08);
insert into labFood (food, cost) values ('nachos', 5.59);
insert into labFood (food, cost) values ('fries', 4.77);
insert into labFood (food, cost) values ('pizza', 9.36);
insert into labFood (food, cost) values ('burrito', 8.34);

insert into labTicket (ticketID, name) values ('T001', 'Archibold');
insert into labTicket (ticketID, name) values ('T002', 'Lynette');
insert into labTicket (ticketID, name) values ('T003', 'Zacherie');
insert into labTicket (ticketID, name) values ('T004', 'Perl');
insert into labTicket (ticketID, name) values ('T005', 'Abdul');
insert into labTicket (ticketID, name) values ('T006', 'Brittani');
insert into labTicket (ticketID, name) values ('T007', 'Maurita');
insert into labTicket (ticketID, name) values ('T008', 'Prinz');
insert into labTicket (ticketID, name) values ('T009', 'Charleen');
insert into labTicket (ticketID, name) values ('T010', 'Verine');

insert into labOrderedFood (foodID, ticketID, food) values ('f001', 'T001', 'burger');
insert into labOrderedFood (foodID, ticketID, food) values ('f002', 'T001', 'fries');

insert into labOrderedFood (foodID, ticketID, food) values ('f003', 'T002', 'wings');
insert into labOrderedFood (foodID, ticketID, food) values ('f004', 'T002', 'wings');
insert into labOrderedFood (foodID, ticketID, food) values ('f005', 'T002', 'wings');

insert into labOrderedFood (foodID, ticketID, food) values ('f006', 'T003', 'hoagie');

insert into labOrderedFood (foodID, ticketID, food) values ('f007', 'T004', 'burrito');
insert into labOrderedFood (foodID, ticketID, food) values ('f008', 'T004', 'nachos');

insert into labOrderedFood (foodID, ticketID, food) values ('f009', 'T005', 'chicken tenders');
insert into labOrderedFood (foodID, ticketID, food) values ('f010', 'T005', 'fries');

insert into labOrderedFood (foodID, ticketID, food) values ('f011', 'T006', 'chilidog');
insert into labOrderedFood (foodID, ticketID, food) values ('f012', 'T006', 'chilidog');

insert into labOrderedFood (foodID, ticketID, food) values ('f013', 'T007', 'chips');
insert into labOrderedFood (foodID, ticketID, food) values ('f014', 'T007', 'nachos');
insert into labOrderedFood (foodID, ticketID, food) values ('f015', 'T007', 'fries');

insert into labOrderedFood (foodID, ticketID, food) values ('f016', 'T008', 'pizza');
insert into labOrderedFood (foodID, ticketID, food) values ('f017', 'T008', 'wings');

insert into labOrderedFood (foodID, ticketID, food) values ('f018', 'T009', 'fish');
insert into labOrderedFood (foodID, ticketID, food) values ('f019', 'T009', 'chips');

insert into labOrderedFood (foodID, ticketID, food) values ('f020', 'T010', 'hotdog');

select * from labCustomer
select * from labfood
select * from labTicket
select * from labOrderedFood

SELECT lc.name AS CustomerName, lf.food AS OrderedFood
FROM labCustomer lc
JOIN labTicket lt ON lc.name = lt.name
JOIN labOrderedFood lof ON lt.ticketID = lof.ticketID
JOIN labFood lf ON lof.food = lf.food
WHERE lc.name = 'Perl'; -- Replace 'Archibold' with the desired customer's name

SELECT lt.ticketID AS TicketID, lc.name AS CustomerName, lf.food AS OrderedFood
FROM labTicket lt
JOIN labCustomer lc ON lt.name = lc.name
JOIN labOrderedFood lof ON lt.ticketID = lof.ticketID
JOIN labFood lf ON lof.food = lf.food
ORDER BY lt.ticketID;