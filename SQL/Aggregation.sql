# Revising Aggregations - The Count Function
SELECT 
    COUNT(*)
FROM
    CITY
WHERE
    population > 100000;
    
# Revising Aggregations - The Sum Function
SELECT 
    SUM(POPULATION)
FROM
    CITY
WHERE
    DISTRICT = 'California';
    
# Revising Aggregations - Averages
SELECT 
    AVG(POPULATION)
FROM
    CITY
WHERE
    DISTRICT = 'California';
    
# Average Population
SELECT 
    ROUND(AVG(POPULATION))
FROM
    CITY;
    
# Japan Population
SELECT 
    SUM(POPULATION)
FROM
    CITY
WHERE
    COUNTRYCODE = 'JPN';
    
# Population Density Difference
SELECT 
    MAX(POPULATION) - MIN(POPULATION)
FROM
    CITY;
    
# The Blunder
SELECT 
    CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM
    EMPLOYEES;

# Top Earners
SELECT 
    (months * salary) AS earnings, COUNT(*)
FROM
    Employee
GROUP BY earnings
ORDER BY earnings DESC
LIMIT 1;

# Weather Observation Station 2
SELECT 
    ROUND(SUM(LAT_N), 2), ROUND(SUM(LONG_W), 2)
FROM
    STATION;
    
# Weather Observation Station 13
SELECT 
    TRUNCATE(SUM(LAT_N), 4)
FROM
    STATION
WHERE
    LAT_N BETWEEN 38.7880 AND 137.2345;
    
# Weather Observation Station 14
SELECT 
    TRUNCATE(MAX(LAT_N), 4)
FROM
    STATION
WHERE
    LAT_N < 137.2345;
    
# Weather Observation Station 15
SELECT 
    ROUND(LONG_W, 4)
FROM
    STATION
WHERE
    LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

# Weather Observation Station 16
SELECT 
    ROUND(MIN(LAT_N), 4)
FROM
    STATION
WHERE
    LAT_N > 38.7780;
    
# Weather Observation Station 17
SELECT 
    ROUND(LONG_W, 4)
FROM
    STATION
WHERE
    LAT_N = (SELECT 
            MIN(LAT_N)
        FROM
            STATION
        WHERE
            LAT_N > 38.7780); 
            
# Weather Observation Station 18
SELECT 
    ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)),
            4)
FROM
    STATION;
    
# Weather Observation Station 19
SELECT 
    ROUND(SQRT(POWER(MAX(LAT_N) - MIN(LAT_N), 2) + POWER(MAX(LONG_W) - MIN(LONG_W), 2)),
            4)
FROM
    STATION;
    
# Weather Observation Station 20
SELECT CEIL(COUNT(*)/2) FROM STATION;
SELECT 
    ROUND(MAX(a.LAT_N), 4)
FROM
    (SELECT 
        LAT_N
    FROM
        STATION
    ORDER BY LAT_N
    LIMIT 250) AS a;