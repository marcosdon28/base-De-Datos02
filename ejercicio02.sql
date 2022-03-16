USE imdb
CREATE table film(
	film_id INT PRIMARY KEY AUTO_INCREMENT, 
	title VARCHAR(50), 
	description VARCHAR(50), 
	release_year DATE
)

CREATE table actor(
	actor_id INT PRIMARY KEY AUTO_INCREMENT, 
	first_name VARCHAR(50), 
	last_name VARCHAR(50)
)

CREATE table film_actor(
	actor_id INT,
	film_id INT
	
)
		
alter table film add COLUMN last_update date
alter table actor add COLUMN last_update date

alter table film_actor add FOREIGN KEY (actor_id) references actor(actor_id)
alter table film_actor add FOREIGN KEY (film_id) references film(film_id)

insert into actor(actor_id,first_name,last_name) values (1,"marcos","don")
insert into actor(actor_id,first_name,last_name) values (2,"doro","reyna")
insert into actor(actor_id,first_name,last_name) values (3,"blito","palacios")

insert into film(film_id ,title , description, release_year) values (1,"Superman","superman muere y revive", '2010/05/13')
insert into film(film_id ,title , description, release_year) values (2,"spiderman","spiderman se convierte en spiderman", '2015/09/23')
insert into film(film_id ,title , description, release_year) values (3,"capian america","capitan america se convierte en capitan america", '2005/11/30')

insert into film_actor (actor_id, film_id) values (1,1)
insert into film_actor (actor_id, film_id) values (2,3)
insert into film_actor (actor_id, film_id) values (3,2)

select * FROM  film f
select * from actor a 
select * from film_actor 



