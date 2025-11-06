-- Create users table
CREATE TABLE users (
    user_id INTEGER PRIMARY KEY,
    age INTEGER,
    gender TEXT,
    occupation TEXT,
    zip_code TEXT
);

-- Create movies table
CREATE TABLE movies (
    movie_id INTEGER PRIMARY KEY,
    title TEXT,
    release_date TEXT,
    video_release_date TEXT,
    imdb_url TEXT,
    unknown INTEGER,
    action INTEGER,
    adventure INTEGER,
    animation INTEGER,
    children INTEGER,
    comedy INTEGER,
    crime INTEGER,
    documentary INTEGER,
    drama INTEGER,
    fantasy INTEGER,
    film_noir INTEGER,
    horror INTEGER,
    musical INTEGER,
    mystery INTEGER,
    romance INTEGER,
    sci_fi INTEGER,
    thriller INTEGER,
    war INTEGER,
    western INTEGER
);

-- Create ratings table
CREATE TABLE ratings (
    user_id INTEGER,
    movie_id INTEGER,
    rating INTEGER,
    timestamp INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);