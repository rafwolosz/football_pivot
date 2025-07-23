SELECT
    HomeTeam,
    CAST(ROUND(AVG(CAST(HomeWin AS DECIMAL(5,4))) * 100, 1) AS INT) AS Avg_HomeWinPct,
    CAST( ROUND(AVG(CAST(GoalDifference AS decimal(10,2))), 2) AS decimal(6,2) )        AS Avg_GoalDiff
INTO dbo.HomeKPIs_2024
FROM dbo.Matches2024
GROUP BY HomeTeam
ORDER BY Avg_HomeWinPct DESC;


SELECT * FROM dbo.HomeKPIs_2024
ORDER BY Avg_HomeWinPct DESC, Avg_GoalDiff DESC;



TRUNCATE TABLE dbo.HomeKPIs_2024;

INSERT INTO dbo.HomeKPIs_2024 (HomeTeam, Avg_HomeWinPct, Avg_GoalDiff)
SELECT
    HomeTeam,
    CAST(ROUND(AVG(HomeWin*100.0),0) AS int)           AS Avg_HomeWinPct,
    ROUND(AVG(GoalDifference*1.0),2)                   AS Avg_GoalDiff
FROM dbo.Matches2024
GROUP BY HomeTeam;


WITH Ranked AS (
    SELECT
        *,
        RANK() OVER (ORDER BY Avg_HomeWinPct DESC)         AS RankHW,
        RANK() OVER (ORDER BY Avg_GoalDiff   DESC)         AS RankGD
    FROM dbo.HomeKPIs_2024
)
SELECT
    HomeTeam,
    Avg_HomeWinPct,
    Avg_GoalDiff,
    RankHW,
    RankGD,
    CASE WHEN ABS(RankHW - RankGD) >= 2 THEN 'OUTLIER' END AS Flag
FROM Ranked
ORDER BY RankHW;