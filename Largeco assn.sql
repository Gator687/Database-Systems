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
-- Query for customers with invoices completed by employee 83649
SELECT
  c.cust_code,
  c.cust_fname,
  c.cust_lname
FROM
  lgcustomer AS c
JOIN
  lginvoice AS i
ON
  c.cust_code = i.cust_code
WHERE
  i.employee_id = 83649

INTERSECT

-- Query for customers with invoices completed by employee 83677
SELECT
  c.cust_code,
  c.cust_fname,
  c.cust_lname
FROM
  lgcustomer AS c
JOIN
  lginvoice AS i
ON
  c.cust_code = i.cust_code
WHERE
  i.employee_id = 83677

ORDER BY
  cust_lname, cust_fname;

