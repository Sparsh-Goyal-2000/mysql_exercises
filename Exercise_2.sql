Create Database vtapp;

Create USER 'vtapp_user'@'localhost' identified by 'vtapp123';

-- To grant all permissions to user
GRANT ALL PRIVILEGES ON vtapp.* TO 'vtapp_user'@'localhost';

-- To grant access only, user can only view data
GRANT SELECT ON vtapp.* TO 'vtapp_user'@'localhost';
