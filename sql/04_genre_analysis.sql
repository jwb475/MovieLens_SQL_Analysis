-- ===== GENRE ANALYSIS & MOVIE RECOMMENDATIONS =====

-- 1. Most Popular Genres by Rating Count
WITH genre_stats AS (
    SELECT 'Action' as genre, 
           COUNT(CASE WHEN m.action = 1 THEN 1 END) as ratings_count,
           ROUND(AVG(CASE WHEN m.action = 1 THEN r.rating END), 2) as avg_rating
    FROM movies m
    JOIN ratings r ON m.movie_id = r.movie_id
    WHERE m.action = 1
    UNION ALL
    SELECT 'Comedy',
           COUNT(CASE WHEN m.comedy = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.comedy = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.comedy = 1
    UNION ALL
    SELECT 'Drama',
           COUNT(CASE WHEN m.drama = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.drama = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.drama = 1
    UNION ALL
    SELECT 'Thriller',
           COUNT(CASE WHEN m.thriller = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.thriller = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.thriller = 1
    UNION ALL
    SELECT 'Romance',
           COUNT(CASE WHEN m.romance = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.romance = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.romance = 1
    UNION ALL
    SELECT 'Horror',
           COUNT(CASE WHEN m.horror = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.horror = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.horror = 1
    UNION ALL
    SELECT 'Sci-Fi',
           COUNT(CASE WHEN m.sci_fi = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.sci_fi = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.sci_fi = 1
    UNION ALL
    SELECT 'Adventure',
           COUNT(CASE WHEN m.adventure = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.adventure = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.adventure = 1
    UNION ALL
    SELECT 'Animation',
           COUNT(CASE WHEN m.animation = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.animation = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.animation = 1
    UNION ALL
    SELECT 'Children',
           COUNT(CASE WHEN m.children = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.children = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.children = 1
    UNION ALL
    SELECT 'Crime',
           COUNT(CASE WHEN m.crime = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.crime = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.crime = 1
    UNION ALL
    SELECT 'Documentary',
           COUNT(CASE WHEN m.documentary = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.documentary = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.documentary = 1
    UNION ALL
    SELECT 'Fantasy',
           COUNT(CASE WHEN m.fantasy = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.fantasy = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.fantasy = 1
    UNION ALL
    SELECT 'Film-Noir',
           COUNT(CASE WHEN m.film_noir = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.film_noir = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.film_noir = 1
    UNION ALL
    SELECT 'Musical',
           COUNT(CASE WHEN m.musical = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.musical = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.musical = 1
    UNION ALL
    SELECT 'Mystery',
           COUNT(CASE WHEN m.mystery = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.mystery = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.mystery = 1
    UNION ALL
    SELECT 'War',
           COUNT(CASE WHEN m.war = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.war = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.war = 1
    UNION ALL
    SELECT 'Western',
           COUNT(CASE WHEN m.western = 1 THEN 1 END),
           ROUND(AVG(CASE WHEN m.western = 1 THEN r.rating END), 2)
    FROM movies m JOIN ratings r ON m.movie_id = r.movie_id WHERE m.western = 1
)
SELECT 
    genre, 
    ratings_count,
    avg_rating
FROM genre_stats
ORDER BY ratings_count DESC;

-- 2. Highest Rated Movies by Genre (Min 50 ratings)
WITH movie_stats AS (
    SELECT 
        m.movie_id,
        m.title,
        COUNT(r.rating) as rating_count,
        ROUND(AVG(r.rating), 2) as avg_rating
    FROM movies m
    JOIN ratings r ON m.movie_id = r.movie_id
    GROUP BY m.movie_id, m.title
    HAVING COUNT(r.rating) >= 50
)
SELECT 
    'Action' as genre,
    ms.title,
    ms.rating_count,
    ms.avg_rating
FROM movie_stats ms
JOIN movies m ON ms.movie_id = m.movie_id
WHERE m.action = 1
ORDER BY ms.avg_rating DESC, ms.rating_count DESC
LIMIT 10;

-- 3. Genre Combinations Analysis
SELECT 
    CASE 
        WHEN action = 1 AND comedy = 1 THEN 'Action-Comedy'
        WHEN action = 1 AND thriller = 1 THEN 'Action-Thriller'
        WHEN drama = 1 AND romance = 1 THEN 'Drama-Romance'
        WHEN comedy = 1 AND romance = 1 THEN 'Romantic-Comedy'
        WHEN sci_fi = 1 AND thriller = 1 THEN 'Sci-Fi-Thriller'
        WHEN horror = 1 AND thriller = 1 THEN 'Horror-Thriller'
        ELSE 'Other'
    END as genre_combo,
    COUNT(DISTINCT m.movie_id) as movie_count,
    COUNT(r.rating) as total_ratings,
    ROUND(AVG(r.rating), 2) as avg_rating
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
WHERE genre_combo != 'Other'
GROUP BY genre_combo
HAVING COUNT(r.rating) >= 100
ORDER BY avg_rating DESC;

-- 4. Movie Recommendations: Similar Users Approach
-- Find movies that users with similar taste enjoyed
WITH target_user_ratings AS (
    -- Change user_id = 1 to any user you want recommendations for
    SELECT movie_id, rating
    FROM ratings
    WHERE user_id = 1 AND rating >= 4
),
similar_users AS (
    SELECT 
        r.user_id,
        COUNT(*) as common_movies,
        ROUND(AVG(r.rating), 2) as their_avg_rating
    FROM ratings r
    JOIN target_user_ratings t ON r.movie_id = t.movie_id
    WHERE r.user_id != 1 AND r.rating >= 4
    GROUP BY r.user_id
    HAVING COUNT(*) >= 3
    ORDER BY common_movies DESC
    LIMIT 20
),
recommended_movies AS (
    SELECT 
        m.movie_id,
        m.title,
        COUNT(r.rating) as recommendation_score,
        ROUND(AVG(r.rating), 2) as avg_rating
    FROM ratings r
    JOIN similar_users su ON r.user_id = su.user_id
    JOIN movies m ON r.movie_id = m.movie_id
    WHERE r.rating >= 4
    AND r.movie_id NOT IN (SELECT movie_id FROM ratings WHERE user_id = 1)
    GROUP BY m.movie_id, m.title
)
SELECT 
    title,
    recommendation_score,
    avg_rating
FROM recommended_movies
ORDER BY recommendation_score DESC, avg_rating DESC
LIMIT 10;

-- 5. Underrated Gems (High avg rating but low rating count)
SELECT 
    m.title,
    COUNT(r.rating) as rating_count,
    ROUND(AVG(r.rating), 2) as avg_rating,
    CASE 
        WHEN m.action = 1 THEN 'Action'
        WHEN m.comedy = 1 THEN 'Comedy'
        WHEN m.drama = 1 THEN 'Drama'
        WHEN m.thriller = 1 THEN 'Thriller'
        WHEN m.romance = 1 THEN 'Romance'
        ELSE 'Other'
    END as primary_genre
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.movie_id, m.title
HAVING COUNT(r.rating) BETWEEN 10 AND 30
AND AVG(r.rating) >= 4.0
ORDER BY avg_rating DESC, rating_count ASC
LIMIT 15;

-- 6. Controversial Movies (High variance in ratings)
WITH movie_variance AS (
    SELECT 
        m.movie_id,
        m.title,
        COUNT(r.rating) as rating_count,
        ROUND(AVG(r.rating), 2) as avg_rating,
        ROUND(AVG(r.rating * r.rating) - AVG(r.rating) * AVG(r.rating), 2) as variance
    FROM movies m
    JOIN ratings r ON m.movie_id = r.movie_id
    GROUP BY m.movie_id, m.title
    HAVING COUNT(r.rating) >= 50
)
SELECT 
    title,
    rating_count,
    avg_rating,
    variance,
    CASE 
        WHEN variance >= 3.0 THEN 'Highly Controversial'
        WHEN variance >= 2.0 THEN 'Somewhat Divisive'
        ELSE 'Generally Agreed Upon'
    END as controversy_level
FROM movie_variance
ORDER BY variance DESC
LIMIT 20;

-- 7. Genre Popularity Over Time
SELECT 
    CASE 
        WHEN CAST(SUBSTR(release_date, -4) as INTEGER) < 1980 THEN '1970s'
        WHEN CAST(SUBSTR(release_date, -4) as INTEGER) < 1990 THEN '1980s'
        WHEN CAST(SUBSTR(release_date, -4) as INTEGER) < 2000 THEN '1990s'
        ELSE '2000s'
    END as decade,
    SUM(CASE WHEN action = 1 THEN 1 ELSE 0 END) as action_count,
    SUM(CASE WHEN comedy = 1 THEN 1 ELSE 0 END) as comedy_count,
    SUM(CASE WHEN drama = 1 THEN 1 ELSE 0 END) as drama_count,
    SUM(CASE WHEN sci_fi = 1 THEN 1 ELSE 0 END) as scifi_count,
    SUM(CASE WHEN horror = 1 THEN 1 ELSE 0 END) as horror_count
FROM movies
WHERE release_date != '' 
AND CAST(SUBSTR(release_date, -4) as INTEGER) >= 1970
GROUP BY decade
ORDER BY decade;

-- 8. Most Consistently Rated Movies (Low variance)
WITH movie_consistency AS (
    SELECT 
        m.movie_id,
        m.title,
        COUNT(r.rating) as rating_count,
        ROUND(AVG(r.rating), 2) as avg_rating,
        ROUND(AVG(r.rating * r.rating) - AVG(r.rating) * AVG(r.rating), 2) as variance
    FROM movies m
    JOIN ratings r ON m.movie_id = r.movie_id
    GROUP BY m.movie_id, m.title
    HAVING COUNT(r.rating) >= 50
)
SELECT 
    title,
    rating_count,
    avg_rating,
    variance
FROM movie_consistency
WHERE avg_rating >= 4.0
ORDER BY variance ASC, avg_rating DESC
LIMIT 15;