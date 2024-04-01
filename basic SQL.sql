show databases;
CREATE DATABASE sale;
DROP DATABASE sale;
use sale;
CREATE TABLE customer_info (
id int, first_name varchar(25), last_name varchar(25)

);
show tables;
insert into customer_info values (1,"aman","ver");
insert into customer_info values (2,"kunal","ch");
insert into customer_info values (3,"ashish","gaddha");
insert into customer_info values (4,"Mohit","murgi");
select * from customer_info;
SELECT * FROM customer_info;
SELECT * FROM customer_info where last_name="ch" OR last_name="murgi";
SELECT * FROM customer_info where first_name="Mohit" AND last_name="murgi";
DROP TABLE CUSTOMER_INFO;
CREATE TABLE customer_info(id int auto_increment ,first_name varchar(25),last_name varchar(25),salary integer,primary key(id));
INSERT INTO customer_info(first_name,last_name,salary) values ("Tarun","Kumar",20000);
select * from customer_info;
drop table customer_info;
CREATE TABLE customer_info(id int auto_increment ,first_name varchar(25),last_name varchar(25),salary integer,primary key(id));
INSERT INTO customer_info(first_name,last_name,salary) values ("Tarun","Kumar",20000),
("Tarun4","Kumar4",20000),("Tarun5","Kumar5",20000),("Tarun6","Kumar6",NULL);
SELECT * FROM customer_info;
drop table customer_info;

# 						Contraint - NOT NULL 				#

# DEFININING DURING TABLE CREATION
CREATE TABLE customer_info(id int auto_increment ,first_name varchar(25),last_name varchar(25),salary integer NOT NULL,primary key(id));
DESCRIBE CUSTOMER_INFO;
DROP table customer_info;

# ADDING CONSTRAINT AFTER CREATION USING ALTER TABLE
CREATE TABLE customer_info(id int auto_increment ,first_name varchar(25),last_name varchar(25),salary integer,primary key(id));
ALTER TABLE customer_info MODIFY COLUMN salary FLOAT NOT NULL;

# INSERTING VALUES
INSERT INTO customer_info(first_name,last_name,salary) values ("Tarun","Kumar",20000);
INSERT INTO customer_info(first_name,last_name,salary) values ("aman","ver",25000);
INSERT INTO customer_info(first_name,last_name,salary) values ("Ashish","Gaddha",28000);
INSERT INTO customer_info(first_name,last_name,salary) values ("Mohit","Murgi",31000);

# UPDATION
UPDATE customer_info
SET salary = 50000
WHERE id=3;
select * from customer_info;
describe customer_info;
DROP TABLE customer_info;

# 					CONSTRAINTS - UNIQUE					#

 CREATE TABLE customer_info(
 id int not null,
 first_name varchar(25),
 last_name varchar(25),
 salary int not null,
 pan_number int unique,
  house_number int unique,
  primary key (id)
  );
  
  describe customer_info;
  
  
  #					ADD CONSTRAINT USING ALTER			#
  insert into customer_info (id,first_name,last_name,salary,pan_number,house_number) values (1,"Tarun","kumar",20000,1234,987);
  ALTER table customer_info
  add constraint pan_name unique (pan_number,first_name);
    ALTER table customer_info
    add constraint pan_L_name unique (pan_number,last_name);

  select * from customer_info;
  insert into customer_info (id,first_name,last_name,salary,pan_number,house_number) values (1,"Tarun","kumar",20000,1234,987);
  insert into customer_info (id,first_name,last_name,salary,pan_number,house_number) values (2,"Tarun2","kumar2",20001,1231,981);
  insert into customer_info (id,first_name,last_name,salary,pan_number,house_number) values (3,"Tarun",4545,20000,4545,4);
  drop table customer_info;
  
  create table student_info(
  id int auto_increment,
  first_name varchar(25),
  last_name varchar(25),
  primary key(id)
  );

alter table student_info
add constraint uc_student unique(first_name,last_name);
  

