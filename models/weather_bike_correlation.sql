WITH CTE AS (
    select
        t.*,
        w.*
    from
        {{ ref('trip_fact') }} AS t
        left join {{ ref('daily_weather') }} AS w
        on t.trip_date = w.daily_weather
    limit 10
)

select
    *
from
    CTE