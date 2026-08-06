CREATE DATABASE ai_diffusion;
USE ai_diffusion;


CREATE TABLE ai_diffusion_data (
    economy VARCHAR(100),
    h1_2025_ai_diffusion VARCHAR(20),
    h2_2025_ai_diffusion VARCHAR(20),
    q1_2026_ai_diffusion VARCHAR(20)
    );
SHOW TABLES;

SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/nafis/OneDrive/Desktop/ai_diffusion.csv'
INTO TABLE ai_diffusion_data
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(
 economy,
 h1_2025_ai_diffusion,
 h2_2025_ai_diffusion,
 q1_2026_ai_diffusion
);

DESCRIBE ai_diffusion_data;

DROP TABLE ai_diffusion_data;

CREATE TABLE ai_diffusion_data (
    economy VARCHAR(100),
    h1_2025_ai_diffusion VARCHAR(20),
    h2_2025_ai_diffusion VARCHAR(20),
    q1_2026_ai_diffusion VARCHAR(20)
    );
    
SELECT * 
FROM ai_diffusion_data;

SELECT COUNT(*)
FROM ai_diffusion_data;

SELECT * 
FROM ai_diffusion_data
LIMIT 10;

CREATE TABLE GDPcapita (
	economy VARCHAR(100),
    CountryCode VARCHAR(10),
    Year YEAR,
    GdpPerCapita DECIMAL(9,2),
    WorldRegion VARCHAR(100)
);

SELECT * FROM GDPcapita;
DESCRIBE GDPcapita;

SELECT * FROM ai_diffusion_data;

CREATE TABLE ai_diffusion_clean AS
SELECT
    economy,
    CAST(REPLACE(h1_205_ai_diffusion, '%', '') AS DECIMAL(5,2)) AS h1_2025_ai_diffusion,
    CAST(REPLACE(h2_2025_ai_diffusion, '%', '') AS DECIMAL(5,2)) AS h2_2025_ai_diffusion,
    CAST(REPLACE(q1_2026_ai_diffusion, '%', '') AS DECIMAL(5,2)) AS q1_2026_ai_diffusion
FROM ai_diffusion_data;

