with payments as (
    select * from {{ ref('stg_payments.sql')}}
),

orders as (
    select * from {{ref('stg_orders.sql')}}
),

final as(
select o.order_id,o.customer_id,p.amount from orders o
left join payments p
on o.order_id = p.order_id
)

select * from final