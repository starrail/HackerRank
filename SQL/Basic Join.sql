# Asian Population
SELECT 
    SUM(CITY.POPULATION)
FROM
    CITY
        JOIN
    COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE
    CONTINENT = 'Asia';
    
# African Cities
SELECT 
    CITY.NAME
FROM
    CITY
        JOIN
    COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE
    CONTINENT = 'Africa';
    
# Average Population of Each Continent
SELECT 
    COUNTRY.Continent, FLOOR(AVG(CITY.POPULATION))
FROM
    CITY
        JOIN
    COUNTRY ON CITY.CountryCode = COUNTRY.Code
GROUP BY COUNTRY.Continent;

# The Report
SELECT 
    IF(GRADE < 8, NULL, NAME), GRADE, MARKS
FROM
    STUDENTS
        JOIN
    GRADES
WHERE
    MARKS BETWEEN MIN_MARK AND MAX_MARK
ORDER BY GRADE DESC , NAME;

# Top Competitors
SELECT 
    h.hacker_id, h.name
FROM
    submissions s
        JOIN
    challenges c ON s.challenge_id = c.challenge_id
        JOIN
    difficulty d ON c.difficulty_level = d.difficulty_level
        JOIN
    hackers h ON s.hacker_id = h.hacker_id
WHERE
    s.score = d.score
GROUP BY h.hacker_id , h.name
HAVING COUNT(s.hacker_id) > 1
ORDER BY COUNT(s.hacker_id) DESC , s.hacker_id ASC;

# Ollivander's Inventory
SELECT 
    W.id, P.age, W.coins_needed, W.power
FROM
    WANDS AS W
        INNER JOIN
    WANDS_PROPERTY AS P ON W.code = P.code
WHERE
    P.is_evil = 0
        AND W.coins_needed = (SELECT 
            MIN(coins_needed)
        FROM
            WANDS AS W1
                INNER JOIN
            WANDS_PROPERTY AS P1 ON W1.code = P1.code
        WHERE
            W1.power = W.power AND P1.age = P.age)
ORDER BY W.power DESC , P.age DESC;

# Contest Leaderboard
SELECT 
    h.hacker_id, name, SUM(score) AS total_score
FROM
    hackers AS h
        INNER JOIN
    (SELECT 
        hacker_id, MAX(score) AS score
    FROM
        submissions
    GROUP BY challenge_id , hacker_id) max_score ON h.hacker_id = max_score.hacker_id
GROUP BY h.hacker_id , name
HAVING total_score > 0
ORDER BY total_score DESC , h.hacker_id;

# Challenges
select c.hacker_id, h.name ,count(c.hacker_id) as c_count

/* this is the join we want to output them from */
from Hackers as h
    inner join Challenges as c on c.hacker_id = h.hacker_id

/* after they have been grouped by hacker */
group by c.hacker_id, h.name

/* but we want to be selective about which hackers we output */
/* having is required (instead of where) for filtering on groups */
having 

    /* output anyone with a count that is equal to... */
    c_count = 
        /* the max count that anyone has */
        (SELECT MAX(temp1.cnt)
        from (SELECT COUNT(hacker_id) as cnt
             from Challenges
             group by hacker_id
             order by hacker_id) temp1)

    /* or anyone who's count is in... */
    or c_count in 
        /* the set of counts... */
        (select t.cnt
         from (select count(*) as cnt 
               from challenges
               group by hacker_id) t
         /* who's group of counts... */
         group by t.cnt
         /* has only one element */
         having count(t.cnt) = 1)
/* finally, the order the rows should be output */
order by c_count DESC, c.hacker_id
;