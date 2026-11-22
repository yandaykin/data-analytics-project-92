-- Топ 10 продавцов с наибольшей выручкой. 
select
	concat(e.first_name, ' ', e.last_name) AS seller,
    count(s.sales_id) AS operations,
    sum(s.quantity * p.price) as income
from sales as s
left join employees as e
    on s.sales_person_id = e.employee_id
left join products as p
    on s.product_id = p.product_id
group by e.employee_id, e.first_name, e.last_name
order by income desc
limit 10;