-- Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. The final output contains these fields,
-- customer_code customer average_discount_percentage.

SELECT 
    f.customer_code,
    d.customer,
    f.pre_invoice_discount_pct as average_discount_percentage
FROM
    fact_pre_invoice_deductions AS f
        JOIN
    dim_customer AS d ON d.customer_code = f.customer_code
WHERE
    f.fiscal_year = 2021
        AND market = 'INdia'
        AND f.pre_invoice_discount_pct > (SELECT 
            AVG(pre_invoice_discount_pct)
        FROM fact_pre_invoice_deductions)
ORDER BY f.pre_invoice_discount_pct DESC
LIMIT 5;
