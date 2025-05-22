SELECT 
    ship_name AS new_name, 
    customer_id AS id_,
    case 
    when ship_name like 'Karen%' and
    customer_id = 27 
    then 1
    else 0 end as new_list,status_id
FROM
    orders AS ord_
    where left(ship_name, 1) in ('A','B','C','K')
    #order by ship_name desc;
order by case 
    when ship_name like 'Karen%' and
    customer_id = 27 then 1
    else 0 end desc,
   case
   when status_id = 3 then 'R' else 'A'
   end;
    
    select * from orders
    where ship_name = 'Karen Toh';