select sum(case when id is null then 1 else 0 end) / count(*) as nulls_pct
from {{ref('my_first_dbt_model')}}
having (sum(case when id is null then 1 else 0 end) / count(*)) > 0.1