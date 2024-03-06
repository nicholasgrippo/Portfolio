--- Q7 : Derive the output --- 

drop table if exists sales_data;
create table sales_data
    (
        sales_date      date,
        customer_id     varchar(30),
        amount          varchar(30)
    );
insert into sales_data values ('01-Jan-2021', 'Cust-1', '50$');
insert into sales_data values ('02-Jan-2021', 'Cust-1', '50$');
insert into sales_data values ('03-Jan-2021', 'Cust-1', '50$');
insert into sales_data values ('01-Jan-2021', 'Cust-2', '100$');
insert into sales_data values ('02-Jan-2021', 'Cust-2', '100$');
insert into sales_data values ('03-Jan-2021', 'Cust-2', '100$');
insert into sales_data values ('01-Feb-2021', 'Cust-2', '-100$');
insert into sales_data values ('02-Feb-2021', 'Cust-2', '-100$');
insert into sales_data values ('03-Feb-2021', 'Cust-2', '-100$');
insert into sales_data values ('01-Mar-2021', 'Cust-3', '1$');
insert into sales_data values ('01-Apr-2021', 'Cust-3', '1$');
insert into sales_data values ('01-May-2021', 'Cust-3', '1$');
insert into sales_data values ('01-Jun-2021', 'Cust-3', '1$');
insert into sales_data values ('01-Jul-2021', 'Cust-3', '-1$');
insert into sales_data values ('01-Aug-2021', 'Cust-3', '-1$');
insert into sales_data values ('01-Sep-2021', 'Cust-3', '-1$');
insert into sales_data values ('01-Oct-2021', 'Cust-3', '-1$');
insert into sales_data values ('01-Nov-2021', 'Cust-3', '-1$');
insert into sales_data values ('01-Dec-2021', 'Cust-3', '-1$');


Select * from sales_data
Order by customer_id, sales_date; 



Select customer_id
,sum(case when to_char(sales_date,'Mon-YY')='Jan-21' then replace(amount,'$','')::int else 0 end) as "Jan-21"
,sum(case when to_char(sales_date,'Mon-YY')='Feb-21' then replace(amount,'$','')::int else 0 end) as "Feb-21"
,sum(case when to_char(sales_date,'Mon-YY')='Mar-21' then replace(amount,'$','')::int else 0 end) as "Mar-21"
,sum(case when to_char(sales_date,'Mon-YY')='Apr-21' then replace(amount,'$','')::int else 0 end) as "Apr-21"
,sum(case when to_char(sales_date,'Mon-YY')='May-21' then replace(amount,'$','')::int else 0 end) as "May-21"
,sum(case when to_char(sales_date,'Mon-YY')='Jun-21' then replace(amount,'$','')::int else 0 end) as "Jun-21"
,sum(case when to_char(sales_date,'Mon-YY')='Jul-21' then replace(amount,'$','')::int else 0 end) as "Jul-21"
,sum(case when to_char(sales_date,'Mon-YY')='Aug-21' then replace(amount,'$','')::int else 0 end) as "Aug-21"
,sum(case when to_char(sales_date,'Mon-YY')='Sep-21' then replace(amount,'$','')::int else 0 end) as "Sep-21"
,sum(case when to_char(sales_date,'Mon-YY')='Oct-21' then replace(amount,'$','')::int else 0 end) as "Oct-21"
,sum(case when to_char(sales_date,'Mon-YY')='Nov-21' then replace(amount,'$','')::int else 0 end) as "Nov-21"
,sum(case when to_char(sales_date,'Mon-YY')='Dec-21' then replace(amount,'$','')::int else 0 end) as "Dec-21"
,sum(replace(amount,'$','')::int) as total
From sales_data
group by customer_id
	UNION
