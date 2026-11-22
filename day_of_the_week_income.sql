-- Выручка каждого продавца по дням недели, округлённая вниз.
select
	CONCAT(e.first_name, ' ', e.last_name) AS seller,
	TRIM(TO_CHAR(s.sale_date, 'day')) AS day_of_week,
	FLOOR(SUM(s.quantity * p.price)) AS income
from sales as s
left join employees as e
    on s.sales_person_id = e.employee_id
left join products as p
    on s.product_id = p.product_id
group by e.employee_id, e.first_name, e.last_name,
	TRIM(TO_CHAR(s.sale_date, 'day')),
	EXTRACT(ISODOW FROM s.sale_date)
ORDER BY
    EXTRACT(ISODOW FROM s.sale_date),
    seller;