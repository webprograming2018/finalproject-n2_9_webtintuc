use newplatform;

insert into role(name,code) VALUES('Quản trị','ADMIN');
insert into role(name,code) VALUES('Người dùng','USER');

insert into users(username,fullname,password,roleid) VALUES('admin','admin','123456',1);
insert into users(username,fullname,password,roleid) VALUES('nguyenvana','nguyễn văn a','123456',2);

insert into category(code, name) values('the-thao','Thể thao');
insert into category(code, name) values('the-gioi','Thế giới');
insert into category(code, name) values('chinh-tri','Chính trị');
insert into category(code, name) values('thoi-su','Thời sự');
insert into category(code, name) values('goc-nhin','Góc nhìn');
