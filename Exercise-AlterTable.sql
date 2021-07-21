CREATE TABLE testing_table (
name VARCHAR(20),
contact_name VARCHAR(20),
roll_no VARCHAR(20)
);

DESCRIBE testing_table;

ALTER TABLE testing_table DROP name;

DESCRIBE testing_table;

ALTER TABLE testing_table CHANGE contact_name username VARCHAR(20);

DESCRIBE testing_table;

ALTER TABLE testing_table ADD first_name VARCHAR(20), ADD last_name VARCHAR(20);

DESCRIBE testing_table;

ALTER TABLE testing_table MODIFY roll_no INTEGER;

DESCRIBE testing_table;
