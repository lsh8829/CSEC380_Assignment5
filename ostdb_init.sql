CREATE DATABASE ost_vulndemo;
USE ost_vulndemo
CREATE USER 'ost_db'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MeetTheRequirements!9';
GRANT ALL PRIVILEGES ON *.* TO 'ost_db'@'localhost' WITH GRANT OPTION;