--2.1
select * from employee;
select * from employee where last_name = 'King';
select * from employee where first_name = 'Andrew' and reports_to is null;

--2.2
select * from album order by title desc;
select first_name from customer order by city asc;

--2.3
insert into genre (name) values ('Pirate Metal'), ('Math Rock'); --yes, these are real music genres.

insert into employee (last_name, first_name, title, reports_to, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) 
	values ('Crosby', 'Harry', 'The Old Groaner', 1, '1903/5/3', '1962/8/1', '1112 North J Street', 'Tacoma', 'WA', 'USA', '98433', '+1 (253) 798-7455', '+1 (253) 798-7455', 'bingcrosby@chinookcorp.com');

insert into customer (first_name, last_name, address, city, country, postal_code, phone, email, support_rep_id) 
	values ('Mark', 'Davis', '5723 Morgan Ave', 'Los Angeles ', 'USA', '90011', '+1 (323) 638-2256', 'richardcheesey@gmail', 5);
	
--2.4
update customer set first_name = 'Robert', last_name = 'Walter' where first_name = 'Aaron' and last_name = 'Mitchell';

update artist set name = 'CCR' where name = 'Creedence Clearwater Revival';

--2.5
select * from invoice where billing_address like 'T%';

--2.6
select * from invoice where total between 15 and 50;

select * from employee where hire_date between '2003-6-1' and '2004-3-1';

--2.7
delete from invoice_line where invoice_id in (select invoice_id from invoice where customer_id = (select customer_id from customer where first_name = 'Robert' and last_name = 'Walter'));
delete from invoice where customer_id = (select customer_id from customer where first_name = 'Robert' and last_name = 'Walter');
delete from customer where first_name = 'Robert' and last_name = 'Walter';

--7.1
select c.first_name, c.last_name, i.invoice_id from customer c inner join invoice i on c.customer_id = i.customer_id;

--7.2
select c.customer_id, c.first_name, c.last_name, i.invoice_id, i.total from customer c full outer join invoice i on c.customer_id = i.customer_id;

--7.3
select a.name, a2.title from artist a right outer join album a2 on a.artist_id = a2.artist_id;

--7.4
select * from artist a cross join album a2 order by a.name asc;

--7.5
select * from employee e inner join employee e2 on e.reports_to = e2.employee_id;