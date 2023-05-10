CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL
);

CREATE TABLE medical_histories (
    id SERIAL PRIMARY KEY,
    admitted_at TIMESTAMP,
    FOREIGN KEY patient_id INT REFERENCES patients(id),
    status VARCHAR(50)
);

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    generated_at TIMESTAMP NOT NULL,
    payed_at TIMESTAMP,
    FOREIGN KEY medical_history_id INT REFERENCES medical_histories(id)
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL(10,2) NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY invoice_id INT REFERENCES invoices(id),
    FOREIGN KEY treatment_id INT REFERENCES treatments(id)
);

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    name VARCHAR(50)
)