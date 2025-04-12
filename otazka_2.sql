-- 2. Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

(SELECT
	rok,
	kategorie,
	round(avg(prumerna_cena)::NUMERIC, 2) AS prumer_cena,
	round(avg(prumerna_mzda)::NUMERIC,2) AS prumer_mzdy,
	round((avg(prumerna_mzda) / avg(prumerna_cena))::NUMERIC, 2)  AS kolik_koupim,
	jednotka
FROM t_dita_velcevova_project_SQL_primary_final
WHERE kod_kategorie in('114201', '111301')
GROUP by rok, kod_kategorie, kategorie, hodnota, jednotka
ORDER BY rok asc
limit 2)
UNION all
(SELECT
	rok,
	kategorie,
	round(avg(prumerna_cena)::NUMERIC, 2) AS prumer_cena,
	round(avg(prumerna_mzda)::NUMERIC,2) AS prumer_mzdy,
	round((avg(prumerna_mzda) / avg(prumerna_cena))::NUMERIC, 2)  AS kolik_koupim,
	jednotka
FROM t_dita_velcevova_project_SQL_primary_final
WHERE kod_kategorie in('114201', '111301')
GROUP by rok, kod_kategorie, kategorie, hodnota, jednotka
ORDER BY rok desc
limit 2)
;
