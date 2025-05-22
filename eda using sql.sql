-- Create database
CREATE DATABASE CEMENT;

-- SELECT DATASET FOR USE
USE CEMENT;

-- NUMBERS OF ROWS IN OUR DATASET
SELECT COUNT(*) AS NUM_ROW
FROM cement_automation;

-- NUMBEER OF COLUMNS IN OUR DATASET
SELECT COUNT(*) AS NUM_COL
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'cement_automation';

-- Check Missing Values

SELECT 
    SUM(CASE WHEN Mill_TPH IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Clinker_TPH IS NULL THEN 1 ELSE 0 END) AS missing_column2_count,
	SUM(CASE WHEN Gypsum_TPH IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN DFA_TPH IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN WFA_TPH IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Mill_KW IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Mill_Inlet_Temp IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Mill_Outlet_Temp IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Mill_Outlet_BE_Amp IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Mill_Vent_Fan_RPM IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Mill_Vent_Fan_KW IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Mill_Vent_BF_Inlet_Draft IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Mill_Vent_BF_Outlet_Draft IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Reject IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Sep_RPM IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Sep_KW IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Sep_Amp IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
	SUM(CASE WHEN CA_Fan_RPM IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN CA_Fan_KW IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Mill_Folaphone IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Mill_Inlet_Draft IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Mill_Outlet_Draft IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Sep_Vent_Inlet_Draft IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
	SUM(CASE WHEN Sep_Vent_Outlet_Draft IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Sep_Vent_bag_filter_fan_kw IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Sep_Vent_bag_filter_fan_rpm IS NULL THEN 1 ELSE 0 END) AS missing_column1_count,
    SUM(CASE WHEN Residue IS NULL THEN 1 ELSE 0 END) AS missing_column1_count
    FROM cement_automation;


/* EDA OPERATION */

/* 1st Business Moment: Measure Of Central Tendency  */

/* Mean */
SELECT AVG(Mill_TPH) AS mean_Mill_TPH
FROM cement_automation;

SELECT AVG(Clinker_TPH) AS mean_Clinker_TPH
FROM cement_automation;

SELECT AVG(Gypsum_TPH) AS mean_Gypsum_TPH
FROM cement_automation;

SELECT AVG(DFA_TPH) AS mean_DFA_TPH
FROM cement_automation;

SELECT AVG(WFA_TPH) AS mean_WFA_TPH
FROM cement_automation;

SELECT AVG(Mill_KW) AS mean_Mill_KW
FROM cement_automation;

SELECT AVG(Mill_Inlet_Temp) AS mean_Mill_Inlet_Temp
FROM cement_automation;

SELECT AVG(Mill_Outlet_Temp) AS mean_Mill_Outlet_Temp
FROM cement_automation;

SELECT AVG(Mill_Outlet_BE_Amp) AS mean_Mill_Outlet_BE_Amp
FROM cement_automation;

SELECT AVG(Mill_Vent_Fan_RPM) AS mean_Mill_Vent_Fan_RPM
FROM cement_automation;

SELECT AVG(Mill_Vent_Fan_KW) AS mean_Mill_Vent_Fan_KW
FROM cement_automation;

SELECT AVG(Mill_Vent_BF_Inlet_Draft) AS mean_Mill_Vent_BF_Inlet_Draft
FROM cement_automation;

SELECT AVG(Mill_Vent_BF_Outlet_Draft) AS mean_Mill_Vent_BF_Outlet_Draft
FROM cement_automation;

SELECT AVG(Reject) AS mean_Reject
FROM cement_automation;

SELECT AVG(Sep_RPM) AS mean_Sep_RPM
FROM cement_automation;

SELECT AVG(Sep_KW) AS mean_Sep_KW
FROM cement_automation;

SELECT AVG(Sep_Amp) AS mean_Sep_Amp
FROM cement_automation;

SELECT AVG(CA_Fan_RPM) AS mean_CA_Fan_RPM
FROM cement_automation;

SELECT AVG(CA_Fan_KW) AS mean_CA_Fan_KW
FROM cement_automation;

SELECT AVG(Mill_Folaphone) AS mean_Mill_Folaphone
FROM cement_automation;

SELECT AVG(Mill_Inlet_Draft) AS mean_Mill_Inlet_Draft
FROM cement_automation;

SELECT AVG(Mill_Outlet_Draft) AS mean_Mill_Outlet_Draft
FROM cement_automation;

SELECT AVG(Sep_Vent_Inlet_Draft) AS mean_Sep_Vent_Inlet_Draft
FROM cement_automation;

SELECT AVG(Sep_Vent_Outlet_Draft) AS mean_Sep_Vent_Outlet_Draft
FROM cement_automation;

SELECT AVG(Sep_Vent_bag_filter_fan_kw) AS mean_Sep_Vent_bag_filter_fan_kw
FROM cement_automation;

SELECT AVG(Sep_Vent_bag_filter_fan_rpm) AS mean_Sep_Vent_bag_filter_fan_rpm
FROM cement_automation;

SELECT AVG(Residue) AS mean_Residue
FROM cement_automation;

-- median

SELECT 
    Mill_TPH AS median_Mill_TPH,
    Clinker_TPH AS median_Clinker_TPH,
    Gypsum_TPH AS median_Gypsum_TPH,
    DFA_TPH AS median_DFA_TPH,
    WFA_TPH AS median_WFA_TPH,
    Mill_KW AS median_Mill_KW,
    Mill_Inlet_Temp AS median_Mill_Inlet_Temp,
    Mill_Outlet_Temp AS median_Mill_Outlet_Temp,
    Mill_Outlet_BE_Amp AS median_Mill_Outlet_BE_Amp,
    Mill_Vent_Fan_RPM AS median_Mill_Vent_Fan_RPM,
    Mill_Vent_Fan_KW AS median_Mill_Vent_Fan_KW,
    Mill_Vent_BF_Inlet_Draft AS median_Mill_Vent_BF_Inlet_Draft,
    Mill_Vent_BF_Outlet_Draft AS median_Mill_Vent_BF_Outlet_Draft,
    Reject AS median_Reject,
    Sep_RPM AS median_Sep_RPM,
    Sep_KW AS median_Sep_KW,
    Sep_Amp AS median_Sep_Amp,
    CA_Fan_RPM AS median_CA_Fan_RPM,
    CA_Fan_KW AS median_CA_Fan_KW,
    Mill_Folaphone AS median_Mill_Folaphone,
    Mill_Inlet_Draft AS median_Mill_Inlet_Draft,
    Mill_Outlet_Draft AS median_Mill_Outlet_Draft,
    Sep_Vent_Inlet_Draft AS median_Sep_Vent_Inlet_Draft,
    Sep_Vent_Outlet_Draft AS median_Sep_Vent_Outlet_Draft,
    Sep_Vent_bag_filter_fan_kw AS median_Sep_Vent_bag_filter_fan_kw,
    Sep_Vent_bag_filter_fan_rpm AS median_Sep_Vent_bag_filter_fan_rpm,
    Residue AS median_Residue
FROM (
    SELECT 
        Mill_TPH, Clinker_TPH, Gypsum_TPH, DFA_TPH, WFA_TPH,
        Mill_KW, Mill_Inlet_Temp, Mill_Outlet_Temp, Mill_Outlet_BE_Amp,
        Mill_Vent_Fan_RPM, Mill_Vent_Fan_KW, Mill_Vent_BF_Inlet_Draft,
        Mill_Vent_BF_Outlet_Draft, Reject, Sep_RPM, Sep_KW, Sep_Amp,
        CA_Fan_RPM, CA_Fan_KW, Mill_Folaphone, Mill_Inlet_Draft,
        Mill_Outlet_Draft, Sep_Vent_Inlet_Draft, Sep_Vent_Outlet_Draft,
        Sep_Vent_bag_filter_fan_kw, Sep_Vent_bag_filter_fan_rpm, Residue,
        ROW_NUMBER() OVER (ORDER BY Mill_TPH) AS row_num,
        COUNT(*) OVER () AS total_count
    FROM cement_automation
) AS subquery
WHERE row_num = (total_count + 1) / 2 OR row_num = (total_count + 2) / 2;

-- mode

SELECT 
    (SELECT Mill_TPH FROM cement_automation GROUP BY Mill_TPH ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_TPH,
    (SELECT Clinker_TPH FROM cement_automation GROUP BY Clinker_TPH ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Clinker_TPH,
    (SELECT Gypsum_TPH FROM cement_automation GROUP BY Gypsum_TPH ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Gypsum_TPH,
    (SELECT DFA_TPH FROM cement_automation GROUP BY DFA_TPH ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_DFA_TPH,
    (SELECT WFA_TPH FROM cement_automation GROUP BY WFA_TPH ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_WFA_TPH,
    (SELECT Mill_KW FROM cement_automation GROUP BY Mill_KW ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_KW,
    (SELECT Mill_Inlet_Temp FROM cement_automation GROUP BY Mill_Inlet_Temp ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_Inlet_Temp,
    (SELECT Mill_Outlet_Temp FROM cement_automation GROUP BY Mill_Outlet_Temp ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_Outlet_Temp,
    (SELECT Mill_Outlet_BE_Amp FROM cement_automation GROUP BY Mill_Outlet_BE_Amp ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_Outlet_BE_Amp,
    (SELECT Mill_Vent_Fan_RPM FROM cement_automation GROUP BY Mill_Vent_Fan_RPM ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_Vent_Fan_RPM,
    (SELECT Mill_Vent_Fan_KW FROM cement_automation GROUP BY Mill_Vent_Fan_KW ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_Vent_Fan_KW,
    (SELECT Mill_Vent_BF_Inlet_Draft FROM cement_automation GROUP BY Mill_Vent_BF_Inlet_Draft ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_Vent_BF_Inlet_Draft,
    (SELECT Mill_Vent_BF_Outlet_Draft FROM cement_automation GROUP BY Mill_Vent_BF_Outlet_Draft ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_Vent_BF_Outlet_Draft,
    (SELECT Reject FROM cement_automation GROUP BY Reject ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Reject,
    (SELECT Sep_RPM FROM cement_automation GROUP BY Sep_RPM ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Sep_RPM,
    (SELECT Sep_KW FROM cement_automation GROUP BY Sep_KW ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Sep_KW,
    (SELECT Sep_Amp FROM cement_automation GROUP BY Sep_Amp ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Sep_Amp,
    (SELECT CA_Fan_RPM FROM cement_automation GROUP BY CA_Fan_RPM ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_CA_Fan_RPM,
    (SELECT CA_Fan_KW FROM cement_automation GROUP BY CA_Fan_KW ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_CA_Fan_KW,
    (SELECT Mill_Folaphone FROM cement_automation GROUP BY Mill_Folaphone ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_Folaphone,
    (SELECT Mill_Inlet_Draft FROM cement_automation GROUP BY Mill_Inlet_Draft ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_Inlet_Draft,
    (SELECT Mill_Outlet_Draft FROM cement_automation GROUP BY Mill_Outlet_Draft ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Mill_Outlet_Draft,
    (SELECT Sep_Vent_Inlet_Draft FROM cement_automation GROUP BY Sep_Vent_Inlet_Draft ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Sep_Vent_Inlet_Draft,
    (SELECT Sep_Vent_Outlet_Draft FROM cement_automation GROUP BY Sep_Vent_Outlet_Draft ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Sep_Vent_Outlet_Draft,
    (SELECT Sep_Vent_bag_filter_fan_kw FROM cement_automation GROUP BY Sep_Vent_bag_filter_fan_kw ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Sep_Vent_bag_filter_fan_kw,
    (SELECT Sep_Vent_bag_filter_fan_rpm FROM cement_automation GROUP BY Sep_Vent_bag_filter_fan_rpm ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Sep_Vent_bag_filter_fan_rpm,
    (SELECT Residue FROM cement_automation GROUP BY Residue ORDER BY COUNT(*) DESC LIMIT 1) AS Mode_Residue;
    
    
-- Measure of dispersion
-- variance

SELECT 
    VARIANCE(Mill_TPH) AS Variance_Mill_TPH,
    VARIANCE(Clinker_TPH) AS Variance_Clinker_TPH,
    VARIANCE(Gypsum_TPH) AS Variance_Gypsum_TPH,
    VARIANCE(DFA_TPH) AS Variance_DFA_TPH,
    VARIANCE(WFA_TPH) AS Variance_WFA_TPH,
    VARIANCE(Mill_KW) AS Variance_Mill_KW,
    VARIANCE(Mill_Inlet_Temp) AS Variance_Mill_Inlet_Temp,
    VARIANCE(Mill_Outlet_Temp) AS Variance_Mill_Outlet_Temp,
    VARIANCE(Mill_Outlet_BE_Amp) AS Variance_Mill_Outlet_BE_Amp,
    VARIANCE(Mill_Vent_Fan_RPM) AS Variance_Mill_Vent_Fan_RPM,
    VARIANCE(Mill_Vent_Fan_KW) AS Variance_Mill_Vent_Fan_KW,
    VARIANCE(Mill_Vent_BF_Inlet_Draft) AS Variance_Mill_Vent_BF_Inlet_Draft,
    VARIANCE(Mill_Vent_BF_Outlet_Draft) AS Variance_Mill_Vent_BF_Outlet_Draft,
    VARIANCE(Reject) AS Variance_Reject,
    VARIANCE(Sep_RPM) AS Variance_Sep_RPM,
    VARIANCE(Sep_KW) AS Variance_Sep_KW,
    VARIANCE(Sep_Amp) AS Variance_Sep_Amp,
    VARIANCE(CA_Fan_RPM) AS Variance_CA_Fan_RPM,
    VARIANCE(CA_Fan_KW) AS Variance_CA_Fan_KW,
    VARIANCE(Mill_Folaphone) AS Variance_Mill_Folaphone,
    VARIANCE(Mill_Inlet_Draft) AS Variance_Mill_Inlet_Draft,
    VARIANCE(Mill_Outlet_Draft) AS Variance_Mill_Outlet_Draft,
    VARIANCE(Sep_Vent_Inlet_Draft) AS Variance_Sep_Vent_Inlet_Draft,
    VARIANCE(Sep_Vent_Outlet_Draft) AS Variance_Sep_Vent_Outlet_Draft,
    VARIANCE(Sep_Vent_bag_filter_fan_kw) AS Variance_Sep_Vent_bag_filter_fan_kw,
    VARIANCE(Sep_Vent_bag_filter_fan_rpm) AS Variance_Sep_Vent_bag_filter_fan_rpm,
    VARIANCE(Residue) AS Variance_Residue
FROM 
    cement_automation;
    
    
-- standard deviation

SELECT 
    STDDEV(Mill_TPH) AS StdDev_Mill_TPH,
    STDDEV(Clinker_TPH) AS StdDev_Clinker_TPH,
    STDDEV(Gypsum_TPH) AS StdDev_Gypsum_TPH,
    STDDEV(DFA_TPH) AS StdDev_DFA_TPH,
    STDDEV(WFA_TPH) AS StdDev_WFA_TPH,
    STDDEV(Mill_KW) AS StdDev_Mill_KW,
    STDDEV(Mill_Inlet_Temp) AS StdDev_Mill_Inlet_Temp,
    STDDEV(Mill_Outlet_Temp) AS StdDev_Mill_Outlet_Temp,
    STDDEV(Mill_Outlet_BE_Amp) AS StdDev_Mill_Outlet_BE_Amp,
    STDDEV(Mill_Vent_Fan_RPM) AS StdDev_Mill_Vent_Fan_RPM,
    STDDEV(Mill_Vent_Fan_KW) AS StdDev_Mill_Vent_Fan_KW,
    STDDEV(Mill_Vent_BF_Inlet_Draft) AS StdDev_Mill_Vent_BF_Inlet_Draft,
    STDDEV(Mill_Vent_BF_Outlet_Draft) AS StdDev_Mill_Vent_BF_Outlet_Draft,
    STDDEV(Reject) AS StdDev_Reject,
    STDDEV(Sep_RPM) AS StdDev_Sep_RPM,
    STDDEV(Sep_KW) AS StdDev_Sep_KW,
    STDDEV(Sep_Amp) AS StdDev_Sep_Amp,
    STDDEV(CA_Fan_RPM) AS StdDev_CA_Fan_RPM,
    STDDEV(CA_Fan_KW) AS StdDev_CA_Fan_KW,
    STDDEV(Mill_Folaphone) AS StdDev_Mill_Folaphone,
    STDDEV(Mill_Inlet_Draft) AS StdDev_Mill_Inlet_Draft,
    STDDEV(Mill_Outlet_Draft) AS StdDev_Mill_Outlet_Draft,
    STDDEV(Sep_Vent_Inlet_Draft) AS StdDev_Sep_Vent_Inlet_Draft,
    STDDEV(Sep_Vent_Outlet_Draft) AS StdDev_Sep_Vent_Outlet_Draft,
    STDDEV(Sep_Vent_bag_filter_fan_kw) AS StdDev_Sep_Vent_bag_filter_fan_kw,
    STDDEV(Sep_Vent_bag_filter_fan_rpm) AS StdDev_Sep_Vent_bag_filter_fan_rpm,
    STDDEV(Residue) AS StdDev_Residue
FROM 
    cement_automation;

-- range

SELECT 
    MAX(Mill_TPH) - MIN(Mill_TPH) AS Mill_TPH_Range,
    MAX(Clinker_TPH) - MIN(Clinker_TPH) AS Clinker_TPH_Range,
    MAX(Gypsum_TPH) - MIN(Gypsum_TPH) AS Gypsum_TPH_Range,
    MAX(DFA_TPH) - MIN(DFA_TPH) AS DFA_TPH_Range,
    MAX(WFA_TPH) - MIN(WFA_TPH) AS WFA_TPH_Range,
    MAX(Mill_KW) - MIN(Mill_KW) AS Mill_KW_Range,
    MAX(Mill_Inlet_Temp) - MIN(Mill_Inlet_Temp) AS Mill_Inlet_Temp_Range,
    MAX(Mill_Outlet_Temp) - MIN(Mill_Outlet_Temp) AS Mill_Outlet_Temp_Range,
    MAX(Mill_Outlet_BE_Amp) - MIN(Mill_Outlet_BE_Amp) AS Mill_Outlet_BE_Amp_Range,
    MAX(Mill_Vent_Fan_RPM) - MIN(Mill_Vent_Fan_RPM) AS Mill_Vent_Fan_RPM_Range,
    MAX(Mill_Vent_Fan_KW) - MIN(Mill_Vent_Fan_KW) AS Mill_Vent_Fan_KW_Range,
    MAX(Mill_Vent_BF_Inlet_Draft) - MIN(Mill_Vent_BF_Inlet_Draft) AS Mill_Vent_BF_Inlet_Draft_Range,
    MAX(Mill_Vent_BF_Outlet_Draft) - MIN(Mill_Vent_BF_Outlet_Draft) AS Mill_Vent_BF_Outlet_Draft_Range,
    MAX(Reject) - MIN(Reject) AS Reject_Range,
    MAX(Sep_RPM) - MIN(Sep_RPM) AS Sep_RPM_Range,
    MAX(Sep_KW) - MIN(Sep_KW) AS Sep_KW_Range,
    MAX(Sep_Amp) - MIN(Sep_Amp) AS Sep_Amp_Range,
    MAX(CA_Fan_RPM) - MIN(CA_Fan_RPM) AS CA_Fan_RPM_Range,
    MAX(CA_Fan_KW) - MIN(CA_Fan_KW) AS CA_Fan_KW_Range,
    MAX(Mill_Folaphone) - MIN(Mill_Folaphone) AS Mill_Folaphone_Range,
    MAX(Mill_Inlet_Draft) - MIN(Mill_Inlet_Draft) AS Mill_Inlet_Draft_Range,
    MAX(Mill_Outlet_Draft) - MIN(Mill_Outlet_Draft) AS Mill_Outlet_Draft_Range,
    MAX(Sep_Vent_Inlet_Draft) - MIN(Sep_Vent_Inlet_Draft) AS Sep_Vent_Inlet_Draft_Range,
    MAX(Sep_Vent_Outlet_Draft) - MIN(Sep_Vent_Outlet_Draft) AS Sep_Vent_Outlet_Draft_Range,
    MAX(Sep_Vent_bag_filter_fan_kw) - MIN(Sep_Vent_bag_filter_fan_kw) AS Sep_Vent_bag_filter_fan_kw_Range,
    MAX(Sep_Vent_bag_filter_fan_rpm) - MIN(Sep_Vent_bag_filter_fan_rpm) AS Sep_Vent_bag_filter_fan_rpm_Range,
    MAX(Residue) - MIN(Residue) AS Residue_Range
FROM 
    cement_automation;


/* Third and Fourth Moment Business Decision */
--- skewness and kurkosis 

SELECT
    (
        SUM(POWER(Mill_TPH - (SELECT AVG(Mill_TPH) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_TPH) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_TPH - (SELECT AVG(Mill_TPH) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_TPH) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Clinker_TPH - (SELECT AVG(Clinker_TPH) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Clinker_TPH) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Clinker_TPH - (SELECT AVG(Clinker_TPH) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Clinker_TPH) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Gypsum_TPH - (SELECT AVG(Gypsum_TPH) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Gypsum_TPH) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Gypsum_TPH - (SELECT AVG(Gypsum_TPH) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Gypsum_TPH) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(DFA_TPH - (SELECT AVG(DFA_TPH) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(DFA_TPH) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(DFA_TPH - (SELECT AVG(DFA_TPH) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(DFA_TPH) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(WFA_TPH - (SELECT AVG(WFA_TPH) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(WFA_TPH) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(WFA_TPH - (SELECT AVG(WFA_TPH) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(WFA_TPH) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Mill_KW - (SELECT AVG(Mill_KW) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_KW) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_KW - (SELECT AVG(Mill_KW) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_KW) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Mill_Inlet_Temp - (SELECT AVG(Mill_Inlet_Temp) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Inlet_Temp) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_Inlet_Temp - (SELECT AVG(Mill_Inlet_Temp) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Inlet_Temp) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Mill_Outlet_Temp - (SELECT AVG(Mill_Outlet_Temp) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Outlet_Temp) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_Outlet_Temp - (SELECT AVG(Mill_Outlet_Temp) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Outlet_Temp) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;


SELECT
    (
        SUM(POWER(Mill_Outlet_BE_Amp - (SELECT AVG(Mill_Outlet_BE_Amp) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Outlet_BE_Amp) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_Outlet_BE_Amp - (SELECT AVG(Mill_Outlet_BE_Amp) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Outlet_BE_Amp) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Mill_Vent_Fan_RPM - (SELECT AVG(Mill_Vent_Fan_RPM) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Vent_Fan_RPM) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_Vent_Fan_RPM - (SELECT AVG(Mill_Vent_Fan_RPM) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Vent_Fan_RPM) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Mill_Vent_Fan_KW - (SELECT AVG(Mill_Vent_Fan_KW) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Vent_Fan_KW) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_Vent_Fan_KW - (SELECT AVG(Mill_Vent_Fan_KW) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Vent_Fan_KW) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Mill_Vent_BF_Inlet_Draft - (SELECT AVG(Mill_Vent_BF_Inlet_Draft) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Vent_BF_Inlet_Draft) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_Vent_BF_Inlet_Draft - (SELECT AVG(Mill_Vent_BF_Inlet_Draft) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Vent_BF_Inlet_Draft) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Mill_Vent_BF_Outlet_Draft - (SELECT AVG(Mill_Vent_BF_Outlet_Draft) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Vent_BF_Outlet_Draft) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_Vent_BF_Outlet_Draft - (SELECT AVG(Mill_Vent_BF_Outlet_Draft) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Vent_BF_Outlet_Draft) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Reject - (SELECT AVG(Reject) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Reject) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Reject - (SELECT AVG(Reject) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Reject) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Sep_RPM - (SELECT AVG(Sep_RPM) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_RPM) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Sep_RPM - (SELECT AVG(Sep_RPM) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_RPM) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Sep_KW - (SELECT AVG(Sep_KW) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_KW) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Sep_KW - (SELECT AVG(Sep_KW) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_KW) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Sep_Amp - (SELECT AVG(Sep_Amp) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Amp) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Sep_Amp - (SELECT AVG(Sep_Amp) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Amp) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(CA_Fan_RPM - (SELECT AVG(CA_Fan_RPM) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Vent_Fan_KW) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(CA_Fan_RPM - (SELECT AVG(CA_Fan_RPM) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(CA_Fan_RPM) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(CA_Fan_KW - (SELECT AVG(CA_Fan_KW) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(CA_Fan_KW) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(CA_Fan_KW - (SELECT AVG(CA_Fan_KW) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(CA_Fan_KW) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Mill_Folaphone - (SELECT AVG(Mill_Folaphone) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Folaphone) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_Folaphone - (SELECT AVG(Mill_Folaphone) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Folaphone) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Mill_Inlet_Draft - (SELECT AVG(Mill_Inlet_Draft) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Inlet_Draft) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_Inlet_Draft - (SELECT AVG(Mill_Inlet_Draft) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Inlet_Draft) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Mill_Outlet_Draft - (SELECT AVG(Mill_Outlet_Draft) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Outlet_Draft) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Mill_Outlet_Draft - (SELECT AVG(Mill_Outlet_Draft) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Mill_Outlet_Draft) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Sep_Vent_Inlet_Draft - (SELECT AVG(Sep_Vent_Inlet_Draft) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Vent_Inlet_Draft) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Sep_Vent_Inlet_Draft - (SELECT AVG(Sep_Vent_Inlet_Draft) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Vent_Inlet_Draft) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Sep_Vent_Outlet_Draft - (SELECT AVG(Sep_Vent_Outlet_Draft) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Vent_Outlet_Draft) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Sep_Vent_Outlet_Draft - (SELECT AVG(Sep_Vent_Outlet_Draft) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Vent_Outlet_Draft) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Sep_Vent_bag_filter_fan_kw - (SELECT AVG(Sep_Vent_bag_filter_fan_kw) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Vent_bag_filter_fan_kw) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Sep_Vent_bag_filter_fan_kw - (SELECT AVG(Sep_Vent_bag_filter_fan_kw) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Vent_bag_filter_fan_kw) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Sep_Vent_bag_filter_fan_rpm - (SELECT AVG(Sep_Vent_bag_filter_fan_rpm) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Vent_bag_filter_fan_rpm) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Sep_Vent_bag_filter_fan_rpm - (SELECT AVG(Sep_Vent_bag_filter_fan_rpm) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Sep_Vent_bag_filter_fan_rpm) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;

SELECT
    (
        SUM(POWER(Residue - (SELECT AVG(Residue) FROM cement_automation), 3)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Residue) FROM cement_automation), 3))
    ) AS skewness,
    (
        (SUM(POWER(Residue - (SELECT AVG(Residue) FROM cement_automation), 4)) / 
        (COUNT(*) * POWER((SELECT STDDEV(Residue) FROM cement_automation), 4))) - 3
    ) AS kurtosis
FROM cement_automation;







