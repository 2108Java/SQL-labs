==========================sql Lab========================================
---------------------2.1 select-----------------------------------------
select * from employee
select * from employee where last_name ='King'
select * from employee where first_name ='Andrew' and reports_to is null
--------------------2.2 order by ----------------------------------------
select * from album order by title desc 
select first_name from customer order by city asc
--------------------2.3 Insert into--------------------------------------
insert into genre (genre_id,name) values (26,'Romance'),(27,'Horor')
insert into employee (last_name,first_name,title,reports_to,birth_date,hire_date,address,city,state,country,postal_code,phone,fax,email)
values('zerihun','Yibeltal','fullstack developer',6,'19850101','20211005','6612 oxon hill','oxon hill','MD','United state','78945','3265987451','9265987451','yib@live.com' ),
('Abel','Amen','frontend developer',6,'19950101','20211005','8457 oxon hill','oxon hill','DC','United state','18945','3244987451','9265687451','ayib@live.com' )
insert into customer (first_name,last_name,company,address,city,state,country,postal_code,phone,fax,email,support_rep_id) 
values('Amen','Tamrat',null,'234 oxonhill','new york',null,'united state','65412','+2578963698',null,'amen@pgcps.org',5),
('Eldana','Jhon',null,'4758 oxonhill','Addis Ababa',null,'Ethiopia','78956','+3698563698',null,'eldana@pgcps.org',3)
--------------------2.4 update-------------------------------------------- 
update customer set first_name = 'Robert',last_name ='Walter'
		where first_name ='Aaron' and last_name ='Mitchell'
update artist set name = 'CCR'
where name = 'Creedence Clearwater Revival'
--------------------2.5 like----------------------------------------------
select * from invoice where billing_address like 'T%'
--------------------2.6 Between-------------------------------------------
select * from invoice where total between 15 and 50
select * from employee where hire_date between '20030601' and '20040301'
--------------------2.7 delete--------------------------------------------
delete from invoice_line where invoice_id in (50,61,116,245,268,290,342)
delete from  invoice where customer_id = '32'
delete from customer where first_name = 'Robert' and last_name ='Walter' 
--------------------7.1 Joins---------------------------------------------
select first_name,Last_name from customer as c inner join orders as o on c.customer_id = o.customer_id
--------------------7.2 outer---------------------------------------------
select c.customer_id,c.first_name,c.last_name,i.invoice_id,i.total from customer  c full outer join invoice  i on c.customer_id = i.customer_id
--------------------7.3 Right---------------------------------------------
select al.title,ar.name from album al right join  artist ar on al.artist_id=ar.artist_id
--------------------7.4 cross----------------------------------------------
select * from album  cross join  artist  order by name asc 
--------------------7.5 self-----------------------------------------------
select  m.employee_id as employee, 
	   e.employee_id as manager
	   from employee e right join employee m on e.employee_id = m.reports_to 
order by m.employee_id
============================================================================


