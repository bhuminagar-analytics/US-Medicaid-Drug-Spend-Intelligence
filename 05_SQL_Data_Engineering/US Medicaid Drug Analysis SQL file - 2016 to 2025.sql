-- STEP 1: SCHEMA & TABLE SETUP
CREATE SCHEMA IF NOT EXISTS raw;
CREATE SCHEMA IF NOT EXISTS staging;
CREATE SCHEMA IF NOT EXISTS analytics;

-- STEP 2A: CREATE RAW TABLE: raw.medicaid_drug_utilization
CREATE TABLE raw.medicaid_drug_utilization (
    utilization_type TEXT,
    state TEXT,
    ndc TEXT,
    labeler_code TEXT,
    product_code TEXT,
    package_size TEXT,
    year INT,
    quarter INT,
    suppression_used BOOLEAN,
    product_name TEXT,
    units_reimbursed NUMERIC,
    number_of_prescriptions NUMERIC,
    total_amount_reimbursed NUMERIC,
    medicaid_amount_reimbursed NUMERIC,
    non_medicaid_amount_reimbursed NUMERIC
);

-- STEP 2B: VERIFY RAW TABLE EXISTS
SELECT *
FROM raw.medicaid_drug_utilization
LIMIT 5;

-- STEP 3: IMPORT U.S MEDICAID DATA (FROM 2016 TO 2025)
-- STEP 3A: IMPORT 2016 DATA
COPY raw.medicaid_drug_utilization
FROM 'F:\Project-2\State Drug Utilization Data - 2016.csv'
DELIMITER ','
CSV HEADER;

-- STEP 3B: IMPORT 2017 DATA
COPY raw.medicaid_drug_utilization
FROM 'F:\Project-2\State Drug Utilization Data - 2017.csv'
DELIMITER ','
CSV HEADER;

-- STEP 3C: IMPORT 2018 DATA
COPY raw.medicaid_drug_utilization
FROM 'F:\Project-2\State Drug Utilization Data - 2018.csv'
DELIMITER ','
CSV HEADER;

-- STEP 3D: IMPORT 2019 DATA
COPY raw.medicaid_drug_utilization
FROM 'F:\Project-2\State Drug Utilization Data - 2019.csv'
DELIMITER ','
CSV HEADER;

-- STEP 3E: IMPORT 2020 DATA
COPY raw.medicaid_drug_utilization
FROM 'F:\Project-2\State Drug Utilization Data - 2020.csv'
DELIMITER ','
CSV HEADER;

-- STEP 3F: IMPORT 2021 DATA
COPY raw.medicaid_drug_utilization
FROM 'F:\Project-2\State Drug Utilization Data - 2021.csv'
DELIMITER ','
CSV HEADER;

-- STEP 3G: IMPORT 2022 DATA
COPY raw.medicaid_drug_utilization
FROM 'F:\Project-2\State Drug Utilization Data - 2022.csv'
DELIMITER ','
CSV HEADER;

-- STEP 3H: IMPORT 2023 DATA
COPY raw.medicaid_drug_utilization
FROM 'F:\Project-2\State Drug Utilization Data - 2023.csv'
DELIMITER ','
CSV HEADER;

-- STEP 3I: IMPORT 2024 DATA
COPY raw.medicaid_drug_utilization
FROM 'F:\Project-2\State Drug Utilization Data - 2024.csv'
DELIMITER ','
CSV HEADER;

-- STEP 3J: IMPORT 2025 DATA
COPY raw.medicaid_drug_utilization
FROM 'F:\Project-2\State Drug Utilization Data - 2025.csv'
DELIMITER ','
CSV HEADER;

-- STEP 4: VERIFY IMPORTED FILES FROM 2016 TO 2025
-- STEP 4A: VERIFY EACH YEAR IS PRESENT
SELECT DISTINCT year
FROM raw.medicaid_drug_utilization
ORDER BY year;

