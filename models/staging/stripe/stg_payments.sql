with payments as (

    select 
        ORDERID as order_id,
        AMOUNT 
    from raw.stripe.payment

)

select * from payments