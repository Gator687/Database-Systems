BEGIN TRAN
SELECT FirstName,LastName
FROM Person.Person WITH (SERIALIZABLE)
WHERE BUsinessENtityID = 15

SELECT resource_type, resource_associated_entity_id,
request_mode,request_status
FROM sys.dm_tran_locks dml INNER JOIN
sys.dm_tran_current_transaction dmt
ON dml.request_owner_id = dmt.transaction_id;