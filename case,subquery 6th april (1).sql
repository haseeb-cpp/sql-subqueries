use northwind;

-- North wind wants to analyze its customers based on their country. However , Instead of listing all country names. they want a simplified categorization:
-- North America (USA, Canada)
-- Europe (UK, Germany, France, Spain, Italy)
-- Asia (Japan, China, India)
-- Other (All remaining countries)

select * from customers;


select
customerid,
companyname,
contactname,
country,
case 
	when country in ('USA','CANADA') then 'North America'
    when country in ('UK','Germany', 'France', 'Spain', 'Italy') then 'Europe'
    when country in ('Japan', 'China', 'India') then 'Asia'
    else 'Others'
    end as continent
from
customers;


select * from products;


select
productname,
unitprice,
case 
	when unitprice < 20 then 'Budget-Friendly'
    when unitprice between 20 and 49 then 'Standard'
    else 'Premium'
    end as price_category
    from
    products;
    
    
    

select * from employees;


select
employeeid,
firstname,
lastname,
title,
case 
	when title like '%Sales%' then 'Sales Team'
    when title like '%Manager%' or title like '%Director%' then 'Management'
    when title like '%Engineer' or title like 'Technician' then 'Technical Staff'
    else 'Other roles'
    end as role_category
    from employees;




select * from customers;



select * from orders;

-- Next class 
select 
c.contactname,
sum(case when count(o.orderid) > 15 then 1 else 0 end) as 'Frequent_buyer',
sum(case when count(o.orderid) between 6 and 14 then 1 else 0 end) as 'Occasional_buyer',
sum(case when count(o.orderid) < 6 then 1 else 0 end) as 'Rare_buyer'
from customers as c
join orders as o
on c.customerid = o.customerid
group by c.contactname;


select
productname,
unitprice,
case 
	when unitprice < 20 then 'Budget-Friendly'
    when unitprice between 20 and 49 then 'Standard'
    else 'Premium'
    end as price_category
    from
    products;


select
*
from
(select
productname,
unitprice,
case 
	when unitprice < 20 then 'Budget-Friendly'
    when unitprice between 20 and 49 then 'Standard'
    else 'Premium'
    end as price_category
    from
    products) as x
    where price_category = 'Budget-Friendly';
    
    

  select
  sum(case when count_orders > 15 then 1 else 0 end) as frequent_buyer,
  sum(case when count_orders between 6 and 14 then 1 else 0 end) as occasional_buyer,
 sum(case when count_orders < 6 then 1 else 0 end) as rare_buyer
    from
    (select 
c.contactname,
count(orderid) as count_orders
from customers as c
join orders as o
on c.customerid = o.customerid
group by c.contactname) as x;


select 
c.contactname,
count(orderid) as count_orders
from customers as c
join orders as o
on c.customerid = o.customerid
group by c.contactname;
    

