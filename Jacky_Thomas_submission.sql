--2.1 SELECT

select * from employee;

select * from employee where last_name = 'King';

select * from employee where first_name = 'Andrew' and reports_to is null;

--2.2 ORDER BY

select * from album order by title;

select first_name from customer order by city asc;

--2.3 INSERT INTO

insert into genre (name)
values ('contemporary christian'),
('bro country');

insert into employee (last_name, first_name, title, reports_to, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email)
values ('Smith', 'John', 'newbie', '2', '1991-10-13 03:14:32', '2020-08-24 12:24:48', '123 1st Street', 'Townsville', 'NY', 'United States', '165864', '+1 (589) 456 4568', '+1 (542) 987 1234', 'email@email.com'),
('Bruce', 'Wayne', 'Batman', null, '1991-10-13 03:14:32', '2020-08-24 12:24:48', 'Wayne Manor', 'Gotham', 'NJ', 'United States', '228626', '+1 (555) 462 2862', '+1 (555) 462 2862', 'ImBatman@Imbatman.com');

insert into customer (first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id)
values ('Clark', 'Kent', 'Daily Planet', '123 Tomorrow Lane', 'Metropolis', 'NY', 'United Sates', '12345', '+1 (555) 555 5555', '+1 (555) 555 5555', 'superman@superman.com', 1),
('Kara', 'Danvers', 'Catco', '123 Cat Street', 'National City', 'CA', 'United States', '54321', '+1 (333) 333 3333', '+1 (333) 333 3333', 'supergirl@supergirl.com', 1);
			
--2.4 UPDATE

update customer set first_name = 'Robert', last_name = 'Walter'
where first_name = 'Aaron' and last_name ='Mitchell';

update artist set "name" = 'CCR' where "name" = 'Creedence Clearwater Revival';

--2.5 LIKE

select * from invoice where billing_address like 'T%';

--2.6 BETWEEN

select * from invoice where total between 15 and 20;

select * from employee where hire_date between '2003-06-01 00:00:00' and '2004-03-01 23:59:59';

--2.7 DELETE
alter table invoice 
drop constraint fk_invoice_customer_id,
add constraint fk_invoice_customer_id
	foreign key (customer_id)
	references customer(customer_id)
	on delete cascade;
alter table invoice_line 
drop constraint fk_invoice_line_invoice_id,
add constraint fk_invoice_line_invoice_id
	foreign key (invoice_id)
	references invoice(invoice_id)
	on delete cascade;
delete from customer where first_name = 'Robert' and last_name = 'Walter';

--7 JOINS

--7.1 INNER

select first_name, last_name, invoice_id 
from customer c inner join invoice i 
on c.customer_id = i.customer_id;

--7.2 OUTER

select c.customer_id, first_name, last_name, invoice_id, total
from customer c full outer join invoice i 
on c.customer_id = i.customer_id;

--7.3 RIGHT

select "name", title
from album a right outer join artist a2
on a.artist_id = a2.artist_id;

--7.4 CROSS

select * from album a cross join artist a2
order by a2."name" asc;

--7.5 SELF

select * from employee e inner join employee e2 
on e.reports_to = e2.reports_to;