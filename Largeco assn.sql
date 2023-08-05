--Question 1
Select *
From lgproduct
Where prod_price > 50
Order by lgproduct.prod_price

--Question 2
Select e.emp_num, e.emp_fname, e.emp_lname, sh.sal_amount As current_salary
From lgemployee As e Join lgsalary_history AS sh
On e.emp_num = sh.emp_num
Where e.dept_num = 300 And sh.sal_end Is null
Order by sh.sal_amount Desc

--Question 3
Select e.emp_num, e.emp_fname, e.emp_lname, sh.sal_amount As starting_salary
From lgemployee As e Join lgsalary_history As sh
On e.emp_num = sh.emp_num
Where sh.sal_from = (Select Min(sal_from) From lgsalary_history Where emp_num = e.emp_num)
Order by e.emp_num

--Question 4
Select l1.inv_num As invoice_number,
  l1.line_num As line_number,
  p1.prod_sku As product_sku,
  p1.prod_descript As product_description,
  p1.brand_id As brand_id
From lgline As l1 Join lgproduct AS p1
On l1.prod_sku = p1.prod_sku Join lgline As l2
On l1.inv_num = l2.inv_num Join lgproduct As p2
On l2.prod_sku = p2.prod_sku
Where
  l1.line_num <> l2.line_num
  And p1.brand_id = p2.brand_id
  And (p1.prod_category = 'Sealer' Or p1.prod_category = 'Top Coat')
  And (p2.prod_category = 'Sealer' Or p2.prod_category = 'Top Coat')
Order by l1.inv_num, l1.line_num

--Questions 5
Select Top 2
e.emp_num As employee_number,
e.emp_fname As employee_first_name,
e.emp_lname As employee_last_name,
e.emp_email As employee_email,
Sum(l.line_qty) As total_units_sold
From lgemployee As e 
Join lginvoice AS i On e.emp_num = i.employee_id
Join lgline As l On i.inv_num = l.inv_num
Join lgproduct As p On l.prod_sku = p.prod_sku
Join lgbrand As b On p.brand_id = b.brand_id
Where b.brand_name = 'BINDER PRIME' And i.inv_date >= '2015-11-01' And i.inv_date <= '2015-12-05'
Group By e.emp_num, e.emp_fname, e.emp_lname, e.emp_email
Order By Sum(l.line_qty) Desc, e.emp_lname

--Question 6
Select c.cust_code, c.cust_fname, c.cust_lname
From lgcustomer As c
Join lginvoice As i On c.cust_code = i.cust_code
Where i.employee_id = 83649
Intersect
Select c.cust_code, c.cust_fname, c.cust_lname
From lgcustomer As c
Join lginvoice AS i On c.cust_code = i.cust_code
Where i.employee_id = 83677
Order by cust_lname, cust_fname

--Question 7
Select c.cust_code, c.cust_fname, c.cust_lname,
Concat(c.cust_street, ', ', c.cust_city, ', ', c.cust_state, ' ', c.cust_zip) AS full_address, 
i.inv_date, Coalesce(i.inv_total, 0) AS invoice_total
From lgcustomer As c Left Join (
Select i.cust_code, i.inv_date, i.inv_total
From lginvoice AS i
Join (Select cust_code, Max(inv_total) AS max_total
From lginvoice
Group By cust_code) As max_inv
On i.cust_code = max_inv.cust_code And i.inv_total = max_inv.max_total) AS i
On c.cust_code = i.cust_code
Where c.cust_state = 'AL'
Order By c.cust_lname, c.cust_fname

--Question 8
Select b.brand_name, b.brand_type, 
Avg(DISTINCT p.prod_price) AS average_price,
Sum(l.line_qty) AS total_units_sold
From lgbrand As b
Join lgproduct As p On b.brand_id = p.brand_id
Left Join lgline As l On p.prod_sku = l.prod_sku
Group By b.brand_name, b.brand_type
Order By b.brand_name

--Question 9
Select b.brand_name, b.brand_type, p.prod_sku, p.prod_descript, p.prod_price
From lgbrand As b
Join lgproduct As p On b.brand_id = p.brand_id
Where b.brand_type <> 'PREMIUM' And p.prod_price > (
Select Max(prod_price)
From lgbrand As premium_b
Join lgproduct As premium_p On premium_b.brand_id = premium_p.brand_id
Where premium_b.brand_type = 'PREMIUM')
Order By b.brand_name, p.prod_sku

--Question 10
Select c.cust_code, c.cust_fname, c.cust_lname, 
Concat(c.cust_street, ', ', c.cust_city, ', ', c.cust_state, ' ', c.cust_zip) As full_address,
i.inv_date,
Coalesce(i.inv_total, 0) As invoice_total
From lgcustomer As c
Left Join (Select i.cust_code, i.inv_date, i.inv_total,
Row_Number() Over (Partition By i.cust_code Order By i.inv_total Desc) As row_num
From lginvoice As i
Join lgcustomer As cust On i.cust_code = cust.cust_code
Where cust.cust_state = 'AL') AS i
On c.cust_code = i.cust_code And i.row_num = 1
Where c.cust_state = 'AL'
Order By c.cust_lname, c.cust_fname