insert into student_info(first_name,last_name) values ("tarun","Kumar");
insert into student_info(first_name,last_name) values ("Supoon","Supoon");
insert into student_info(first_name,last_name) values ("Tarun","Kumar");


#			remove constraint 				#
alter table student_info
drop index uc_student;

drop table student_info;

create table person(
id int not null,
first_name varchar(25),
last_name varchar(25),
age int,
primary key(id)
);
desc person;

alter table person
drop primary key;


alter table person
add constraint uc_person primary key (id,last_name);

insert into person values(
1,'Tarun','Kumar',24
);

insert into person values(
1,'Tarun','Kumar',24
);

alter table person
drop primary key;

#		Foreign key			#

drop table person;

create table person(
id int not null,
first_name varchar(25),
last_name varchar(25),
age int,
primary key(id)
);
desc person;

create table orders(
orderid int not null,
orderNumber int not null,
id int,
primary key(orderid),
foreign key(id) references person(id)
);

insert into person values(1,"Tarun","Kumar",24),(2,"Savita","nirali",29),(3,"Shiv","upadhyay",28),(4,"preet","Bhati",22);
insert into person values(5,"Kunal","chaudhary",24);
insert into person values(6,"Aman","chaudhary",24);
insert into person values(7,"mohit","chaudhary",27);

select * from person;
select * from orders;

insert into orders values (1,1,2);
insert into orders values (2,2,3);
insert into orders values (3,3,1);
insert into orders values (12,6,4);
insert into orders values (13,7,5);
insert into orders values (14,8,6);
insert into orders values (155,9,7);





select * from orders,person where orders.id=person.id;

select * from person as ps inner join orders as od
on ps.id=od.id;

select * from person as ps left join orders as od
on ps.id=od.id;

select * from person as ps left outer join orders as od	
on ps.id=od.id order by age desc;

select * from orders; 
select * from person;  

select * from person left outer join orders on person.id=orders.id order by age;
select * from person left join orders on person.id=orders.id order by age;
select * from person full outer join orders on person.id=orders.id order by age;

select * from person right outer join orders on person.id=orders.id order by age;

select first_name from person left outer join orders on person.id=orders.id where age>28;  


select * from person as ps inner join orders as od on ps.id=od.id;

drop table customers;

create  table customers(
id int auto_increment,
first_name varchar(25),
country varchar(25),
capital varchar(25),
primary key(id));

insert into customers(first_name,country,capital) values
("tarun","India","Delhi"),("Varun","Australia","Melbourne"),("Arun","USA","Washington"),
("Aman","Netherlands","Denmark"),("Preet","germany","berlin"),("Ashish","pakistan","islamabd");


select * from customers where not country ="australia";


create table if not exists bank_details(
age int,
job varchar(30),
marital varchar(30),
education varchar(30),
`default` varchar(30),
balance int , 
housing varchar(30),
loan varchar(30) , 
contact varchar(30),
`day` int,
`month` varchar(30) , 
duration int , 
campaign int,
pdays int , 
previous int , 
poutcome varchar(30) , 
y varchar(30));

select * from bank_details;

