Select * From lgcustomer
Where cust_city = 'Montgomery' And cust_state = 'AL'

Select cust_city, Count(*) As num_customers
From lgcustomer
Group By cust_city
Order By num_customers Desc

Select *From lgcustomer
Where cust_city Like 'EAST%'

Select cust_city, Count(*) As num_customers
From lgcustomer
Group By cust_city
Having Count(*) > 3

Select prod_sku, prod_descript As product_name, prod_price, prod_qoh,
(prod_price * prod_qoh) As inv_value
From lgproduct

Select cust_fname + ' ' + cust_lname As customer_name
From lgcustomer
Where cust_balance = (Select Max(cust_balance) From lgcustomer)

Select c.cust_fname, c.cust_lname, p.prod_descript
From lgcustomer c
Join lginvoice i On c.cust_code = i.cust_code
Join lgline l On i.inv_num = l.inv_num
Join lgproduct p On l.prod_sku = p.prod_sku
Where Convert(Date, i.inv_date) = '2015-02-01'
Order By c.cust_lname

SELECT prod_sku, prod_price
FROM lgproduct
WHERE prod_price > 30.0;

Update lgproduct
Set prod_price = prod_price - 5.0
Where prod_price > 30.0

Select li.inv_num, Sum(li.line_qty) As total_line_qty
From lgline li
Group By li.inv_num

Select p.prod_descript As product_name, p.prod_sku, p.prod_price
From lgproduct p
Join lgbrand b On p.brand_id = b.brand_id
Where b.brand_type = 'premium'

Select p.prod_descript As product_name, p.prod_sku, Count(*) As product_count
From lgproduct p
Join lgline l On p.prod_sku = l.prod_sku
Join lginvoice i On l.inv_num = i.inv_num
Join lgcustomer c On i.cust_code = c.cust_code
Where c.cust_state = 'AL'
Group By p.prod_descript, p.prod_sku
Order By product_count Desc
