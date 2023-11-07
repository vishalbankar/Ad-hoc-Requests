-- 3.Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. The final output contains 2 fields, 
-- segment product_count


SELECT segment, COUNT(Distinct product_code)as product_cnt 
FROM gdb023.dim_product
group by segment
order by product_cnt DESC ;