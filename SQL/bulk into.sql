BULK INSERT dbo.Matches2024_raw
FROM 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\e02024-2025clean.csv'
WITH
(
    FIRSTROW        = 2,          
    CODEPAGE        = '65001',    
    FIELDTERMINATOR = ';',        
    ROWTERMINATOR   = '0x0d0a',   
    TABLOCK
);


SET DATEFORMAT dmy;          


INSERT INTO dbo.Matches2024
       (MatchDate,
        HomeTeam,
        AwayTeam,
        FTHG,
        FTAG,
        FTR,
        GoalDifference,
        HomeWin)
SELECT
    CONVERT(date,  MatchDate,      104),  
    HomeTeam,
    AwayTeam,
    CONVERT(tinyint,  FTHG),
    CONVERT(tinyint,  FTAG),
    FTR,
    CONVERT(smallint, GoalDifference),
    CONVERT(bit,      HomeWin)
FROM dbo.Matches2024_raw;