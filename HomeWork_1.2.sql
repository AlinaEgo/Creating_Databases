CREATE TABLE IF NOT EXISTS Department (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Employee (
    id SERIAL PRIMARY KEY, 
    name VARCHAR(150) NOT NULL,
    department_id INTEGER REFERENCES Department(id),
    head_id INTEGER REFERENCES Employee(id)
);