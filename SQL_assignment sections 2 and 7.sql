--Question 2.1
select *from employee;
select *from employee where last_name = 'King';
select *from employee where reports_to is null and first_name = 'Andrew';

--Question 2.2
select *from album order by title desc;
select *from customer first_name order by city ;
select *from customer;

--Question 2.3
insert into genre (name) values ('New Metal');
insert into genre(name) values ('Horror');
select *from genre;

insert into employee (last_name,first_name,title,reports_to,birth_date,hire_date,address,city,state,country,postal_code,phone,fax,email); 
values ('Kovenburg','Attiya','Product Development Mngr',null,null,timestamp'01-01-2021 00:00:00', '123 Main Street','Montclair','NJ','US',null,null,null,'adarensburg@live.com');
insert into employee (last_name,first_name,title,reports_to,birth_date,hire_date,address,city,state,country,postal_code,phone,fax,email) 
values('Doe','John','IT staff',null,null,timestamp'01-01-2021 00:00:00',null,'New York','NY','US',null,null,null,'JDoe@gmail.com');

insert into customer (first_name,last_name,company,address,city,state,country,postal_code,phone,fax,email,support_rep_id)
values('Rogers','Steve','Captian America Co.','123 Avenue of the Americas','New York','NY','United States','00001',null,null,'stever@gmail.com',null);
insert into customer (first_name,last_name,company,address,city,state,country,postal_code,phone,fax,email,support_rep_id)
values('Stark','Tony','Stark Industries','124 Avenue of the Americas','New York','NY','United States','00001',null,null,'tstark@gmail.com',null);

--Question 2.4
update customer set first_name = 'Robert', last_name ='Walter' where first_name = 'Aaron' and last_name = 'Mitchell';
update artist set name = 'CCR' where name = 'Creedence Clearwater Revival';

select *from artist;

--Question 2.5
select *from invoice;
select *from invoice where billing_address like 'T%';

--Question 2.6
select *from invoice total where 15 <= total and 50 >= total;
select *from employee;

select *from employee where hire_date between'2003-06-01 00:00:00' and '2004-03-01 00:00:00'; 

--Question 2.7
select *from customer where first_name ='Robert' and last_name = 'Walter';

select *from invoice;
select *from customer;
select *from invoice_line;

delete from invoice where customer_id = 32;
delete from invoice_line where invoice_id = 50;  
delete from invoice_line where invoice_id = 61;
delete from invoice_line where invoice_id = 116;
delete from invoice_line where invoice_id = 245;
delete from invoice_line where invoice_id = 268;
delete from invoice_line where invoice_id = 290;
delete from invoice_line where invoice_id = 342;

delete from customer where first_name ='Robert' and last_name = 'Walter';

--Question 7.1
select c.first_name,c.last_name,i.invoice_id from customer c inner join invoice i on c.customer_id = i.customer_id ;

--Question 7.2
select c.customer_id,c.first_name,c.last_name,i.invoice_id,i.total from invoice i full outer join customer c on c.customer_id = i.customer_id ;

--Question 7.3
select *from artist a right outer join album a2 on a.artist_id = a2.artist_id ;

--Question 7.4
select *from artist cross join album order by name;

--Question 7.5
select *from employee e inner join employee e2 on e.reports_to = e2.reports_to ;





