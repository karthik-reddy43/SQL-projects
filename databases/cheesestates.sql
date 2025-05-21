SELECT 
    COUNT(DISTINCT State_ANSI) AS State_Count
FROM 
    cheese_production
WHERE 
    Value > 100000000 
    AND Period = 'APR' 
    AND Year = 2023;
