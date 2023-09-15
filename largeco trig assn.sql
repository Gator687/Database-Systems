--Question 3
Create trigger UpdateProductQOH
on lgline
after insert
AS
BEGIN
    Update lgproduct
    set prod_qoh = prod_qoh - i.line_qty
    From lgproduct p
    Inner join inserted i on p.prod_sku = i.prod_sku
END

select * from lgproduct where prod_sku='9838-FUF'
insert into lgline values(3452, 1, '9838-FUF', 3, 29.99)
select * from lgproduct where prod_sku='9838-FUF'

--Question 4
ALTER TABLE lgemployee
ADD active BIT

UPDATE lgemployee
SET active = 1

Go
Create trigger InsteadOfDeleteEmployee
on lgemployee
instead of delete
AS
BEGIN
    Update lgemployee
    set active = 0
    Where emp_num in (Select emp_num From deleted)
END

INSERT INTO LGEMPLOYEE VALUES (83304, 'TAMARA','MCDONALD', 'T.MCDONA3@LGCOMPANY.COM', '453-9342', '10/20/2008', 'ASSOCIATE', NULL, 400, 1);

select * from lgemployee where emp_num = 83304

delete from lgemployee
where emp_num = 83304

--Bonus
Create table lgneedsordered (
  order_id int identity(1,1) primary key,
  order_date date,
  prod_sku varchar(15),
  prod_min numeric(10,0)
)

Go
Create trigger AfterUpdateProductQOH
on lgproduct
After update
AS
BEGIN
    If update(prod_QOH)
    BEGIN
        Insert into lgneedsordered (order_date, prod_sku, prod_min)
        Select Getdate(), i.prod_sku, i.prod_min
        From inserted i
        Inner join deleted d on i.prod_sku = d.prod_sku
        Where i.prod_QOH < i.prod_min;
    END
END

Update lgproduct
set prod_QOH = 12
Where prod_sku = '1021-MTI'

-- Check the lgneedsordered table for recorded information
SELECT * FROM lgneedsordered;
select * from lgproduct

-- Check the updated prod_QOH value for the product with SKU 'ABC123'
SELECT prod_sku, prod_QOH, prod_MIN
FROM lgproduct
WHERE prod_sku = '1021-MTI';