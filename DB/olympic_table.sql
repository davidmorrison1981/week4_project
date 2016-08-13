DROP TABLE participation;
DROP TABLE events;
DROP TABLE nations;
DROP TABLE athletes;

CREATE TABLE athletes(
id serial4 PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE events(
id serial4 PRIMARY KEY,
sport VARCHAR(255),
athlete_id int4 references athletes(id) ON DELETE CASCADE
);

CREATE TABLE nations(
id serial4 PRIMARY KEY,
country VARCHAR(255),
athlete_id int4 references athletes(id) ON DELETE CASCADE
);

CREATE TABLE participation(
id serial4 PRIMARY KEY,
athlete_id int4 references athletes(id) ON DELETE CASCADE,
event_id int4 references events(id) ON DELETE CASCADE
);