-- Vytvoření tabulky t_dita_velcevova_project_SQL_primary_final

CREATE TABLE t_dita_velcevova_project_SQL_primary_final AS
SELECT
    round(avg(cp.value)::NUMERIC, 2) AS prumerna_mzda,
    cp.industry_branch_code AS kod_oboru,
    cpib.name AS nazev_oboru,
    cp.payroll_year AS rok,
    round(avg(cp2.value)::NUMERIC, 2) AS prumerna_cena,
    cp2.category_code AS kod_kategorie,
    cpc.name AS kategorie,
    cpc.price_value AS hodnota,
    cpc.price_unit AS jednotka
FROM czechia_payroll cp 
JOIN czechia_payroll_industry_branch cpib ON cp.industry_branch_code = cpib.code
LEFT JOIN czechia_price cp2 ON cp.payroll_year = date_part('year', cp2.date_from)
LEFT JOIN czechia_price_category cpc ON cp2.category_code = cpc.code
WHERE cp.value_type_code = 5958
  AND cp.unit_code = 200
  AND cp.calculation_code = 100
  AND cp.industry_branch_code IS NOT NULL
  AND cp2.value IS NOT NULL 
GROUP BY cp.value_type_code, cp.unit_code, cp.calculation_code, cp.industry_branch_code, cp.payroll_year, cpib.name, cpc.name, cp2.value, cpc.price_unit, cpc.price_value, cp2.category_code 
ORDER BY cp.industry_branch_code, cp.payroll_year desc;
