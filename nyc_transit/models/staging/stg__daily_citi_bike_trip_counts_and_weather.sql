with bike_trips as (
    select
        date_trunc('day', starttime) as trip_date,
        count(*) as trip_count
    from {{ ref('stg__bike_data') }}
    group by trip_date
),
weather as (
    select
        observation_date,
        avg(max_temperature) as avg_max_temp,
        avg(min_temperature) as avg_min_temp,
        sum(precipitation) as total_precipitation
    from {{ ref('stg__central_park_weather') }}
    group by observation_date
)

select
    bt.trip_date,
    bt.trip_count,
    w.avg_max_temp,
    w.avg_min_temp,
    w.total_precipitation
from bike_trips bt
left join weather w
on bt.trip_date = w.observation_date
