SELECT DISTINCT h.State_ANSI
FROM honey_production h
JOIN milk_production m
ON h.State_ANSI = m.State_ANSI
WHERE h.Year = 2022 AND m.Year = 2022;


SELECT 
    CASE 
        WHEN EXISTS (
            SELECT 1
            FROM honey_production h
            JOIN milk_production m
            ON h.State_ANSI = m.State_ANSI
            WHERE h.Year = 2022 AND m.Year = 2022 AND h.State_ANSI = 35
        ) THEN 'Yes'
        ELSE 'No'
    END AS Produced_Both_Honey_And_Milk;
