with orders as (
    select * from {{ source('sample_source','orders')}}
)

select distinct o_orderdate, 
sum(o_totalprice) over (order by o_orderdate) as cumulative_sales
from orders

{% if target.name == 'dev' %}
where year(o_orderdate) = 1996
{% endif %}