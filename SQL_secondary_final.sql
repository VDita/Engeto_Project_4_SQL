CREATE TABLE t_dita_velcevova_project_SQL_secondary_final AS
SELECT
	e.country,
	round((e.gdp/1e9)::NUMERIC, 2) AS hdp_miliardy,
	e.gini,
	round((e.taxes):: NUMERIC, 2) AS taxes,
	e.year
FROM economies e
JOIN countries c ON e.country = c.country 
WHERE c.continent = 'Europe'
	AND e.YEAR BETWEEN 2006 AND 2018
ORDER BY e.country, e.year;
