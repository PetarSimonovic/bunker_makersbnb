CREATE TABLE bookings(id SERIAL PRIMARY KEY, property_id INTEGER REFERENCES properties (id), user_id INTEGER REFERENCES users (id), status VARCHAR(20));

-- to update use below and once everyone has delete above --

CREATE TABLE bookings(booking_id SERIAL PRIMARY KEY, property_id INTEGER REFERENCES properties (property_id), guest_id INTEGER REFERENCES users (user_id), status VARCHAR(20));
