--SELECT--
select * from employee;
select * from employee where last_name ='King';
select * from employee where (first_name ='Andrew' and reports_to is null);

--ORDER BY--
select * from album order by title desc;
select first_name from customer order by city asc;

--INSERT INTO--
insert into genre (genre_id,name) values ('26','new_genre'),('27','another_new_genre');
insert into employee values ('9','Brady','Tom','QB',null,'1960-05-23 00:00:00','2007-04-30 00:00:00','123 Place Rd','Tampa','FL','USA','12345','+1 (800) 123-1234','+1 (800) 123-1235','tom@chinookcorp.com');
insert into employee values ('10','Wilsom','Russel','QB',null,'1961-02-23 00:00:00','2008-04-15 00:00:00','456 Road Ave','Seatle','WA','USA','56789','+1 (800) 321-1234','+1 (800) 321-1235','russ@chinookcorp.com');
insert into customer values ('60','Brown','James',null,'2342 Heaven St','Hollywood','CA','USA','12345','+1 (800) 123-1234',null,'james@brown.com','3');
insert into customer values ('61','Doe','John',null,'1234 Hell Ave','Hollywood','CA','USA','12456','+1 (800) 143-1456',null,'john@doe.com','4');

--UPDATE--
update customer set first_name = 'Robert',last_name = 'Walter' where customer_id = '32';
update artist set name = 'CCR' where name = 'Creedence Clearwater Revival';

--LIKE--
select * from invoice where billing_address like 'T%';

--BETWEEN--
select * from invoice where total between 15 and 50;
select * from employee where hire_date between '2003-06-01' and '2004-03-01';

--DELETE--
ALTER TABLE public.invoice_line drop CONSTRAINT fk_invoice_line_invoice_id;
ALTER TABLE public.invoice_line ADD CONSTRAINT fk_invoice_line_invoice_id FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)on delete cascade;
delete from customer where customer_id = '32';

--INNER--
select customer.first_name,  invoice.invoice_id from customer inner join invoice on customer.customer_id = invoice.customer_id;

--OUTER--
select customer.customer_id, customer.first_name, customer.last_name, invoice.invoice_id, invoice.total from customer left join invoice on customer.customer_id = invoice.customer_id;

--RIGHT--
select album.title, artist.name from artist right join album on artist.artist_id = album.artist_id;

--CROSS--
select * from album cross join artist a order by a.name asc;

--SELF--
select * from employee a inner join employee b on a.reports_to = b.reports_to;
