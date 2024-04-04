use music_data;

/*Q1 : who is the senior most employee bases on job title ?
ans:	employee_id	last_name	first_name	title	        reports_to	levels	birthdate	      hire_date	         address	         city	   state	country	 postal_code  phone	                 fax	           email
		1	        Adams	    Andrew	    General Manager	  9	        L6	    18-02-1962 00:00  14-08-2016 00:00	11120 Jasper Ave NW	 Edmonton   AB	     Canada	  T5K 2N1	  +1 (780) 428-9482	 +1 (780) 428-3457	andrew@chinookcorp.com
*/

select * from employee
order by levels desc
limit 1;

/*Q2 : Which country have the most invoices ?
ans:  131	USA
*/


select count(*) , billing_country from invoice
group by billing_country 
order by count(*) desc;

/*Q3 : what are top 3 values of total invoice*/

select total from invoice
order by total desc
limit 3;


/*Q4 : Which city has best customers ? We would like to throw a promotional music fastival in the fastival in the city we made the most money. 
write a query that return one city name and sum of all invoice total.*/

select sum(total) as invoice_total , billing_city from invoice
group by billing_city
order by invoice_total desc;


/*Q5 : Who is the best customer? The customer who has spend the most money will declared the best customer .
write the query that returns the person who has spent the most money.
ans:	first_name	last_name	    customer_id	total
		FrantiÅ¡ek	WichterlovÃ¡	5	         144.54000000000002
 */

select c.first_name, c.last_name, c.customer_id, sum(i.total) as total
from customer as c join invoice as i
on c.customer_id = i.customer_id 
group by c.customer_id ,c.first_name, c.last_name
order by total desc 
limit 1;

