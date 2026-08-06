-- 1. Categorize countries into high, medium and low AI adoption. 
SELECT 
	a.economy, 
    g.WorldRegion,
	a.q1_2026_ai_diffusion,
    CASE 
		WHEN a.q1_2026_ai_diffusion >= 50 THEN 'High Adoption'
        WHEN a.q1_2026_ai_diffusion >= 20 THEN 'Medium Adoption'
		ELSE 'Low Adoption'
	END AS adoption_category
FROM ai_diffusion_clean a
JOIN gdp_2024 g
	ON a.economy = g.economy
ORDER BY q1_2026_ai_diffusion DESC;

-- 2. What regional patterns can be observed for the countries in the high AI adoption category? 
WITH adoption_level AS (
SELECT 
	a.economy, 
    g.WorldRegion,
	a.q1_2026_ai_diffusion,
    CASE 
		WHEN a.q1_2026_ai_diffusion >= 50 THEN 'High Adoption'
        WHEN a.q1_2026_ai_diffusion >= 20 THEN 'Medium Adoption'
		ELSE 'Low Adoption'
	END AS adoption_category
FROM ai_diffusion_clean a
JOIN gdp_2024 g
	ON a.economy = g.economy
)
SELECT 
	WorldRegion,
    COUNT(*) AS high_adoption_countries
FROM adoption_level 
WHERE adoption_category = 'High Adoption'
GROUP BY WorldRegion
ORDER BY high_adoption_countries DESC;