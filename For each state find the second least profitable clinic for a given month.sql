SELECT t1.*
FROM (
    SELECT 
        c.state,
        cs.cid,
        SUM(cs.amount) - IFNULL(SUM(e.amount),0) AS profit
    FROM clinic_sales cs
    JOIN clinics c ON cs.cid = c.cid
    LEFT JOIN expenses e 
        ON cs.cid = e.cid 
        AND MONTH(e.datetime) = 4
    WHERE MONTH(cs.datetime) = 4
    GROUP BY c.state, cs.cid
) t1
WHERE 1 = (
    SELECT COUNT(DISTINCT t2.profit)
    FROM (
        SELECT 
            c.state,
            cs.cid,
            SUM(cs.amount) - IFNULL(SUM(e.amount),0) AS profit
        FROM clinic_sales cs
        JOIN clinics c ON cs.cid = c.cid
        LEFT JOIN expenses e 
            ON cs.cid = e.cid 
            AND MONTH(e.datetime) = 4
        WHERE MONTH(cs.datetime) = 4
        GROUP BY c.state, cs.cid
    ) t2
    WHERE t2.state = t1.state
      AND t2.profit < t1.profit
);