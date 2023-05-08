/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    id int primary key,
    name varchar(50) not null,
    date_of_birth date not null,
    escape_attemps int not null default 0,
    neutered boolean not null default false,
    weight_kg decimal (6,2) not null default 0
);

ALTER TABLE animals ADD species VARCHAR(50);

CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    age INT
);

CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255)
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(250),
    age INT,
    date_of_graduation DATE
);

CREATE TABLE specialization (
    id SERIAL PRIMARY KEY,
    species_id INT REFERENCES species(id),
    vet_id INT REFERENCES vets(id)
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animal_id INT REFERENCES animals(id),
    vet_id INT REFERENCES vets(id),
    visit_date DATE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

CREATE INDEX vet_id_index ON visits(vet_id);
    
CREATE INDEX animal_id_asc ON visits (animal_id ASC);

CREATE INDEX email_id_asc ON owners (email ASC);

    
    
