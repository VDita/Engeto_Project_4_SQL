-- 1. Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

WITH rust_mezd_cte AS (
    SELECT 
    	rok,
        kod_oboru,
        nazev_oboru,
        ROUND(AVG(prumerna_mzda)::NUMERIC, 2) AS prumerna_mzda,
        LAG(ROUND(AVG(prumerna_mzda)::NUMERIC, 2), 1) OVER (PARTITION BY kod_oboru ORDER BY rok) AS predchozi_mzda,
        CASE 
            WHEN ROUND(AVG(prumerna_mzda)::NUMERIC, 2) > LAG(ROUND(AVG(prumerna_mzda)::NUMERIC, 2), 1) OVER (PARTITION BY kod_oboru ORDER BY rok) THEN 'roste'
            WHEN ROUND(AVG(prumerna_mzda)::NUMERIC, 2) < LAG(ROUND(AVG(prumerna_mzda)::NUMERIC, 2), 1) OVER (PARTITION BY kod_oboru ORDER BY rok) THEN 'klesá'
            ELSE 'stejné'
        END AS rust_mzdy
    FROM t_dita_velcevova_project_SQL_primary_final
    GROUP BY kod_oboru, nazev_oboru, rok
)
SELECT *
FROM rust_mezd_cte
WHERE rok > 2005 AND rok < 2019 AND rust_mzdy = 'klesá'
ORDER BY rok
;
