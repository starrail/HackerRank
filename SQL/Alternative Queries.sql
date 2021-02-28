# Draw The Triangle 1
set @number = 21;
SELECT 
    REPEAT('* ', @number:=@number - 1)
FROM
    information_schema.tables;

# Draw The Triangle 2
set @i:=0;
SELECT 
    REPEAT('* ', @i:=@i + 1)
FROM
    information_schema.tables
WHERE
    @i < 20;
    
# Print Prime Numbers
SET @potential_prime = 1;
SET @divisor = 1;

SELECT 
    GROUP_CONCAT(POTENTIAL_PRIME
        SEPARATOR '&')
FROM
    (SELECT 
        @potential_prime:=@potential_prime + 1 AS POTENTIAL_PRIME
    FROM
        information_schema.tables t1, information_schema.tables t2
    LIMIT 1000) list_of_potential_primes
WHERE
    NOT EXISTS( SELECT 
            *
        FROM
            (SELECT 
                @divisor:=@divisor + 1 AS DIVISOR
            FROM
                information_schema.tables t4, information_schema.tables t5
            LIMIT 1000) list_of_divisors
        WHERE
            MOD(POTENTIAL_PRIME, DIVISOR) = 0
                AND POTENTIAL_PRIME <> DIVISOR);
