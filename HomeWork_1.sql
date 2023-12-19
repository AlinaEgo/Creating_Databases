CREATE TABLE IF NOT EXISTS Music_genres (
    id SERIAL PRIMARY KEY,
    music_genre_name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Music_artists (
    id SERIAL PRIMARY KEY,
    music_artist_name VARCHAR(80) NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres_artists (
    music_genre_id INTEGER NOT NULL REFERENCES Music_genres(id),
    music_artist_id INTEGER NOT NULL REFERENCES Music_artists(id),
    CONSTRAINT genres_artist_pk PRIMARY KEY(music_genre_id, music_artist_id)
);
  
CREATE TABLE IF NOT EXISTS Albums (
    id SERIAL PRIMARY KEY,
    album_name VARCHAR(80) NOT NULL,
    album_release_year date NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums_music_artists (
    album_id INTEGER NOT NULL REFERENCES Albums(id),
    music_artist_id INTEGER NOT NULL REFERENCES Music_artists(id),
    CONSTRAINT album_music_artist_pk PRIMARY KEY(album_id, music_artist_id)
);

CREATE TABLE IF NOT EXISTS Tracks (
    id SERIAL PRIMARY KEY,
    track_name VARCHAR(80) NOT NULL,
    track_duration INTEGER NOT NULL,
    album_id INTEGER NOT NULL REFERENCES Albums(id)
);

CREATE TABLE IF NOT EXISTS Collections (
    id SERIAL PRIMARY KEY,
    collection_name VARCHAR(80) NOT NULL,
    collection_release_year date NOT NULL
);
  
CREATE TABLE IF NOT EXISTS Tracks_collections (
    collection_id INTEGER NOT NULL REFERENCES Collections(id),
    track_id INTEGER NOT NULL REFERENCES Tracks(id),
    CONSTRAINT track_collection_id PRIMARY KEY(collection_id, track_id)
);