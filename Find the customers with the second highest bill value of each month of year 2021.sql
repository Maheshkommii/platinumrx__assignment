

SELECT 
    t1.month,
    t1.user_id,
    t1.bill_id,
    t1.bill_amount
FROM (
    -- Step 1: calculate bill amount per bill
    SELECT 
        b.user_id,
        MONTH(bc.bill_date) AS month,
        bc.bill_id,
        SUM(bc.item_quantity * i.item_rate) AS bill_amount
    FROM booking_commercials bc
    JOIN bookings b 
        ON bc.booking_id = b.booking_id
    JOIN items i 
        ON bc.item_id = i.item_id
    WHERE YEAR(bc.bill_date) = 2026
    GROUP BY b.user_id, MONTH(bc.bill_date), bc.bill_id
) t1
WHERE 1 = (
    -- Step 2: count how many bills are greater than current bill
    SELECT COUNT(DISTINCT t2.bill_amount)
    FROM (
        SELECT 
            MONTH(bc.bill_date) AS month,
            bc.bill_id,
            SUM(bc.item_quantity * i.item_rate) AS bill_amount
        FROM booking_commercials bc
        JOIN items i 
            ON bc.item_id = i.item_id
        WHERE YEAR(bc.bill_date) = 2026
        GROUP BY MONTH(bc.bill_date), bc.bill_id
    ) t2
    WHERE t2.month = t1.month
      AND t2.bill_amount > t1.bill_amount
);