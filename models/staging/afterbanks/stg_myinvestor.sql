with myinvestor as (
    select
    concat((year(to_date(fecha, 'DD/MM/YY'))*10000+month(to_date(fecha, 'DD/MM/YY'))*100+day(to_date(fecha, 'DD/MM/YY')))*100000+_row,cuenta) as id, -- Calculate an id unique for each transaction
    (year(to_date(fecha, 'DD/MM/YY'))*10000+month(to_date(fecha, 'DD/MM/YY'))*100+day(to_date(fecha, 'DD/MM/YY')))*100000+_row as id_order_transaction, -- Calculate an id for each transaction to have the possiblity to order
    to_number(cuenta) as account_id,
    to_date(fecha, 'DD/MM/YY') as date,
    importe as amount,
    balance_en_cuenta as account_balance,
    descripci_un as description,
    categoria as category,
    initcap(nombre_cuenta) as account_name,
    initcap(banco) as bank,
    _fivetran_synced as etl_load
    from {{source('afterbank_raw','myinvestor')}}

)

select * from myinvestor