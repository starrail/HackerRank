#Revising the Select Query I
SELECT 
    *
FROM
    CITY
WHERE
    POPULATION > 100000
        AND CountryCode = 'USA';
        
#Revising the Select Query II
SELECT 
    NAME
FROM
    CITY
WHERE
    POPULATION > 120000
        AND CountryCode = 'USA';
        
#Select All
SELECT 
    *
FROM
    CITY;
    
#Select By ID
SELECT 
    *
FROM
    CITY
WHERE
    ID = 1661;
    
#Japanese Cities' Attributes
SELECT 
    *
FROM
    CITY
WHERE
    COUNTRYCODE = 'JPN';
    
#Japanese Cities' Names
SELECT 
    NAME
FROM
    CITY
WHERE
    COUNTRYCODE = 'JPN';
    
#Weather Observation Station 1
SELECT 
    CITY, STATE
FROM
    STATION;
    
#Weather Observation Station 3
SELECT DISTINCT
    (CITY)
FROM
    STATION
WHERE
    ID % 2 = 0;
    
#Weather Observation Station 4
SELECT 
    COUNT(*) - COUNT(DISTINCT CITY)
FROM
    STATION;
    
#Weather Observation Station 5
SELECT 
    CITY, LENGTH(CITY)
FROM
    STATION
ORDER BY LENGTH(CITY) DESC , CITY
LIMIT 1;

SELECT 
    CITY, LENGTH(CITY)
FROM
    STATION
ORDER BY LENGTH(CITY) , CITY
LIMIT 1;

#Weather Observation Station 6
SELECT DISTINCT
    (CITY)
FROM
    STATION
WHERE
    LEFT(CITY, 1) IN ('a' , 'e', 'i', 'o', 'u');
    
#Weather Observation Station 7
SELECT DISTINCT
    (CITY)
FROM
    STATION
WHERE
    RIGHT(CITY, 1) IN ('a' , 'e', 'i', 'o', 'u');
    
#Weather Observation Station 8
SELECT DISTINCT
    (CITY)
FROM
    STATION
WHERE
    RIGHT(CITY, 1) IN ('a' , 'e', 'i', 'o', 'u')
        AND LEFT(CITY, 1) IN ('a' , 'e', 'i', 'o', 'u');
        
#Weather Observation Station 9
SELECT DISTINCT
    (CITY)
FROM
    STATION
WHERE
    LEFT(CITY, 1) NOT IN ('a' , 'e', 'i', 'o', 'u');
    
#Weather Observation Station 10
SELECT DISTINCT
    (CITY)
FROM
    STATION
WHERE
    RIGHT(CITY, 1) NOT IN ('a' , 'e', 'i', 'o', 'u');
    
#Weather Observation Station 11
SELECT DISTINCT
    (CITY)
FROM
    STATION
WHERE
    RIGHT(CITY, 1) NOT IN ('a' , 'e', 'i', 'o', 'u')
        OR LEFT(CITY, 1) NOT IN ('a' , 'e', 'i', 'o', 'u');
        
#Higher Than 75 Marks
SELECT 
    Name
FROM
    STUDENTS
WHERE
    Marks > 75
ORDER BY RIGHT(Name, 3) , ID ASC;

#Employee Names
SELECT 
    name
FROM
    Employee
ORDER BY name;

#Employee Salaries
SELECT 
    name
FROM
    Employee
WHERE
    salary > 2000 AND months < 10
ORDER BY employee_id;

    
