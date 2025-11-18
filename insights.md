# MovieLens Analysis: Key Insights & Findings

## Executive Summary
This document presents the key findings from analyzing 100,000 movie ratings from 943 users. The analysis reveals significant patterns in user behavior, demographic preferences, and movie rating trends that provide actionable insights for content recommendation and user engagement strategies.

---

## 1. User Behavior Patterns

### 1.1 User Activity Distribution

**Finding**: The user base shows a clear power law distribution in activity levels.

**Data**:
- Power Users (100+ ratings): ~38% of users
- Active Users (50-99 ratings): ~22% of users
- Regular Users (20-49 ratings): ~40% of users

**Insight**: 
A small percentage of highly engaged users contribute disproportionately to the platform's activity. This suggests that retention efforts should focus on converting casual users to active users, while maintaining power user engagement through exclusive features or recognition programs.

**Business Implication**: 
- Design gamification features to encourage casual users to rate more movies
- Create VIP programs for power users
- Focus retention efforts on users who hit the 20-50 rating milestone

---

### 1.2 Rating Distribution

**Finding**: Ratings are skewed towards the lower end of the scale, with more critical (1 and 2 stars) than positive (4 and 5 stars) ratings.

**Data**:

|Rating | Count | Percentage|
|-------|-------|-----------|
|5      | 6110  | 6.11%     |
|4      | 11370 | 11.37%    |
|3      | 27145 | 27.14%    |
|2      | 34174 | 34.17%    |
|1      | 21201 | 21.2%     |


**Insight**:
Users are more likely to be critical, with 55.37% of all ratings being a 1 or 2, compared to only 17.48% being a 4 or 5. The most common rating is 2 stars. This indicates a critical user base, not a positive-bias one.

**Business Implication**:
Recommendation systems should not be overly-penalized by low average scores; a 3.5 average rating may be exceptionally high on this platform. Use percentile ranks or normalized scores rather than raw averages for comparisons.

---

### 1.3 User Consistency & Rating Patterns

**Finding**: Users display a wide range of rating consistency; some users rate most movies similarly, while others use the full range of the scale.

**Key Metrics**:
- Most consistent users: [1.04 < X]
- Most variable users: [2.48 > Y]

**Insight**:
Consistent raters (low variance) are predictable and may prefer a specific niche or quality level, making their future preferences easier to model. Variable raters (high variance) may be more exploratory and open to diverse recommendations.

---

## 2. Demographic Insights

### 2.1 Age Group Analysis

**Finding**: User activity (ratings per user) steadily declines with age, while average rating score (generosity) generally increases, peaking in the 45-54 group.

**Data by Age Group**:
| Age Group | User Count | Avg Ratings/User | Avg Rating Score |
|-----------|------------|------------------|------------------|
| Under 18  | 198        | 121.52           | 3.47             |
| 18-24     | 310        | 114.34           | 3.49             |
| 25-34     | 194        | 100.98           | 3.59             |
| 35-44     | 142        | 90               | 3.63             |
| 45-54     | 63         | 89.43            | 3.65             |
| 55+       | 36         | 69.19            | 3.42             |

**Insight**:
Younger users (<25) are the most active "power raters" but are also more critical. Users aged 25-54 rate less frequently but tend to give higher scores. The 55+ group is both the least active and gives lower ratings, similar to the youngest users.

**Business Implication**:
- Target younger users with engagement campaigns to capitalize on their high activity.
- Use ratings from the 25-54 age group as a potential signal for content "quality," as they rate more generously.

---

### 2.2 Gender Differences

**Finding**: While there are significantly more male users who rate slightly more often, both male and female users have the exact same average rating score.

**Data**:
- Male users: 670 total, 110.84 avg ratings per user, 3.53 avg rating score
- Female users: 273 total, 94.29 avg ratings per user, 3.53 avg rating score

**Insight**:
The primary difference is in platform participation (670M vs 273F) and activity volume. However, in terms of rating behavior and "generosity," there is no difference. Gender is not a significant predictor of a user's average rating.

---

### 2.3 Occupation-Based Patterns

**Finding**: The user base is heavily dominated by students and users in technical or academic fields.

**Top 5 Most Active Occupations**:
1. Student: 196 users, 21,957 total ratings
2. Other: 105 users, 10,663 total ratings
3. Educator: 95 users, 9,442 total ratings
4. Engineer: 67 users, 8,175 total ratings
5. Programmer: 66 users, 7,801 total ratings

**Insight**:
These findings reflect the dataset's origin (a university research project). The preferences seen in the data are likely skewed towards a young, educated, and tech-savvy audience and may not represent the general population.

---

## 3. Genre & Content Insights

### 3.1 Most Popular Genres

**Finding**: Drama is the most-rated and third-highest-rated genre. Niche genres like Film-Noir and War are the highest-rated, while Comedy is popular but rated relatively poorly.

**Genre Ranking by Volume**:
1. Drama: 39895 ratings, 3.69 avg score
2. Comedy: 29832 ratings, 3.39 avg score
3. Action: 25589 ratings, 3.48 avg score

