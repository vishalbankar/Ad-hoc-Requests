-- Get the Top 3 products in each division that have a high
-- total_sold_quantity in the fiscal_year 2021? The final output contains these
-- fields,
-- division
-- product_code
-- product
-- total_sold_quantity
-- rank_order

with top_products as (select 
d.division,
d.product_code,
concat(d.product ," (",d.variant, ")") as product,
sum(f.sold_quantity) as sold_qty,
dense_rank() over(partition by division order by sum(f.sold_quantity) desc) as product_ranking
from fact_sales_monthly as f
join dim_product as d 
on f.product_code=d.product_code
where f.fiscal_year=2021
group by division,product,variant)

select *
from top_products where product_ranking<=3;
