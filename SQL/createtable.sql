USE FootballPL;                
GO

DROP TABLE IF EXISTS dbo.Matches2024;
GO

CREATE TABLE dbo.Matches2024
(
    MatchDate       DATE,           
    HomeTeam        NVARCHAR(40),
    AwayTeam        NVARCHAR(40),
    FTHG            TINYINT,        
    FTAG            TINYINT,        
    FTR             CHAR(1),       
    GoalDifference  SMALLINT,       
    HomeWin         BIT             
);


DROP TABLE IF EXISTS dbo.Matches2024_raw;
GO
CREATE TABLE dbo.Matches2024_raw
(
    MatchDate      NVARCHAR(20),
    HomeTeam       NVARCHAR(40),
    AwayTeam       NVARCHAR(40),
    FTHG           NVARCHAR(8),
    FTAG           NVARCHAR(8),
    FTR            NVARCHAR(2),
    GoalDifference NVARCHAR(8),
    HomeWin        NVARCHAR(2)
);













