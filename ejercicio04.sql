select title, special_features 
from film f 
where rating = 'PG-13'
;

select title, length as 'duracion en minutos'
from film f
order by length
;

select title, rental_rate, replacement_cost 
from film f 
where replacement_cost 
between 20.00 and 24.00
order by replacement_cost 
;

select f.title, c.name as 'category', f.rating 
from film f, film_category fc, category c  
where f.film_id = fc.film_id 
	and fc.category_id = c.category_id 
	and f.special_features like '%Behind the Scenes%'
order by f.title
;

select a.first_name, a.last_name
from actor a
join film_actor fa on a.actor_id = fa.actor_id
join film f on fa.film_id = f.film_id 
	where f.title = 'ZOOLANDER FICTION'
order by first_name
;

select address, city, country 
from store s 
join address a on a.address_id = s.address_id
join city c on c.city_id = a.city_id 
join country c2 on c.country_id = c2.country_id 
where store_id = 1
;

select any_value(title), rating 
from film f 
group by rating 
;

select f.title, f.description, sta.first_name, sta.last_name
from film f
join inventory i on f.film_id = i.film_id 
join store s on i.store_id = s.store_id 
join staff sta on s.manager_staff_id = sta.staff_id 
where s.store_id = 2
;