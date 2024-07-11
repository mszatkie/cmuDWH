with source as (
    select * from {{ source('main', 'central_park_weather') }}
),
cleaned as (
    select
        station as station,
        name as weather_station_name,
        date as observation_date,
        awnd as average_wind_speed,
        prcp as precipitation,
        snow as snowfall,
        snwd as snow_depth,
        tmax as max_temperature,
        tmin as min_temperature
    from source
)

select * from cleaned
