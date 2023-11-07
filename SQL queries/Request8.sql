With Quarterly_sold_qty as(
SELECT 
    date,
    fiscal_year,
    CONCAT('Q',QUARTER(DATE_ADD(date, INTERVAL 4 MONTH))) AS fiscal_quarter,
    sold_quantity
FROM
    gdb023.fact_sales_monthly)
SELECT 
    fiscal_quarter AS 'Quarter',
    SUM(sold_quantity) AS total_sold_quantity
FROM
    Quarterly_sold_qty
WHERE
    fiscal_year = 2020
GROUP BY fiscal_quarter
ORDER BY total_sold_quantity DESC;




