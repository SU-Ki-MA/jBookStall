

create database jb;
use jb;

create table authors (
a_id varchar(50) primary key, 
a_name varchar(50) not null, 
a_copies_sold int(11) not null);

create table books (b_id varchar(11) primary key,
 b_name varchar(50) not null,
 b_price DOUBLE(10,2) not null,
 b_stock int(11) not null,
 b_copy_sold int(11) not null,
 a_id varchar(50) not null,
 pages int not null,
 book_year year(4),
 act_creation_time datetime,
last_access_time datetime,
session_creation datetime,
session_ip_address varchar(50) not null,
session_id varchar(50) not null,

 FOREIGN KEY (a_id) REFERENCES authors(a_id) );
 
create table users(u_id varchar(50) primary key , uname varchar(70) not null , email varchar(50) not null UNIQUE, pass_hash varchar(50) not null, salt varchar(50) not null,
 c_id varchar(50) not null UNIQUE); 
 

create table carts( c_id varchar(50) primary key, u_id varchar(50) not null UNIQUE,FOREIGN KEY (u_id) REFERENCES users(u_id));

create table email(email varchar(50) primary key, u_id varchar(50) not null, FOREIGN KEY (u_id) REFERENCES users(u_id));
ALTER TABLE users ADD FOREIGN KEY (email) REFERENCES email(email);
 create table checkouts(bill_id varchar(50) primary key ,
 bill_total DOUBLE(10,2) not null ,
 cc_no varchar(25) , cc_name varchar(35), 
 cc_cvv varchar(5), cc_exp DATE, c_id varchar(50),
 FOREIGN KEY (c_id) REFERENCES carts(c_id));
 
 create table cart_data(
 c_id varchar(50) not null,
 b_id varchar(50) not null,
 qty int(11) not null,
 price DOUBLE(10,2) , 
 chkout varchar(50),
  FOREIGN KEY (c_id) REFERENCES carts(c_id),
  FOREIGN KEY (b_id) REFERENCES books(b_id));
