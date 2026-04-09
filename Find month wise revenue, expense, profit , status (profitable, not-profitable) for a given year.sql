SELECT 
    r.month,
    r.revenue,
    IFNULL(e.expense,0) AS expense,
    (r.revenue - IFNULL(e.expense,0)) AS profit,
    CASE 
        WHEN (r.revenue - IFNULL(e.expense,0)) > 0 
        THEN 'Profitable'
        ELSE 'Not Profitable'
    END AS status
FROM (
    SELECT 
        MONTH(datetime) AS month,
        SUM(amount) AS revenue
    FROM clinic_sales
    WHERE YEAR(datetime) = 2026
    GROUP BY MONTH(datetime)
) r
LEFT JOIN (
    SELECT 
        MONTH(datetime) AS month,
        SUM(amount) AS expense
    FROM expenses
    WHERE YEAR(datetime) = 2026
    GROUP BY MONTH(datetime)
) e
ON r.month = e.month;