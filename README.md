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
1. **[Your finding #1]** - Example: "Users aged 25-34 are the most active demographic, accounting for 35% of all ratings"
2. **[Your finding #2]** - Example: "Male users rate 40% more movies on average than female users"
3. **[Your finding #3]** - Example: "Students and engineers are the most active occupations"

### Genre Insights
1. **[Your finding #1]** - Example: "Drama is the most-rated genre with over 25,000 ratings"
2. **[Your finding #2]** - Example: "Action-Comedy combinations receive higher average ratings than pure action movies"
3. **[Your finding #3]** - Example: "Sci-Fi movie ratings have increased steadily from the 1970s to 1990s"

### Surprising Discoveries
- **[Interesting pattern you found]**
- **[Unexpected correlation]**
- **[Contrarian insight]**

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
└── results/                           # Screenshots of query results
    └── [your screenshots here]
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
- **Portfolio**: [Your Portfolio Link]

---

*This project was completed as part of my data analytics portfolio to demonstrate SQL proficiency and analytical thinking.*