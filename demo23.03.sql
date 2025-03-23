Create database day2;
use day2;
create table library
(Book_id int primary key auto_increment,
name varchar(20),
Author varchar(20),
Price int
);

insert into library values
(01, "Why Bharat Matters", "Dr. S.Jaishankar", 300),
(null, "Rich dad poor dad", "Robert kiyoski", 250),
(null, "Atomic Habits", "James clear", 400),
(null, "The Alchemist", "Paulo", 400),
(null, "The lean startup", "Eric Ries", 300);

select * from library;

desc library; 

drop table library;



use day2;
create table Membership
(M_id int primary key auto_increment,
name varchar(20),
Ph_Number bigint,
Joindate date,
MembershipType varchar(20),
 FOREIGN KEY (Book_id) REFERENCES Library(Book_id)
);

insert into Membership values
(01, "Dhruv", 023145, "2025-03-02", "Premium"),
(null, "Sidharth", 023145, "2025-03-15", "Basic"),
(null, "Tarun", 023145, "2025-03-20", "Standard"),
(null, "hardik", 023145, "2025-01-01", "Basic"),
(null, "muskan", 023145, "2025-02-10", "Premium");

select * from Membership;

drop table Membership;

use day2;
create table Payments
(Payment_id int primary key auto_increment,
Member_id int,
Paymentdate date,
PaymentMethod varchar(20),
FOREIGN KEY (Member_id) REFERENCES Membership(M_id)
);

insert into Payments values
(01, 01, "2025-03-10", "Cash"),
(null, 02, "2025-03-10", "UPI"),
(null, 03, "2025-03-10", "CC"),
(null, 04, "2025-03-10", "UPI"),
(null, 05, "2025-03-10", "Cash");

select * from Payments;


SELECT 
    M.M_id, 
    M.Name AS MemberName, 
    M.Ph_Number, 
    M.MembershipType, 
    P.Payment_id, 
    P.PaymentDate, 
    P.PaymentMethod, 
    L.Book_id, 
    L.name AS BookTitle, 
    L.Author
FROM Membership M
JOIN Payments P ON M.M_id = P.Member_id
JOIN Library L ON M.Book_id = L.Book_id;
