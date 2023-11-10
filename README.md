# CSEC380_Assignment5

Intentionally vulnerable version of osTicket 1.12.

Setup:
```
docker build . -t osticket
docker run -p 8080:80 -p 3306:3306 osticket
```
Navigate to http://localhost:8080/upload/setup/install.php. 

Follow the prompts for the installation. Default database connection information:
```
Table prefix: ost_
Database host: 127.0.0.1
Database name: ost_vulndemo
Database user: ost_db
Database password: MeetTheRequirements!9
```
