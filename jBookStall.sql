create database jb;
use jb;
-- drop database jb;

create table authors (
a_id varchar(50) primary key, 
a_name varchar(50) not null, 
a_copies_sold int not null);

create table books (
b_id varchar(50) primary key,
 b_name varchar(50) not null,
 b_price DOUBLE not null,
 b_stock int not null,
 b_copy_sold int not null,
 a_id varchar(50) not null,
 FOREIGN KEY (a_id) REFERENCES authors(a_id));
 -- 0896a7d7-c0a6-4d57-b3e7-ad487695361c
create table users(
u_id varchar(50) primary key , 
uname varchar(70) not null , 
email varchar(50) UNIQUE, 
pass_hash TEXT not null, 
c_id varchar(50) UNIQUE,
creation_time datetime,
-- last_access_time datetime,
session_creation datetime,
session_ip_address varchar(50) not null,
session_id text not null
); 
 

create table carts( c_id varchar(50) primary key, 
u_id varchar(50) not null ,chkout BOOLEAN,
FOREIGN KEY (u_id) REFERENCES users(u_id));

create table email(email varchar(50) primary key, u_id varchar(50) not null, 
FOREIGN KEY (u_id) REFERENCES users(u_id));

ALTER TABLE users ADD FOREIGN KEY (email) REFERENCES email(email);
 
 create table checkouts(bill_id varchar(50) primary key ,
 bill_total DOUBLE not null ,
 cc_no varchar(25) , cc_name varchar(35), 
 cc_cvv varchar(5), cc_exp varchar(8), c_id varchar(50),
 FOREIGN KEY (c_id) REFERENCES carts(c_id));
 
 create table cart_data(
 c_id varchar(50) not null,
 b_id varchar(50) not null,
 qty int not null,
 price DOUBLE , 
  FOREIGN KEY (c_id) REFERENCES carts(c_id),
  FOREIGN KEY (b_id) REFERENCES books(b_id));
  




desc users;
select * from users;
select * from carts;
select * from email;
select * from authors;
select * from books;
select * from cart_data;
select * from checkouts;

SELECT cd.c_id,cd.b_id,b.b_name,cd.price,cd.qty FROM cart_data AS cd, books AS b WHERE cd.b_id = b.b_id  and cd.c_id= "0896a7d7-c0a6-4d57-b3e7-ad487695361c";