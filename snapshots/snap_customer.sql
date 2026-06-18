{% snapshot snap_customers %}

{{ config(
    target_schema = 'DWH',
    target_database = 'PRACTICE_DB',
    unique_key = 'customer_id',
    strategy = 'timestamp',
    updated_at = 'updated_at'

)}}

select  
    customer_id,
    first_name,
    last_name,
    email,
    city,
    updated_at
from {{ source('src_data', 'raw_customers') }}

{% endsnapshot %}