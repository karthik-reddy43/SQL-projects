SELECT 
    sl.State, 
    COALESCE(cp.Value, 0) AS Cheese_Production_Value
FROM 
    state_lookup sl
LEFT JOIN 
    cheese_production cp ON sl.State_ANSI = cp.State_ANSI 
    AND cp.Year = 2023 
    AND cp.Period = 'APR';
	
	
	

	
	


