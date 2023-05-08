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

SELECT animals.name FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

SELECT animals.name FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

SELECT species.name, COUNT(*) AS num_animals
FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;

SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

SELECT animals.name FROM animals
JOIN owners on animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attemps = 0;

SELECT owners.full_name, COUNT(*) as num_animals FROM animals
JOIN owners ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY num_animals DESC
LIMIT 1;

SELECT animals.name FROM animals
JOIN visits ON animals.id = visits.animal_id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'William Tatcher'
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT visits.animal_id) AS num_animals FROM visits
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez';

SELECT vets.name, species.name FROM specialization
JOIN vets ON specialization.vet_id = vets.id
JOIN species ON specialization.species_id = species.id;

SELECT animals.name, visits.visit_date FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Stephanie Mendez' AND visits.visit_date BETWEEN '2020-04-01' AND '2020-08-30';

SELECT animals.name, COUNT (visits.animal_id) FROM visits
JOIN animals ON visits.animal_id = animals.id
GROUP BY animals.name
ORDER BY COUNT (visits.animal_id) DESC
LIMIT 1;

SELECT animals.name, visits.visit_date FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
WHERE vets.name = 'Maisy Smith'
ORDER BY visits.visit_date ASC
LIMIT 1;

SELECT animals.name, vets.name, visits.visit_date FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
ORDER BY visits.visit_date DESC
LIMIT 1;

SELECT COUNT(visits.animal_id) FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
JOIN specialization ON vets.id = specialization.vet_id
WHERE specialization.species_id != animals.species_id;

SELECT COUNT(species.name) AS spec_visits, species.name FROM visits
JOIN vets ON visits.vet_id = vets.id
JOIN animals ON visits.animal_id = animals.id
JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name;

SELECT COUNT(*) FROM visits where animal_id = 4;
SELECT * FROM visits where vet_id = 2;
SELECT * FROM owners where email = 'owner_18327@mail.com';