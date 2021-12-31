-- file is meant to be used as a quick way to initialize a database with the tables to represent the medical center ERD
CREATE DATABASE IF NOT EXISTS SoccerLeague;
USE SoccerLeague;

-- added this block of statements in case the file is modified and needs to be run again
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Goals;
DROP TABLE IF EXISTS Teams;
DROP TABLE IF EXISTS Players;
DROP TABLE IF EXISTS Referees;
DROP TABLE IF EXISTS Season;
DROP TABLE IF EXISTS Results;
DROP TABLE IF EXISTS Matches;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Goals (
  id int NOT NULL,
  player_id int NOT NULL,
  match_id int NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (player_id) REFERENCES Players(id),
  FOREIGN KEY (match_id) REFERENCES Matches(id)
);

CREATE TABLE Teams (
  id int NOT NULL,
  name char(100) NOT NULL,
  city char(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE Players (
  id int NOT NULL,
  team_id int NOT NULL,
  name char(100) NOT NULL,
  date_of_birth date NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY team_id REFERENCES Teams(id)
);

CREATE TABLE Referees (
  id int NOT NULL,
  name char(100) NOT NULL,
  PRIMARY KEY (id),
);

CREATE TABLE Season (
  id int NOT NULL,
  start_date date NOT NULL,
  end_date date NOT NULL,
  PRIMARY KEY (id),
);

CREATE TABLE Results (
  id int NOT NULL,
  team_id int NOT NULL,
  match_id int NOT NULL,
  result char(4) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (team_id) REFERENCES Teams(id),
  FOREIGN KEY (match_id) REFERENCES Matches(id)
);

CREATE TABLE Matches (
  id int NOT NULL,
  home_team_id int NOT NULL,
  away_team_id int NOT NULL,
  referee_id int NOT NULL,
  season_id int NOT NULL,
  match_date date NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (home_team_id) REFERENCES Teams(id),
  FOREIGN KEY (away_team_id) REFERENCES Teams(id),
  FOREIGN KEY (referee_id) REFERENCES Referees(id),
  FOREIGN KEY (season_id) REFERENCES Season(id)
);
