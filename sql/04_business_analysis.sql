-- 1. What is the average AI adoption by region?
SELECT 
    g.WorldRegion,
    ROUND(AVG(a.q1_2026_ai_diffusion),2) AS avg_adoption
FROM ai_diffusion_final a
JOIN gdp_2024_final g
	ON a.economy = g.economy
GROUP BY g.WorldRegion
ORDER BY avg_adoption DESC;


-- 2. Top 10 countries by AI adoption, and their GDP
SELECT 
	a.economy,
    a.q1_2026_ai_diffusion,
    g.GdpPerCapita
FROM ai_diffusion_final a
JOIN gdp_2024_final g
	ON a.economy = g.economy
ORDER BY 2 DESC
LIMIT 10;


-- 3. Which countries outperform the global average for AI adoption?
SELECT 
	economy, 
    q1_2026_ai_diffusion
FROM ai_diffusion_final
WHERE q1_2026_ai_diffusion > (
	SELECT AVG(q1_2026_ai_diffusion)
	FROM ai_diffusion_final
)
ORDER BY 2 DESC;


-- 4. Which European countries have AI adoption rates above the global average?
SELECT 
	a.economy, 
    a.q1_2026_ai_diffusion
FROM ai_diffusion_final a
JOIN gdp_2024_final g
	ON a.economy = g.economy
WHERE a.q1_2026_ai_diffusion > (
	SELECT AVG(q1_2026_ai_diffusion)
    FROM ai_diffusion_final 
)
AND g.WorldRegion = 'Europe'
ORDER BY 2 DESC;


-- 5. Which countries combine strong economic performance with strong AI adoption?
SELECT 
	a.economy,
    a.q1_2026_ai_diffusion,
    g.GdpPerCapita
FROM ai_diffusion_final a
JOIN gdp_2024_final g
	ON a.economy = g.economy
WHERE g.GdpPerCapita > (
	SELECT AVG(GdpPerCapita)
	FROM gdp_2024_final
)
AND a.q1_2026_ai_diffusion > (
    SELECT AVG(q1_2026_ai_diffusion)
    FROM ai_diffusion_final
)
ORDER BY 2 DESC;