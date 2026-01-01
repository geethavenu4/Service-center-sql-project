create database jntu;
use jntu;
create table engineeringstudents (
id int primary key ,
first_name varchar(50),
last_name varchar(50),
email varchar(100) unique,
department char(30),
age int);
insert into engineeringstudents values
(1 , 'geetha' , 'venu' ,'geetha@gmail.com', 'cse',  20),
(2 , ' priya', 'sri' ,'priya@gmail.com', 'cse',  21),
(3 , 'lucky' , 'jay' ,'lucky@gmail.com', 'cse',  22),
(4 , 'jaanu' , 'dev' ,'jaanu@gmail.com', 'cse',  19);
 select * , concat(first_name,last_name)as fullname from engineeringstudents
select * , concat(id,first_name)as name from engineeringstudents
select * , substring_index(email,'@',-1) as mail from engineeringstudents
select * , length(department)as lengthdepartment from engineeringstudents
select * , upper(first_name) as upperfn from engineeringstudents
select * , right(first_name,2) as name  from engineeringstudents
select * , instr(email , '@') as email from engineeringstudents
select * , strcmp(last_name , 'a')  from engineeringstudents
select * from engineeringstudents;
select * , upper(first_name)as firstname from engineeringstudents
select * , lower(last_name)as lastname from engineeringstudents
select * , concat(first_name,last_name)as fullname from engineeringstudents
select * , left(first_name,3)as firstname from engineeringstudents
select * , left(last_name,3)as lastname from engineeringstudents
select * , replace(email,'gmail.com','company.com')as mail from engineeringstudents
select * , reverse(first_name)as firstname from engineeringstudents
select *  from engineeringstudents where first_name like 'j%';
select * from engineeringstudents where length(first_name) = length(last_name)
SELECT 
  CONCAT(
    SUBSTRING(email, 1, 1),
    '*****',
    SUBSTRING(email, LOCATE('@', email))
  ) AS masked_email
FROM engineeringstudents;
select abs(-220) as absolutevalue
select ceil(20.01)
select floor(78.97)
select round(20.50);
select round(avg(age)) from engineeringstudents
select * , log(age,2)as logarithm from engineeringstudents
select * ,   mod(age,2)  from engineeringstudents
select *,sign(age)as signage   from engineeringstudents
select age , age*pi()  from engineeringstudents
select * , exp(age)  from engineeringstudents
select age, radians(age)  from engineeringstudents
select degrees(0.3490658503988659)
select max(age) as maximumage from engineeringstudents
select rand() * 100 as randomvalue