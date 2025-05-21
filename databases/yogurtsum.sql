SELECT 
    SUM(yogurt.Value) AS Total_Yogurt_Production
FROM 
    yogurt_production yogurt
WHERE 
    yogurt.Year = 2022 
    AND yogurt.State_ANSI IN (
        SELECT DISTINCT cheese.State_ANSI
        FROM cheese_production cheese
        WHERE cheese.Year = 2023
    );

	
	
SELECT 
    SUM(yp.Value) AS Total_Yogurt_Production
FROM 
    yogurt_production yp
WHERE 
    yp.Year = 2022
AND 
    yp.State_ANSI IN (
        SELECT DISTINCT cp.State_ANSI
        FROM cheese_production cp
        WHERE cp.Year = 2023
    );
