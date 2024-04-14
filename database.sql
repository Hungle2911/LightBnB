CREATE TABLE users (
  id SERIAL PRIMARY KEY NOT NULL, 
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL
);
CREATE TABLE properties (
  id SERIAL PRIMARY KEY NOT NULL,
  owner_id INT REFERENCES users(id) ON DELETE CASCADE,
  title VARCHAR(255) NOT NULL, 
  description VARCHAR(255) NOT NULL, 
  cost_per_night INT NOT NULL, 
  parking_spaces INT NOT NULL DEFAULT 0, 
  number_of_bathrooms INT NOT NULL DEFAULT 0,  
  number_of_bedrooms INT NOT NULL DEFAULT 0,
  thumbnail_photo_url VARCHAR(255) NOT NULL,
  cover_photo_url VARCHAR(255) NOT NULL,
  country VARCHAR(255) NOT NULL, 
  street VARCHAR(255) NOT NULL, 
  city VARCHAR(255) NOT NULL, 
  province VARCHAR(255) NOT NULL, 
  post_code VARCHAR(255) NOT NULL,
  active BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE reservations (
  id SERIAL PRIMARY KEY NOT NULL,
  property_id INT REFERENCES properties(id) ON DELETE CASCADE,
  guest_id INT REFERENCES users(id) ON DELETE CASCADE,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

CREATE TABLE property_reviews (
  id SERIAL PRIMARY KEY NOT NULL,
  guest_id INT REFERENCES users(id) ON DELETE CASCADE,
  property_id INT REFERENCES properties(id) ON DELETE CASCADE,
  reservation_id INT REFERENCES reservations(id) ON DELETE CASCADE,
  rating SMALLINT NOT NULL DEFAULT 1,
  message TEXT
);
