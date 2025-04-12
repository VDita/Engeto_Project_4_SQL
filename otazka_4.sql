-- 4. Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

WITH prumerne_ceny AS (
	SELECT
		rok,
		round(avg(prumerna_cena)::NUMERIC, 2) AS prumerna_cena
	FROM t_dita_velcevova_project_SQL_primary_final
	GROUP BY rok
),
mezirocni_narust_cen AS (
	SELECT 
		rok,
		prumerna_cena,
		LAG (prumerna_cena) over(ORDER BY rok) AS predchozi_cena,
		round(
			(prumerna_cena - LAG(prumerna_cena) OVER (ORDER BY rok))
			/ LAG (prumerna_cena) OVER (ORDER BY rok) * 100,
			2
		) AS mezirocni_narust_cen
	FROM prumerne_ceny
),
prumerne_mzdy AS (
	SELECT
		rok,
		round(avg(prumerna_mzda)::numeric, 2) AS prumerna_mzda
	FROM t_dita_velcevova_project_SQL_primary_final
	GROUP BY rok
),
mezirocni_narust_mezd AS (
	SELECT
		rok,
		prumerna_mzda,
		lag(prumerna_mzda) OVER (ORDER BY rok) AS predchozi_mzda,
		round(
			(prumerna_mzda - LAG(prumerna_mzda) over(ORDER BY rok))
			/ LAG (prumerna_mzda) OVER (ORDER BY rok) * 100,
			2
		) AS mezirocni_narust_mezd
	FROM prumerne_mzdy
)
SELECT
	m.rok,
	m.mezirocni_narust_cen,
	mz.mezirocni_narust_mezd,
	(m.mezirocni_narust_cen - mz.mezirocni_narust_mezd) AS rozdil
FROM mezirocni_narust_cen m
JOIN mezirocni_narust_mezd mz ON m.rok = mz.rok
WHERE (m.mezirocni_narust_cen - mz.mezirocni_narust_mezd) > 10
ORDER by rozdil desc ;
