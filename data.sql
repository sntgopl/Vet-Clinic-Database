/* Populate database with sample data. */

insert into animals values (1, 'Agumon', '2020-02-03', 0, true, 10.23);
insert into animals (id, name, date_of_birth, escape_attemps, neutered, weight_kg)
    values (2, 'Gabumon', '2018-11-15', 2, true, 8.0),
        (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
        (4, 'Devimon', '2017-05-12', 5, true, 11.0);