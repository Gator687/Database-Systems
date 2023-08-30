--database: tempdb
CREATE TABLE table1 
( i int NOT NULL PRIMARY KEY, 
col1 varchar(20) NOT NULL, 
col2 varchar(20) NULL);

INSERT INTO table1 VALUES (1,'First row','First row');
INSERT INTO table1 VALUES (2,NULL,'Second row');
INSERT INTO table1 VALUES (3,'Third row','Third row');

select * from table1
delete from table1

truncate table table1

BEGIN TRANSACTION 
INSERT INTO table1 VALUES (1,'First row','First row');
INSERT INTO table1 VALUES (2,NULL,'Second row');
INSERT INTO table1 VALUES (3,'Third row','Third row');
COMMIT TRANSACTION;

BEGIN TRY 
BEGIN TRAN 
INSERT INTO table1 
VALUES (1,'First row','First row');
INSERT INTO table1 
VALUES (2,NULL,'Second row');
INSERT INTO table1 
VALUES (3,'Third row','Third row');
COMMIT TRAN;
END TRY
BEGIN CATCH
ROLLBACK TRAN
END CATCH

BEGIN TRY
BEGIN TRAN

INSERT INTO table1
VALUES (1,'First row','First row');
INSERT INTO table1
VALUES (2,NULL,'Second row');
INSERT INTO table1
VALUES (3,'Third row','Third row');

COMMIT TRAN;
END TRY
BEGIN CATCH
DECLARE @er nvarchar(max)
SET @er = 'Error: '+ ERROR_MESSAGE();
RAISERROR(@er,14,1);
ROLLBACK TRAN
END CATCH;