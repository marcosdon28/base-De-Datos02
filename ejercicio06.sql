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


-- Find customers that rented more than one film
	
select first_name 
from customer c 
where (select count(*)
		from rental r where r.customer_id = c.customer_id  
		)>1;
		
-- List the actors that acted in 'BETRAYED REAR' or in 'CATCH AMISTAD'

select a.first_name, a.last_name, f2.title
from actor a, film f2 
where exists (select * from film_actor fa 
where f2.film_id = fa.film_id and f2.title = 'BETRAYED REAR' 
or f2.title = 'CATCH AMISTAD');

-- List the actors that acted in 'BETRAYED REAR' but not in 'CATCH AMISTAD'

select a.first_name, a.last_name, f2.title
from actor a, film f2 
where exists (select * from film_actor fa 
where f2.film_id = fa.film_id and f2.title = 'BETRAYED REAR' 
);


-- List the actors that acted in both 'BETRAYED REAR' and 'CATCH AMISTAD'

select a.first_name, a.last_name, f2.title
from actor a, film f2 
where exists (select * from film_actor fa 
where f2.film_id = fa.film_id and f2.title = 'BETRAYED REAR' 
and f2.title = 'CATCH AMISTAD');

-- List all the actors that didn't work in 'BETRAYED REAR' or 'CATCH AMISTAD'

select a.first_name, a.last_name, f2.title
from actor a, film f2 
where not exists (select * from film_actor fa 
where f2.film_id = fa.film_id and f2.title = 'BETRAYED REAR' 
or f2.title = 'CATCH AMISTAD');

