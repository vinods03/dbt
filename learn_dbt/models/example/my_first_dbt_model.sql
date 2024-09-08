
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table', alias='first_model',tags=['manual','non-critical']) }}

with source_data as (

    select 1 as id, 'NY' as state, '2020-02-01 03:00:00.000'::timestamp as update_ts
    union all
    select 2 as id, 'VT' as state, '2020-01-01 00:00:00.000'::timestamp as update_ts

)

select *
from source_data

