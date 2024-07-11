{{ config(materialized='view') }}

with source as (
    select * from {{ source('main', 'citibike_tripdata') }}
)

select
    tripduration,
    starttime,
    stoptime,
    "start station id" as start_station_id,
    "start station name" as start_station_name,
    "start station latitude" as start_station_latitude,
    "start station longitude" as start_station_longitude,
    "end station id" as end_station_id,
    "end station name" as end_station_name,
    "end station latitude" as end_station_latitude,
    "end station longitude" as end_station_longitude,
    bikeid,
    usertype,
    "birth year" as birth_year,
    gender
from source