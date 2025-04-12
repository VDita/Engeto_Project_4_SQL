-- 3. Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)?

WITH ceny AS (
    SELECT
        rok,
        kategorie,
        ROUND(AVG(prumerna_cena)::NUMERIC, 2) AS prumerna_cena
    FROM t_dita_velcevova_project_SQL_primary_final
    GROUP BY rok, kategorie
),
mezirocni_zmena AS (
    SELECT
        kategorie,
        rok,
        prumerna_cena,
        LAG(prumerna_cena) OVER (PARTITION BY kategorie ORDER BY rok) AS predchozi_cena,
        ROUND(
            (prumerna_cena - LAG(prumerna_cena) OVER (PARTITION BY kategorie ORDER BY rok)) 
            / LAG(prumerna_cena) OVER (PARTITION BY kategorie ORDER BY rok) * 100, 
            2
        ) AS mezirocni_narust
    FROM ceny
)
SELECT 
    kategorie, 
    ROUND(AVG(mezirocni_narust)::NUMERIC, 2) AS prumerny_narust
FROM mezirocni_zmena
WHERE mezirocni_narust IS NOT NULL  -- odstraníme první rok, kde není předchozí hodnota
GROUP BY kategorie
ORDER BY prumerny_narust ASC
LIMIT 5;
