--2.1 SELECT
select * from employee;

select * from employee where last_name = 'King';

select * from employee where first_name = 'Andrew' and reports_to = null; 

--2.2 ORDER BY

select * from album order by title desc;

select first_name from customer order by city asc;

--2.3 INSERT INTO

insert into genre values(27, 'Industrial'), (28, 'Black Metal');

insert into employee values(9, 'Miller', 'Ashlyn', 'IT Staff', 6, to_timestamp('1993-04-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS.FF'), CURRENT_TIMESTAMP, '623 N 5th Ave', 'Athens', 'OH', 'USA', '23452', '+1 (234) 236-6643', '+1 (234) 336-2643', 'ashlyn@chinookcorp.com'), 
(10, 'Thorp', 'Gavin', 'IT Staff', 6, to_timestamp('1995-08-05 00:00:00', 'YYYY-MM-DD HH24:MI:SS.FF'), CURRENT_TIMESTAMP, '89 S 9th Ave', 'Toledo', 'OH', 'USA', '43452', '+1 (643) 236-6553', '+1 (234) 876-2693', 'gavin@chinookcorp.com');

insert into customer(customer_id, first_name, last_name, address, city, state, country, postal_code, phone, email, support_rep_id) values(60, 'Janet', 'Smith', '345 Eldergrove Ln', 'Richmond', 'VA', 'USA', '23304', '+1 (223) 239-7854', 'janet.smith@gmail.com', 4),
(61, 'Elliot', 'Goldman', '366 Farm Ln', 'Richmond', 'VA', 'USA', '23304', '+1 (223) 339-6654', 'elliot.goldman@gmail.com', 4);

--2.4 UPDATE

update customer set first_name = 'Aaron', last_name = 'Mitchell' where first_name = 'Robert' and last_name = 'Walter';

update artist set "name" = 'CCR' where "name" = 'Creedence Clearwater Revival';

--2.5 LIKE

select * from invoice where billing_address like 'T%';

--2.6 BETWEEN

select * from invoice where total between 15 and 50;

select * from employee where hire_date between to_timestamp('2003-06-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS.FF') and to_timestamp('2004-03-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS.FF');

--2.7 DELETE

delete from customer where first_name = 'Robert' and last_name = 'Walter';

--3.1 System Defined Functions

create function retrieve_time() 
returns timestamp 
as
begin 
	return current_timestamp 
end;

--5.0 Transactions

