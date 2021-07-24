create table Branch(
	BCode varchar(3) PRIMARY KEY,
	Librarian varchar(20) not null,
	address varchar(20) not null
	);
	
insert into Branch values
('B1', 'John Smith', '2 Anglesea Rd'),
('B2', 'Mary Jones', '34 Pearse St'),
('B3', 'Francis Owens', 'Grange X');

create table Titles(
	Title varchar(25) PRIMARY KEY,
	Author varchar(25) not null,
	publisher varchar(25)
	);
	
insert into Titles values
('susannah', 'ann brown', 'macmillan'),
('how to fish', 'amy fly', 'stop press'),
('a history of dublin', 'david little', 'wiley'),
('computer', 'blaise pascal', 'applewoods'),
('the wife', 'ann brown', 'macmillan');

create table Holdings(
	Branch varchar(3),
	Title varchar(25),
	copies int not null,
	PRIMARY KEY(Branch, Title)
	);

insert into Holdings values
('b1', 'susannah', 3),
('b1', 'how to', 2),
('b1', 'a history og dublin', 1),
('b2', 'how to fish', 4),
('b2', 'computer', 2),
('b2', 'the wife', 3),
('b3', 'a history og dublin', 1),
('b3', 'computer', 4),
('b3', 'susannah', 3),
('b3', 'the wife', 1);

select title from Titles where Publisher = 'Macmillan';

select distinct Branch from Holdings 
where title in (
	select title from Titles
	where Author = 'Ann Brown'
	);

select distinct Holdings.Branch 
from Holdings 
join Titles using(Title) 
where Titles.Author = 'Ann Brown';

select Branch, sum(copies) as no_of_books from Holdings group by Branch;