-- STEP 4B: COUNT ROWS PER YEAR
SELECT 
    year,
    COUNT(*) AS total_rows
FROM raw.medicaid_drug_utilization
GROUP BY year
ORDER BY year;

-- STEP 4C: CHECK SUPPRESSED VS NON-SUPPRESSED BY YEAR
SELECT
	year,
	COUNT (*) AS total_rows,
	COUNT (*) FILTER (WHERE suppression_used = TRUE) AS suppressed_rows,
	COUNT (*) FILTER (WHERE suppression_used = FALSE) AS non_suppressed_rows
FROM raw.medicaid_drug_utilization
GROUP BY year
ORDER BY year;

-- STEP 4D: QUICK CHECK OF YEAR-QUARTER COMBINATIONS
SELECT
	year,
	quarter,
	COUNT (*) AS row_count
FROM raw.medicaid_drug_utilization
GROUP BY year, quarter
ORDER BY year, quarter;

-- STEP 4E: CHECK NULL BEHAVIOR BY YEAR
SELECT
	year,
	COUNT (units_reimbursed) AS units_non_null,
	COUNT (number_of_prescriptions) AS prescriptions_non_null,
	COUNT (total_amount_reimbursed) AS amount_non_null
FROM raw.medicaid_drug_utilization
GROUP BY year
ORDER BY year;

-- STEP 4F: TOTAL DATASET SIZE
SELECT COUNT (*)
FROM raw.medicaid_drug_utilization;


-- STEP 5: CREATE CLEAN STAGING VIEW

CREATE VIEW staging.medicaid_clean AS
SELECT
    utilization_type,
    state,
    ndc,
    labeler_code,
    product_code,
    package_size,
    year,
    quarter,
    product_name,
    suppression_used,

    -- Clean numeric fields (ignore suppressed rows)
    CASE 
        WHEN suppression_used = FALSE THEN units_reimbursed
        ELSE NULL
    END AS units_reimbursed,

    CASE 
        WHEN suppression_used = FALSE THEN number_of_prescriptions
        ELSE NULL
    END AS number_of_prescriptions,

    CASE 
        WHEN suppression_used = FALSE THEN total_amount_reimbursed
        ELSE NULL
    END AS total_amount_reimbursed,

    CASE 
        WHEN suppression_used = FALSE THEN medicaid_amount_reimbursed
        ELSE NULL
    END AS medicaid_amount_reimbursed,

    CASE 
        WHEN suppression_used = FALSE THEN non_medicaid_amount_reimbursed
        ELSE NULL
    END AS non_medicaid_amount_reimbursed

FROM raw.medicaid_drug_utilization;

-- STEP 6: VALIDATE VIEW
-- STEP 6A: VALIDATE VIEW's TOTAL DATASET SIZE
SELECT COUNT(*) 
FROM staging.medicaid_clean;

-- STEP 6B: CHECK TOTAL ROWS & NON_NULL VALUES FROM VIEW
SELECT 
    COUNT(*) AS total_rows,
    COUNT(units_reimbursed) AS units_non_null,
    COUNT(number_of_prescriptions) AS prescriptions_non_null,
    COUNT(total_amount_reimbursed) AS amount_non_null
FROM staging.medicaid_clean;
-- STEP 7: FEATURE ENGINEERING

CREATE VIEW staging.medicaid_enriched AS
SELECT
    *,

    -- Cost per prescription
    CASE 
        WHEN number_of_prescriptions > 0 
        THEN total_amount_reimbursed / number_of_prescriptions
        ELSE NULL
    END AS cost_per_prescription,

    -- Cost per unit
    CASE 
        WHEN units_reimbursed > 0 
        THEN total_amount_reimbursed / units_reimbursed
        ELSE NULL
    END AS cost_per_unit,

    -- Units per prescription (usage intensity)
    CASE 
        WHEN number_of_prescriptions > 0 
        THEN units_reimbursed / number_of_prescriptions
        ELSE NULL
    END AS units_per_prescription,

    -- Medicaid dependency ratio
    CASE 
        WHEN total_amount_reimbursed > 0 
        THEN medicaid_amount_reimbursed / total_amount_reimbursed
        ELSE NULL
    END AS medicaid_dependency_ratio

