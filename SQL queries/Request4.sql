-- Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields, 
-- Segment product_count_2020 product_count_2021 difference

WITH percentage_change as(
Select 
d.segment,
count(distinct case when f.fiscal_year=2020 then d.product_code end) as product_count_2020,
count(distinct case when f.fiscal_year=2021 then d.product_code end) as product_count_2021
from fact_sales_monthly f
join dim_product d
on f.product_code=d.product_code
group by d.segment)

select *,
round((product_count_2021-product_count_2020)*100/product_count_2020,2) as prec_diff
from percentage_change 
order by prec_diff desc;