insert into bank_details values
(44,"technician","single","secondary","no",29,"yes","no","unknown",5,"may",151,1,-1,0,"unknown","no"),
(33,"entrepreneur","married","secondary","no",2,"yes","yes","unknown",5,"may",76,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",1506,"yes","no","unknown",5,"may",92,1,-1,0,"unknown","no"),
(33,"unknown","single","unknown","no",1,"no","no","unknown",5,"may",198,1,-1,0,"unknown","no"),
(35,"management","married","tertiary","no",231,"yes","no","unknown",5,"may",139,1,-1,0,"unknown","no"),
(28,"management","single","tertiary","no",447,"yes","yes","unknown",5,"may",217,1,-1,0,"unknown","no"),
(42,"entrepreneur","divorced","tertiary","yes",2,"yes","no","unknown",5,"may",380,1,-1,0,"unknown","no"),
(58,"retired","married","primary","no",121,"yes","no","unknown",5,"may",50,1,-1,0,"unknown","no"),
(43,"technician","single","secondary","no",593,"yes","no","unknown",5,"may",55,1,-1,0,"unknown","no"),
(41,"admin.","divorced","secondary","no",270,"yes","no","unknown",5,"may",222,1,-1,0,"unknown","no"),
(29,"admin.","single","secondary","no",390,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",6,"yes","no","unknown",5,"may",517,1,-1,0,"unknown","no"),
(58,"technician","married","unknown","no",71,"yes","no","unknown",5,"may",71,1,-1,0,"unknown","no"),
(57,"services","married","secondary","no",162,"yes","no","unknown",5,"may",174,1,-1,0,"unknown","no"),
(51,"retired","married","primary","no",229,"yes","no","unknown",5,"may",353,1,-1,0,"unknown","no"),
(45,"admin.","single","unknown","no",13,"yes","no","unknown",5,"may",98,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",52,"yes","no","unknown",5,"may",38,1,-1,0,"unknown","no"),
(60,"retired","married","primary","no",60,"yes","no","unknown",5,"may",219,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",0,"yes","no","unknown",5,"may",54,1,-1,0,"unknown","no"),
(28,"blue-collar","married","secondary","no",723,"yes","yes","unknown",5,"may",262,1,-1,0,"unknown","no"),
(56,"management","married","tertiary","no",779,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(32,"blue-collar","single","primary","no",23,"yes","yes","unknown",5,"may",160,1,-1,0,"unknown","no"),
(25,"services","married","secondary","no",50,"yes","no","unknown",5,"may",342,1,-1,0,"unknown","no"),
(40,"retired","married","primary","no",0,"yes","yes","unknown",5,"may",181,1,-1,0,"unknown","no"),
(44,"admin.","married","secondary","no",-372,"yes","no","unknown",5,"may",172,1,-1,0,"unknown","no"),
(39,"management","single","tertiary","no",255,"yes","no","unknown",5,"may",296,1,-1,0,"unknown","no"),
(52,"entrepreneur","married","secondary","no",113,"yes","yes","unknown",5,"may",127,1,-1,0,"unknown","no"),
(46,"management","single","secondary","no",-246,"yes","no","unknown",5,"may",255,2,-1,0,"unknown","no"),
(36,"technician","single","secondary","no",265,"yes","yes","unknown",5,"may",348,1,-1,0,"unknown","no"),
(57,"technician","married","secondary","no",839,"no","yes","unknown",5,"may",225,1,-1,0,"unknown","no"),
(49,"management","married","tertiary","no",378,"yes","no","unknown",5,"may",230,1,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",39,"yes","yes","unknown",5,"may",208,1,-1,0,"unknown","no"),
(59,"blue-collar","married","secondary","no",0,"yes","no","unknown",5,"may",226,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",10635,"yes","no","unknown",5,"may",336,1,-1,0,"unknown","no"),
(57,"technician","divorced","secondary","no",63,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(25,"blue-collar","married","secondary","no",-7,"yes","no","unknown",5,"may",365,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",-3,"no","no","unknown",5,"may",1666,1,-1,0,"unknown","no"),
(36,"admin.","divorced","secondary","no",506,"yes","no","unknown",5,"may",577,1,-1,0,"unknown","no"),
(37,"admin.","single","secondary","no",0,"yes","no","unknown",5,"may",137,1,-1,0,"unknown","no"),
(44,"services","divorced","secondary","no",2586,"yes","no","unknown",5,"may",160,1,-1,0,"unknown","no"),
(50,"management","married","secondary","no",49,"yes","no","unknown",5,"may",180,2,-1,0,"unknown","no"),
(60,"blue-collar","married","unknown","no",104,"yes","no","unknown",5,"may",22,1,-1,0,"unknown","no"),
(54,"retired","married","secondary","no",529,"yes","no","unknown",5,"may",1492,1,-1,0,"unknown","no"),
(58,"retired","married","unknown","no",96,"yes","no","unknown",5,"may",616,1,-1,0,"unknown","no"),
(36,"admin.","single","primary","no",-171,"yes","no","unknown",5,"may",242,1,-1,0,"unknown","no"),
(58,"self-employed","married","tertiary","no",-364,"yes","no","unknown",5,"may",355,1,-1,0,"unknown","no"),
(44,"technician","married","secondary","no",0,"yes","no","unknown",5,"may",225,2,-1,0,"unknown","no"),
(55,"technician","divorced","secondary","no",0,"no","no","unknown",5,"may",160,1,-1,0,"unknown","no"),
(29,"management","single","tertiary","no",0,"yes","no","unknown",5,"may",363,1,-1,0,"unknown","no"),
(54,"blue-collar","married","secondary","no",1291,"yes","no","unknown",5,"may",266,1,-1,0,"unknown","no"),
(48,"management","divorced","tertiary","no",-244,"yes","no","unknown",5,"may",253,1,-1,0,"unknown","no"),
(32,"management","married","tertiary","no",0,"yes","no","unknown",5,"may",179,1,-1,0,"unknown","no"),
(42,"admin.","single","secondary","no",-76,"yes","no","unknown",5,"may",787,1,-1,0,"unknown","no"),
(24,"technician","single","secondary","no",-103,"yes","yes","unknown",5,"may",145,1,-1,0,"unknown","no"),
(38,"entrepreneur","single","tertiary","no",243,"no","yes","unknown",5,"may",174,1,-1,0,"unknown","no"),
(38,"management","single","tertiary","no",424,"yes","no","unknown",5,"may",104,1,-1,0,"unknown","no"),
(47,"blue-collar","married","unknown","no",306,"yes","no","unknown",5,"may",13,1,-1,0,"unknown","no"),
(40,"blue-collar","single","unknown","no",24,"yes","no","unknown",5,"may",185,1,-1,0,"unknown","no"),
(46,"services","married","primary","no",179,"yes","no","unknown",5,"may",1778,1,-1,0,"unknown","no"),
(32,"admin.","married","tertiary","no",0,"yes","no","unknown",5,"may",138,1,-1,0,"unknown","no"),
(53,"technician","divorced","secondary","no",989,"yes","no","unknown",5,"may",812,1,-1,0,"unknown","no"),
(57,"blue-collar","married","primary","no",249,"yes","no","unknown",5,"may",164,1,-1,0,"unknown","no"),
(33,"services","married","secondary","no",790,"yes","no","unknown",5,"may",391,1,-1,0,"unknown","no"),
(49,"blue-collar","married","unknown","no",154,"yes","no","unknown",5,"may",357,1,-1,0,"unknown","no"),
(51,"management","married","tertiary","no",6530,"yes","no","unknown",5,"may",91,1,-1,0,"unknown","no"),
(60,"retired","married","tertiary","no",100,"no","no","unknown",5,"may",528,1,-1,0,"unknown","no"),
(59,"management","divorced","tertiary","no",59,"yes","no","unknown",5,"may",273,1,-1,0,"unknown","no"),
(55,"technician","married","secondary","no",1205,"yes","no","unknown",5,"may",158,2,-1,0,"unknown","no"),
(35,"blue-collar","single","secondary","no",12223,"yes","yes","unknown",5,"may",177,1,-1,0,"unknown","no"),
(57,"blue-collar","married","secondary","no",5935,"yes","yes","unknown",5,"may",258,1,-1,0,"unknown","no"),
(31,"services","married","secondary","no",25,"yes","yes","unknown",5,"may",172,1,-1,0,"unknown","no"),
(54,"management","married","secondary","no",282,"yes","yes","unknown",5,"may",154,1,-1,0,"unknown","no"),
(55,"blue-collar","married","primary","no",23,"yes","no","unknown",5,"may",291,1,-1,0,"unknown","no"),
(43,"technician","married","secondary","no",1937,"yes","no","unknown",5,"may",181,1,-1,0,"unknown","no"),
(53,"technician","married","secondary","no",384,"yes","no","unknown",5,"may",176,1,-1,0,"unknown","no"),
(44,"blue-collar","married","secondary","no",582,"no","yes","unknown",5,"may",211,1,-1,0,"unknown","no"),
(55,"services","divorced","secondary","no",91,"no","no","unknown",5,"may",349,1,-1,0,"unknown","no"),
(49,"services","divorced","secondary","no",0,"yes","yes","unknown",5,"may",272,1,-1,0,"unknown","no"),
(55,"services","divorced","secondary","yes",1,"yes","no","unknown",5,"may",208,1,-1,0,"unknown","no"),
(45,"admin.","single","secondary","no",206,"yes","no","unknown",5,"may",193,1,-1,0,"unknown","no"),
(47,"services","divorced","secondary","no",164,"no","no","unknown",5,"may",212,1,-1,0,"unknown","no"),
(42,"technician","single","secondary","no",690,"yes","no","unknown",5,"may",20,1,-1,0,"unknown","no"),
(59,"admin.","married","secondary","no",2343,"yes","no","unknown",5,"may",1042,1,-1,0,"unknown","yes"),
(46,"self-employed","married","tertiary","no",137,"yes","yes","unknown",5,"may",246,1,-1,0,"unknown","no"),
(51,"blue-collar","married","primary","no",173,"yes","no","unknown",5,"may",529,2,-1,0,"unknown","no"),
(56,"admin.","married","secondary","no",45,"no","no","unknown",5,"may",1467,1,-1,0,"unknown","yes"),
(41,"technician","married","secondary","no",1270,"yes","no","unknown",5,"may",1389,1,-1,0,"unknown","yes"),
(46,"management","divorced","secondary","no",16,"yes","yes","unknown",5,"may",188,2,-1,0,"unknown","no"),
(57,"retired","married","secondary","no",486,"yes","no","unknown",5,"may",180,2,-1,0,"unknown","no"),
(42,"management","single","secondary","no",50,"no","no","unknown",5,"may",48,1,-1,0,"unknown","no"),
(30,"technician","married","secondary","no",152,"yes","yes","unknown",5,"may",213,2,-1,0,"unknown","no"),
(60,"admin.","married","secondary","no",290,"yes","no","unknown",5,"may",583,1,-1,0,"unknown","no");



#	#	#	#	#	#	#				PRACTICE			#	#	#	#	#	#	#
select * from bank_details;

select * from bank_details where age>=30 and age<=35 order by balance; 
select * from bank_details where age=30 between age=35; 

select * from bank_details where age<=60 and job='retired' order by balance; 
use sale;
#1		fine out sum of balance 
select min(balance) from bank_details;

#2		find out avarage of balance 
SELECT AVG(balance) FROM bank_details;

#3		Find out who is having a min balance 
SELECT * FROM bank_details WHERE balance=(SELECT MIN(balance) FROM bank_details);

#4		Find out who is having a maximum balance 
SELECT * FROM bank_details WHERE balance=(SELECT MAX(balance) from bank_details);

#5		Prepare a list of all the person who is having loan
SELECT * FROM bank_details where loan='yes';

#6		Find out average balance for all the people whose job role is admin 
select avg(balance) from bank_details where job='admin.';

#7		Find out a record  without job whose age is below 45
SELECT * FROM bank_details WHERE job='unknown' and age<45;

#8		Find out a record where education is primarty and person is jobless
SELECT * FROM bank_details WHERE education='primary' and job='jobless' or job='self-employed';

#9		Find of a record whose bank account is having a negative balance 
SELECT * FROM bank_details WHERE balance<0;

#10		Find our a record who is not having house at all along with there balance 
SELECT * FROM bank_details WHERE housing='no' AND balance<1;


























