with source as (
    select * from {{ source('main', 'fhv_bases') }}
),
cleaned as (
    select
        base_number,
        base_name,
        dba,
        dba_category
    from source
)

select * from cleaned
