# Engeto_Project_4_SQL

# Úvod do projektu a zadání
Na našem analytickém oddělení nezávislé společnosti, která se zabývá životní úrovní občanů, jsme se dohodli, že se pokusíme odpovědět na pár definovaných výzkumných otázek, které adresují dostupnost základních potravin široké veřejnosti. Kolegové již vydefinovali základní otázky, na které se pokusíme odpovědět a poskytnout tuto informaci tiskovému oddělení. Toto oddělení bude výsledky prezentovat na následující konferenci zaměřené na tuto oblast.
Potřebují k tomu připravit robustní datové podklady, ve kterých bude možné vidět porovnání dostupnosti potravin na základě průměrných příjmů za určité časové období.
Jako dodatečný materiál připravíme i tabulku s HDP, GINI koeficientem a populací dalších evropských států ve stejném období, jako primární přehled pro ČR.

# Datové sady
Datové sady, které je možné použít pro získání vhodného datového podkladu

**Primární tabulky:**

1.czechia_payroll – Informace o mzdách v různých odvětvích za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.

2.czechia_payroll_calculation – Číselník kalkulací v tabulce mezd.

3.czechia_payroll_industry_branch – Číselník odvětví v tabulce mezd.

4.czechia_payroll_unit – Číselník jednotek hodnot v tabulce mezd.

5.czechia_payroll_value_type – Číselník typů hodnot v tabulce mezd.

6.czechia_price – Informace o cenách vybraných potravin za několikaleté období. Datová sada pochází z Portálu otevřených dat ČR.

7.czechia_price_category – Číselník kategorií potravin, které se vyskytují v našem přehledu.

**Číselníky sdílených informací o ČR:**

1.czechia_region – Číselník krajů České republiky dle normy CZ-NUTS 2.

2.czechia_district – Číselník okresů České republiky dle normy LAU.

**Dodatečné tabulky:**

1.countries - Všemožné informace o zemích na světě, například hlavní město, měna, národní jídlo nebo průměrná výška populace.

2.economies - HDP, GINI, daňová zátěž, atd. pro daný stát a rok.


# Výzkumné otázky
**Otázka 1**: Rostou v průběhu let mzdy ve všech odvětvích, nebo v některých klesají?

**Otázka 2**: Kolik je možné si koupit litrů mléka a kilogramů chleba za první a poslední srovnatelné období v dostupných datech cen a mezd?

**Otázka 3**: Která kategorie potravin zdražuje nejpomaleji (je u ní nejnižší percentuální meziroční nárůst)? 

**Otázka 4**: Existuje rok, ve kterém byl meziroční nárůst cen potravin výrazně vyšší než růst mezd (větší než 10 %)?

**Otázka 5**: Má výška HDP vliv na změny ve mzdách a cenách potravin? Neboli, pokud HDP vzroste výrazněji v jednom roce, projeví se to na cenách potravin či mzdách ve stejném nebo následujícím roce výraznějším růstem?


# Příprava tabulek
Pro odpověď na otázku 1 až 4 byla vytvořena tabulka **t_dita_velcevova_project_SQL_primary_final**, ve které se spojují tabulky obsahující informace o mzdách a cenách.
Pro odpověď na 5. otázku pak byla vytvořena nová tabulka **t_dita_velcevova_project_SQL_secondary_final**, která vychází ze spojení tabulke **economies** a **countries**.

# Výstup projektu
Výstupem projektu je 5 sql dotazů označených podle čísla otázky (otazka_1.sql až otazka_5.sql) a také PDF soubor **Odpovědi.pdf**, který obsahuje popis postupu jednotlivých dotazů a jejich odpovědi.

