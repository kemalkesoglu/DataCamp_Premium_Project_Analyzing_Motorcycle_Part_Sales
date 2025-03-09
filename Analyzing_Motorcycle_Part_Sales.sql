SELECT product_line,
CASE WHEN EXTRACT('month' FROM date) = 6 THEN 'June'
	 WHEN EXTRACT('month' FROM date) = 7 THEN 'July'
	 WHEN EXTRACT('month' FROM date) = 8 THEN 'August'
END AS month,
warehouse,
(SUM(total) - SUM(payment_fee)) AS net_revenue
FROM Sales
WHERE client_type = 'Wholesale'
GROUP BY 1,2,3
ORDER BY 1,2,4 DESC; 
