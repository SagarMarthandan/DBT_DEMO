### 🚀 Project Overview

- **Tech Stack**: ![Snowflake](https://img.shields.io/badge/Snowflake-29B5E8?style=flat-square&logo=Snowflake&logoColor=white) ![dbt](https://img.shields.io/badge/dbt-FF694B?style=flat-square&logo=dbt&logoColor=white)
- **Data Domain**: 🚲 Rental bike data (derived from weather and bike trips)
- **Data Modeling**: 📊 Utilizes Fact and Dimension tables

### 🛠️ Implementation Details

- **Environment**: ☁️ Built on DBT Cloud with minimal structure editing (no manual audit/profile editing).
- **Connectivity**: 🔌 Used all connection profiles directly from DBT Cloud.
- **Version Control**: 🐙 Used integrated git to maintain version control and commit to `dev` and `master` branches.
- **Data Integration**: ❄️ Used Snow CLI based data integration into the stage data.

### 🧠 Key Concepts & Learnings

- **Lineage**: 🕸️ Explored data lineage to understand dependencies between models.
- **Jinja Macros**: 🧩 Used Jinja templating for dynamic SQL generation.

### 🔄 Data Transformation Workflow

The transformation logic in `models/daily_weather.sql` demonstrates a typical dbt workflow:
1.  **Source Data**: 📥 Raw weather data is referenced using `{{ source('demo', 'weather') }}`.
2.  **Cleaning (CTE 1)**: 🧹 The `daily_weather` CTE casts the time column to a date and selects relevant columns.
3.  **Aggregation (CTE 2)**: 📈 The `daily_weather_agg` CTE calculates daily averages for temperature, pressure, humidity, and clouds.
4.  **Deduplication**: 🔍 The `qualify` statement ensures only the most significant weather entry per day is kept based on the count of weather events.

#### 💡 Concept Explanations with Code

**Jinja Templating:**
Instead of hardcoding table names, dbt uses the `source` function. This allows dbt to manage dependencies and compilation.
```sql
-- From models/daily_weather.sql
from {{ source('demo', 'weather') }}
```

**Window Functions in dbt:**
Using `qualify` to filter window functions directly in the `SELECT` statement (Snowflake feature utilized in dbt models).
```sql
qualify ROW_NUMBER() OVER (PARTITION BY daily_weather ORDER BY count(weather) desc) = 1
```

### Configuration Files Explained

**1. `dbt_project.yml`**
The main configuration file for the project.
- Defines the project name (`my_new_project`) and version.
- Configures file paths (where models, seeds, and tests live).
- Sets global configurations, such as materializing all models as tables by default:
  ```yaml
  models:
    my_new_project:
      +materialized: table
  ```

**2. `models/example/schema.yml`**
Defines documentation and testing for specific models.
- **Tests**: Applies data quality checks like `unique` and `not_null` to columns (e.g., `id`).
- **Documentation**: Adds descriptions to models and columns.
