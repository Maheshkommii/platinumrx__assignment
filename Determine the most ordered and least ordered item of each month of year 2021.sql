

SELECT 
    a.month,
    a.item_id,
    a.total_qty,
    CASE 
        WHEN a.total_qty = b.max_qty THEN 'MOST ORDERED'
        WHEN a.total_qty = b.min_qty THEN 'LEAST ORDERED'
    END AS category
FROM (
    -- Step 1: total quantity per item per month
    SELECT 
        MONTH(bill_date) AS month,
        item_id,
        SUM(item_quantity) AS total_qty
    FROM booking_commercials
    WHERE YEAR(bill_date) = 2026
    GROUP BY MONTH(bill_date), item_id
) a
JOIN (
    -- Step 2: find max and min per month
    SELECT 
        month,
        MAX(total_qty) AS max_qty,
        MIN(total_qty) AS min_qty
    FROM (
        SELECT 
            MONTH(bill_date) AS month,
            item_id,
            SUM(item_quantity) AS total_qty
        FROM booking_commercials
        WHERE YEAR(bill_date) = 2026
        GROUP BY MONTH(bill_date), item_id
    ) t
    GROUP BY month
) b
ON a.month = b.month
WHERE a.total_qty = b.max_qty 
   OR a.total_qty = b.min_qty
ORDER BY a.month;