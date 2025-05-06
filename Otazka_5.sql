WITH hdp_cr AS (
    SELECT 
        year,
        hdp_miliardy,
        LAG(hdp_miliardy) OVER (ORDER BY year) AS predchozi_hdp,
        ROUND(((hdp_miliardy - LAG(hdp_miliardy) OVER (ORDER BY year)) / LAG(hdp_miliardy) OVER (ORDER BY year)) * 100, 2) AS rust_hdp_proc
    FROM t_dita_velcevova_project_SQL_secondary_final
    WHERE country = 'Czech Republic'
),
mzdy_ceny AS (
    SELECT
        rok,
        ROUND(AVG(prumerna_mzda), 2) AS prumerna_mzda,
        ROUND(AVG(prumerna_cena), 2) AS prumerna_cena,
        LAG(ROUND(AVG(prumerna_mzda), 2)) OVER (ORDER BY rok) AS predchozi_mzda,
        LAG(ROUND(AVG(prumerna_cena), 2)) OVER (ORDER BY rok) AS predchozi_cena,
        ROUND(((AVG(prumerna_mzda) - LAG(AVG(prumerna_mzda)) OVER (ORDER BY rok)) / LAG(AVG(prumerna_mzda)) OVER (ORDER BY rok)) * 100, 2) AS rust_mezd_proc,
        ROUND(((AVG(prumerna_cena) - LAG(AVG(prumerna_cena)) OVER (ORDER BY rok)) / LAG(AVG(prumerna_cena)) OVER (ORDER BY rok)) * 100, 2) AS rust_cen_proc
    FROM t_dita_velcevova_project_SQL_primary_final
    WHERE rok BETWEEN 2006 AND 2018
    GROUP BY rok
)
SELECT 
    h.year,
    h.rust_hdp_proc,
    m.rust_mezd_proc,
    m.rust_cen_proc
FROM hdp_cr h
JOIN mzdy_ceny m ON h.year = m.rok
ORDER BY h.YEAR desc;
