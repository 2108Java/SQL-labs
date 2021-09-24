--SQL Labs homework E. Davis

-- 2.1

select * from employee;

select * from employee where last_name = 'King';

select * from employee where first_name = 'Andrew' and reports_to is null;

-- 2.2

select * from album order by title desc;

select first_name from customer order by city asc;

-- 2.3

insert into genre(genre_id, name) values (26, 'Lo-Fi'), (27, 'Latin');

insert into employee (last_name, first_name, title, reports_to, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email)
values ('Smith', 'John', 'Sales Support Agent', 2, TIMESTAMP '1992-09-13', TIMESTAMP '2000-04-15', '222 Orchid Way', 'Saskatoon', 'SK', 'Canada', 'T80 4J9', '1(889) 555-0909', '1(889) 555-0990', 'john@chinnokcorp.com'),
		('Berry', 'Gary', 'IT Staff', 6, TIMESTAMP '1992-08-26', TIMESTAMP '2002-11-23', '650 Yak Drive', 'Toronto', 'ON', 'Canada', 'T09 800', '1 (448) 889-0000','1 (894) 339-9000', 'gary@chinnokcorp.com');
		
insert into customer (first_name, last_name, company, address, city, state, country, postal_code, phone, email) values 
		('Steve', 'Sanders','American Airlines','6000 Long Way','Fort Worth', 'TX', 'United States','76004-6490','1(817) 555-0120', 'ssanders@aa.com'),
		('Jack', 'Tatum', 'Play Ball Inc.', '9049 Talc Drive', 'Arlington', 'TX', 'United States', '76433-0000', '1(469)800-5394', 'jack@playball.com');
		
-- 2.4

update customer set first_name = 'Robert', last_name = 'Walter' where first_name = 'Aaron', last_name = 'Mitchell';

update artist set name = 'CCR' where name = 'Creedence Clearwater Revival';

-- 2.5 

select * from invoice where billing_address like 'T%';

-- 2.6 

select * from invoice where total between 15 and 50;

select * from employee where hire_date between TIMESTAMP '2003-06-01' and TIMESTAMP '2004-03-01';

-- 2.7 


delete from invoice_line where invoice_id in (50, 61, 116, 245, 268, 290, 342);
delete from invoice where customer_id = 32;
delete from customer where customer_id = 32;

-- 7.1 

select i.invoice_id, c.first_name, c.last_name from customer c inner join invoice i on c.customer_id = i.customer_id;
 
-- 7.2

select c.customer_id, i.invoice_id , c.first_name , c.last_name , i.total from customer c full outer join invoice i on c.customer_id = i.customer_id;

-- 7.3

select ar.name, al.title from album al right join artist ar on ar.artist_id = al.artist_id;

-- 7.4

select ar.name, al.title from album al cross join artist ar order by ar.name ASC;

-- 7.5

select * from employee e inner join employee e2 on e.reports_to = e2.reports_to;