-- ===== USER BEHAVIOR ANALYSIS =====

-- 1. Most Active Users (Top 10 raters)
SELECT 
    u.user_id,
    u.age,
    u.gender,
    u.occupation,
    COUNT(r.rating) as total_ratings,
    ROUND(AVG(r.rating), 2) as avg_rating
FROM users u
JOIN ratings r ON u.user_id = r.user_id
GROUP BY u.user_id, u.age, u.gender, u.occupation
ORDER BY total_ratings DESC
LIMIT 10;

-- 2. Rating Distribution by Demographics
SELECT 
    u.gender,
    COUNT(DISTINCT u.user_id) as user_count,
    COUNT(r.rating) as total_ratings,
    ROUND(AVG(r.rating), 2) as avg_rating,
    ROUND(COUNT(r.rating) * 1.0 / COUNT(DISTINCT u.user_id), 2) as ratings_per_user
FROM users u
LEFT JOIN ratings r ON u.user_id = r.user_id
GROUP BY u.gender
ORDER BY user_count DESC;

-- 3. Most Critical vs Most Generous Users
WITH user_stats AS (
    SELECT 
        u.user_id,
        u.occupation,
        COUNT(r.rating) as rating_count,
        ROUND(AVG(r.rating), 2) as avg_rating
    FROM users u
    JOIN ratings r ON u.user_id = r.user_id
    GROUP BY u.user_id, u.occupation
    HAVING COUNT(r.rating) >= 20
),
critical AS (
    SELECT 'Most Critical' as user_type, * FROM user_stats ORDER BY avg_rating ASC LIMIT 5
),
generous AS (
    SELECT 'Most Generous' as user_type, * FROM user_stats ORDER BY avg_rating DESC LIMIT 5
)
SELECT * FROM critical
UNION ALL
SELECT * FROM generous;

-- 4. Age Group Analysis
SELECT
    CASE 
        WHEN age < 18 THEN 'Under 18'
        WHEN age BETWEEN 18 AND 24 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END as age_group,
    COUNT(DISTINCT u.user_id) as user_count,
    COUNT(r.rating) as total_ratings,
    ROUND(AVG(r.rating), 2) as avg_rating,
    ROUND(COUNT(r.rating) * 1.0 / COUNT(DISTINCT u.user_id), 2) as ratings_per_user
FROM users u
JOIN ratings r ON u.user_id = r.user_id
GROUP BY age_group
ORDER BY age_group;

-- 5. Occupation Insights
SELECT 
    u.occupation,
    COUNT(DISTINCT u.user_id) as user_count,
    COUNT(r.rating) as total_ratings,
    ROUND(AVG(r.rating), 2) as avg_rating,
    MIN(r.rating) as min_rating,
    MAX(r.rating) as max_rating
FROM users u
JOIN ratings r ON u.user_id = r.user_id
GROUP BY u.occupation
ORDER BY total_ratings DESC;

-- 6. Rating Behavior Patterns (Rating Distribution)
SELECT 
    r.rating,
    COUNT(*) as count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM ratings), 2) as percentage
FROM ratings r
GROUP BY r.rating
ORDER BY r.rating;

-- 7. Power Users vs Casual Users
SELECT 
    CASE 
        WHEN rating_count >= 100 THEN 'Power User (100+)'
        WHEN rating_count >= 50 THEN 'Active User (50-99)'
        WHEN rating_count >= 20 THEN 'Regular User (20-49)'
        ELSE 'Casual User (<20)'
    END as user_segment,
    COUNT(*) as user_count,
    ROUND(AVG(avg_rating), 2) as segment_avg_rating
FROM (
    SELECT 
        u.user_id,
        COUNT(r.rating) as rating_count,
        AVG(r.rating) as avg_rating
    FROM users u
    JOIN ratings r ON u.user_id = r.user_id
    GROUP BY u.user_id
) user_activity
GROUP BY user_segment
ORDER BY MIN(rating_count) DESC;

-- Distribution of Ratings Across Movies
SELECT 
    CASE 
        WHEN rating_count >= 100 THEN '100+ ratings'
        WHEN rating_count >= 50 THEN '50-99 ratings'
        WHEN rating_count >= 10 THEN '10-49 ratings'
        ELSE '<10 ratings'
    END as rating_bracket,
    COUNT(*) as movie_count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT movie_id) FROM ratings), 2) as percentage
FROM (
    SELECT 
        movie_id,
        COUNT(*) as rating_count
    FROM ratings
    GROUP BY movie_id
) movie_ratings
GROUP BY rating_bracket
ORDER BY MIN(rating_count) DESC;

-- What percentage of total ratings go to each bracket?
SELECT 
    CASE 
        WHEN rating_count >= 100 THEN '100+ ratings'
        WHEN rating_count >= 50 THEN '50-99 ratings'
        WHEN rating_count >= 10 THEN '10-49 ratings'
        ELSE '<10 ratings'
    END as rating_bracket,
    COUNT(*) as movie_count,
    SUM(rating_count) as total_ratings_in_bracket,
    ROUND(SUM(rating_count) * 100.0 / (SELECT COUNT(*) FROM ratings), 2) as percentage_of_all_ratings
FROM (
    SELECT 
        movie_id,
        COUNT(*) as rating_count
    FROM ratings
    GROUP BY movie_id
) movie_ratings
GROUP BY rating_bracket
ORDER BY MIN(rating_count) DESC;