CREATE TABLE IF NOT EXISTS Performers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS Style (
    id SERIAL PRIMARY KEY,
    name_style VARCHAR(40) NOT NULL
);
CREATE TABLE IF NOT EXISTS Performers_style (
    style_id INTEGER REFERENCES Style(id),
    performers_id INTEGER REFERENCES Performers(id),
    CONSTRAINT performers_style_id PRIMARY KEY (performers_id, style_id)
);
CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    year_of_release DATE
);
CREATE TABLE IF NOT EXISTS Performers_album (
    performers_id INTEGER REFERENCES Performers(id),
    album_id INTEGER REFERENCES Album(id),
    CONSTRAINT performers_album_id PRIMARY KEY (performers_id, album_id)
);
CREATE TABLE IF NOT EXISTS Track (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    duration TIME,
    album_id INTEGER REFERENCES Album(id)
);
CREATE TABLE IF NOT EXISTS Collection (
    id SERIAL PRIMARY KEY,
    name VARCHAR(40) NOT NULL,
    year_of_release DATE
);
CREATE TABLE IF NOT EXISTS Track_collection (
    track_id INTEGER REFERENCES Track(id),
    collection_id INTEGER REFERENCES Collection(id),
    CONSTRAINT track_collection_id PRIMARY KEY (track_id, collection_id)
);