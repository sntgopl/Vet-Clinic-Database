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
