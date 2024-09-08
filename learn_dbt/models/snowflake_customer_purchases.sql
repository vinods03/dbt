{{ config(materialized='table') }}

-- select c.c_custkey, c.c_name, c.c_nationkey, sum(o.o_totalprice) as total_order_price
-- from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER c
-- left join SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.ORDERS o
-- on c.c_custkey = o.o_custkey
-- group by c.c_custkey, c.c_name, c.c_nationkey

-- select c.c_custkey, c.c_name, c.c_nationkey, sum(o.o_totalprice) as total_order_price
-- from {{ source('sample_source', 'customer') }} c
-- left join {{ source('sample_source', 'orders') }} o
-- on c.c_custkey = o.o_custkey
-- group by c.c_custkey, c.c_name, c.c_nationkey

with sample_customer as (
    select * from {{ source('sample_source','customer') }}
),
     sample_orders as (
        select * from {{ source('sample_source', 'orders') }}
     )

select c.c_custkey, c.c_name, c.c_nationkey, sum(o.o_totalprice) as total_order_price
from sample_customer c
left join sample_orders o
on c.c_custkey = o.o_custkey
group by c.c_custkey, c.c_name, c.c_nationkey