/*Queries that provide answers to the questions from all projects.*/

select * from animals where name like '%mon';
select name from animals where date_of_birth between '2016-01-01' and '2019-12-31';
select name from animals where neutered = true and escape_attemps < 3;
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';
select name, escape_attemps from animals where weight_kg > 10.5;
select * from animals where neutered = true;
select * from animals where name != 'Gabumon';
select * from animals where weight_kg >= 10.4 and weight_kg <=17.3;

BEGIN TRANSACTION;
UPDATE animals
    SET species = 'unspecified';
ROLLBACK;
BEGIN TRANSACTION;
UPDATE animals SET species = 'pokemon';
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';
COMMIT;

BEGIN TRANSACTION;
DELETE FROM animals;
ROLLBACK;

BEGIN TRANSACTION;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
COMMIT

SELECT COUNT (name) FROM animals;
SELECT COUNT (name) FROM animals WHERE escape_attemps = 0;
SELECT AVG (weight_kg) FROM animals;
SELECT SUM (escape_attemps), neutered FROM animals GROUP BY neutered;
SELECT species, MAX (weight_kg), MIN (weight_kg) FROM animals GROUP BY species;
SELECT species, AVG (escape_attemps) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31' GROUP BY species;