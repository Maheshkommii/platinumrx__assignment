SELECT 
    uid,
    SUM(amount) AS total_spent
FROM clinic_sales
WHERE YEAR(datetime) = 2026
GROUP BY uid
ORDER BY total_spent DESC
LIMIT 10;