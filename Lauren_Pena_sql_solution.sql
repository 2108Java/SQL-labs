--2.1
select * from employee;
select * from employee where last_name = 'King';
SELECT * FROM employee WHERE first_name = 'Andrew' AND reports_to is NULL;

--2.2
SELECT * FROM album ORDER BY title DESC;
SELECT first_name FROM customer ORDER BY city ASC;

--2.3
insert into genre (name) values ('Gospel');
insert into genre (name) values ('Christian Comtemporary');

insert into employee (last_name, first_name) values ('Pena', 'Lauren');
insert into employee (last_name, first_name) values ('Pena', 'Jonathan');

insert into customer (first_name, last_name, email) values ('Smith', 'Diana', 'diana.smith@sample.com');
insert into customer (first_name, last_name, email) values ('Smith', 'William', 'william.smith@sample.com');

--2.4
update customer set first_name = 'Robert', last_name = 'Walter' where first_name = 'Aaron' and last_name = 'Mitchell';
update artist set name = 'CCR' where name = 'Creedence Clearwater Revival';

--2.5
select * from invoice where billing_address like 'T%';

--2.6
select * from invoice where total between 15 and 50;
select * from employee where hire_date between '2003-06-01' and '2004-03-01';

--2.7
delete from invoice_line where invoice_id in (select invoice_id from invoice where customer_id = (select customer_id from customer where last_name = 'Walter' and first_name = 'Robert'));
delete from invoice where customer_id = (select customer_id from customer where last_name = 'Walter' and first_name = 'Robert');
delete from customer where last_name = 'Walter' and first_name = 'Robert';

--7.1
select c.first_name, i.invoice_id from customer c inner join invoice i on c.customer_id = i.customer_id;

--7.2
select c.customer_id, c.first_name, c.last_name, i.invoice_id, i.total from customer c full outer join invoice i
	on c.customer_id = i.customer_id;

--7.3
select b.name, a.title from album a right outer join artist b on a.artist_id = b.artist_id;

--7.4
select * from album a cross join artist b order by b.name asc;

--7.5
select a.first_name, b.first_name reports_to from employee a inner join employee b on b.employee_id = a.reports_to;