**Genre Ranking by Average Rating**:
1. Film-Noir: 3.92 avg score, 1733 ratings
2. War: 3.82 avg score, 9398 ratings
3. Drama: 3.69 avg score, 39895 ratings

**Insight**:
There is a clear distinction between what is watched (popular) and what is loved (highly-rated). Drama is the strong all-rounder. Niche, "prestige" genres (Film-Noir, War) perform very well in ratings, suggesting a dedicated fanbase. Comedy's low score (3.39) suggests it's a difficult genre to get right.

---

### 3.2 Genre Combinations

**Finding**: Drama-Romance movies have a high average rating and a high movie count.

**Top Performing Combinations**:
- Drama-Romance: 3.72 avg rating, 7951 total ratings
- Romantic-Comedy: 3.45 avg rating, 6364 total ratings
- Horror-Thriller: 3.42 avg rating, 1259 total ratings

**Insight**:
Blending Drama with Romance yields high engagement and high satisfaction. Interestingly, blending Romance with Comedy (Romantic-Comedy) results in a significantly lower average rating (3.45), reinforcing the finding that Comedy is a divisive or lower-rated genre.

---

### 3.3 Underrated Gems

**Finding**: An Affair to Remember (1957), Fresh (1994), and Paradise Lost: The Child Murders at Robin Hood Hills (1996) have high ratings with low rating count. 

**Examples**:
1. An Affair to Remember (1957): 4.19 avg rating, only 26 ratings
2. Fresh (1994): 4.1 avg rating, only 10 ratings
3. Paradise Lost: The Child Murders at Robin Hood Hills (1996): 4.05 avg rating, only 20 ratings

**Insight**:
These movies could benefit from increased promotion or targeted recommendations to similar users. They represent a "long tail" of high-quality content that most of the user base has not discovered.

---

### 3.4 Controversial Movies

**Finding**: Movies like Koyaanisqatsi (1983) and Natural Born Killers (1994) have high variance, indicating they strongly divide audiences.

**Most Divisive Movies**:
1. Koyaanisqatsi (1983): Variance = 1.83, Avg rating = 3.49
2. The Postman (1997): Variance = 1.79, Avg rating = 3.22
3. Natural Born Killers (1994): Variance = 1.75, Avg rating = 2.95

**Insight**:
High variance movies appeal to specific niches. Recommendation systems should be careful about suggesting these to broader audiences, but they may be excellent recommendations for users with similar "controversial" tastes.

---

## 4. Temporal Patterns

### 4.1 User Engagement Over Time

**Finding**: User activity and engagement peaked dramatically in November 1997, which saw the highest user count (288) and more than double the total ratings (23,980) of any other month. This was followed by a sharp drop in activity in December. The average rating score was relatively stable (3.54-3.59) during the 1997 growth period but saw a notable dip in January 1998 (3.4).

**Data**:
| Month   | User Count | Total Ratings | Avg Rating Score |
|---------|------------|---------------|------------------|
| 1997-09 |	80	       | 6704	       | 3.54             |
| 1997-10 |	152	       | 10304	       | 3.59             |
| 1997-11 |	288	       | 23980	       | 3.56             |
| 1997-12 |	184	       | 11911	       | 3.58             |
| 1998-01 |	219	       | 14095	       | 3.4              | 
| 1998-02 |	174	       | 10991	       | 3.46             |

**Insight**:
The data shows high seasonal volatility. The massive November spike could be tied to an external event (like a marketing campaign, platform launch, or a holiday movie season) that drove a huge, temporary influx of users. The sharp drop in December is a classic holiday slump. The dip in average ratings in January, as user count rebounded, might suggest that new users (or users rating post-holiday) are more critical. This pattern indicates that user engagement isn't steady but is driven by specific events or times of the year.

---

### 4.2 Genre Trends by Decade

**Finding**: While Comedy was the top-rated genre for movies from the 1970s, Drama took over as the dominant top genre for movies released in both the 1980s and 1990s.

**Decade Analysis**:
- 1970s: Comedy
- 1980s: Drama  
- 1990s: Drama

**Insight**:
This reveals a clear shift in audience preference (or at least in what was rated highest) over time. The dominance of Drama in the 80s and 90s—the two decades closest to the dataset's collection period (1998)—strongly aligns with the overall finding that Drama is the most-rated and highly-rated genre on the platform. The appreciation for 1970s Comedy shows that users were actively rating older catalog titles and that audience taste isn't uniform across all "classic" films; the appeal of a specific decade is tied to its standout genres.

---

## 5. Contrarian Users & Unique Behaviors

### 5.1 Contrarian Raters

**Finding**: No particular pattern for a contrarian

**Characteristics**:
- Average deviation from movie averages: 1.68
- Occupations most represented: writer

**Insight**:
Contrarian users may be film critics, cinephiles, or simply have unique tastes. They can be valuable for discovering niche content but may not be good seeds for general recommendations.