FROM staging.medicaid_clean;

-- STEP 8: VALIDATE FEATURES
SELECT *
FROM staging.medicaid_enriched
LIMIT 10;

-- STEP 9: KPI / AGGREGATION LAYER
-- STEP 9A1: YEAR-LEVEL KPI VIEW

CREATE VIEW analytics.kpi_yearly AS
SELECT
    year,
    COUNT(*) AS row_count,
    COUNT(*) FILTER (WHERE suppression_used = TRUE) AS suppressed_rows,
    COUNT(*) FILTER (WHERE suppression_used = FALSE) AS non_suppressed_rows,

    SUM(total_amount_reimbursed) AS total_spend,
    SUM(medicaid_amount_reimbursed) AS medicaid_spend,
    SUM(non_medicaid_amount_reimbursed) AS non_medicaid_spend,
    SUM(number_of_prescriptions) AS total_prescriptions,
    SUM(units_reimbursed) AS total_units,

    AVG(cost_per_prescription) AS avg_cost_per_prescription,
    AVG(cost_per_unit) AS avg_cost_per_unit,
    AVG(units_per_prescription) AS avg_units_per_prescription,
    AVG(medicaid_dependency_ratio) AS avg_medicaid_dependency_ratio

FROM staging.medicaid_enriched
GROUP BY year
ORDER BY year;

-- STEP 9A2: VALIDATION OF YEAR-LEVEL KPI VIEW
SELECT *
FROM analytics.kpi_yearly;


-- STEP 9B1: STATE-LEVEL KPI VIEW

CREATE VIEW analytics.kpi_state AS
SELECT
    state,
    COUNT(*) AS row_count,
    COUNT(*) FILTER (WHERE suppression_used = TRUE) AS suppressed_rows,
    COUNT(*) FILTER (WHERE suppression_used = FALSE) AS non_suppressed_rows,

    SUM(total_amount_reimbursed) AS total_spend,
    SUM(medicaid_amount_reimbursed) AS medicaid_spend,
    SUM(non_medicaid_amount_reimbursed) AS non_medicaid_spend,
    SUM(number_of_prescriptions) AS total_prescriptions,
    SUM(units_reimbursed) AS total_units,

    AVG(cost_per_prescription) AS avg_cost_per_prescription,
    AVG(cost_per_unit) AS avg_cost_per_unit,
    AVG(units_per_prescription) AS avg_units_per_prescription,
    AVG(medicaid_dependency_ratio) AS avg_medicaid_dependency_ratio

FROM staging.medicaid_enriched
GROUP BY state
ORDER BY total_spend DESC;

-- STEP 9B2: VALIDATION OF STATE-LEVEL KPI VIEW
SELECT *
FROM analytics.kpi_state;

-- STEP 9C1: STATE × YEAR KPI VIEW

CREATE VIEW analytics.kpi_state_year AS
SELECT
    state,
    year,
    COUNT(*) AS row_count,
    COUNT(*) FILTER (WHERE suppression_used = TRUE) AS suppressed_rows,
    COUNT(*) FILTER (WHERE suppression_used = FALSE) AS non_suppressed_rows,

    SUM(total_amount_reimbursed) AS total_spend,
    SUM(medicaid_amount_reimbursed) AS medicaid_spend,
    SUM(non_medicaid_amount_reimbursed) AS non_medicaid_spend,
    SUM(number_of_prescriptions) AS total_prescriptions,
    SUM(units_reimbursed) AS total_units,

    AVG(cost_per_prescription) AS avg_cost_per_prescription,
    AVG(cost_per_unit) AS avg_cost_per_unit,
    AVG(units_per_prescription) AS avg_units_per_prescription,
    AVG(medicaid_dependency_ratio) AS avg_medicaid_dependency_ratio

