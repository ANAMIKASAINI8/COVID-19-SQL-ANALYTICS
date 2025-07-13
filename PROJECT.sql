CREATE DATABASE COVID_ANALYSIS;
USE COVID_ANALYSIS;
CREATE TABLE covid_datas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    observation_date DATE,
    province_state VARCHAR(100),
    country_region VARCHAR(100),
    last_update DATETIME,
    confirmed INT,
    deaths INT,
    recovered INT
);

USE COVID_ANALYSIS ;
SELECT * FROM covid_datas LIMIT 10;

INSERT INTO covid_datas (observation_date, province_state, country_region, last_update, confirmed, deaths, recovered)
VALUES ('2020-03-01', NULL, 'India', '2020-03-01 23:59:59', 3, 0, 0);

INSERT INTO covid_datas (observation_date, province_state, country_region, last_update, confirmed, deaths, recovered)
VALUES 
('2020-03-01', NULL, 'India', '2020-03-01 23:59:59', 550, 10, 200),
('2020-03-02', NULL, 'India', '2020-03-02 23:59:59', 680, 15, 250),
('2020-03-03', NULL, 'US', '2020-03-03 23:59:59', 1200, 30, 300),
('2020-03-04', NULL, 'UK', '2020-03-04 23:59:59', 890, 22, 500),
('2020-03-05', NULL, 'Brazil', '2020-03-05 23:59:59', 670, 14, 400);

-- TOTAL CONFIRMED CASES BY COUNTRY

SELECT country_region, SUM(confirmed) AS total_confirmed
FROM covid_datas
GROUP BY country_region
ORDER BY total_confirmed DESC;

-- DEATH RATE % PER COUNTRY
SELECT country_region,
       SUM(deaths) AS total_deaths,
       SUM(confirmed) AS total_cases,
       ROUND((SUM(deaths) / SUM(confirmed)) * 100, 2) AS death_rate_percent
FROM covid_datas
GROUP BY country_region
ORDER BY death_rate_percent DESC;


-- DAILY CASE TREND FOR INDIA 
SELECT observation_date, SUM(confirmed) AS daily_cases
FROM covid_datas
WHERE country_region = 'India'
GROUP BY observation_date
ORDER BY observation_date;

-- COUNTRY WITH MOST RECOVERIES 
SELECT country_region, SUM(recovered) AS total_recovered
FROM covid_datas
GROUP BY country_region
ORDER BY total_recovered DESC;