---

## 6. Recommendation System Insights

### 6.1 Collaborative Filtering Performance

**Approach**: Implemented a user-user collaborative filtering model using SQL. The approach identifies a target user's "neighbors" by first finding other users with a high number of co-rated movies. From this group, it calculates a similarity score (e.g., Pearson correlation or a simpler mean-squared difference) based on their shared ratings. The system then recommends movies that these "neighbors" rated highly (e.g., 4+ stars) but which the target user has not yet seen, ranking them by the predicted score or average rating from the neighbor group.

**Sample Results**:
- For User 22 (who rated Pulp Fiction (5) and Fargo (5)):
- Recommended: Reservoir Dogs (1992) (Avg. Neighbor Rating: 4.7)
- Recommended: The Usual Suspects (1995) (Avg. Neighbor Rating: 4.6)
- Recommended: Goodfellas (1990) (Avg. Neighbor Rating: 4.5)

**Insight**:
The SQL-based approach is effective for demonstrating the principles of collaborative filtering and can produce relevant, "serendipitous" recommendations that are not immediately obvious (e.g., connecting users who like the same style of film, not just the same genre).

However, it is not scalable. The required queries are computationally expensive, involving multiple self-joins, complex aggregations, and subqueries that would not perform well in a real-time production environment. It also suffers from the classic "cold start" problem: it cannot generate recommendations for new users with no ratings or for new movies that have not yet been rated.

---

## 7. Data Quality Observations

### 7.1 Rating Coverage

**Finding**: 
- Total possible ratings: 943 users × 1,682 movies = 1,586,126
- Actual ratings: 100,000
- Coverage: ~6.3%

**Insight**:
The sparse rating matrix means most users have rated only a small fraction of available movies. This is typical for recommendation systems and highlights the importance of finding similar users and movies.

---

### 7.2 Popular vs Unpopular Movies

**Finding**: [Distribution of ratings across movies]

- Movies with 100+ ratings: X
- Movies with 50-99 ratings: Y
- Movies with 10-49 ratings: Z
- Movies with <10 ratings: W

**Insight**:
A small number of blockbuster movies receive the majority of attention, while many movies remain relatively unknown. This long-tail distribution is typical of entertainment platforms.

---

## 8. Key Takeaways & Recommendations

### For Content Strategy:
1. **Promote Quality Niches:** Actively recommend high-performing niche genres like Film-Noir and War (3.92, 3.82 avg scores) to users who already enjoy high-rating mainstream genres like Drama.
2. **Invest in "Safe Bets":** Content acquisition should favor Drama-Romance (3.72 avg score), which proves to be both popular and highly-rated.
3. **Surface "Underrated Gems":** Create recommendation carousels for "Hidden Gems" or "High-Rating, Low-Views" to promote titles like An Affair to Remember (1957), increasing their visibility.

### For User Engagement:
1. **Implement Gamification:** Target Regular Users (20-49 ratings) with "rate 5 more movies" badges or challenges to convert them into Active Users.
2. **Launch a VIP Program:** Recognize Power Users (100+ ratings), who form 38% of the user base, with exclusive "Top Rater" badges or early access to new features.
3. **Targeted Onboarding:** Use age-based insights. Prompt younger, more critical users (<25) for ratings more often, and use the more generous ratings from 25-54 year-olds as stronger signals of content quality.

### For Recommendation Systems:
1. **Normalize Ratings:** Do not use raw average scores. Given the critical bias (55% of ratings are 1 or 2), normalize scores (e.g., Z-scores, percentile ranks) to identify what is "good" relative to the platform's baseline.
2. **Use Age as a Feature: Age** is a clear predictor of rating behavior (score and volume). Incorporate age-group preferences into personalization models.
3. **Handle Divisive Content:** Tag "controversial" movies (high variance). Recommend them only to users who have positively rated other high-variance films, avoiding a negative experience for the general user base.

---

## 9. Limitations & Future Work

### Limitations:
- Dataset is from 1995-1998, may not reflect modern viewing habits
- Limited demographic information (no income, education, etc.)
- Binary genre classification doesn't capture nuance
- No information about viewing context (time of day, device, etc.)

### Future Analysis Opportunities:
- Compare with modern streaming data (Netflix, Hulu)
- Incorporate sentiment analysis from movie reviews
- Build predictive models for user churn
- Analyze seasonal/holiday viewing patterns
- Implement machine learning recommendation algorithms

---

## Conclusion

This analysis reveals that user behavior in movie rating platforms is highly heterogeneous, with clear demographic patterns and content preferences. The insights derived from this SQL-based analysis demonstrate the power of data-driven decision making in content recommendation and user engagement strategies.

The techniques demonstrated here - complex SQL queries, statistical analysis, and collaborative filtering - are foundational skills for any data analyst working with user behavior data.

---

**Analysis Date**: 6/11/2025 
**Analyst**: Jack Baek  
**Tools Used**: SQLite, Python, SQL  
**Dataset**: MovieLens 100K