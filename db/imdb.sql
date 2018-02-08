DROP TABLE casting;
DROP TABLE movie_star;
DROP TABLE movie;

CREATE TABLE movie_star (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255)
);

CREATE TABLE movie (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  genre VARCHAR(255),
  rating INT
);

CREATE TABLE casting (
  id SERIAL PRIMARY KEY,
  movie_id INT REFERENCES movie(id) ON DELETE CASCADE,
  movie_star_id INT REFERENCES movie_star(id) ON DELETE CASCADE,
  fee INT
);
