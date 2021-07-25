Create Table Departments(
	id int PRIMARY KEY,
	name Varchar(15) NOT NULL UNIQUE
	);

Insert Into Departments values
(1, 'Banking'),
(2, 'Insurance'),
(3, 'Services');

Create Table Employees(
	id int PRIMARY KEY,
	name Varchar(25) NOT NULL,
	salary mediumint unsigned NOT NULL,
	department_id int NOT NULL,
	FOREIGN KEY (department_id) REFERENCES Departments(id)
	);

Insert Into Employees Values
(1, 'Chris Gayle', 1000000, 1),
(2, 'Michael Clarke', 800000, 2),
(3, 'Rahul Dravid', 700000, 1),
(4, 'Ricky Pointing', 600000, 2),
(5, 'Albie Morkel', 650000, 2),
(6, 'Wasim Akram', 750000, 3);

Create Table Commissions(
	id int PRIMARY KEY,
	employee_id int NOT NULL,
	commission_amount mediumint unsigned NOT NULL,
	FOREIGN KEY (employee_id) REFERENCES Employees(id)
	);

Insert into Commissions values
(1,1,5000),
(2,2,3000),
(3,3,4000),
(4,1,4000),
(5,2,3000),
(6,4,2000),
(7,5,1000),
(8,6,5000);

# i)
Select Name, sum(commission_amount) as Commission 
From Employees 
join Commissions on Employees.id = Commissions.employee_id 
group by employee_id 
order by Commission desc limit 1;

# ii)
Select Name from Employees 
where salary = (
	Select Distinct Salary From Employees 
	Order by Salary desc limit 3,1
	);

# iii)
Select Departments.name, sum(commission_amount) as Commission 
From Departments
join Employees on Departments.id = Employees.department_id 
join Commissions on Employees.id = Commissions.employee_id 
group by Departments.name 
order by Commission desc limit 1;

# iv)

Select group_concat(name) as Names, Commission_amount 
From Commissions 
join Employees on Employees.id = Commissions.employee_id 
group by Commission_amount having Commission_amount > 3000;

# If We Require Group Names for Total Commission
Select group_concat(Name) as Names, Commission 
from (
	Select Name, Sum(commission_amount) as Commission 
	From Employees 
	join Commissions on Employees.id = Commissions.employee_id 
	group by Name
	) as Total_Commissions
group by Commission having Commission > 3000
order by Commission desc;

# OR

Select group_concat(Name) as Names, Commission 
From Employees 
join (
	Select employee_id, Sum(commission_amount) as Commission 
	From Commissions group by employee_id
	) as Total_Commissions 
on Employees.id = Total_Commissions.employee_id 
group by Commission having Commission > 3000 
order by Commission desc;
