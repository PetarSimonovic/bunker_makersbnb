CREATE TABLE bookings(id SERIAL PRIMARY KEY, property_id INTEGER REFERENCES properties (id), user_id INTEGER REFERENCES users (id), status VARCHAR(20));
