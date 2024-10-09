-- Create table dim_year to store year information containing year ID and year:
CREATE TABLE dim_year (
    "Year ID" INT PRIMARY KEY, -- primary key 
    "Year" VARCHAR(50) NOT NULL
);

-- Create table dim_mental_illness_location to store mental illness location information containing mental illness location ID, continent, country:
CREATE TABLE dim_mental_illness_location (
    "Mental Illness Location ID" INT PRIMARY KEY, -- primary key
    "Continent" VARCHAR(255) NOT NULL, 
    "Country" VARCHAR(255) NOT NULL
);

-- Create table dim_host_types to store host types information containing host type ID and host type:
CREATE TABLE dim_host_types (
    "Host Type ID" INT PRIMARY KEY, -- primary key
    "Host Type" VARCHAR(255) NOT NULL
);

-- Create table fact_mental_illness_DALYs to store all IDs and DALYs from different mental illnesses:
CREATE TABLE fact_mental_illness_DALYs (
    "Mental Illness DALYs Fact ID" SERIAL PRIMARY KEY, -- primary key with auto increment
    "Year ID" INT NOT NULL, -- foreign key to dim_year
    "Mental Illness Location ID" INT NOT NULL, -- foreign key to dim_mental_illness_location
    "Host Type ID" INT NOT NULL, -- foreign key to dim_host_types
    "DALYs from depressive disorders" FLOAT NOT NULL, 
    "DALYs from schizophrenia" FLOAT NOT NULL,
    "DALYs from bipolar disorder" FLOAT NOT NULL,
    "DALYs from eating disorders" FLOAT NOT NULL,
    "DALYs from anxiety disorders" FLOAT NOT NULL,
    FOREIGN KEY ("Year ID") REFERENCES dim_year("Year ID"), -- dim_year foreign key constraint
    FOREIGN KEY ("Mental Illness Location ID") REFERENCES dim_mental_illness_location("Mental Illness Location ID"), -- dim_mental_illness_location foreign key constraint
    FOREIGN KEY ("Host Type ID") REFERENCES dim_host_types("Host Type ID") -- dim_host_types foreign key constraint
);