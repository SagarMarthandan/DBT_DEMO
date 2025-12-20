-- first CTE
WITH TRIPS AS (
    select
        RIDE_ID,
        --RIDEABLE_TYPE,
        DATE(TO_TIMESTAMP(STARTED_AT)) AS TRIP_DATE,
        start_station_id,
        END_STATION_ID,
        MEMBER_CSUAL AS MEMBER_CASUAL,
        TIMESTAMPDIFF(SECOND, TO_TIMESTAMP(STARTED_AT), TO_TIMESTAMP(ENDED_AT)) AS TRIP_DURATION_SECONDS
    from
        {{ ref('stg_bike') }}
--    where
--        RIDE_ID != 'ride_id'
)

select
    *
from
    TRIPS