FROM staging.medicaid_enriched
GROUP BY state, year
ORDER BY state, year;

-- STEP 9C2: VALIDATION OF STATE × YEAR KPI VIEW

SELECT *
FROM analytics.kpi_state_year
LIMIT 20;

-- STEP 9C3: COUNT TOTAL ROWS
SELECT
	COUNT (*) AS total_ROWS
FROM analytics.kpi_state_year;

-- STEP 9D1: DRUG-LEVEL KPI VIEW

CREATE OR REPLACE VIEW analytics.kpi_drug AS
SELECT
    product_name,
    COUNT(*) AS row_count,
    COUNT(*) FILTER (WHERE suppression_used = TRUE) AS suppressed_rows,
    COUNT(*) FILTER (WHERE suppression_used = FALSE) AS non_suppressed_rows,

    SUM(total_amount_reimbursed) AS total_spend,
    SUM(number_of_prescriptions) AS total_prescriptions,
    SUM(units_reimbursed) AS total_units,

    AVG(cost_per_prescription) AS avg_cost_per_prescription,
    AVG(cost_per_unit) AS avg_cost_per_unit,
    AVG(units_per_prescription) AS avg_units_per_prescription,
    AVG(medicaid_dependency_ratio) AS avg_medicaid_dependency_ratio

FROM staging.medicaid_enriched
WHERE suppression_used = FALSE
GROUP BY product_name
ORDER BY total_spend DESC;

-- STEP 9D2: VALIDATION OF DRUG LEVEL KPI VIEW
SELECT *
FROM analytics.kpi_drug
LIMIT 20;

-- STEP 9D3: VERIFY TOTAL_DRUGS & NON_NULL_SPEND FROM DRUG LEVEL KPI VIEW
SELECT 
    COUNT(*) AS total_drugs,
    COUNT(total_spend) AS non_null_spend
FROM analytics.kpi_drug;

-- STEP 9D4: VERIFY REAL_DRUG_NAMES & ACTUAL_NUMBERS (NOT_NULL) FROM DRUG LEVEL KPI VIEW
SELECT *
FROM analytics.kpi_drug
ORDER BY total_spend DESC
LIMIT 5;

-- STEP 9E1: DRUG SHARE (PARETO READY)
CREATE VIEW analytics.kpi_drug_share AS
SELECT
	*,

	-- Spend share (% of total spend)
	total_spend / SUM(total_spend) OVER () AS spend_share,

	-- Prescription share (% of total prescriptions)
	total_prescriptions / SUM(total_prescriptions) OVER () AS prescription_share

FROM analytics.kpi_drug;

-- STEP 9E2: VALIDATION OF DRUG SHARE (PARETO CHART)
SELECT *
FROM analytics.kpi_drug_share
ORDER BY total_spend DESC
LIMIT 10;

-- STEP 9F1: PARETO ANALYSIS (CUMULATIVE %)

CREATE VIEW analytics.kpi_drug_pareto AS
SELECT
    *,
    
    -- Cumulative spend %
    SUM(spend_share) OVER (
        ORDER BY total_spend DESC
    ) AS cumulative_spend_share

FROM analytics.kpi_drug_share;

-- STEP 9F2: VALIDATION OF PARETO ANALYSIS
SELECT 
    product_name,
    total_spend,
    spend_share,
    cumulative_spend_share
FROM analytics.kpi_drug_pareto
ORDER BY total_spend DESC
LIMIT 20;

-- STEP 9F3: DRUGS CONTRIBUTING TO 80% OF TOTAL SPEND
SELECT *
FROM analytics.kpi_drug_pareto
WHERE cumulative_spend_share <= 0.80;

-- STEP 9G1: FFSU vs MCOU KPI VIEW

