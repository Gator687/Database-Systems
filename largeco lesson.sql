--build largeco database
--find brand with the most sold
select top(5) * from lgline

select top(5) brand_name, sum(line_qty) as totalsold
from lgline lgl join lgproduct lgp on lgl.prod_sku = lgp.prod_sku
join lgbrand lgb on lgp.brand_id = lgb.brand_id
group by brand_name
order by sum(line_qty) desc

--find customers who bought products sold in by vendors in PA, OH, WV
--step 1 find vendors in PA, OH, WV
select vend_id from lgvendor where vend_state in ('PA', 'OH', 'WV')

select distinct lgc.cust_code, cust_fname, cust_lname
from lgcustomer lgc join lginvoice lgi on lgc.cust_code = lgi.cust_code
join lgline lgl on lgi.inv_num = lgl.inv_num
join lgproduct lgp on lgp.prod_sku = lgl.prod_sku
join lgsupplies lgs on lgl.prod_sku = lgs.prod_sku
where vend_id in (select vend_id from lgvendor where vend_state in ('PA', 'OH', 'WV'))
order by cust_code