select 'total' as customer_id
,sum(case when to_char(sales_date,'Mon-YY')='Jan-21' then replace(amount,'$','')::int else 0 end) as "Jan-21"
,sum(case when to_char(sales_date,'Mon-YY')='Feb-21' then replace(amount,'$','')::int else 0 end) as "Feb-21"
,sum(case when to_char(sales_date,'Mon-YY')='Mar-21' then replace(amount,'$','')::int else 0 end) as "Mar-21"
,sum(case when to_char(sales_date,'Mon-YY')='Apr-21' then replace(amount,'$','')::int else 0 end) as "Apr-21"
,sum(case when to_char(sales_date,'Mon-YY')='May-21' then replace(amount,'$','')::int else 0 end) as "May-21"
,sum(case when to_char(sales_date,'Mon-YY')='Jun-21' then replace(amount,'$','')::int else 0 end) as "Jun-21"
,sum(case when to_char(sales_date,'Mon-YY')='Jul-21' then replace(amount,'$','')::int else 0 end) as "Jul-21"
,sum(case when to_char(sales_date,'Mon-YY')='Aug-21' then replace(amount,'$','')::int else 0 end) as "Aug-21"
,sum(case when to_char(sales_date,'Mon-YY')='Sep-21' then replace(amount,'$','')::int else 0 end) as "Sep-21"
,sum(case when to_char(sales_date,'Mon-YY')='Oct-21' then replace(amount,'$','')::int else 0 end) as "Oct-21"
,sum(case when to_char(sales_date,'Mon-YY')='Nov-21' then replace(amount,'$','')::int else 0 end) as "Nov-21"
,sum(case when to_char(sales_date,'Mon-YY')='Dec-21' then replace(amount,'$','')::int else 0 end) as "Dec-21"
,null as total
From sales_data
Order by 1;

----------------------

CREATE EXTENSION TABLEFUNC;

Select customer_id
,case when Jan_21<0 then '(' || (Jan_21*-1) || ')$' else Jan_21||'$' end as Jan_21
,case when Jan_21<0 then '(' || (Feb_21*-1) || ')$' else Feb_21||'$' end as Feb_21
,case when Jan_21<0 then '(' || (Mar_21*-1) || ')$' else Mar_21||'$' end as Mar_21
,case when Jan_21<0 then '(' || (Apr_21*-1) || ')$' else Apr_21||'$' end as Apr_21
,case when Jan_21<0 then '(' || (May_21*-1) || ')$' else May_21||'$' end as May_21
,case when Jan_21<0 then '(' || (Jun_21*-1) || ')$' else Jun_21||'$' end as Jun_21
,case when Jan_21<0 then '(' || (Jul_21*-1) || ')$' else Jul_21||'$' end as Jul_21
,case when Jan_21<0 then '(' || (Aug_21*-1) || ')$' else Aug_21||'$' end as Aug_21
,case when Jan_21<0 then '(' || (Sep_21*-1) || ')$' else Sep_21||'$' end as Sep_21
,case when Jan_21<0 then '(' || (Oct_21*-1) || ')$' else Oct_21||'$' end as Oct_21
,case when Jan_21<0 then '(' || (Nov_21*-1) || ')$' else Nov_21||'$' end as Nov_21
,case when Jan_21<0 then '(' || (Dec_21*-1) || ')$' else Dec_21||'$' end as Dec_21
,case when total < 0 then '(' || (total*-1) || ')$' else total ||'$' end as toatl
from (
		select x.*
	,(Jan_21 + Feb_21 + Mar_21 + Apr_21 + May_21 + Jun_21 + Jul_21 + Aug_21 + Sep_21 + Oct_21 + Nov_21 + Dec_21) as total
	from (
		select customer_id
	)
)

-------------------------------------------------

CREATE EXTENSION TABLEFUNC;

