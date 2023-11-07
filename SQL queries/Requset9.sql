-- Which channel helped to bring more gross sales in the fiscal year 2021
-- and the percentage of contribution? The final output contains these fields,
-- channel
-- gross_sales_mln
-- percentage

with CTE as(
SELECT
	dc.channel ,
    fs.fiscal_year,
    Round(SUM(fs.sold_quantity * fg.gross_price)/10000000,2) as gross_sales_amount_mln
FROM
    fact_sales_monthly fs JOIN
    dim_customer AS dc ON fs.customer_code = dc.customer_code
	JOIN
    fact_gross_price AS fg ON fg.product_code = fs.product_code
where fs.fiscal_year=2021
GROUP BY channel
ORDER BY FS.fiscal_year)

select channel,gross_sales_amount_mln,
(sum(gross_sales_amount_mln)/(select SUM(gross_sales_amount_mln) from cte))*100 as pct_contribution
from cte
group by channel
;

