

SELECT 
    bc.bill_id,
    SUM(bc.item_quantity * i.item_rate) AS bill_amount
FROM booking_commercials bc
JOIN items i 
    ON bc.item_id = i.item_id
WHERE EXTRACT(MONTH FROM bc.bill_date) = 3
  AND EXTRACT(YEAR FROM bc.bill_date) = 2026
GROUP BY bc.bill_id
HAVING SUM(bc.item_quantity * i.item_rate) > 1000;