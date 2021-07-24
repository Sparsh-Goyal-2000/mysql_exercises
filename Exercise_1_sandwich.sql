create table tastes(
	name varchar(10) not null,
	filling varchar(10) not null
	);

insert into tastes values
('Brown', 'Turkey'),
('Brown', 'Beef'),
('Brown', 'Ham'),
('Green', 'Beef'),
('Jones', 'Cheese'),
('Green', 'Turkey'),
('Green', 'Cheese');

select  * from tastes;

create table sandwiches(
	location varchar(10) not null,
	bread varchar(10) not null,
	filling varchar(10) not null,
	price float not null,
	index(location)
	);
    
insert into sandwiches values
('Lincoln', 'Rye', 'Ham', 1.25),
('O\'Neill\'s', 'White', 'Cheese', 1.20),
('O\'Neill\'s', 'White', 'Ham', 1.25),
('Old Nag', 'Rye', 'Beef', 1.35),
('Buttery', 'White', 'Cheese', 1.00),
('O\'Neill\'s', 'White', 'Turkey', 1.35),
('Buttery', 'White', 'Ham', 1.10),
('Lincoln', 'Rye', 'Beef', 1.35),
('Lincoln', 'White', 'Ham', 1.30),
('Old Nag', 'Rye', 'Ham', 1.40);

select * from sandwiches;

create table locations(
	LName varchar(10) not null,
	phone int(10) not null,
	address varchar(15),
	FOREIGN KEY(LName) references sandwiches(location)
	);

insert into locations values
('Lincoln', 6834523, 'Lincoln Place'),
('O\'Neill\'s', 6742134, 'Parse St'),
('Old Nag', 7678132, 'Dame St'),
('Buttery', 7023421, 'College St');

select * from locations;

select * from locations 
where lname in (
	select location from sandwiches 
	where filling in (
		select filling from tastes 
		where name = 'Jones'
		)
	);
    
select locations.lname, locations.phone, locations.address 
from locations 
join sandwiches on locations.lname = sandwiches.location
join tastes on sandwiches.filling = tastes.filling 
where tastes.name = 'Jones';

select sandwiches.location, count(distinct tastes.name) 
from sandwiches 
join tastes using(filling) 
group by sandwiches.location;
