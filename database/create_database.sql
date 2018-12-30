create database newplatform;

use newplatform;

create table role
(
	id bigint primary key identity(1,1),
	code varchar(30),
	name nvarchar(100)
);

create table users
(
	id bigint primary key identity(1,1),
	username varchar(30),
	password varchar(32), 
	status int DEFAULT 1,
	isdelete int DEFAULT 0,
    address nvarchar(255), 
    phone varchar(20),
    fullname nvarchar(255),
    roleid bigint foreign key references role(id)
);

create table category
(
	id bigint primary key identity(1,1),
	code varchar(100),
	name nvarchar(100),
	createddate datetime2(7),
	createdby nvarchar(255),
	modifieddate datetime2(7),
	modifiedby nvarchar(255)
);

create table news
(
	id bigint primary key identity(1,1),
	image varchar(100),
	title nvarchar(MAX),
	shortdescription nvarchar(MAX),
	content nvarchar(MAX),
	newslide int DEFAULT 0,
	newhot int DEFAULT 0,
	createddate datetime2(7),
	createdby nvarchar(255),
	modifieddate datetime2(7),
	modifiedby nvarchar(255),
	categoryid bigint foreign key references category(id)
);

create table new_user
(
	id bigint primary key identity(1,1),
    userid bigint foreign key references users(id),
    newid bigint foreign key references news(id),
    content nvarchar(MAX),
	code varchar(100),
    primary key(id)
);

