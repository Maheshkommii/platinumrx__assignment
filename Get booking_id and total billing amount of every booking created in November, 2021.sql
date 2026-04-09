
SELECT 
    b.booking_id,
    SUM(bc.item_quantity * i.item_rate) AS total_bill
FROM bookings b
JOIN booking_commercials bc 
    ON b.booking_id = bc.booking_id
JOIN items i 
    ON bc.item_id = i.item_id
WHERE EXTRACT(MONTH FROM b.booking_date) = 4
  AND EXTRACT(YEAR FROM b.booking_date) = 2026
GROUP BY b.booking_id;