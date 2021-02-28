#Type of Triangle
SELECT 
    CASE
        WHEN
            A + B > C AND A + C > B AND B + C > A
        THEN
            CASE
                WHEN A = B AND B = C THEN 'Equilateral'
                WHEN A = B OR B = C OR A = C THEN 'Isosceles'
                ELSE 'Scalene'
            END
        ELSE 'Not A Triangle'
    END
FROM
    TRIANGLES;

#The PADS
select Concat(Name,"(",LEFT(Occupation,1),")")
from OCCUPATIONS
order by Name;
SELECT 
    CONCAT('There are a total of ',
            COUNT(Occupation),
            ' ',
            LOWER(Occupation),
            's.')
FROM
    OCCUPATIONS
GROUP BY Occupation
ORDER BY COUNT(*) , Occupation;

# Occupations
set @r1:=0, @r2:=0, @r3:=0, @r4:=0;
SELECT 
    MIN(doctor), MIN(Professor), MIN(Singer), MIN(Actor)
FROM
    (SELECT 
        CASE
                WHEN Occupation = 'Doctor' THEN (@r1:=@r1 + 1)
                WHEN Occupation = 'Professor' THEN (@r2:=@r2 + 1)
                WHEN Occupation = 'Singer' THEN (@r3:=@r3 + 1)
                WHEN Occupation = 'Actor' THEN (@r4:=@r4 + 1)
            END AS RowNum,
            CASE
                WHEN Occupation = 'Doctor' THEN Name
            END AS Doctor,
            CASE
                WHEN Occupation = 'Professor' THEN Name
            END AS Professor,
            CASE
                WHEN Occupation = 'Singer' THEN Name
            END AS Singer,
            CASE
                WHEN Occupation = 'Actor' THEN Name
            END AS Actor
    FROM
        OCCUPATIONS
    ORDER BY Name) temp
GROUP BY RowNum;

# Binary Tree Nodes
SELECT 
    CASE
        WHEN P IS NULL THEN CONCAT(N, ' Root')
        WHEN
            N IN (SELECT DISTINCT
                    P
                FROM
                    BST)
        THEN
            CONCAT(N, ' Inner')
        ELSE CONCAT(N, ' Leaf')
    END
FROM
    BST
ORDER BY N;

# New Companies
SELECT 
    c.company_code,
    c.founder,
    COUNT(DISTINCT e.lead_manager_code),
    COUNT(DISTINCT e.senior_manager_code),
    COUNT(DISTINCT e.manager_code),
    COUNT(DISTINCT e.employee_code)
FROM
    company c
        INNER JOIN
    employee e ON e.company_code = c.company_code
GROUP BY c.company_code , c.founder
ORDER BY c.company_code;




