exec usp_titlePub
exec henry.usp_higherAvg
exec henry.uspbooksLessThan

exec henry.usp_bookTypeWarehousePrice 20; --20 use both defaults
exec henry.usp_bookTypeWarehousePrice 20, 'HOR';
exec henry.usp_bookTypeWarehousePrice 20, 'HOR', 2;
exec henry.usp_bookTypeWarehousePrice 20, default, 2;--use default value for desiredType