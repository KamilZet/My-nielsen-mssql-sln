declare @plnName varchar(256)

;WITH cte(num) AS
(
    SELECT 1 AS num
    UNION ALL
    SELECT (num + 1) AS num FROM cte
    WHERE num < 99
)
SELECT @plnName = COALESCE(@plnName,'') + CONVERT(VARCHAR(2),num / 10)
FROM cte 
order BY num asc
option (MAXRECURSION 0)

SELECT @plnName + ','+@plnName