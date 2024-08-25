create database  banking;
use banking;
create table customer(
cid int, 
cname varchar(50), 
city varchar(50));
create table account(
accno int,
acctype varchar(50));
create table depositor(
accno int,
cid int,
amount float);
alter table customer add constraint pk_customer primary key(cid);
alter table account add constraint pk_acount primary key(accno);
alter table depositor add constraint pk_depositor primary key(cid,accno);
alter table depositor add constraint fk_depositor_cid foreign key(cid) references customer(cid);
alter table depositor add constraint fk_depositor_accno foreign key(accno) references account(accno);
desc depositor;
desc account;
desc customer;
alter table account modify acctype varchar(50) not null;
alter table customer modify cname varchar(50) not null;
alter table depositor add constraint check(amount>0);
alter table account add column branchname varchar(50);
alter table account add constraint un_branchname unique(branchname);
alter table account drop constraint un_branchname;
alter table customer modify city varchar(50) default 'delhi';
insert into customer values
(101,'sandhiya','pondicherry'),
(102,'divya','salam'),
(103,'umadevi','trichy'),
(104,'chandran','madurai');
insert into account values
(2021,'saving','lawspet'),
(2022,'checking','muthiyalpet'),
(2023,'saving','saram');
 insert into depositor values
 (2020,101,50000),
 (2021,102,60000);
 select * from depositor;
 alter table depositor drop constraint fk_depositor_cid;
 alter table depositor drop constraint fk_depositor_accno;
