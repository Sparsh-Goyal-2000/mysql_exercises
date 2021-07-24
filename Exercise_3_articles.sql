Create Table Users(
	id int PRIMARY KEY auto_increment,
	name varchar(25),
	type enum('Admin', 'Normal')
	);

Insert Into Users(name, type) values
('Sparsh', 'Admin'), 
('Naman', 'Normal'), 
('Utsav', 'Admin'), 
('Aman', 'Normal'), 
('Abhishek', 'Normal');

Create Table Categories(
	id int PRIMARY KEY auto_increment,
	name varchar(25)
	);

Insert Into Categories(name) Values
('ML'),
('AI'),
('DBMS'),
('DSA'),
('AWS');

Create Table Articles(
	id int PRIMARY KEY auto_increment,
	title varchar(25) NOT NULL,
	categories_id int NOT NULL,
	user_id int NOT NULL,
	FOREIGN KEY (categories_id) REFERENCES Categories(id),
	FOREIGN KEY (user_id) REFERENCES Users(id)
	);

Insert Into Articles(title, categories_id, user_id) values
('ML in Home', 1, 1),
('AI in Car', 2, 4), 
('AWS in World', 5, 3), 
('DSA in CS', 4, 2), 
('DBMS in Office', 3, 5), 
('AI in Home', 2, 1), 
('AWS in Clouds', 5, 5);

Create Table Comments(
	id int PRIMARY KEY auto_increment,
	comment varchar(25) NOT NULL,
	article_id int NOT NULL,
	user_id int NOT NULL,
	FOREIGN KEY (article_id) REFERENCES Articles(id),
	FOREIGN KEY (user_id) REFERENCES Users(id)
	);

Insert Into Comments(comment,article_id,user_id) values
('Wow','1','1'), 
('Awesome','1','1'), 
('Amazing','1','2'), 
('Nice','1','3'), 
('Keep it up','2','3'), 
('Good','2','3'), 
('Beautiful','4','3'), 
('Pretty','4','4'), 
('Average','5','5'), 
('Good','6','4');

Select title from Articles 
join Users on Articles.user_id = Users.id 
where Users.name = 'Sparsh';

Set @user_name = 'Sparsh';
Select title from Articles join Users on Articles.user_id = Users.id where Users.name = @user_name;

Select Articles.title, Comments.comment 
from Articles 
join Users on Articles.user_id = Users.id 
join Comments on Articles.id = Comments.article_id 
where Users.name = 'Sparsh';

Select 
(Select title from Articles where id = article_id) as Title, 
comment as Comments
from Comments 
where article_id in (
	Select id from Articles 
	where user_id = (
		Select id from Users where name = 'Sparsh'
		)
	);
	
Select Articles.title 
from Articles 
left join Comments on Articles.id = Comments.article_id
where Comments.article_id is NULL;

Select title 
from Articles 
where id NOT IN (
	Select distinct article_id from Comments
	);
	
Select Articles.title, count(Comments.id) as max_comments
from Articles 
join Comments on Articles.id = Comments.article_id 
group by Comments.article_id 
order by count(Comments.id) desc 
limit 1;

Select title 
from Articles
where id = (
	Select article_id 
	from Comments 
	group by article_id 
	order by count(id) desc 
	limit 1
	);
	
Select Articles.title 
from Articles 
left join Comments on Articles.id = Comments.article_id 
group by Articles.title
having count(Comments.user_id) - count(distinct Comments.user_id) = 0;
