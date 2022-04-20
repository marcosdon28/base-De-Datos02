-- List all the actors that share the last name. Show them in order

select *
from actor a1
where exists (select last_name 
				from actor a2 
				where a1.last_name = a2.last_name
				)
order by last_name ;
			
-- Find actors that don't work in any film

select first_name  
from actor a1 
where not exists (select actor_id 
				from film_actor fa
				where a1.actor_id = fa.actor_id 
				);
			
-- Find customers that rented only one film
			
select first_name 
from customer c 
where (select count(*)
		from rental r where r.customer_id = c.customer_id  
		)=1;


