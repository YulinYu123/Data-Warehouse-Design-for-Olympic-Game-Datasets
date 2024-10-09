-- Create table dim_athlete to store athlete information containing athlete ID and athlete full name:
CREATE TABLE dim_athlete (
    "Athlete ID" INT PRIMARY KEY, -- primary key
    "Athlete Full Name" VARCHAR(255) NOT NULL
);

-- Create table dim_medal_types to store medal types information containing medal type ID and medal type:
CREATE TABLE dim_medal_types (
    "Medal Type ID" INT PRIMARY KEY, -- primary key
    "Medal Type" VARCHAR(50) NOT NULL
);

-- Create table dim_time to store time information containing game year ID and game year:
CREATE TABLE dim_time (
    "Game Year ID" INT PRIMARY KEY, -- primary key
    "Game Year" VARCHAR(50) NOT NULL
);

-- Create table dim_discipline to store discipline information containing discipline ID, discipline title, participant type
CREATE TABLE dim_discipline (
    "Discipline ID" INT PRIMARY KEY, -- primary key
    "Discipline Title" VARCHAR(255) NOT NULL,
    "Participant Type" VARCHAR(255) NOT NULL,
    "Event Gender" VARCHAR(50) NOT NULL,
    "Event Title" VARCHAR(255) NOT NULL
);

-- Create table dim_olympic_game to store olympic game information containing olympic game ID, game season, slug game
CREATE TABLE dim_olympic_game (
    "Olympic Game ID" INT PRIMARY KEY, -- primary key
    "Game Season" VARCHAR(50) NOT NULL,
    "Slug Game" VARCHAR(255) NOT NULL
);

-- Create table dim_location to store location information containing location ID, continent, country name
CREATE TABLE dim_location (
    "Location ID" INT PRIMARY KEY, -- primary key
    "Continent" VARCHAR(50) NOT NULL,
    "Country Name" VARCHAR(255) NOT NULL
);

-- Create table fact_medals_count to store all IDs
CREATE TABLE fact_medals_count (
	"Medals Fact ID" SERIAL PRIMARY KEY, -- primary key with auto increment
    "Game Year ID" INT NOT NULL, -- foreign key to dim_time
    "Athlete ID" INT NOT NULL, -- foreign key to dim_athlete
    "Medal Type ID" INT NOT NULL, -- foreign key to dim_medal_types
    "Location ID" INT NOT NULL, -- foreign key to dim_location
    "Olympic Game ID" INT NOT NULL, -- foreign key to dim_olympic_game
    "Discipline ID" INT NOT NULL, -- foreign key to dim_discipline
    medal_count INT DEFAULT 1, -- column to store the count of medals, with default value 1
    FOREIGN KEY ("Game Year ID") REFERENCES dim_time("Game Year ID"), -- dim_time foreign key constraint
    FOREIGN KEY ("Athlete ID") REFERENCES dim_athlete("Athlete ID"), -- dim_athlete foreign key constraint
    FOREIGN KEY ("Medal Type ID") REFERENCES dim_medal_types("Medal Type ID"), -- dim_medal_types foreign key constraint
    FOREIGN KEY ("Location ID") REFERENCES dim_location("Location ID"), -- dim_location foreign key constraint
    FOREIGN KEY ("Olympic Game ID") REFERENCES dim_olympic_game("Olympic Game ID"), -- dim_olympic_game foreign key constraint
    FOREIGN KEY ("Discipline ID") REFERENCES dim_discipline("Discipline ID") -- dim_discipline foreign key constraint
);

