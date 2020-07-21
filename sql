-- CREATE DATABASE all_test;
-- USE all_test;

-- CREATE table my_table(
-- 	id int (6) not NULL PRIMARY KEY,
-- 	name char (12) NOT null,
--    text char (12) NOT null,
--   	place text (255) not null,
--   	age float (0) not null
-- );

-- DESC my_table;

# 索引1
-- create index my_index on my_table(name);

# 索引2
-- ALTER TABLE my_table ADD index name_index(name);

# 删除索引1
-- drop INDEX my_index on my_table;

# 删除索引2
-- ALTER TABLE all_test.my_table drop index name_index;

-- desc my_table;

# 创建表的时候加index

-- CREATE table test2 (
-- 	id int (11) not null,
-- 	day date not null,
-- 	float1 float not null,
-- 	email char (12) not null,
-- 	PRIMARY key(id,day,float1,email),
-- 	index email_index (email)
-- );

# 创建外键1
-- CREATE table test3 (
-- 	id int (11) not null,
-- 	day date not null,
-- 	float1 float not null,
-- 	email char (12) not null,
-- 	test2_id int(11) not null,
-- 	PRIMARY key(id),
-- 	constraint a_foreign foreign key (test2_id) references test2(id)
-- );

# 创建外键2 未命名
-- CREATE table test4 (
-- 	id int (11) not null,
-- 	day date not null,
-- 	float1 float not null,
-- 	email char (12) not null,
-- 	test2_id int(11),
-- 	FOREIGN KEY (test2_id) REFERENCES test2(id),
-- 	PRIMARY key(id)
-- );

# 创建外键3
-- alter table test4 add foreign KEY (id) references test2(id);


# 插入数据 主键最好递增
-- insert into test2 values(4, '2020-8-15', 105.2, 'good');



# -- auto_increment
-- CREATE TABLE test_auto_increment(
-- 	id int auto_increment PRIMARY KEY
-- );

# 修改表结构
-- alter table test_auto_increment add my float not null UNIQUE comment 'add';







