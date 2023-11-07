--  What is the percentage of unique product increase in 2021 vs. 2020? The
--  final output contains these fields,
--  unique_products_2020
--  unique_products_2021
--  percentage_chg 

with unique_products as(
Select 
count(distinct case when fiscal_year=2020 then product_code end) as unique_products_2020, 
count(distinct case when fiscal_year=2021 then product_code end) as unique_products_2021 
from fact_sales_monthly) 

select *,
ROUND((unique_products_2021-unique_products_2020)*100 / unique_products_2020,2) as per_diff
from unique_products;