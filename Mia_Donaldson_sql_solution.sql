-- SQL CHALLENGE SECTIONS 2 AND 7

-- SECTION 2

-- 2.1 SELECT
-- Task – Select all records from the Employee table.
-- Task – Select all records from the Employee table where last name is King.
-- Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.

select * from employee;
select * from employee where last_name = 'King';
select * from employee where first_name = 'Andrew' and reports_to = null ;

-- 2.2 ORDER BY
-- Task – Select all albums in Album table and sort result set in descending order by title.
-- Task – Select first name from Customer and sort result set in ascending order by city

select * from album order by title asc;
select first_name from customer c order by city asc;


-- 2.3 INSERT INTO
-- Task – Insert two new records into Genre table
-- Task – Insert two new records into Employee table
-- Task – Insert two new records into Customer table

insert into genre ("name") values ('Disney');
insert into genre ("name") values ('Trap/Drill');

insert into employee (last_name, first_name, title, reports_to, birth_date, hire_date, address, city, state, 
		country, postal_code, phone, fax, email) 
		VALUES('Doe', 'John', 'IT Staff', 6, '1996-08-15', '2018-11-01', '123 Java Lane', 'Chicago', 'IL', 
		'USA', '60443', '1 (708) 407-6634', '1 (708) 555-5555', 'john@chinookcorp.com');
insert into employee (last_name, first_name, title, reports_to, birth_date, hire_date, address, city, state, 
		country, postal_code, phone, fax, email) 
		VALUES('Smith', 'Anne', 'IT Staff', 6, '1989-05-05', '2018-12-01', '456 Json Lane', 'Bevery Hills', 'CA', 
		'USA', '90210', '1 (305) 704-4366', '1 (305) 555-5555', 'jane@chinookcorp.com');
	
insert into customer (first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) 
		values ('Mia', 'Jones', 'Revature', '789 Michigan Ave', 'Chicago', 'IL','USA', '60652', '1 (773) 202-5862', '', 'mia_jones@gmail.com', 5);
insert into customer (first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) 
		values ('Kelly', 'Black', '', '012 State Street', 'Chicago', 'IL','USA', '60652', '1 (773) 222-2222', '', 'kblack@gmail.com', 3);


-- 2.4 UPDATE
-- Task – Update Aaron Mitchell in Customer table to Robert Walter
-- Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”

update customer set first_name='Robert', last_name='Walter' where first_name = 'Aaron' and last_name = 'Mitchell';
update artist set name='CCR' where name = 'Creedence Clearwater Revival';

-- 2.5 LIKE
-- Task – Select all invoices with a billing address like “T%”

select * from invoice where billing_address like 'T%';


-- 2.6 BETWEEN
-- Task – Select all invoices that have a total between 15 and 50
-- Task – Select all employees hired between 1st of June 2003 and 1st of March 2004

select * from invoice where total between 15 and 50;
select * from employee where hire_date between '2003-06-01' and '2004-03-01';

-- 2.7 DELETE
-- Task – Delete a record in Customer table where the name is Robert Walter 
-- (There may be constraints that rely on this, find out how to resolve them).

delete from invoice_line 
where invoice_id in (select invoice_id from invoice 
where customer_id = (select customer_id from customer 
where first_name ='Robert' and last_name = 'Walter' ));

--select * from customer;

--delete from invoice_line
--	where invoice_line_id in (select invoice_id from invoice where  
--	invoice_id = 32 limit 1);
--
--delete from customer 
--	where customer_id in (select customer_id from customer where  
--	first_name = 'Robert'and last_name = 'Walter' limit 1);

-- fk_invoice_customer_id
-- delete from customer where first_name = 'Robert'and last_name = 'Walter';

-- SECTION 7: JOINS 

-- 7.1 INNER JOIN
-- Task – Create an inner join that joins customers and orders and 
-- 			specifies the name of the customer and the invoiceId.

select c.first_name, c.last_name , i.invoice_id from customer c inner join invoice i on c.customer_id = i.customer_id;

-- 7.2 OUTER JOIN
-- Task – Create an outer join that joins the customer and invoice table, 
--			specifying the CustomerId, firstname, lastname, invoiceId, and total.

select c.customer_id, c.first_name, c.last_name , i.invoice_id, i.total from customer c 
			full outer join invoice i on c.customer_id = i.customer_id;

-- 7.3 RIGHT JOIN
-- Task – Create a right join that joins album and artist specifying artist name and title.

select a.title, a2."name" from album a right outer join artist a2 on a.artist_id = a2.artist_id ;

-- 7.4 CROSS JOIN
-- Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.

select * from album a cross join artist a2 order by a2."name" asc;

-- 7.5 SELF JOIN
-- Task – Perform a self-join on the employee table, joining on the reportsto column.

select * from employee e inner join employee e2 on e.reports_to = e2.reports_to ;




