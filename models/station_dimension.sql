-- first CTE
WITH BIKE AS (
    select
        start_station_id AS station_id,
        start_station_name AS station_name,
        start_lat AS station_lat,
        start_lng as station_lng
    from
        {{ ref('stg_bike') }}
--    where
--        RIDE_ID != 'ride_id'
)

select
    *
from
    BIKE