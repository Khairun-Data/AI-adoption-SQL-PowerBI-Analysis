-- How many countries are in the dataset?
SELECT COUNT(*) FROM ai_diffusion_clean;
-- 147

SELECT COUNT(*) FROM gdp_2024;
-- 208

SELECT COUNT(*) 
FROM ai_diffusion_clean a
JOIN gdp_2024 g
	ON a.economy = g.economy;
-- 138 countries available for the final analysis 

-- What countries are missing?
SELECT a.economy
FROM ai_diffusion_clean a
LEFT JOIN gdp_2024 g
	ON a.economy = g.economy
WHERE g.economy IS NULL; 
-- 9 countries with GDP data but missing AI diffusion data

