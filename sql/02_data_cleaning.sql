CREATE TABLE ai_diffusion_clean AS
SELECT
    economy,
    CAST(REPLACE(h1_2025_ai_diffusion, '%', '') AS DECIMAL(5,2)) AS h1_2025_ai_diffusion,
    CAST(REPLACE(h2_2025_ai_diffusion, '%', '') AS DECIMAL(5,2)) AS h2_2025_ai_diffusion,
    CAST(REPLACE(q1_2026_ai_diffusion, '%', '') AS DECIMAL(5,2)) AS q1_2026_ai_diffusion
FROM ai_diffusion_data;


