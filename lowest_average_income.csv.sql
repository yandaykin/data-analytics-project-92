-- отчет о продажах менеджеров с наименьшим средним доходом
select 
	CONCAT(e.first_name, ' ', e.last_name) AS seller,
	AVG(s.quantity * p.price) as average_income
from sales as s
left join employees as e
	on s.sales_person_id = e.employee_id 
left join products as p 
	on s.product_id = p.product_id 
group by e.employee_id, e.first_name, e.last_name
having AVG(s.quantity * p.price) < (
    SELECT AVG(s.quantity * p.price)
    FROM sales AS s
    JOIN products AS p ON s.product_id = p.product_id
);