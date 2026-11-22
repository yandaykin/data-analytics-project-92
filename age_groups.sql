-- Количество покупателей по возрастным группам (16-25, 26-40, 40+)
select
	case 
		when age between 16 and 25 then '16-25'
		when age between 26 and 40 then '26-40'
		when age > 40 then '40+'
	end as age_category,
	count(age) as age_count
from customers
group by age_category
order by age_category;