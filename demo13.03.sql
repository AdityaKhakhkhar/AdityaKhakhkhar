Create database day2;
use day2;
create table Students
(id int primary key auto_increment,
name varchar(20),
Ph_Number bigint,
Course_id int,
foreign key (course_id) references ACourses(course_id),
foreign key (Payment_id) references Payments(Payment_id)
);

insert into students values
(01, "aditya", 0123456, 03),
(null, "raj", 0123456, 04),
(null, "shubh", 0123456, 02),
(null, "akash", 0123456, 01),
(null, "bhavin", 0123456, 05);

select * from students;

desc students; 

drop table students;



use day2;
create table Teacher
(T_id int primary key auto_increment,
name varchar(20),
Ph_Number bigint,
Course_id int,
foreign key (course_id) references ACourses(course_id)
);

insert into Teacher values
(01, "Dhruv", 023145, 02),
(null, "Sidharth", 023145, 03),
(null, "Tarun", 023145, 05),
(null, "hardik", 023145, 01),
(null, "muskan", 023145, 04);

select * from teacher;

drop table teacher;

use day2;
create table ACourses
(Course_id int primary key auto_increment,
name varchar(20),
Duration varchar(20),
Fees int,
foreign key (T_id) references teacher(course_id)
);

insert into ACourses values
(01, "Python", "2months", 10000),
(null, "DBMS", "2months", 10000),
(null, "PowerBi", "1months", 7000),
(null, "Data_Visualisation", "1months", 5000),
(null, "Web_Development", "3months", 15000);

select * from Acourses;


create table Payments
(Payment_id int primary key auto_increment,
Paid_by varchar(20),
Amount int,
Status varchar(20)
);

insert into Payments values
(01, "aditya", 7000, "paid"),
(null, "raj", 5000, "pending"),
(null, "shubh", 10000, "part_payment"),
(null, "akash", 10000, "paid"),
(null, "bhavin", 15000, "paid");

select * from payments;

drop table payments;


select s.name as students, c.name as Courses from students s join ACourses c on s.Course_id = c.Course_id;
select T.name as Teacher, c.name as Courses from teacher T join ACourses c on T.Course_id = c.Course_id;
select s.name as students, p.status as payments from students s inner join Payments P on s.id = p.payment_id;
select s.name as students, c.name as Courses, T.name as Teacher from Students s join ACourses c on s.Course_id = c.Course_id
join Teacher T on s.Course_id = T.Course_id;

drop database day2;