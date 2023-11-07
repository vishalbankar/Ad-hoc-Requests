-- 5.	Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields, 
-- product_code product manufacturing_cost

SELECT
fm.product_code,product, manufacturing_cost
FROM fact_manufacturing_cost as fm
join dim_product as dm
on dm.product_code= fm.product_code
where manufacturing_cost=(select min(manufacturing_cost)  from fact_manufacturing_cost)
or  manufacturing_cost=(select max(manufacturing_cost)  from fact_manufacturing_cost);

