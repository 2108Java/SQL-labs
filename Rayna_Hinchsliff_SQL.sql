--2.0 SQL Queries
--2.1 SELECT
--Task – Select all records from the Employee table.
select * from employee;
--Task – Select all records from the Employee table where last name is King.
select * from employee where last_name = 'King';
--Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
select * from employee where first_name = 'Andrew' and reports_to isnull;

--2.2 ORDER BY
--Task – Select all albums in Album table and sort result set in descending order by title.
select * from album order by title desc;
--Task – Select first name from Customer and sort result set in ascending order by city
select first_name from customer order by city;

--2.3 INSERT INTO
--Task – Insert two new records into Genre table
insert into genre (genre_id, name) values
			(26, 'Electronic'),
			(27, 'Calming');
--Task – Insert two new records into Employee table
insert into employee (employee_id, last_name, first_name, title, reports_to, birth_date, hire_date, address, city, state, country, postal_code, phone, fax, email) values 
(default, 'Hinchsliff', 'Rayna', 'Customer Service Manager', 1, '2020/1/10', '1998/10/28', '105 74 Terr NE', 'Gladstone', 'MO', 'United States', '66418', '+1 (913) 820-3075', null, 'rayna.hinchsliff@revature.net'),
(default, 'Jones', 'William', 'Sales Manager', 1, '2020/1/10', '1994/6/10', '105 74 Terr NE', 'Gladstone', 'MO', 'United States', '66418', '+1 (913) 963-7456', null, 'caseyrock7@yahoo.com');
--Task – Insert two new records into Customer table
insert into customer (customer_id, first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id) values
(default, 'Jake', 'Sullivan', 'Medical Resouce Group', '410 Brodway Blvd', 'Kansas City', 'MO', 'United States', '64118', '+1 (816) 555-5555', null, 'jacob.sulivan@mrg.org', 9),
(default, 'Ashleigh', 'Branham', 'Medical Resouce Group', '410 Brodway Blvd', 'Kansas City', 'MO', 'United States', '64118', '+1 (816) 555-5555', null, 'ashleigh.branham@mrg.org', 9);

--2.4 UPDATE
--Task – Update Aaron Mitchell in Customer table to Robert Walter
update customer set first_name='Robert',last_name='Walter' where first_name='Aaron' and last_name='Mitchell';
--Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
update artist set name='CCR' where name ='Creedence Clearwater Revival';

--2.5 LIKE
--Task – Select all invoices with a billing address like “T%”
select * from invoice where billing_address like 'T%';

--2.6 BETWEEN
--Task – Select all invoices that have a total between 15 and 50
select * from invoice where total between 15 and 50;
--Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
select * from employee where hire_date between '2003/06/01' and '2004/03/01';

--2.7 DELETE
--Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
alter table customer drop constraint fk_customer_support_rep_id, add constraint fk_customer_support_rep_id foreign key (support_rep_id) references employee(employee_id) on delete cascade;
alter table invoice drop constraint fk_invoice_customer_id, add constraint fk_invoice_customer_id foreign key (customer_id) references customer(customer_id) on delete cascade;
alter table invoice_line drop constraint fk_invoice_line_invoice_id, add constraint fk_invoice_line_invoice_id foreign key (invoice_id) references invoice(invoice_id) on delete cascade;
delete from customer where first_name = 'Robert' and last_name='Walter';

--7.0 JOINS
--7.1 INNER
--Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
select c.first_name, i.invoice_id from customer c inner join invoice i on c.customer_id = i.customer_id ;

--7.2 OUTER
--Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
select c.customer_id, c.first_name, c.last_name, i.invoice_id, i.total from customer c full outer join invoice i on c.customer_id = i.customer_id ;
--7.3 RIGHT
--Task – Create a right join that joins album and artist specifying artist name and title.
select s.name, a.title from album a right join artist s on a.artist_id = s.artist_id ;
--7.4 CROSS
--Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
select * from album a cross join artist s order by s.name;
--7.5 SELF
--Task – Perform a self-join on the employee table, joining on the reportsto column.
select * from employee;
select a.first_name, b.first_name from employee a join employee b on a.reports_to = b.employee_id;