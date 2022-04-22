with payments as (

    select 
        ORDERID as order_id,
        AMOUNT/100 as amount,
        "STATUS" as payment_status
    from raw.stripe.payment

)

select * from payments