SELECT 
    sl.State
FROM 
    state_lookup sl
LEFT JOIN 
    milk_production mp ON sl.State_ANSI = mp.State_ANSI AND mp.Year = 2023
WHERE 
    mp.State_ANSI IS NULL;

	
SELECT 
    COUNT(sl.State) AS Missing_States
FROM 
    state_lookup sl
LEFT JOIN 
    milk_production mp ON sl.State_ANSI = mp.State_ANSI AND mp.Year = 2023
WHERE 
    mp.State_ANSI IS NULL;
	
	
	
SELECT 
    sl.State, sl.State_ANSI
FROM 
    state_lookup sl
WHERE 
    sl.State_ANSI NOT IN (
        SELECT DISTINCT State_ANSI
        FROM milk_production
        WHERE Year = 2023
    );
	
SELECT COUNT(*) AS Missing_States
FROM state_lookup s
LEFT JOIN milk_production m ON s.State_ANSI = m.State_ANSI AND m.Year = 2023
WHERE m.State_ANSI IS NULL;


SELECT count(sl.State_ANSI) AS num 
FROM state_lookup sl 
WHERE sl.State_ANSI NOT IN 
    (SELECT DISTINCT mp.State_ANSI 
     FROM milk_production mp 
     WHERE mp.Year = 2023);

	 
SELECT AVG(cp.Value) AS avg_coffee_production
FROM coffee_production cp
WHERE cp.Year IN (
    SELECT DISTINCT hp.Year
    FROM honey_production hp
    WHERE hp.Value > 1000000
);

