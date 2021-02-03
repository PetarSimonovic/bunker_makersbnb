CREATE TABLE properties(id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(200), price DECIMAL(8,2), availability VARCHAR(25));

"Ensure "users" table is created then:"

ALTER TABLE properties ADD "host" INTEGER REFERENCES users (id);


-- to update use below and once everyone has delete above --
CREATE TABLE properties(property_id SERIAL PRIMARY KEY, name VARCHAR(60), description VARCHAR(200), price DECIMAL(8,2), availability VARCHAR(25));

"Ensure "users" table is created then:"

ALTER TABLE properties ADD host_id INTEGER REFERENCES users (user_id);