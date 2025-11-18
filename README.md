# MovieLens User Behavior Analysis

## 📊 Project Overview
This project analyzes the MovieLens 100K dataset using advanced SQL techniques to uncover patterns in user behavior, movie preferences, and rating trends. The analysis demonstrates proficiency in complex SQL queries, data analysis, and deriving actionable insights from large datasets.

## 🎯 Objectives
- Analyze user rating patterns and engagement levels
- Identify demographic differences in movie preferences
- Discover genre trends and popular movie combinations
- Build a simple recommendation system using SQL
- Segment users based on activity and rating behavior

## 📁 Dataset
**MovieLens 100K Dataset**
- **Source**: [GroupLens Research](https://grouplens.org/datasets/movielens/)
- **Size**: 100,000 ratings from 943 users on 1,682 movies
- **Time Period**: Ratings collected from 1995-1998
- **Features**: User demographics (age, gender, occupation), movie metadata, and ratings (1-5 scale)

## 🗄️ Database Schema

```
users
├── user_id (PK)
├── age
├── gender
├── occupation
└── zip_code

movies
├── movie_id (PK)
├── title
├── release_date
├── video_release_date
├── imdb_url
└── genre columns (19 binary columns for genres)

ratings
├── user_id (FK)
├── movie_id (FK)
├── rating
└── timestamp
```

## 🔍 Key Analyses Performed

### 1. User Behavior Analysis
- Identified most active users and their rating patterns
- Analyzed rating distribution across demographics (age, gender, occupation)
- Segmented users into power users, active users, and casual users
- Discovered "contrarian" users who rate differently than the crowd

### 2. Advanced User Insights
- Calculated user engagement metrics and retention patterns
- Measured rating consistency using variance analysis
- Performed cohort analysis by age groups and gender
- Analyzed temporal patterns in user activity

### 3. Genre & Movie Analysis
- Identified most popular genres and genre combinations
- Found underrated gems (high ratings, low visibility)
- Discovered controversial movies with high rating variance
- Analyzed genre popularity trends over decades

### 4. Recommendation System
- Built collaborative filtering approach using similar user ratings
- Generated personalized movie recommendations

## 💡 Key Findings

### User Behavior Insights
1. **Users are highly critical:** - The platform has a strong critical bias. Over 55% of all 100,000 ratings are 1 or 2 stars, while only 17.5% are positive 4 or 5-star ratings.
2. **Activity declines with age, generosity increases:** - Users under 25 are the most active (rating ~115-120 movies on average), but users aged 35-54 are the most generous, giving the highest average scores (3.63-3.65).
3. **Students are the dominant demographic:** - Students are the most active occupation by a wide margin, accounting for 196 users and nearly 22,000 total ratings.

### Genre Insights
1. **Drama is the platform's cornerstone:** - Drama is both the most popular (39,895 ratings) and one of the most-loved (3.69 average score) genres, making it the most successful all-rounder.
2. **Niche genres are the highest-rated:** - The highest average scores belong to niche genres like Film-Noir (3.92) and War (3.82), indicating a passionate fanbase for "prestige" films.
3. **Genre-blending matters:** - Blending Drama with Romance (3.72 avg) creates a highly-rated combination. However, blending Comedy with Romance (3.45 avg) scores significantly lower, reinforcing that Comedy is a divisive, lower-rated genre.

### Surprising Discoveries
- **Zero gender bias in generosity:** - Despite male users outnumbering female users 2.5-to-1 and rating more often, both genders have the exact same average rating score (3.53).
- **Controversial films are clear:** - Movies like Natural Born Killers are clearly divisive, with a low average score (2.95) but one of the highest rating variances, confirming they split the audience.

## 🛠️ Technical Skills Demonstrated

**SQL Techniques Used:**
- Complex JOINs (2-way and 3-way joins)
- Window Functions (RANK, PARTITION BY, OVER)
- Common Table Expressions (CTEs) with multiple levels
- Aggregate Functions (COUNT, AVG, MIN, MAX)
- Subqueries and nested queries
- CASE statements for data segmentation
- Date/time manipulation
- Statistical calculations (variance, deviation)
- UNION operations
- HAVING clauses for filtered aggregations

## 📂 Project Structure

```
MovieLens-SQL-Analysis/
├── README.md                          # Project overview and documentation
├── insights.md                        # Detailed findings and analysis
├── data/                              # Raw MovieLens data files
│   ├── u.user
│   ├── u.item
│   └── u.data
├── sql/
│   ├── 01_create_tables.sql          # Database schema creation
│   ├── 02_user_behavior_analysis.sql # Basic user behavior queries
│   ├── 03_advanced_user_analysis.sql # Advanced user insights
│   └── 04_genre_analysis.sql         # Genre and recommendation queries
├── import_data.py                     # Python script to load data
```

## 🚀 How to Run This Project

### Prerequisites
- SQLite3
- Python 3.x (for data import)
- VSCode with SQLite extension (recommended)

### Setup Instructions

1. **Clone or download this repository**
```bash
git clone [your-repo-url]
cd MovieLens-SQL-Analysis
```

2. **Download the MovieLens 100K dataset**
   - Visit: https://grouplens.org/datasets/movielens/
   - Download ml-100k.zip
   - Extract to the `data/` folder

3. **Create the database and tables**
```bash
sqlite3 movies.db < sql/01_create_tables.sql
```

4. **Import the data**
```bash
python import_data.py
```

5. **Run the analysis queries**
   - Open the SQL files in your preferred SQL editor
   - Execute queries individually or in groups
   - Export results for further analysis

## 📊 Sample Queries

### Find Most Active Users
```sql
SELECT 
    u.user_id,
    u.occupation,
    COUNT(r.rating) as total_ratings,
    ROUND(AVG(r.rating), 2) as avg_rating
FROM users u
JOIN ratings r ON u.user_id = r.user_id
GROUP BY u.user_id, u.occupation
ORDER BY total_ratings DESC
LIMIT 10;
```

### Genre Popularity Analysis
```sql
-- See full queries in sql/04_genre_analysis.sql
```

## 📈 Future Enhancements

- [ ] Add visualizations using Python (Matplotlib/Seaborn)
- [ ] Build a dashboard in Tableau/Power BI
- [ ] Implement machine learning recommendation algorithms
- [ ] Analyze seasonal trends in movie watching
- [ ] Compare with modern streaming data

## 🎓 What I Learned

- How to structure and normalize relational databases
- Advanced SQL query optimization techniques
- Statistical analysis within SQL
- Data storytelling and insight generation
- Building recommendation systems with SQL

## 📞 Connect With Me

- **GitHub**: [jwb475](https://github.com/jwb475)
- **LinkedIn**: [Jin Wook Baek](https://www.linkedin.com/in/jin-wook-baek-jwb475)
- **Email**: jwb475@nyu.edu
- **Portfolio**: [https://jwb475.github.io/]

---

*This project was completed as part of my data analytics portfolio to demonstrate SQL proficiency and analytical thinking.*