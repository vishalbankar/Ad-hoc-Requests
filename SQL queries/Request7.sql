SELECT
	 dc.customer,
    CONCAT(DATE_FORMAT(fs.date, '%b'),' (',YEAR(FS.date),')') AS 'Month',
    fs.fiscal_year,
    Round(SUM(fs.sold_quantity * fg.gross_price),2) as gross_sales_amount
FROM
    fact_sales_monthly fs JOIN
    dim_customer AS dc ON fs.customer_code = dc.customer_code
	JOIN
    fact_gross_price AS fg ON fg.product_code = fs.product_code
WHERE
    dc.customer = 'Atliq Exclusive'
GROUP BY Month;

