Create database cement;
use cement;


-- Display all records from the 'rawmaterial' table
Select * from rawmaterial;


            #MEAN
            
-- Calculate the mean (average) of the column

SELECT AVG(`Mill TPH`) AS mean_MillTPH
FROM rawmaterial;

SELECT AVG(`Clinker TPH`) AS mean_Clinker_TPH
FROM rawmaterial;

SELECT AVG(`Gypsum TPH`) AS mean_Gypsum_TPH
FROM rawmaterial;

SELECT AVG(`DFA TPH`) AS mean_DFA_TPH
FROM rawmaterial;

SELECT AVG(`WFA TPH`) AS mean_WFA_TPH
FROM rawmaterial;

SELECT AVG(`Mill KW`) AS mean_Mill_KW
FROM rawmaterial;

SELECT AVG(`Mill I/L Temp`) AS mean_Mill_I_L_Temp
FROM rawmaterial;

SELECT AVG(`Mill O/L Temp`) AS mean_Mill_O_L_Temp
FROM rawmaterial;

SELECT AVG(`Mill_O_L_BE_Amp`) AS mean_Mill_O_L_BE_Amp
FROM rawmaterial;

SELECT AVG(`Mill Vent Fan RPM`) AS mean_Mill_Vent_Fan_RPM
FROM rawmaterial;

SELECT AVG(`Mill Vent Fan KW`) AS mean_Mill_Vent_Fan_KW
FROM rawmaterial;

SELECT AVG(`Mill Vent BF I/L Draft`) AS mean_Mill_Vent_BF_I_L_Draft
FROM rawmaterial;

SELECT AVG(`Mill Vent BF O/L Draft`) AS mean_Mill_Vent_BF_O_L_Draft
FROM rawmaterial;

SELECT AVG(`Reject`) AS mean_Reject
FROM rawmaterial;

SELECT AVG(`Sep RPM`) AS mean_Sep_RPM
FROM rawmaterial;

SELECT AVG(`Sep KW`) AS mean_Sep_KW
FROM rawmaterial;

SELECT AVG(`Sep Amp`) AS mean_Sep_Amp
FROM rawmaterial;

SELECT AVG(`CA Fan RPM`) AS mean_CA_Fan_RPM
FROM rawmaterial;

SELECT AVG(`CA Fan KW`) AS mean_CA_Fan_KW
FROM rawmaterial;

SELECT AVG(`Mill Folaphone`) AS mean_Mill_Folaphone
FROM rawmaterial;


SELECT AVG(`Mill I/L Draft`) AS mean_Mill_I_L_Draft
FROM rawmaterial;

SELECT AVG(`Mill O/L Draft`) AS mean_Mill_O_L_Draft
FROM rawmaterial;

SELECT AVG(`Sep. Vent I/L Draft`) AS mean_Sep_Vent_I_L_Draft
FROM rawmaterial;

SELECT AVG(`Sep. Vent O/L Draft`) AS mean_Sep_Vent_O_L_Draft
FROM rawmaterial;

SELECT AVG(`Sep.Vent bag filter fan kw`) AS mean_Sep_Vent_bag_filter_fan_kw
FROM rawmaterial;

SELECT AVG(`Sep.Vent bag filter fan rpm`) AS mean_Sep_Vent_bag_filter_fan_rpm
FROM rawmaterial;

SELECT AVG(`Residue`) AS mean_Residue
FROM rawmaterial;

				  #MEDIAN

