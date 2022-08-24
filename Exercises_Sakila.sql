USE sakila;

/*Query for #1*/
select * from actor where first_name = 'Scarlett';
/*Answer: Scarlett Damon, Scarlett Bening*/

/*Query for #2*/
select * from actor where last_name = 'Johansson';
/*Answer: Matthew Johannson, Ray Johansson, Albert Johansson*/

/*Query for #3*/
select count(distinct last_name) from actor;
/*Answer: 121*/

/*Query for #4*/
select max(last_name) as last_name from actor group by last_name having count(*) = 1;
/*Answer: ASTAIRE BACALL BALE BALL BARRYMORE BASINGER BERGEN BERGMAN BIRCH BLOOM BRIDGES BULLOCK CARREY CHAPLIN CLOSE COSTNER 
CROWE CRUISE CRUZ DAMON DAY-LEWIS DERN DREYFUSS DUNST GABLE GIBSON GOLDBERG GRANT HAWKE HESTON HOPE HUDSON HUNT HURT JOLIE
JOVOVICH LEIGH LOLLOBRIGIDA MALDEN MANSFIELD MARX MCDORMAND MIRANDA NICHOLSON PESCI PFEIFFER PHOENIX PINKETT PITT POSEY
PRESLEY REYNOLDS RYDER SINATRA SOBIESKI STALLONE SUVARI SWANK TAUTOU TOMEI VOIGHT WALKEN WAYNE WILSON WITHERSPOON WRAY
*/

/*Query for #5*/
select max(last_name) as last_name from actor group by last_name having count(*) > 1;
/*Answer: AKROYD ALLEN BAILEY BENING BERRY BOLGER BRODY CAGE CHASE CRAWFORD CRONYN DAVIS DEAN DEE DEGENERES DENCH DEPP
DUKAKIS FAWCETT GARLAND GOODING GUINESS HACKMAN HARRIS HOFFMAN HOPKINS HOPPER JACKMAN JOHANSSON KEITEL KILMER MCCONAUGHEY
MCKELLEN MCQUEEN MONROE MOSTEL NEESON NOLTE OLIVIER PALTROW PECK PENN SILVERSTONE STREEP TANDY TEMPLE TORN TRACY WAHLBERG
WEST WILLIAMS WILLIS WINSLET WOOD ZELLWEGER
*/

/*Query for #6*/
select actor.last_name, count(film_actor.film_id) as NumberOfFilms 
from actor inner join film_actor on actor.actor_id = film_actor.actor_id group by last_name
having NumberOfFilms =(select max(Films) from (
select actor.last_name, count(film_actor.film_id) Films 
from actor inner join film_actor on actor.actor_id = film_actor.actor_id group by last_name) as S);
/*Answer: Kilmer*/

/*Query for #7*/
select store_id from inventory
where exists (select title from film where film.film_id = inventory.film_id and title = 'ACADEMY DINOSAUR')
having store_id = 1;
/*Answer: Yes*/

/*Query for #8*/
insert into rental (customer_id, inventory_id, rental_date, staff_id)
values ('1', '1', '2022-08-24 00:50:40', '1');

/*Query for #9*/
select rental_duration from film where title = 'ACADEMY DINOSAUR';
/*Answer: 6 days later or 2022-08-30*/

/*Query for #10*/
select avg(length) from film;
/*Answer: About 115 min*/

/*Query for #11*/
select category.name, avg(film.length) as AvgLength 
from ((category left join film_category on category.category_id = film_category.category_id) 
inner join film on film_category.film_id = film.film_id) group by name; 
/*Answer: Action, 111.6094 min
Animation, 111.0152 min
Children, 109.8000 min
Classics, 111.6667 min
Comedy, 115.8276 min
Documentary, 108.7500 min
Drama, 120.8387 min
Family, 114.7826 min
Foreign, 121.6986 min
Games, 127.8361 min
Horror, 112.4821 min
Music, 113.6471 min
New, 111.1270 min
Sci-Fi, 108.1967 min
Sports, 128.2027 min
Travel, 113.3158 min
*/
/*Query for #12*/
select * from film natural join inventory;
/*Answer: Because since natural join will only show rows for the intersection of columns with the same name that have the
same value, even though film_id matches between film and inventory, last_update does not. Therefore you would get the empty
set from doing the above query.*/