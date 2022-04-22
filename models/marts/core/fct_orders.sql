with payments as (
    select * from {{ ref('stg_payments') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

final as(
    select 
        orders.order_id,
        orders.customer_id,
        sum(case when payments.PAYMENT_STATUS='fail' then 0 else payments.amount end) as amount
    from orders
    left join payments using (order_id)
    group by 1,2
)

select * from final