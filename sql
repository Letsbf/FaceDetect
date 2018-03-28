CREATE database face_detect;
use face_detect;

DROP TABLE if EXISTS face;
CREATE TABLE face(name VARCHAR(20) NOT NULL DEFAULT '',group_id VARCHAR(20) NOT NULL DEFAULT '0',uid VARCHAR(20) NOT NULL PRIMARY KEY,user_info VARCHAR(256))CHARACTER SET utf8 COLLATE utf8_general_ci;
create table admin(username varchar(20) not null primary key,password varchar(20) not null) CHARACTER SET utf8 COLLATE utf8_general_ci;


INSERT INTO face VALUE ("杨亮","1403021","14030210035","小猪佩奇身上纹");
insert into admin value("杨亮","123456");