-- Calculate the median of the 'workex' column
SELECT AVG(`Mill TPH`) AS median
FROM (
  SELECT 
    `Mill TPH`,
    ROW_NUMBER() OVER (ORDER BY `Mill TPH`) AS row_num,
    COUNT(*) OVER () AS total_rows  # This line calculates the total number of rows in the rawmaterial table.
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
SELECT AVG(`Clinker TPH`) AS median
FROM (
  SELECT 
    `Clinker TPH`,
    ROW_NUMBER() OVER (ORDER BY `Clinker TPH`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
SELECT AVG(`Gypsum TPH`) AS median
FROM (
  SELECT 
    `Gypsum TPH`,
    ROW_NUMBER() OVER (ORDER BY `Gypsum TPH`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
 SELECT AVG(`DFA TPH`) AS median
FROM (
  SELECT 
    `DFA TPH`,
    ROW_NUMBER() OVER (ORDER BY `DFA TPH`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
  SELECT AVG(`WFA TPH`) AS median
FROM (
  SELECT 
    `WFA TPH`,
    ROW_NUMBER() OVER (ORDER BY `WFA TPH`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Mill KW`) AS median
FROM (
  SELECT 
    `Mill KW`,
    ROW_NUMBER() OVER (ORDER BY `Mill KW`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Mill I/L Temp`) AS median
FROM (
  SELECT 
    `Mill I/L Temp`,
    ROW_NUMBER() OVER (ORDER BY `Mill I/L Temp`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Mill O/L Temp`) AS median
FROM (
  SELECT 
    `Mill O/L Temp`,
    ROW_NUMBER() OVER (ORDER BY `Mill O/L Temp`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Mill O/L BE Amp`) AS median
FROM (
  SELECT 
    `Mill O/L BE Amp`,
    ROW_NUMBER() OVER (ORDER BY `Mill O/L BE Amp`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Mill Vent Fan RPM`) AS median
FROM (
  SELECT 
    `Mill Vent Fan RPM`,
    ROW_NUMBER() OVER (ORDER BY `Mill Vent Fan RPM`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Mill Vent Fan KW`) AS median
FROM (
  SELECT 
    `Mill Vent Fan KW`,
    ROW_NUMBER() OVER (ORDER BY `Mill Vent Fan KW`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Mill Vent BF I/L Draft`) AS median
FROM (
  SELECT 
    `Mill Vent BF I/L Draft`,
    ROW_NUMBER() OVER (ORDER BY `Mill Vent BF I/L Draft`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Mill Vent BF O/L Draft`) AS median
FROM (
  SELECT 
    `Mill Vent BF O/L Draft`,
    ROW_NUMBER() OVER (ORDER BY `Mill Vent BF O/L Draft`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Reject`) AS median
FROM (
  SELECT 
    `Reject`,
    ROW_NUMBER() OVER (ORDER BY `Reject`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Sep RPM`) AS median
FROM (
  SELECT 
    `Sep RPM`,
    ROW_NUMBER() OVER (ORDER BY `Sep RPM`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Sep KW`) AS median
FROM (
  SELECT 
    `Sep KW`,
    ROW_NUMBER() OVER (ORDER BY `Sep KW`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Sep Amp`) AS median
FROM (
  SELECT 
    `Sep Amp`,
    ROW_NUMBER() OVER (ORDER BY `Sep Amp`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`CA Fan RPM`) AS median
FROM (
  SELECT 
    `CA Fan RPM`,
    ROW_NUMBER() OVER (ORDER BY `CA Fan RPM`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`CA Fan KW`) AS median
FROM (
  SELECT 
    `CA Fan KW`,
    ROW_NUMBER() OVER (ORDER BY `CA Fan KW`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Mill Folaphone`) AS median
FROM (
  SELECT 
    `Mill Folaphone`,
    ROW_NUMBER() OVER (ORDER BY `Mill Folaphone`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Mill I/L Draft`) AS median
FROM (
  SELECT 
    `Mill I/L Draft`,
    ROW_NUMBER() OVER (ORDER BY `Mill I/L Draft`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Mill O/L Draft`) AS median
FROM (
  SELECT 
    `Mill O/L Draft`,
    ROW_NUMBER() OVER (ORDER BY `Mill O/L Draft`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Sep. Vent I/L Draft`) AS median
FROM (
  SELECT 
    `Sep. Vent I/L Draft`,
    ROW_NUMBER() OVER (ORDER BY `Sep. Vent I/L Draft`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
  
    SELECT AVG(`Sep. Vent O/L Draft`) AS median
FROM (
  SELECT 
    `Sep. Vent O/L Draft`,
    ROW_NUMBER() OVER (ORDER BY `Sep. Vent O/L Draft`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Sep.Vent bag filter fan kw`) AS median
FROM (
  SELECT 
    `Sep.Vent bag filter fan kw`,
    ROW_NUMBER() OVER (ORDER BY `Sep.Vent bag filter fan kw`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Sep.Vent bag filter fan rpm`) AS median
FROM (
  SELECT 
    `Sep.Vent bag filter fan rpm`,
    ROW_NUMBER() OVER (ORDER BY `Sep.Vent bag filter fan rpm`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  
  
    SELECT AVG(`Residue`) AS median
FROM (
  SELECT 
    `Residue`,
    ROW_NUMBER() OVER (ORDER BY `Residue`) AS row_num,
    COUNT(*) OVER () AS total_rows
  FROM rawmaterial
) AS subquery
WHERE 
  row_num IN ((total_rows + 1) / 2, (total_rows + 2) / 2);
  


  
  
  
#MODE

SELECT `Mill TPH` AS mode_value
FROM rawmaterial
GROUP BY `Mill TPH`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Clinker TPH` AS mode_value
FROM rawmaterial
GROUP BY `Clinker TPH`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Gypsum TPH` AS mode_value
FROM rawmaterial
GROUP BY `Gypsum TPH`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `DFA TPH` AS mode_value
FROM rawmaterial
GROUP BY `DFA TPH`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `WFA TPH` AS mode_value
FROM rawmaterial
GROUP BY `WFA TPH`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Mill KW` AS mode_value
FROM rawmaterial
GROUP BY `Mill KW`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Mill I/L Temp` AS mode_value
FROM rawmaterial
GROUP BY `Mill I/L Temp`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Mill O/L Temp` AS mode_value
FROM rawmaterial
GROUP BY `Mill O/L Temp`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Mill O/L BE Amp` AS mode_value
FROM rawmaterial
GROUP BY `Mill O/L BE Amp`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Mill Vent Fan RPM` AS mode_value
FROM rawmaterial
GROUP BY `Mill Vent Fan RPM`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Mill Vent Fan KW` AS mode_value
FROM rawmaterial
GROUP BY `Mill Vent Fan KW`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Mill Vent BF I/L Draft` AS mode_value
FROM rawmaterial
GROUP BY `Mill Vent BF I/L Draft`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Mill Vent BF O/L Draft` AS mode_value
FROM rawmaterial
GROUP BY `Mill Vent BF O/L Draft`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Reject` AS mode_value
FROM rawmaterial
GROUP BY `Reject`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Sep RPM` AS mode_value
FROM rawmaterial
GROUP BY `Sep RPM`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Sep KW` AS mode_value
FROM rawmaterial
GROUP BY `Sep KW`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Sep Amp` AS mode_value
FROM rawmaterial
GROUP BY `Sep Amp`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `CA Fan RPM` AS mode_value
FROM rawmaterial
GROUP BY `CA Fan RPM`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `CA Fan KW` AS mode_value
FROM rawmaterial
GROUP BY `CA Fan KW`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Mill Folaphone` AS mode_value
FROM rawmaterial
GROUP BY `Mill Folaphone`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Mill I/L Draft` AS mode_value
FROM rawmaterial
GROUP BY `Mill I/L Draft`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Mill O/L Draft` AS mode_value
FROM rawmaterial
GROUP BY `Mill O/L Draft`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Sep. Vent I/L Draft` AS mode_value
FROM rawmaterial
GROUP BY `Sep. Vent I/L Draft`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Sep. Vent O/L Draft` AS mode_value
FROM rawmaterial
GROUP BY `Sep. Vent O/L Draft`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Sep.Vent bag filter fan kw` AS mode_value
FROM rawmaterial
GROUP BY `Sep.Vent bag filter fan kw`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Sep.Vent bag filter fan rpm` AS mode_value
FROM rawmaterial
GROUP BY `Sep.Vent bag filter fan rpm`
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT `Residue` AS mode_value
FROM rawmaterial
GROUP BY `Residue`
ORDER BY COUNT(*) DESC
LIMIT 1;




#Variance 

SELECT VARIANCE(`Mill TPH`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Clinker TPH`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Gypsum TPH`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`DFA TPH`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`WFA TPH`) AS column_variance
FROM rawmaterial;
    
SELECT VARIANCE(`Mill KW`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Mill I/L Temp`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Mill O/L Temp`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Mill O/L BE Amp`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Mill Vent Fan RPM`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Mill Vent Fan KW`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Mill Vent BF I/L Draft`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Mill Vent BF O/L Draft`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Reject`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Sep RPM`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Sep KW`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Sep Amp`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`CA Fan RPM`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`CA Fan KW`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Mill Folaphone`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Mill I/L Draft`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Mill O/L Draft`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Sep. Vent I/L Draft`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Sep. Vent O/L Draft`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Sep.Vent bag filter fan kw`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Sep.Vent bag filter fan rpm`) AS column_variance
FROM rawmaterial;

SELECT VARIANCE(`Residue`) AS column_variance
FROM rawmaterial;

   
    
#Standard Deviation

SELECT STDDEV(`Mill TPH`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Clinker TPH`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Gypsum TPH`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`DFA TPH`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`WFA TPH`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Mill KW`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Mill I/L Temp`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Mill O/L Temp`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Mill O/L BE Amp`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Mill Vent Fan RPM`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Mill Vent Fan KW`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Mill Vent BF I/L Draft`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Mill Vent BF O/L Draft`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Reject`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Sep RPM`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Sep KW`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Sep Amp`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`CA Fan RPM`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`CA Fan KW`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Mill Folaphone`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Mill I/L Draft`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Mill O/L Draft`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Sep. Vent I/L Draft`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Sep. Vent O/L Draft`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Sep.Vent bag filter fan kw`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Sep.Vent bag filter fan rpm`) AS column_stddev
FROM rawmaterial;

SELECT STDDEV(`Residue`) AS column_stddev
FROM rawmaterial;





           
		    #Range
            
SELECT MAX(`Mill TPH`) - MIN(`Mill TPH`) AS column_range
FROM rawmaterial;

SELECT MAX(`Clinker TPH`) - MIN(`Clinker TPH`) AS column_range
FROM rawmaterial;

SELECT MAX(`Gypsum TPH`) - MIN(`Gypsum TPH`) AS column_range
FROM rawmaterial;

SELECT MAX(`DFA TPH`) - MIN(`DFA TPH`) AS column_range
FROM rawmaterial;

SELECT MAX(`WFA TPH`) - MIN(`WFA TPH`) AS column_range
FROM rawmaterial;

SELECT MAX(`Mill KW`) - MIN(`Mill KW`) AS column_range
FROM rawmaterial;

SELECT MAX(`Mill I/L Temp`) - MIN(`Mill I/L Temp`) AS column_range
FROM rawmaterial;

SELECT MAX(`Mill O/L Temp`) - MIN(`Mill O/L Temp`) AS column_range
FROM rawmaterial;

SELECT MAX(`Mill O/L BE Amp`) - MIN(`Mill O/L BE Amp`) AS column_range
FROM rawmaterial;

SELECT MAX(`Mill Vent Fan RPM`) - MIN(`Mill Vent Fan RPM`) AS column_range
FROM rawmaterial;

SELECT MAX(`Mill Vent Fan KW`) - MIN(`Mill Vent Fan KW`) AS column_range
FROM rawmaterial;

SELECT MAX(`Mill Vent BF I/L Draft`) - MIN(`Mill Vent BF I/L Draft`) AS column_range
FROM rawmaterial;

SELECT MAX(`Mill Vent BF O/L Draft`) - MIN(`Mill Vent BF O/L Draft`) AS column_range
FROM rawmaterial;

SELECT MAX(`Reject`) - MIN(`Reject`) AS column_range
FROM rawmaterial;

SELECT MAX(`Sep RPM`) - MIN(`Sep RPM`) AS column_range
FROM rawmaterial;

SELECT MAX(`Sep KW`) - MIN(`Sep KW`) AS column_range
FROM rawmaterial;

SELECT MAX(`Sep Amp`) - MIN(`Sep Amp`) AS column_range
FROM rawmaterial;

SELECT MAX(`CA Fan RPM`) - MIN(`CA Fan RPM`) AS column_range
FROM rawmaterial;

SELECT MAX(`CA Fan KW`) - MIN(`CA Fan KW`) AS column_range
FROM rawmaterial;

SELECT MAX(`Mill Folaphone`) - MIN(`Mill Folaphone`) AS column_range
FROM rawmaterial;

SELECT MAX(`Mill I/L Draft`) - MIN(`Mill I/L Draft`) AS column_range
FROM rawmaterial;

SELECT MAX(`Mill O/L Draft`) - MIN(`Mill O/L Draft`) AS column_range
FROM rawmaterial;

SELECT MAX(`Sep. Vent I/L Draft`) - MIN(`Sep. Vent I/L Draft`) AS column_range
FROM rawmaterial;

SELECT MAX(`Sep. Vent O/L Draft`) - MIN(`Sep. Vent O/L Draft`) AS column_range
FROM rawmaterial;

SELECT MAX(`Sep.Vent bag filter fan kw`) - MIN(`Sep.Vent bag filter fan kw`) AS column_range
FROM rawmaterial;

SELECT MAX(`Sep.Vent bag filter fan rpm`) - MIN(`Sep.Vent bag filter fan rpm`) AS column_range
FROM rawmaterial;

SELECT MAX(`Residue`) - MIN(`Residue`) AS column_range
FROM rawmaterial;






#Skewness

SELECT 
    SUM(POWER(`Mill TPH` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill TPH`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill TPH`) AS avg_val FROM rawmaterial) AS subquery;
    
    
SELECT 
    SUM(POWER(`Clinker TPH` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Clinker TPH`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Clinker TPH`) AS avg_val FROM rawmaterial) AS subquery;
    
SELECT 
    SUM(POWER(`Gypsum TPH` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Gypsum TPH`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Gypsum TPH`) AS avg_val FROM rawmaterial) AS subquery;
    
    
SELECT 
    SUM(POWER(`DFA TPH` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`DFA TPH`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`DFA TPH`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
SELECT 
    SUM(POWER(`WFA TPH` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`WFA TPH`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`WFA TPH`) AS avg_val FROM rawmaterial) AS subquery;      
    
 SELECT 
    SUM(POWER(`Mill KW` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill KW`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill KW`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Mill I/L Temp` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill I/L Temp`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill I/L Temp`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Mill O/L Temp` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill O/L Temp`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill O/L Temp`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Mill O/L BE Amp` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill O/L BE Amp`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill O/L BE Amp`) AS avg_val FROM rawmaterial) AS subquery;  

    
    SELECT 
    SUM(POWER(`Mill Vent Fan RPM` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill Vent Fan RPM`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill Vent Fan RPM`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Mill Vent Fan KW` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill Vent Fan KW`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill Vent Fan KW`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Mill Vent BF I/L Draft` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill Vent BF I/L Draft`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill Vent BF I/L Draft`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Mill Vent BF O/L Draft` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill Vent BF O/L Draft`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill Vent BF O/L Draft`) AS avg_val FROM rawmaterial) AS subquery;  
    
    SELECT 
    SUM(POWER(`Reject` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Reject`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Reject`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Sep RPM` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Sep RPM`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Sep RPM`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Sep KW` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Sep KW`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Sep KW`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Sep Amp` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Sep Amp`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Sep Amp`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`CA Fan RPM` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`CA Fan RPM`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`CA Fan RPM`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`CA Fan KW` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`CA Fan KW`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`CA Fan KW`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Mill Folaphone` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill Folaphone`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill Folaphone`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Mill I/L Draft` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill I/L Draft`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill I/L Draft`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Mill O/L Draft` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Mill O/L Draft`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Mill O/L Draft`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    
    SELECT 
    SUM(POWER(`Sep. Vent I/L Draft` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Sep. Vent I/L Draft`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Sep. Vent I/L Draft`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Sep. Vent O/L Draft` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Sep. Vent O/L Draft`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Sep. Vent O/L Draft`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Sep.Vent bag filter fan kw` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Sep.Vent bag filter fan kw`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Sep.Vent bag filter fan kw`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    SELECT 
    SUM(POWER(`Sep.Vent bag filter fan rpm` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Sep.Vent bag filter fan rpm`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Sep.Vent bag filter fan rpm`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    
SELECT 
    SUM(POWER(`Residue` - avg_val, 3)) / (COUNT(*) * POWER(STDDEV(`Residue`), 3)) AS skewness
FROM 
    rawmaterial,
    (SELECT AVG(`Residue`) AS avg_val FROM rawmaterial) AS subquery;  
    
    
    
 
    
#KURTOSIS

SELECT 
    (SUM(POWER(`Mill TPH` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill TPH`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill TPH`) AS avg_val FROM rawmaterial) AS subquery;    
    
    
    
SELECT 
    (SUM(POWER(`Clinker TPH` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Clinker TPH`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Clinker TPH`) AS avg_val FROM rawmaterial) AS subquery;     
    
    
SELECT 
    (SUM(POWER(`Gypsum TPH` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Gypsum TPH`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Gypsum TPH`) AS avg_val FROM rawmaterial) AS subquery;     
    
    
    
SELECT 
    (SUM(POWER(`DFA TPH` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`DFA TPH`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`DFA TPH`) AS avg_val FROM rawmaterial) AS subquery;     
    
    
    
    SELECT 
    (SUM(POWER(`WFA TPH` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`WFA TPH`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`WFA TPH`) AS avg_val FROM rawmaterial) AS subquery; 
   
   
       SELECT 
    (SUM(POWER(`Mill KW` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill KW`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill KW`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`Mill I/L Temp` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill I/L Temp`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill I/L Temp`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`Mill O/L Temp` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill O/L Temp`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill O/L Temp`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`Mill O/L BE Amp` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill O/L BE Amp`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill O/L BE Amp`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`WFA TPH` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`WFA TPH`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`WFA TPH`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`Mill Vent Fan RPM` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill Vent Fan RPM`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill Vent Fan RPM`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
    
           SELECT 
    (SUM(POWER(`Mill Vent Fan KW` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill Vent Fan KW`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill Vent Fan KW`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
    
           SELECT 
    (SUM(POWER(`Mill Vent BF I/L Draft` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill Vent BF I/L Draft`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill Vent BF I/L Draft`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`Mill Vent BF O/L Draft` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill Vent BF O/L Draft`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill Vent BF O/L Draft`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
    
           SELECT 
    (SUM(POWER(`Reject` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Reject`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Reject`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
    
           SELECT 
    (SUM(POWER(`Sep RPM` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Sep RPM`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Sep RPM`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
    
           SELECT 
    (SUM(POWER(`Sep KW` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Sep KW`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Sep KW`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`Sep Amp` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Sep Amp`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Sep Amp`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`CA Fan RPM` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`CA Fan RPM`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`CA Fan RPM`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`CA Fan KW` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`CA Fan KW`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`CA Fan KW`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`Mill Folaphone` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill Folaphone`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill Folaphone`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`Mill I/L Draft` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill I/L Draft`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill I/L Draft`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
    
           SELECT 
    (SUM(POWER(`Mill O/L Draft` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Mill O/L Draft`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Mill O/L Draft`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`Sep. Vent I/L Draft` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Sep. Vent I/L Draft`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Sep. Vent I/L Draft`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`Sep. Vent O/L Draft` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Sep. Vent O/L Draft`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Sep. Vent O/L Draft`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
           SELECT 
    (SUM(POWER(`Sep.Vent bag filter fan kw` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Sep.Vent bag filter fan kw`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Sep.Vent bag filter fan kw`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
    
           SELECT 
    (SUM(POWER(`Sep.Vent bag filter fan rpm` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Sep.Vent bag filter fan rpm`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Sep.Vent bag filter fan rpm`) AS avg_val FROM rawmaterial) AS subquery; 
    
    
    
           SELECT 
    (SUM(POWER(`Residue` - avg_val, 4)) / (COUNT(*) * POWER(STDDEV(`Residue`), 4))) - 3 AS kurtosis
FROM 
    rawmaterial,
    (SELECT AVG(`Residue`) AS avg_val FROM rawmaterial) AS subquery; 