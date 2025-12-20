WITH CTE AS (

select
    TO_TIMESTAMP(STARTED_AT) AS STARTED_AT,
    DATE(STARTED_AT) AS DATE_STARTED_AT,
    HOUR(TO_TIMESTAMP(STARTED_AT)) AS HOUR_STARTED_AT,
    {{DAY_TYPE('STARTED_AT')}} AS DAY_TYPE,
    {{STATION_OF_YEAR('STARTED_AT')}} AS STATION_OF_YEAR      
from
    {{ ref('stg_bike') }}
--where 
    --STARTED_AT != 'started_at'

)

select
    *
from
    CTE
