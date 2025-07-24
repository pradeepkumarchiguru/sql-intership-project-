drop database project 
create database project 
use project 
drop table customer 

create table if not exists customer  (
customer_id int primary key ,
first_name varchar(50) not null ,
last_name varchar(50),
email varchar(30) unique  not null ,
phone varchar(50) not null,
address varchar(100) not null,
city varchar(100) not null
);

 load data infile
 "C:\\customers.csv"
 into table customer 
 fields terminated by ','
 enclosed by '"'
 lines terminated by '\n'
 ignore 1 rows
 

select * from customer 

create table if not exists product(
product_id int primary key ,
`description` text ,
price decimal(10,2),
stock_quantity int check (stock_quantity >0)
);


load data infile 
"C:\\products.csv"
into table product 
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows 

select * from product 

create table if not exists orders(
order_id int primary key ,
customer_id int ,
order_date varchar(20),
total_amount decimal (10,2) check (total_amount>0),
order_status varchar(100),
foreign key (customer_id) references customer(customer_id)
);

load data infile 
"C:\\orders.csv"
into table orders
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows 

select * from orders 

create table if not exists order_item (
order_item_id int primary key ,
order_id int ,
product_id int ,
quantity int check(quantity>0),
foreign key (order_id) references orders(order_id),
foreign key (product_id) references product(product_id))

load data infile 
"C:\\order_items.csv"
into table order_item
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows 

select * from order_item 


create table if not exists payments(
payment_id int primary key ,
order_id int ,
payment_date varchar(20),
amount decimal (10,2),
payment_method varchar(30),
transaction_id varchar(20),
payment_status varchar(100) default ' successful ',
foreign key (order_id) references orders(order_id));


load data infile 
"C:\\payments.csv"
into table payments
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows 

select * from payments 





