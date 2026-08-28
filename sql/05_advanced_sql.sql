-- 1. Categorize countries into high, medium and low AI adoption. 
CREATE OR REPLACE VIEW Adoption_Category AS 
	SELECT 
		a.economy,
        a.q1_2026_ai_diffusion,
        g.WorldRegion,
        CASE 
			WHEN a.q1_2026_ai_diffusion >= 50 THEN "High Adoption"
            WHEN a.q1_2026_ai_diffusion >= 20 THEN "Medium Adoption"
            ELSE "Low Adoption"
		END AS adoption_level
	FROM ai_diffusion_final a
    JOIN gdp_2024_final g
		ON a.economy = g.economy
	ORDER BY a.q1_2026_ai_diffusion DESC;
    
SELECT * FROM Adoption_Category;


-- 2. How many countries are in each of the AI adoption categories?
SELECT 
	adoption_level, 
	ROUND(AVG(q1_2026_ai_diffusion),2) AS avg_diffusion,
	COUNT(economy) AS total_countries
FROM Adoption_Category
GROUP BY adoption_level
ORDER BY 2 DESC;


-- 3. What regional patterns can be observed for the countries in the high AI adoption category? 
SELECT 
	economy, 
	WorldRegion,
    adoption_level
FROM Adoption_Category
WHERE adoption_level = "High Adoption";

    
-- 4. What are the top 3 AI-adopting countries in each region?
-- rank countries within each region 
WITH ranked_countries AS (
	SELECT 
		economy,
		WorldRegion,
		q1_2026_ai_diffusion,
		RANK() OVER(
			PARTITION BY WorldRegion 
			ORDER BY q1_2026_ai_diffusion DESC 
        ) AS regional_rank
FROM Adoption_Category
)

SELECT * 
FROM ranked_countries
WHERE regional_rank <= 3
ORDER BY WorldRegion;   