use cement;


SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN `Mill TPH` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_TPH,
    SUM(CASE WHEN `Clinker TPH` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Clinker_TPH,
	SUM(CASE WHEN `Gypsum TPH` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Gypsum_TPH,
    SUM(CASE WHEN `DFA TPH` IS NULL THEN 1 ELSE 0 END) AS nulls_in_DFA_TPH,
    SUM(CASE WHEN `WFA TPH` IS NULL THEN 1 ELSE 0 END) AS nulls_in_WFA_TPH,
    SUM(CASE WHEN `Mill KW` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_KW,
    SUM(CASE WHEN `Mill I/L Temp` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_I_L_Temp,
    SUM(CASE WHEN `Mill O/L Temp` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_O_L_Temp,
    SUM(CASE WHEN `Mill O/L BE Amp` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_O_L_BE_Amp,
    SUM(CASE WHEN `Mill Vent Fan RPM` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_Vent_Fan_RPM,
    SUM(CASE WHEN `Mill Vent Fan KW` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_Vent_Fan_KW,
    SUM(CASE WHEN `Mill Vent BF I/L Draft` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_Vent_BF_I_L_Draft,
    SUM(CASE WHEN `Mill Vent BF O/L Draft` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_Vent_BF_O_L_Draft,
    SUM(CASE WHEN `Reject` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Reject,
    SUM(CASE WHEN `Sep RPM` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Sep_RPM,
    SUM(CASE WHEN `Sep KW` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Sep_KW,
    SUM(CASE WHEN `Sep Amp` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Sep_Amp,
    SUM(CASE WHEN `CA Fan RPM` IS NULL THEN 1 ELSE 0 END) AS nulls_in_CA_Fan_RPM,
    SUM(CASE WHEN `CA Fan KW` IS NULL THEN 1 ELSE 0 END) AS nulls_in_CA_Fan_KW,
    SUM(CASE WHEN `Mill Folaphone` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_Folaphone,
    SUM(CASE WHEN `Mill I/L Draft` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_I_L_Draft,
    SUM(CASE WHEN `Mill O/L Draft` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Mill_O_L_Draft,
    SUM(CASE WHEN `Sep. Vent I/L Draft` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Sep_Vent_I_L_Draft,
    SUM(CASE WHEN `Sep. Vent O/L Draft` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Sep_Vent_O_L_Draft,
    SUM(CASE WHEN `Sep.Vent bag filter fan kw` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Sep_Vent_bag_filter_fan_kw,
    SUM(CASE WHEN `Sep.Vent bag filter fan rpm` IS NULL THEN 1 ELSE 0 END) AS nulls_in_Sep_Vent_bag_filter_fan_rpm
FROM rawmaterial;


#To know the data types of columns in a table in SQL, you can use the DESCRIBE or DESC command in most database systems
DESCRIBE rawmaterial;


ALTER TABLE rawmaterial
MODIFY COLUMN `Mill I/L Draft` double;


#Checking Duplicates In Data
SELECT `Date & Time`,`Mill TPH`,`Clinker TPH`,`Gypsum TPH`,`DFA TPH`,`WFA TPH`,`Mill KW`,'Mill I/L Temp','Mill O/L Temp','Mill O/L BE Amp','Mill Vent Fan RPM','Mill Vent Fan KW','Mill Vent BF I/L Draft','Mill Vent BF O/L Draft','Reject','Sep RPM','Sep KW','Sep Amp','CA Fan RPM','CA Fan KW','Mill Folaphone','Mill I/L Draft','Mill O/L Draft','Sep. Vent I/L Draft','Sep. Vent O/L Draft','Sep.Vent bag filter fan kw','Sep.Vent bag filter fan rpm','Residue'
FROM rawmaterial
GROUP BY `Date & Time`,`Mill TPH`,`Clinker TPH`,`Gypsum TPH`,`DFA TPH`,`WFA TPH`,`Mill KW`,'Mill I/L Temp','Mill O/L Temp','Mill O/L BE Amp','Mill Vent Fan RPM','Mill Vent Fan KW','Mill Vent BF I/L Draft','Mill Vent BF O/L Draft','Reject','Sep RPM','Sep KW','Sep Amp','CA Fan RPM','CA Fan KW','Mill Folaphone','Mill I/L Draft','Mill O/L Draft','Sep. Vent I/L Draft','Sep. Vent O/L Draft','Sep.Vent bag filter fan kw','Sep.Vent bag filter fan rpm','Residue'
HAVING COUNT(*) > 1;






  
-- Find outliers and rectifying
#MillTPH


WITH quartiles AS (
    SELECT
        `Mill TPH` AS MillTPH,
        NTILE(4) OVER (ORDER BY `Mill TPH`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN MillTPH END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN MillTPH END) AS q3
    FROM
        quartiles
)
SELECT
    MillTPH,
    CASE
        WHEN MillTPH < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN MillTPH > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    -- Rectification
    SET SQL_SAFE_UPDATES = 0;
    
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `Mill TPH` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `Mill TPH` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `Mill TPH` END) AS q3
    FROM (
        SELECT
             `Mill TPH`,
            NTILE(4) OVER (ORDER BY  `Mill TPH`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `Mill TPH` = CASE
    WHEN  `Mill TPH` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `Mill TPH` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `Mill TPH`
END;






#Clinker
WITH quartiles AS (
    SELECT
        `Clinker TPH` AS ClinkerTPH,
        NTILE(4) OVER (ORDER BY `Clinker TPH`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN ClinkerTPH END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN ClinkerTPH END) AS q3
    FROM
        quartiles
)
SELECT
    ClinkerTPH,
    CASE
        WHEN ClinkerTPH < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN ClinkerTPH > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    

    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `Clinker TPH` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `Clinker TPH` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `Clinker TPH` END) AS q3
    FROM (
        SELECT
             `Clinker TPH`,
            NTILE(4) OVER (ORDER BY  `Clinker TPH`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `Clinker TPH` = CASE
    WHEN  `Clinker TPH` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `Clinker TPH` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `Clinker TPH`
END;






#Gypsum TPH

WITH quartiles AS (
    SELECT
        `Gypsum TPH` AS GypsumTPH,
        NTILE(4) OVER (ORDER BY `Gypsum TPH`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN GypsumTPH END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN GypsumTPH END) AS q3
    FROM
        quartiles
)
SELECT
    GypsumTPH,
    CASE
        WHEN GypsumTPH < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN GypsumTPH > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `Gypsum TPH` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `Gypsum TPH` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `Gypsum TPH` END) AS q3
    FROM (
        SELECT
             `Gypsum TPH`,
            NTILE(4) OVER (ORDER BY  `Gypsum TPH`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `Gypsum TPH` = CASE
    WHEN  `Gypsum TPH` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `Gypsum TPH` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `Gypsum TPH`
END;
    
    
    

#DFA TPH

WITH quartiles AS (
    SELECT
        `DFA TPH` AS DFATPH,
        NTILE(4) OVER (ORDER BY `DFA TPH`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN DFATPH END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN DFATPH END) AS q3
    FROM
        quartiles
)
SELECT
    DFATPH,
    CASE
        WHEN DFATPH < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN DFATPH > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `DFA TPH` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `DFA TPH` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `DFA TPH` END) AS q3
    FROM (
        SELECT
             `DFA TPH`,
            NTILE(4) OVER (ORDER BY  `DFA TPH`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `DFA TPH` = CASE
    WHEN  `DFA TPH` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `DFA TPH` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `DFA TPH`
END;

show tables;
select * from rawmaterial;
    
    
    
    

#WFA TPH

WITH quartiles AS (
    SELECT
        `WFA TPH` AS WFATPH,
        NTILE(4) OVER (ORDER BY `WFA TPH`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN WFATPH END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN WFATPH END) AS q3
    FROM
        quartiles
)
SELECT
    WFATPH,
    CASE
        WHEN WFATPH < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN WFATPH > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `WFA TPH` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `WFA TPH` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `WFA TPH` END) AS q3
    FROM (
        SELECT
             `WFA TPH`,
            NTILE(4) OVER (ORDER BY  `WFA TPH`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `WFA TPH` = CASE
    WHEN  `WFA TPH` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `WFA TPH` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `WFA TPH`
END;
    
        
    
    
    
    
    
#Mill KW

WITH quartiles AS (
    SELECT
        `Mill KW` AS MillKW,
        NTILE(4) OVER (ORDER BY `Mill KW`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN MillKW END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN MillKW END) AS q3
    FROM
        quartiles
)
SELECT
    MillKW,
    CASE
        WHEN MillKW < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN MillKW > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `Mill KW` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `Mill KW` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `Mill KW` END) AS q3
    FROM (
        SELECT
             `Mill KW`,
            NTILE(4) OVER (ORDER BY  `Mill KW`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `Mill KW` = CASE
    WHEN  `Mill KW` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `Mill KW` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `Mill KW`
END;
    
    
    
    
    
    
    
#Mill I/L Temp

WITH quartiles AS (
    SELECT
        `Mill I/L Temp` AS MillI_LTemp,
        NTILE(4) OVER (ORDER BY `Mill I/L Temp`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN MillI_LTemp END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN MillI_LTemp END) AS q3
    FROM
        quartiles
)
SELECT
    MillI_LTemp,
    CASE
        WHEN MillI_LTemp < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN MillI_LTemp > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `Mill I/L Temp` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `Mill I/L Temp` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `Mill I/L Temp` END) AS q3
    FROM (
        SELECT
             `Mill I/L Temp`,
            NTILE(4) OVER (ORDER BY  `Mill I/L Temp`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `Mill I/L Temp` = CASE
    WHEN  `Mill I/L Temp` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `Mill I/L Temp` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `Mill I/L Temp`
END;
    
    
    
    
    
    
    
    
#Mill O/L Temp

WITH quartiles AS (
    SELECT
        `Mill O/L Temp` AS Mill_O_L_Temp,
        NTILE(4) OVER (ORDER BY `Mill O/L Temp`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN Mill_O_L_Temp END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN Mill_O_L_Temp END) AS q3
    FROM
        quartiles
)
SELECT
    Mill_O_L_Temp,
    CASE
        WHEN Mill_O_L_Temp < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN Mill_O_L_Temp > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `Mill O/L Temp` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `Mill O/L Temp` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `Mill O/L Temp` END) AS q3
    FROM (
        SELECT
             `Mill O/L Temp`,
            NTILE(4) OVER (ORDER BY  `Mill O/L Temp`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `Mill O/L Temp` = CASE
    WHEN  `Mill O/L Temp` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `Mill O/L Temp` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `Mill O/L Temp`
END;
    
    
    


    
    
#Mill O/L BE Amp

WITH quartiles AS (
    SELECT
        `Mill O/L BE Amp` AS Mill_O_L_BE_Amp,
        NTILE(4) OVER (ORDER BY `Mill O/L BE Amp`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN Mill_O_L_BE_Amp END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN Mill_O_L_BE_Amp END) AS q3
    FROM
        quartiles
)
SELECT
    Mill_O_L_BE_Amp,
    CASE
        WHEN Mill_O_L_BE_Amp < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN Mill_O_L_BE_Amp > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    

    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `Mill O/L BE Amp` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `Mill O/L BE Amp` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `Mill O/L BE Amp` END) AS q3
    FROM (
        SELECT
             `Mill O/L BE Amp`,
            NTILE(4) OVER (ORDER BY  `Mill O/L BE Amp`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `Mill O/L BE Amp` = CASE
    WHEN  `Mill O/L BE Amp` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `Mill O/L BE Amp` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `Mill O/L BE Amp`
END;
    
    




#Mill Vent Fan RPM

WITH quartiles AS (
    SELECT
        `Mill Vent Fan RPM` AS Mill_Vent_Fan_RPM,
        NTILE(4) OVER (ORDER BY `Mill Vent Fan RPM`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN Mill_Vent_Fan_RPM END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN Mill_Vent_Fan_RPM END) AS q3
    FROM
        quartiles
)
SELECT
    Mill_Vent_Fan_RPM,
    CASE
        WHEN Mill_Vent_Fan_RPM < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN Mill_Vent_Fan_RPM > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    

#DONT HAVE OUTLIERS







#Mill Vent Fan KW

WITH quartiles AS (
    SELECT
        `Mill Vent Fan KW` AS Mill_Vent_Fan_KW,
        NTILE(4) OVER (ORDER BY `Mill Vent Fan KW`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN Mill_Vent_Fan_KW END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN Mill_Vent_Fan_KW END) AS q3
    FROM
        quartiles
)
SELECT
    Mill_Vent_Fan_KW,
    CASE
        WHEN Mill_Vent_Fan_KW < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN Mill_Vent_Fan_KW > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `Mill Vent Fan KW` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `Mill Vent Fan KW` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `Mill Vent Fan KW` END) AS q3
    FROM (
        SELECT
             `Mill Vent Fan KW`,
            NTILE(4) OVER (ORDER BY  `Mill Vent Fan KW`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `Mill Vent Fan KW` = CASE
    WHEN  `Mill Vent Fan KW` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `Mill Vent Fan KW` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `Mill Vent Fan KW`
END;
    
    
    


#Mill Vent BF I/L Draft

WITH quartiles AS (
    SELECT
        `Mill Vent BF I/L Draft` AS Mill_Vent_BF_I_L_Draft,
        NTILE(4) OVER (ORDER BY `Mill Vent BF I/L Draft`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN Mill_Vent_BF_I_L_Draft END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN Mill_Vent_BF_I_L_Draft END) AS q3
    FROM
        quartiles
)
SELECT
    Mill_Vent_BF_I_L_Draft,
    CASE
        WHEN Mill_Vent_BF_I_L_Draft < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN Mill_Vent_BF_I_L_Draft > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `Mill Vent BF I/L Draft` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `Mill Vent BF I/L Draft` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `Mill Vent BF I/L Draft` END) AS q3
    FROM (
        SELECT
             `Mill Vent BF I/L Draft`,
            NTILE(4) OVER (ORDER BY  `Mill Vent BF I/L Draft`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `Mill Vent BF I/L Draft` = CASE
    WHEN  `Mill Vent BF I/L Draft` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `Mill Vent BF I/L Draft` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `Mill Vent BF I/L Draft`
END;
    
    
    
    
    
    #Mill Vent BF O/L Draft

WITH quartiles AS (
    SELECT
        `Mill Vent BF O/L Draft` AS Mill_Vent_BF_O_L_Draft,
        NTILE(4) OVER (ORDER BY `Mill Vent BF O/L Draft`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN Mill_Vent_BF_O_L_Draft END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN Mill_Vent_BF_O_L_Draft END) AS q3
    FROM
        quartiles
)
SELECT
    Mill_Vent_BF_O_L_Draft,
    CASE
        WHEN Mill_Vent_BF_O_L_Draft < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN Mill_Vent_BF_O_L_Draft > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `Mill Vent BF O/L Draft` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `Mill Vent BF O/L Draft` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `Mill Vent BF O/L Draft` END) AS q3
    FROM (
        SELECT
             `Mill Vent BF O/L Draft`,
            NTILE(4) OVER (ORDER BY  `Mill Vent BF O/L Draft`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `Mill Vent BF O/L Draft` = CASE
    WHEN  `Mill Vent BF O/L Draft` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `Mill Vent BF O/L Draft` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `Mill Vent BF O/L Draft`
END;
    










#Reject

WITH quartiles AS (
    SELECT
        `Reject` AS Reject,
        NTILE(4) OVER (ORDER BY `Reject`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN Reject END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN Reject END) AS q3
    FROM
        quartiles
)
SELECT
    Reject,
    CASE
        WHEN Reject < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN Reject > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN `Reject` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN  `Reject` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN  `Reject` END) AS q3
    FROM (
        SELECT
             `Reject`,
            NTILE(4) OVER (ORDER BY  `Reject`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET  `Reject` = CASE
    WHEN  `Reject` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN  `Reject` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE  `Reject`
END;







# Sep RPM

WITH quartiles AS (
    SELECT
        `Sep RPM` AS Sep_RPM,
        NTILE(4) OVER (ORDER BY `Sep RPM`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN Sep_RPM END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN Sep_RPM END) AS q3
    FROM
        quartiles
)
SELECT
    Sep_RPM,
    CASE
        WHEN Sep_RPM < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN Sep_RPM > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  `Sep RPM` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN   `Sep RPM` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN   `Sep RPM` END) AS q3
    FROM (
        SELECT
              `Sep RPM`,
            NTILE(4) OVER (ORDER BY   `Sep RPM`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET   `Sep RPM` = CASE
    WHEN   `Sep RPM` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN   `Sep RPM` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE   `Sep RPM`
END;





# Sep KW

WITH quartiles AS (
    SELECT
        `Sep Amp` AS Sep_Amp,
        NTILE(4) OVER (ORDER BY `Sep Amp`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  Sep_Amp END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN  Sep_Amp END) AS q3
    FROM
        quartiles
)
SELECT
     Sep_Amp,
    CASE
        WHEN  Sep_Amp < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN  Sep_Amp > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  `Sep Amp` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN   `Sep Amp` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN   `Sep Amp` END) AS q3
    FROM (
        SELECT
              `Sep Amp`,
            NTILE(4) OVER (ORDER BY   `Sep Amp`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET   `Sep Amp` = CASE
    WHEN   `Sep Amp` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN   `Sep Amp` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE   `Sep Amp`
END;
    
    
    





# Sep KW

WITH quartiles AS (
    SELECT
        `Sep KW` AS Sep_KW,
        NTILE(4) OVER (ORDER BY `Sep KW`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  Sep_KW END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN  Sep_KW END) AS q3
    FROM
        quartiles
)
SELECT
     Sep_KW,
    CASE
        WHEN  Sep_KW < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN  Sep_KW > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  `Sep KW` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN   `Sep KW` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN   `Sep KW` END) AS q3
    FROM (
        SELECT
              `Sep KW`,
            NTILE(4) OVER (ORDER BY   `Sep KW`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET   `Sep KW` = CASE
    WHEN   `Sep KW` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN   `Sep KW` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE   `Sep KW`
END;
    
    
    
    
    
    
    
# CA Fan RPM

WITH quartiles AS (
    SELECT
        `CA Fan RPM` AS CA_Fan_RPM,
        NTILE(4) OVER (ORDER BY `CA Fan RPM`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  CA_Fan_RPM END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN  CA_Fan_RPM END) AS q3
    FROM
        quartiles
)
SELECT
     CA_Fan_RPM,
    CASE
        WHEN  CA_Fan_RPM < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN  CA_Fan_RPM > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  `CA Fan RPM` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN   `CA Fan RPM` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN   `CA Fan RPM` END) AS q3
    FROM (
        SELECT
              `CA Fan RPM`,
            NTILE(4) OVER (ORDER BY   `CA Fan RPM`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET   `CA Fan RPM` = CASE
    WHEN   `CA Fan RPM` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN   `CA Fan RPM` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE   `CA Fan RPM`
END;






#Mill_I_L_Draft

WITH quartiles AS (
    SELECT
        `Mill I/L Draft` AS Mill_I_L_Draft,
        NTILE(4) OVER (ORDER BY `Mill I/L Draft`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  Mill_I_L_Draft END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN  Mill_I_L_Draft END) AS q3
    FROM
        quartiles
)
SELECT
     Mill_I_L_Draft,
    CASE
        WHEN  Mill_I_L_Draft < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN  Mill_I_L_Draft > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  `Mill I/L Draft` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN   `Mill I/L Draft` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN   `Mill I/L Draft` END) AS q3
    FROM (
        SELECT
              `Mill I/L Draft`,
            NTILE(4) OVER (ORDER BY   `Mill I/L Draft`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET   `Mill I/L Draft` = CASE
    WHEN   `Mill I/L Draft` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN   `Mill I/L Draft` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE   `Mill I/L Draft`
END;
    
    
    
    
    
    
    

#Mill_O_L_Draft

WITH quartiles AS (
    SELECT
        `Mill O/L Draft` AS Mill_O_L_Draft,
        NTILE(4) OVER (ORDER BY `Mill O/L Draft`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  Mill_O_L_Draft END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN  Mill_O_L_Draft END) AS q3
    FROM
        quartiles
)
SELECT
     Mill_O_L_Draft,
    CASE
        WHEN  Mill_O_L_Draft < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN  Mill_O_L_Draft > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  `Mill O/L Draft` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN   `Mill O/L Draft` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN   `Mill O/L Draft` END) AS q3
    FROM (
        SELECT
              `Mill O/L Draft`,
            NTILE(4) OVER (ORDER BY   `Mill O/L Draft`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET   `Mill O/L Draft` = CASE
    WHEN   `Mill O/L Draft` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN   `Mill O/L Draft` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE   `Mill O/L Draft`
END;
    
    
        
        
        

#Sep. Vent I/L Draft

WITH quartiles AS (
    SELECT
        `Sep. Vent I/L Draft` AS Sep_Vent_I_L_Draft,
        NTILE(4) OVER (ORDER BY `Sep. Vent I/L Draft`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  Sep_Vent_I_L_Draft END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN  Sep_Vent_I_L_Draft END) AS q3
    FROM
        quartiles
)
SELECT
     Sep_Vent_I_L_Draft,
    CASE
        WHEN  Sep_Vent_I_L_Draft < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN  Sep_Vent_I_L_Draft > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  `Sep. Vent I/L Draft` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN   `Sep. Vent I/L Draft` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN   `Sep. Vent I/L Draft` END) AS q3
    FROM (
        SELECT
              `Sep. Vent I/L Draft`,
            NTILE(4) OVER (ORDER BY   `Sep. Vent I/L Draft`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET   `Sep. Vent I/L Draft` = CASE
    WHEN   `Sep. Vent I/L Draft` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN   `Sep. Vent I/L Draft` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE   `Sep. Vent I/L Draft`
END;
    
    
    
    
    
    
    
#Sep. Vent O/L Draft

WITH quartiles AS (
    SELECT
        `Sep. Vent O/L Draft` AS Sep_Vent_O_L_Draft,
        NTILE(4) OVER (ORDER BY `Sep. Vent O/L Draft`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  Sep_Vent_O_L_Draft END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN  Sep_Vent_O_L_Draft END) AS q3
    FROM
        quartiles
)
SELECT
     Sep_Vent_O_L_Draft,
    CASE
        WHEN  Sep_Vent_O_L_Draft < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN  Sep_Vent_O_L_Draft > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  `Sep. Vent O/L Draft` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN   `Sep. Vent O/L Draft` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN   `Sep. Vent O/L Draft` END) AS q3
    FROM (
        SELECT
              `Sep. Vent O/L Draft`,
            NTILE(4) OVER (ORDER BY   `Sep. Vent O/L Draft`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET   `Sep. Vent O/L Draft` = CASE
    WHEN   `Sep. Vent O/L Draft` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN   `Sep. Vent O/L Draft` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE   `Sep. Vent O/L Draft`
END;
    
    
        
    
            
            
            
#Sep. Vent O/L Draft

WITH quartiles AS (
    SELECT
        `Sep.Vent bag filter fan kw` AS Sep_Vent_bag_filter_fan_kw,
        NTILE(4) OVER (ORDER BY `Sep.Vent bag filter fan kw`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  Sep_Vent_bag_filter_fan_kw END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN  Sep_Vent_bag_filter_fan_kw END) AS q3
    FROM
        quartiles
)
SELECT
     Sep_Vent_bag_filter_fan_kw,
    CASE
        WHEN  Sep_Vent_bag_filter_fan_kw < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN  Sep_Vent_bag_filter_fan_kw > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  `Sep.Vent bag filter fan kw` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN   `Sep.Vent bag filter fan kw` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN   `Sep.Vent bag filter fan kw` END) AS q3
    FROM (
        SELECT
              `Sep.Vent bag filter fan kw`,
            NTILE(4) OVER (ORDER BY   `Sep.Vent bag filter fan kw`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET   `Sep.Vent bag filter fan kw` = CASE
    WHEN   `Sep.Vent bag filter fan kw` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN   `Sep.Vent bag filter fan kw` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE   `Sep.Vent bag filter fan kw`
END;
    
    
    
    
    
    
#Sep.Vent bag filter fan rpm

WITH quartiles AS (
    SELECT
        `Sep.Vent bag filter fan rpm` AS Sep_Vent_bag_filter_fan_rpm,
        NTILE(4) OVER (ORDER BY `Sep.Vent bag filter fan rpm`) AS quartile
    FROM
        rawmaterial
),
q_values AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  Sep_Vent_bag_filter_fan_rpm END) AS q1,
        MAX(CASE WHEN quartile = 3 THEN  Sep_Vent_bag_filter_fan_rpm END) AS q3
    FROM
        quartiles
)
SELECT
     Sep_Vent_bag_filter_fan_rpm,
    CASE
        WHEN  Sep_Vent_bag_filter_fan_rpm < q1 - 1.5 * (q3 - q1) THEN 'Outlier (below)'
        WHEN  Sep_Vent_bag_filter_fan_rpm > q3 + 1.5 * (q3 - q1) THEN 'Outlier (above)'
        ELSE 'Not an outlier'
    END AS outlier_status,
    q1 AS Q1,
    q3 AS Q3
FROM
    quartiles
CROSS JOIN
    q_values;
    
    
    
    
    
    
    
    
     -- Rectification
     SET SQL_SAFE_UPDATES = 0;
    WITH quartiles AS (
    SELECT
        MAX(CASE WHEN quartile = 1 THEN  `Sep.Vent bag filter fan rpm` END) AS q1,
        MAX(CASE WHEN quartile = 2 THEN   `Sep.Vent bag filter fan rpm` END) AS q2,
        MAX(CASE WHEN quartile = 3 THEN   `Sep.Vent bag filter fan rpm` END) AS q3
    FROM (
        SELECT
              `Sep.Vent bag filter fan rpm`,
            NTILE(4) OVER (ORDER BY   `Sep.Vent bag filter fan rpm`) AS quartile
        FROM
            rawmaterial
    ) AS q
)
UPDATE rawmaterial
SET   `Sep.Vent bag filter fan rpm` = CASE
    WHEN   `Sep.Vent bag filter fan rpm` > (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q3 + 1.5 * (q3 - q1) FROM quartiles)
    WHEN   `Sep.Vent bag filter fan rpm` < (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles) THEN (SELECT q1 - 1.5 * (q3 - q1) FROM quartiles)
    ELSE   `Sep.Vent bag filter fan rpm`
END;    




-- Scaling (Normalization):

-- Min-Max scaling of the salary column to a range of 0 to 1

UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill TPH`) AS min_mill_tph, MAX(`Mill TPH`) AS max_mill_tph
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill TPH` = (rawmaterial.`Mill TPH` - stats.min_mill_tph) / 
                             (stats.max_mill_tph - stats.min_mill_tph);
                             

UPDATE rawmaterial
JOIN (
    SELECT MIN(`Clinker TPH`) AS min_clinker_tph, MAX(`Clinker TPH`) AS max_clinker_tph
    FROM rawmaterial
) AS stats
SET rawmaterial.`Clinker TPH` = (rawmaterial.`Clinker TPH` - stats.min_clinker_tph) / 
                             (stats.max_clinker_tph - stats.min_clinker_tph);
                             
                             
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Gypsum TPH`) AS min_gypsum_tph, MAX(`Gypsum TPH`) AS max_gypsum_tph
    FROM rawmaterial
) AS stats
SET rawmaterial.`Gypsum TPH` = (rawmaterial.`Gypsum TPH` - stats.min_gypsum_tph) / 
                             (stats.max_gypsum_tph - stats.min_gypsum_tph);
                             
  

UPDATE rawmaterial
JOIN (
    SELECT MIN(`DFA TPH`) AS min_dfa_tph, MAX(`DFA TPH`) AS max_dfa_tph
    FROM rawmaterial
) AS stats
SET rawmaterial.`DFA TPH` = (rawmaterial.`DFA TPH` - stats.min_dfa_tph) / 
                             (stats.max_dfa_tph - stats.min_dfa_tph);



UPDATE rawmaterial
JOIN (
    SELECT MIN(`WFA TPH`) AS min_wfa_tph, MAX(`WFA TPH`) AS max_wfa_tph
    FROM rawmaterial
) AS stats
SET rawmaterial.`WFA TPH` = (rawmaterial.`WFA TPH` - stats.min_wfa_tph) / 
                             (stats.max_wfa_tph - stats.min_wfa_tph);
      
      

UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill KW`) AS min_Mill_KW, MAX(`Mill KW`) AS max_Mill_KW
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill KW` = (rawmaterial.`Mill KW` - stats.min_Mill_KW) / 
                             (stats.max_Mill_KW - stats.min_Mill_KW);
      
            
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill I/L Temp`) AS min_Mill_I_L_Temp, MAX(`Mill I/L Temp`) AS max_Mill_I_L_Temp
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill I/L Temp` = (rawmaterial.`Mill I/L Temp` - stats.min_Mill_I_L_Temp) / 
                             (stats.max_Mill_I_L_Temp - stats.min_Mill_I_L_Temp);
      
            
select * from rawmaterial;
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill O/L Temp`) AS min_Mill_O_L_Temp, MAX(`Mill O/L Temp`) AS max_Mill_O_L_Temp
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill O/L Temp` = (rawmaterial.`Mill O/L Temp` - stats.min_Mill_O_L_Temp) / 
                             (stats.max_Mill_O_L_Temp - stats.min_Mill_O_L_Temp);
      
      
                             
                             
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill O/L BE Amp`) AS min_Mill_O_L_BE_Amp, MAX(`Mill O/L BE Amp`) AS max_Mill_O_L_BE_Amp
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill O/L BE Amp` = (rawmaterial.`Mill O/L BE Amp` - stats.min_Mill_O_L_BE_Amp) / 
                             (stats.max_Mill_O_L_BE_Amp - stats.min_Mill_O_L_BE_Amp);
      
     
 UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill Vent Fan RPM`) AS min_Mill_Vent_Fan_RPM, MAX(`Mill Vent Fan RPM`) AS max_Mill_Vent_Fan_RPM
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill Vent Fan RPM` = (rawmaterial.`Mill Vent Fan RPM` - stats.min_Mill_Vent_Fan_RPM) / 
                             (stats.max_Mill_Vent_Fan_RPM - stats.min_Mill_Vent_Fan_RPM);
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill Vent Fan KW`) AS min_Mill_Vent_Fan_KW, MAX(`Mill Vent Fan KW`) AS max_Mill_Vent_Fan_KW
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill Vent Fan KW` = (rawmaterial.`Mill Vent Fan KW` - stats.min_Mill_Vent_Fan_KW) / 
                             (stats.max_Mill_Vent_Fan_KW - stats.min_Mill_Vent_Fan_KW);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`WFA TPH`) AS min_wfa_tph, MAX(`WFA TPH`) AS max_wfa_tph
    FROM rawmaterial
) AS stats
SET rawmaterial.`WFA TPH` = (rawmaterial.`WFA TPH` - stats.min_wfa_tph) / 
                             (stats.max_wfa_tph - stats.min_wfa_tph);
      
            
            
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill Vent BF I/L Draft`) AS min_Mill_Vent_BF_I_L_Draft, MAX(`Mill Vent BF I/L Draft`) AS max_Mill_Vent_BF_I_L_Draft
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill Vent BF I/L Draft` = (rawmaterial.`Mill Vent BF I/L Draft` - stats.min_Mill_Vent_BF_I_L_Draft) / 
                             (stats.max_Mill_Vent_BF_I_L_Draft - stats.min_Mill_Vent_BF_I_L_Draft);
      
                  
                  
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill Vent BF O/L Draft`) AS min_Mill_Vent_BF_O_L_Draft, MAX(`Mill Vent BF O/L Draft`) AS max_Mill_Vent_BF_O_L_Draft
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill Vent BF O/L Draft` = (rawmaterial.`Mill Vent BF O/L Draft` - stats.min_Mill_Vent_BF_O_L_Draft) / 
                             (stats.max_Mill_Vent_BF_O_L_Draft - stats.min_Mill_Vent_BF_O_L_Draft);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Reject`) AS min_Reject, MAX(`Reject`) AS max_Reject
    FROM rawmaterial
) AS stats
SET rawmaterial.`Reject` = (rawmaterial.`Reject` - stats.min_Reject) / 
                             (stats.max_Reject - stats.min_Reject);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Sep RPM`) AS min_Sep_RPM, MAX(`Sep RPM`) AS max_Sep_RPM
    FROM rawmaterial
) AS stats
SET rawmaterial.`Sep RPM` = (rawmaterial.`Sep RPM` - stats.min_Sep_RPM) / 
                             (stats.max_Sep_RPM - stats.min_Sep_RPM);
      
            
            
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Sep KW`) AS min_Sep_KW, MAX(`Sep KW`) AS max_Sep_KW

    FROM rawmaterial
) AS stats
SET rawmaterial.`Sep KW` = (rawmaterial.`Sep KW` - stats.min_Sep_KW) / 
                             (stats.max_Sep_KW - stats.min_Sep_KW);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Sep Amp`) AS min_Sep_Amp, MAX(`Sep Amp`) AS max_Sep_Amp
    FROM rawmaterial
) AS stats
SET rawmaterial.`Sep Amp` = (rawmaterial.`Sep Amp` - stats.min_Sep_Amp) / 
                             (stats.max_Sep_Amp - stats.min_Sep_Amp);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`CA Fan RPM`) AS min_CA_Fan_RPM, MAX(`CA Fan RPM`) AS max_CA_Fan_RPM
    FROM rawmaterial
) AS stats
SET rawmaterial.`CA Fan RPM` = (rawmaterial.`CA Fan RPM` - stats.min_CA_Fan_RPM) / 
                             (stats.max_CA_Fan_RPM - stats.min_CA_Fan_RPM);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`CA Fan KW`) AS min_CA_Fan_KW, MAX(`CA Fan KW`) AS max_CA_Fan_KW
    FROM rawmaterial
) AS stats
SET rawmaterial.`CA Fan KW` = (rawmaterial.`CA Fan KW` - stats.min_CA_Fan_KW) / 
                             (stats.max_CA_Fan_KW - stats.min_CA_Fan_KW);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill Folaphone`) AS min_Mill_Folaphone, MAX(`Mill Folaphone`) AS max_Mill_Folaphone
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill Folaphone` = (rawmaterial.`Mill Folaphone` - stats.min_Mill_Folaphone) / 
                             (stats.max_Mill_Folaphone - stats.min_Mill_Folaphone);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill I/L Draft`) AS min_Mill_I_L_Draft, MAX(`Mill I/L Draft`) AS max_Mill_I_L_Draft
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill I/L Draft` = (rawmaterial.`Mill I/L Draft` - stats.min_Mill_I_L_Draft) / 
                             (stats.max_Mill_I_L_Draft - stats.min_Mill_I_L_Draft);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Mill O/L Draft`) AS min_Mill_O_L_Draft, MAX(`Mill O/L Draft`) AS max_Mill_O_L_Draft
    FROM rawmaterial
) AS stats
SET rawmaterial.`Mill O/L Draft` = (rawmaterial.`Mill O/L Draft` - stats.min_Mill_O_L_Draft) / 
                             (stats.max_Mill_O_L_Draft - stats.min_Mill_O_L_Draft);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Sep. Vent I/L Draft`) AS min_Sep_Vent_I_L_Draft, MAX(`Sep. Vent I/L Draft`) AS max_Sep_Vent_I_L_Draft
    FROM rawmaterial
) AS stats
SET rawmaterial.`Sep. Vent I/L Draft` = (rawmaterial.`Sep. Vent I/L Draft` - stats.min_Sep_Vent_I_L_Draft) / 
                             (stats.max_Sep_Vent_I_L_Draft - stats.min_Sep_Vent_I_L_Draft);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Sep. Vent O/L Draft`) AS min_Sep_Vent_O_L_Draft, MAX(`Sep. Vent O/L Draft`) AS max_Sep_Vent_O_L_Draft
    FROM rawmaterial
) AS stats
SET rawmaterial.`Sep. Vent O/L Draft` = (rawmaterial.`Sep. Vent O/L Draft` - stats.min_Sep_Vent_O_L_Draft) / 
                             (stats.max_Sep_Vent_O_L_Draft - stats.min_Sep_Vent_O_L_Draft);
      
      
      
UPDATE rawmaterial
JOIN (
    SELECT MIN(`Sep.Vent bag filter fan kw`) AS min_wfa_tph, MAX(`Sep.Vent bag filter fan kw`) AS max_wfa_tph
    FROM rawmaterial
) AS stats
SET rawmaterial.`Sep.Vent bag filter fan kw` = (rawmaterial.`Sep.Vent bag filter fan kw` - stats.min_wfa_tph) / 
                             (stats.max_wfa_tph - stats.min_wfa_tph);
      
            
            



UPDATE rawmaterial
JOIN (
    SELECT MIN(`Sep.Vent bag filter fan rpm`) AS min_wfa_tph, MAX(`Sep.Vent bag filter fan rpm`) AS max_wfa_tph
    FROM rawmaterial
) AS stats
SET rawmaterial.`Sep.Vent bag filter fan rpm` = (rawmaterial.`Sep.Vent bag filter fan rpm` - stats.min_wfa_tph) / 
                             (stats.max_wfa_tph - stats.min_wfa_tph);
                             
                             
Select * from rawmaterial ;                            