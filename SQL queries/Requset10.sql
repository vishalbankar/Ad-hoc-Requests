with cte as (select 
d.product,
d.product_code,
d.division,
sum(f.sold_quantity) as sold_qty,
dense_rank() over(partition by division order by sum(f.sold_quantity) desc) as dense_ranking
from fact_sales_monthly as f
join dim_product as d 
on f.product_code=d.product_code
where f.fiscal_year=2021
group by product)

select *
from cte where dense_ranking<=5
;