select customer_id
, case when Jan_21<0 then '(' || (Jan_21*-1) || ')$' else Jan_21||'$' end as Jan_21
, case when Feb_21<0 then '(' || (Feb_21*-1) || ')$' else Feb_21||'$' end as Feb_21
, case when Mar_21<0 then '(' || (Mar_21*-1) || ')$' else Mar_21||'$' end as Mar_21
, case when Apr_21<0 then '(' || (Apr_21*-1) || ')$' else Apr_21||'$' end as Apr_21
, case when May_21<0 then '(' || (May_21*-1) || ')$' else May_21||'$' end as May_21
, case when Jun_21<0 then '(' || (Jun_21*-1) || ')$' else Jun_21||'$' end as Jun_21
, case when Jul_21<0 then '(' || (Jul_21*-1) || ')$' else Jul_21||'$' end as Jul_21
, case when Aug_21<0 then '(' || (Aug_21*-1) || ')$' else Aug_21||'$' end as Aug_21
, case when Sep_21<0 then '(' || (Sep_21*-1) || ')$' else Sep_21||'$' end as Sep_21
, case when Oct_21<0 then '(' || (Oct_21*-1) || ')$' else Oct_21||'$' end as Oct_21
, case when Nov_21<0 then '(' || (Nov_21*-1) || ')$' else Nov_21||'$' end as Nov_21
, case when Dec_21<0 then '(' || (Dec_21*-1) || ')$' else Dec_21||'$' end as Dec_21
, case when total < 0 then '(' || (total*-1) || ')$' else total||'$' end as total
from (
    select x.*
    , (Jan_21 + Feb_21 + Mar_21 + Apr_21 + May_21 + Jun_21
     + Jul_21 + Aug_21 + Sep_21 + Oct_21 + Nov_21 + Dec_21) as total
    from (
        select customer_id
        , coalesce(Jan_21,0) as Jan_21
        , coalesce(Feb_21,0) as Feb_21
        , coalesce(Mar_21,0) as Mar_21
        , coalesce(Apr_21,0) as Apr_21
        , coalesce(May_21,0) as May_21
        , coalesce(Jun_21,0) as Jun_21
        , coalesce(Jul_21,0) as Jul_21
        , coalesce(Aug_21,0) as Aug_21
        , coalesce(Sep_21,0) as Sep_21
        , coalesce(Oct_21,0) as Oct_21
        , coalesce(Nov_21,0) as Nov_21
        , coalesce(Dec_21,0) as Dec_21
        from crosstab('select customer_id, to_char(sales_date,''Mon-YY'') as month, sum(replace(amount,''$'','''')::int) as amount
                        from sales_data
                        group by customer_id, to_char(sales_date,''Mon-YY'')
                        order by customer_id'
                      , 'values (''Jan-21''), (''Feb-21''), (''Mar-21''), (''Apr-21'')
                              , (''May-21''), (''Jun-21''), (''Jul-21''), (''Aug-21'')
                              , (''Sep-21''), (''Oct-21''), (''Nov-21''), (''Dec-21'')')
            AS FINAL_RESULT(customer_id varchar, Jan_21 bigint, Feb_21 bigint, Mar_21 bigint
                           , Apr_21 bigint, May_21 bigint, Jun_21 bigint, Jul_21 bigint
                           , Aug_21 bigint, Sep_21 bigint, Oct_21 bigint, Nov_21 bigint, Dec_21 bigint)
        ) x
        union
    select customer_id
        , coalesce(Jan_21,0) as Jan_21
        , coalesce(Feb_21,0) as Feb_21
        , coalesce(Mar_21,0) as Mar_21
        , coalesce(Apr_21,0) as Apr_21
        , coalesce(May_21,0) as May_21
        , coalesce(Jun_21,0) as Jun_21
        , coalesce(Jul_21,0) as Jul_21
        , coalesce(Aug_21,0) as Aug_21
        , coalesce(Sep_21,0) as Sep_21
        , coalesce(Oct_21,0) as Oct_21
        , coalesce(Nov_21,0) as Nov_21
        , coalesce(Dec_21,0) as Dec_21
        , null as total
        from crosstab('select ''Total'' as customer_id, to_char(sales_date,''Mon-YY'') as month, sum(replace(amount,''$'','''')::int) as amount
                        from sales_data
                        group by to_char(sales_date,''Mon-YY'') '
                      , 'values (''Jan-21''), (''Feb-21''), (''Mar-21''), (''Apr-21'')
                              , (''May-21''), (''Jun-21''), (''Jul-21''), (''Aug-21'')
                              , (''Sep-21''), (''Oct-21''), (''Nov-21''), (''Dec-21'')')
            AS FINAL_RESULT(customer_id varchar, Jan_21 bigint, Feb_21 bigint, Mar_21 bigint
                           , Apr_21 bigint, May_21 bigint, Jun_21 bigint, Jul_21 bigint
                           , Aug_21 bigint, Sep_21 bigint, Oct_21 bigint, Nov_21 bigint, Dec_21 bigint)
    order by customer_id) z
















