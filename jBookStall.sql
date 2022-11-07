create database jb;
use jb;
-- drop database jb;

create table authors (
a_id varchar(50) primary key, 
a_name varchar(50) not null, 
a_copies_sold int not null);

create table books (
b_id varchar(100) primary key,
 b_name varchar(100) not null,
 b_price DOUBLE not null,
 b_stock int not null,
 b_copy_sold int not null,
 a_id varchar(100) not null,
 FOREIGN KEY (a_id) REFERENCES authors(a_id));
 -- 0896a7d7-c0a6-4d57-b3e7-ad487695361c
create table users(
u_id varchar(100) primary key , 
uname varchar(100) not null , 
email varchar(100) UNIQUE, 
pass_hash TEXT not null, 
c_id varchar(50) UNIQUE,
creation_time datetime,
-- last_access_time datetime,
session_creation datetime,
session_ip_address varchar(50) not null,
session_id text not null
); 
 

create table carts( c_id varchar(100) primary key, 
u_id varchar(100) not null ,chkout BOOLEAN,
FOREIGN KEY (u_id) REFERENCES users(u_id));

create table email(email varchar(50) primary key, u_id varchar(100) not null, 
FOREIGN KEY (u_id) REFERENCES users(u_id));

ALTER TABLE users ADD FOREIGN KEY (email) REFERENCES email(email);
 
 create table checkouts(bill_id varchar(50) primary key ,
 bill_time datetime,
 bill_total DOUBLE not null ,
 cc_no varchar(25) , cc_name varchar(35), 
 cc_cvv varchar(5), cc_exp varchar(8), c_id varchar(50) unique,
 FOREIGN KEY (c_id) REFERENCES carts(c_id));
 
 create table cart_data(
 c_id varchar(100) not null,
 b_id varchar(100) not null,
 qty int not null,
 price DOUBLE(11,4) , 
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

SELECT *
FROM carts
NATURAL JOIN checkouts;

select * from books where b_id = (select b_id from cart_data where c_id = "7f1d26cc-4773-46c1-8492-e66d53463b7b") ;
SELECT c_id,bill_id,bill_time,bill_total FROM carts NATURAL JOIN checkouts where u_id="41c82a5e-8974-4071-8064-0871a52b579c" order by bill_time asc;
SELECT cd.c_id,cd.b_id,b.b_name,cd.price,cd.qty FROM cart_data AS cd, books AS b WHERE cd.b_id = b.b_id  and cd.c_id= "0896a7d7-c0a6-4d57-b3e7-ad487695361c";