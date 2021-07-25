Create Table Users(
	id Varchar(10) PRIMARY KEY,
	name Varchar(20) NOT NULL,
	email Varchar(30) UNIQUE NOT NULL,
	account_no Bigint Unsigned UNIQUE NOT NULL
	);

Insert Into Users Values
('ABC123', 'userA', 'usera@gmail.com', 123456789),
('DEF456', 'userB', 'userb@gmail.com', 987654321),
('XYZ789', 'userC', 'userc@gmail.com', 192837465);

Create Table Accounts(
	id Varchar(10) PRIMARY KEY,
	account_no Bigint Unsigned UNIQUE NOT NULL,
	balance Decimal(12,2) NOT NULL,
	FOREIGN KEY (id) REFERENCES Users(id),
	FOREIGN KEY (account_no) REFERENCES Users(account_no)
	);

Insert Into Accounts values
('ABC123', 123456789, 5000.50),
('DEF456', 987654321, 9800.40),
('XYZ789', 192837465, 5485466.24);

START TRANSACTION;
Update Accounts join Users Using(id) 
Set balance = balance + 1000 
where name = 'userA';
Commit;

START TRANSACTION;
Update Accounts join Users Using(id) 
Set balance = balance - 500 
where name = 'userA';
Commit;

START TRANSACTION;
Update Accounts join Users Using(id) 
Set balance = balance - 200 
where name = 'userA';
Update Accounts join Users Using(id) 
Set balance = balance + 200 
where name = 'userB';
Commit;
