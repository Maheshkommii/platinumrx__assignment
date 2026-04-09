SELECT t.*
FROM (
    SELECT 
        c.city,
        cs.cid,
        SUM(cs.amount) - IFNULL(SUM(e.amount),0) AS profit
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e 
        ON cs.cid = e.cid 
        AND MONTH(e.datetime) = 4
    WHERE MONTH(cs.datetime) = 4
    GROUP BY c.city, cs.cid
) t
WHERE profit = (
    SELECT MAX(sub.profit)
    FROM (
        SELECT 
            c.city,
            cs.cid,
            SUM(cs.amount) - IFNULL(SUM(e.amount),0) AS profit
        FROM clinic_sales cs
        JOIN clinics c ON cs.cid = c.cid
        LEFT JOIN expenses e 
            ON cs.cid = e.cid 
            AND MONTH(e.datetime) = 4
        WHERE MONTH(cs.datetime) = 4
        GROUP BY c.city, cs.cid
    ) sub
    WHERE sub.city = t.city
);