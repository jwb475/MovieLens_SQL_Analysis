-- ===== ADVANCED USER BEHAVIOR ANALYSIS =====

-- 1. User Engagement Over Time (Monthly Activity)
SELECT 
    strftime('%Y-%m', datetime(timestamp, 'unixepoch')) as month,
    COUNT(DISTINCT user_id) as active_users,
    COUNT(*) as total_ratings,
    ROUND(AVG(rating), 2) as avg_rating
FROM ratings
GROUP BY month
ORDER BY month;

-- 2. User Retention: First-time vs Repeat Raters
WITH user_first_rating AS (
    SELECT 
        user_id,
        MIN(timestamp) as first_rating_time
    FROM ratings
    GROUP BY user_id
),
user_activity AS (
    SELECT 
        r.user_id,
        COUNT(*) as total_ratings,
        MIN(r.timestamp) as first_rating,
        MAX(r.timestamp) as last_rating,
        ROUND((MAX(r.timestamp) - MIN(r.timestamp)) / 86400.0, 2) as days_active
    FROM ratings r
    GROUP BY r.user_id
)
SELECT 
    CASE 
        WHEN total_ratings = 1 THEN 'One-time Rater'
        WHEN total_ratings BETWEEN 2 AND 5 THEN 'Occasional (2-5)'
        WHEN total_ratings BETWEEN 6 AND 20 THEN 'Regular (6-20)'
        WHEN total_ratings BETWEEN 21 AND 50 THEN 'Active (21-50)'
        ELSE 'Power User (50+)'
    END as user_type,
    COUNT(*) as user_count,
    ROUND(AVG(days_active), 2) as avg_days_active,
    ROUND(AVG(total_ratings), 2) as avg_ratings
FROM user_activity
GROUP BY user_type
ORDER BY MIN(total_ratings);

-- 3. User Rating Consistency (Variance by User)
WITH user_rating_stats AS (
    SELECT 
        u.user_id,
        u.occupation,
        COUNT(r.rating) as rating_count,
        ROUND(AVG(r.rating), 2) as avg_rating,
        ROUND(AVG(r.rating * r.rating) - AVG(r.rating) * AVG(r.rating), 2) as variance
    FROM users u
    JOIN ratings r ON u.user_id = r.user_id
    GROUP BY u.user_id, u.occupation
    HAVING COUNT(r.rating) >= 20
)
SELECT 
    user_id,
    occupation,
    rating_count,
    avg_rating,
    variance,
    CASE 
        WHEN variance < 0.25 THEN 'Very Consistent'
        WHEN variance < 0.5 THEN 'Consistent'
        WHEN variance < 1.0 THEN 'Moderate'
        WHEN variance < 2.0 THEN 'Variable'
        ELSE 'Highly Variable'
    END as rating_consistency
FROM user_rating_stats
ORDER BY variance ASC
LIMIT 20;

-- 4. Top 3 Most Active Users per Occupation
WITH user_stats AS (
    SELECT 
        u.occupation,
        u.user_id,
        COUNT(r.rating) as rating_count,
        ROUND(AVG(r.rating), 2) as avg_rating
    FROM users u
    JOIN ratings r ON u.user_id = r.user_id
    GROUP BY u.occupation, u.user_id
),
ranked_users AS (
    SELECT 
        occupation,
        user_id,
        rating_count,
        avg_rating,
        RANK() OVER (PARTITION BY occupation ORDER BY rating_count DESC) as activity_rank
    FROM user_stats
),
occupation_averages AS (
    SELECT 
        occupation,
        ROUND(AVG(rating_count), 2) as occupation_avg_ratings
    FROM user_stats
    GROUP BY occupation
)
SELECT 
    r.occupation,
    r.user_id,
    r.rating_count,
    r.avg_rating,
    r.activity_rank,
    o.occupation_avg_ratings
FROM ranked_users r
JOIN occupation_averages o ON r.occupation = o.occupation
WHERE r.activity_rank <= 3
ORDER BY r.occupation, r.activity_rank;

-- 5. Gender Differences in Movie Preferences by Genre
SELECT 
    u.gender,
    CASE 
        WHEN m.action = 1 THEN 'Action'
        WHEN m.comedy = 1 THEN 'Comedy'
        WHEN m.drama = 1 THEN 'Drama'
        WHEN m.thriller = 1 THEN 'Thriller'
        WHEN m.romance = 1 THEN 'Romance'
        WHEN m.horror = 1 THEN 'Horror'
        WHEN m.sci_fi = 1 THEN 'Sci-Fi'
        ELSE 'Other'
    END as genre,
    COUNT(*) as rating_count,
    ROUND(AVG(r.rating), 2) as avg_rating
FROM users u
JOIN ratings r ON u.user_id = r.user_id
JOIN movies m ON r.movie_id = m.movie_id
WHERE genre != 'Other'
GROUP BY u.gender, genre
ORDER BY u.gender, rating_count DESC;

-- 6. User Cohort Analysis (by Age & Gender)
SELECT 
    u.gender,
    CASE 
        WHEN u.age < 25 THEN 'Young'
        WHEN u.age BETWEEN 25 AND 40 THEN 'Adult'
        ELSE 'Mature'
    END as age_cohort,
    COUNT(DISTINCT u.user_id) as users,
    COUNT(r.rating) as total_ratings,
    ROUND(AVG(r.rating), 2) as avg_rating,
    ROUND(COUNT(r.rating) * 1.0 / COUNT(DISTINCT u.user_id), 2) as ratings_per_user
FROM users u
LEFT JOIN ratings r ON u.user_id = r.user_id
GROUP BY u.gender, age_cohort
ORDER BY u.gender, age_cohort;

-- 7. Identify "Contrarian" Users (Rate differently than average)
WITH movie_avg_ratings AS (
    SELECT 
        movie_id,
        AVG(rating) as movie_avg_rating,
        COUNT(*) as rating_count
    FROM ratings
    GROUP BY movie_id
    HAVING COUNT(*) >= 10
),
user_deviation AS (
    SELECT 
        r.user_id,
        u.occupation,
        COUNT(*) as movies_rated,
        ROUND(AVG(ABS(r.rating - m.movie_avg_rating)), 2) as avg_deviation
    FROM ratings r
    JOIN movie_avg_ratings m ON r.movie_id = m.movie_id
    JOIN users u ON r.user_id = u.user_id
    GROUP BY r.user_id, u.occupation
    HAVING COUNT(*) >= 20
)
SELECT 
    user_id,
    occupation,
    movies_rated,
    avg_deviation,
    CASE 
        WHEN avg_deviation > 1.5 THEN 'Highly Contrarian'
        WHEN avg_deviation > 1.0 THEN 'Somewhat Contrarian'
        ELSE 'Mainstream'
    END as user_style
FROM user_deviation
ORDER BY avg_deviation DESC
LIMIT 20;