create database if not exists crud_db;
use crud_db;

drop table if exists user;

create table user (
id int (8) not null auto_increment,
name varchar(25) default null,
age int(3) default null,
isAdmin tinyint(1) default null,
createdDate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
primary key (id)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

insert into user values 
(null,'Mike',37,true,null),
(null,'Zack',20,false,null),
(null,'Lilia',23,true,null),
(null,'Viola',59,false,null),
(null,'Carolina',28,false,null),
(null,'Mike',37,true,null),
(null,'Zack',20,false,null),
(null,'Lilia',23,true,null),
(null,'Viola',59,false,null),
(null,'Carolina',28,false,null),
(null,'Mike',37,true,null),
(null,'Zack',20,false,null),
(null,'Lilia',23,true,null),
(null,'Viola',59,false,null),
(null,'Carolina',28,false,null),
(null,'Mike',37,true,null),
(null,'Zack',20,false,null),
(null,'Lilia',23,true,null),
(null,'Viola',59,false,null),
(null,'Carolina',28,false,null);