CREATE VIEW analytics.kpi_utilization_type AS
SELECT
    utilization_type,
    
    COUNT(*) AS row_count,
    COUNT(*) FILTER (WHERE suppression_used = TRUE) AS suppressed_rows,
    COUNT(*) FILTER (WHERE suppression_used = FALSE) AS non_suppressed_rows,

    SUM(total_amount_reimbursed) AS total_spend,
    SUM(medicaid_amount_reimbursed) AS medicaid_spend,
    SUM(non_medicaid_amount_reimbursed) AS non_medicaid_spend,
    SUM(number_of_prescriptions) AS total_prescriptions,
    SUM(units_reimbursed) AS total_units,

    AVG(cost_per_prescription) AS avg_cost_per_prescription,
    AVG(cost_per_unit) AS avg_cost_per_unit,
    AVG(units_per_prescription) AS avg_units_per_prescription,
    AVG(medicaid_dependency_ratio) AS avg_medicaid_dependency_ratio

FROM staging.medicaid_enriched
GROUP BY utilization_type
ORDER BY total_spend DESC;

-- STEP 9G2: VALIDATION OF FFSU VS MCOU KPI
SELECT *
FROM analytics.kpi_utilization_type;

-- STEP 10: ANALYSIS FOR SUPPRESSED DRUGS

-- STEP 10A1: SUPPRESSION BY YEAR
CREATE VIEW analytics.kpi_suppression_year AS
SELECT
    year,
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE suppression_used = TRUE) AS suppressed_rows,
    COUNT(*) FILTER (WHERE suppression_used = FALSE) AS non_suppressed_rows,
    COUNT(*) FILTER (WHERE suppression_used = TRUE)::NUMERIC / COUNT(*) AS suppression_rate
FROM staging.medicaid_clean
GROUP BY year
ORDER BY year;

-- STEP 10A2: VALIDATION OF SUPPRESSION BY YEAR
SELECT *
FROM analytics.kpi_suppression_year;

-- STEP 10B1: SUPPRESSION BY STATE

CREATE VIEW analytics.kpi_suppression_state AS
SELECT
    state,
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE suppression_used = TRUE) AS suppressed_rows,
    COUNT(*) FILTER (WHERE suppression_used = FALSE) AS non_suppressed_rows,
    COUNT(*) FILTER (WHERE suppression_used = TRUE)::NUMERIC / COUNT(*) AS suppression_rate
FROM staging.medicaid_clean
GROUP BY state
ORDER BY suppressed_rows DESC;

-- STEP 10B2: VALIDATION OF SUPPRESSION BY STATE
SELECT *
FROM analytics.kpi_suppression_state
LIMIT 20;

-- STEP 10C1: SUPPRESSION BY UTILIZATION TYPE

CREATE VIEW analytics.kpi_suppression_utilization_type AS
SELECT
    utilization_type,
    COUNT(*) AS total_rows,
    COUNT(*) FILTER (WHERE suppression_used = TRUE) AS suppressed_rows,
    COUNT(*) FILTER (WHERE suppression_used = FALSE) AS non_suppressed_rows,
    COUNT(*) FILTER (WHERE suppression_used = TRUE)::NUMERIC / COUNT(*) AS suppression_rate
FROM staging.medicaid_clean
GROUP BY utilization_type
ORDER BY suppressed_rows DESC;

-- STEP 10C2: VALIDATION OF SUPPRESSION BY UTILIZATION TYPE
SELECT *
FROM analytics.kpi_suppression_utilization_type;

-- STEP 10D1: MOST FREQUENTLY SUPPRESSED DRUGS

CREATE VIEW analytics.kpi_suppressed_drug AS
SELECT
    product_name,
    COUNT(*) AS suppressed_count
FROM staging.medicaid_clean
WHERE suppression_used = TRUE
GROUP BY product_name
ORDER BY suppressed_count DESC;

-- STEP 10D2: MOST FREQUENTLY SUPPRESSED DRUGS
SELECT *
FROM analytics.kpi_suppressed_drug
LIMIT 20;