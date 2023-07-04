-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [teams] (
    [team_id] int  NOT NULL ,
    [team_name] string  NOT NULL ,
    CONSTRAINT [PK_teams] PRIMARY KEY CLUSTERED (
        [team_id] ASC
    )
)

CREATE TABLE [goals] (
    [goal_id] int  NOT NULL ,
    [player_id] int  NOT NULL ,
    [match_id] int  NOT NULL ,
    CONSTRAINT [PK_goals] PRIMARY KEY CLUSTERED (
        [goal_id] ASC
    )
)

CREATE TABLE [players] (
    [player_id] int  NOT NULL ,
    [player_name] string  NOT NULL ,
    CONSTRAINT [PK_players] PRIMARY KEY CLUSTERED (
        [player_id] ASC
    )
)

CREATE TABLE [referees] (
    [referee_id] int  NOT NULL ,
    [refree_name] string  NOT NULL ,
    CONSTRAINT [PK_referees] PRIMARY KEY CLUSTERED (
        [referee_id] ASC
    )
)

CREATE TABLE [matches] (
    [match_id] int  NOT NULL ,
    [home_team_id] int  NOT NULL ,
    [awwy_team_id] int  NOT NULL ,
    [location] string  NOT NULL ,
    [season_id] int  NOT NULL ,
    CONSTRAINT [PK_matches] PRIMARY KEY CLUSTERED (
        [match_id] ASC
    )
)

CREATE TABLE [season] (
    [season_id] int  NOT NULL ,
    [start_date] string  NOT NULL ,
    [end_date] string  NOT NULL ,
    CONSTRAINT [PK_season] PRIMARY KEY CLUSTERED (
        [season_id] ASC
    )
)

CREATE TABLE [lineups] (
    [lineup_id] int  NOT NULL ,
    [player_id] int  NOT NULL ,
    [match_id] int  NOT NULL ,
    [team_id] int  NOT NULL ,
    CONSTRAINT [PK_lineups] PRIMARY KEY CLUSTERED (
        [lineup_id] ASC
    )
)

CREATE TABLE [result] (
    [result_id] int  NOT NULL ,
    [team_id] int  NOT NULL ,
    [match_id] int  NOT NULL ,
    [result] (win,loss,draw)  NOT NULL ,
    CONSTRAINT [PK_result] PRIMARY KEY CLUSTERED (
        [result_id] ASC
    )
)

COMMIT TRANSACTION QUICKDBD