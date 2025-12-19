-- macro for seasons of the year
{% macro STATION_OF_YEAR(x) %}
    CASE WHEN
         MONTH(TO_TIMESTAMP({{x}})) in (12,1,2) THEN 'WINTER'
         WHEN
         MONTH(TO_TIMESTAMP({{x}})) in (3,4,5) THEN 'SPRING'
         WHEN
         MONTH(TO_TIMESTAMP({{x}})) in (6,7,8) THEN 'SUMMER'
         ELSE 'AUTUMN'
    END 
{% endmacro  %}

-- macro for tyoe of the day
{% macro DAY_TYPE(x) %}
    CASE WHEN
        DAYNAME(TO_TIMESTAMP(STARTED_AT)) in ('Sat', 'Sun')
        THEN 'WEEKEND'
        ELSE 'BUSINESSDAY'
    END
{% endmacro %}