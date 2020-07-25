# 建库
create database all_test;

# 使用库
use all_test;

# 创建
drop trigger if exists all_test.my_trigger;

# 建表1
create table test1(
	id1 int auto_increment primary key comment '主键注释',
	id2 int unique comment '唯一',
	name char (12) not null,
   text char (12) not null,
  	place text (255) null comment '可以为空',
  	age float not null
)engine=innodb charset=utf8 comment '表注释';

# 建表2
create table test2(
	id int,
	constraint test_fk foreign key (id) references test1(id1) on delete cascade on update cascade,
	# on delete no action\set null
	primary key (id),
	index test_index(id)
)engine=innodb charset=utf8 comment '表注释';

# 查看表结构
desc my_table;

# 建立索引1
create index my_index on my_table(name);

# 索引2
alter table my_table add index name_index(name);

# 删除索引1
drop index my_index on my_table;

# 删除索引2
alter table all_test.my_table drop index name_index;

# 创建表的时候加index
reate table test2 (
	id int (11) not null,
	day date not null,
	float1 float not null,
	email char (12) not null,
	primary key(id,day,float1,email),
	index email_index (email)
);

# 创建外键1
create table test3 (
	id int (11) not null,
	day date not null,
	float1 float not null,
	email char (12) not null,
	test2_id int(11) not null,
	primary key(id),
	constraint a_foreign foreign key (test2_id) references test2(id)
);

# 创建外键2 未命名
create table test4 (
	id int (11) not null,
	day date not null,
	float1 float not null,
	email char (12) not null,
	test2_id int(11),
	foreign key (test2_id) references test2(id),
	primary key(id)
);

# 创建外键3
alter table test4 add foreign key (id) references test2(id);

# 创建外键并命名
alter table test4 add constraint my_fk foreign key (id) references test2(id);

# 外键选项
on delete/update/ restrict（默认 严格、拒绝）/set null/no action/cascade（级联）

# 插入数据 主键最好递增
insert into test2 values(4, '2020-8-15', 105.2, 'good');

# 修改表结构
alter table test_auto_increment add my float not null unique comment 'add';

# 修改表名
alter table test2 rename to test3;

# 重命名字段
alter table test2 change id4 id1 int(12);

# 注意刷新
# 创建触发器 (definer=`root`@`%`可有可无)
delimiter $$
$$
create definer=`root`@`%` trigger `my_trigger` before update on `test1` for each row 
begin
	if new.id2 > 0 
		then set new.id2 = old.id2+100;
	end if;
end;$$
delimiter ;


# 存储过程
# 更改结束符仅当前会话有效
delimiter $
drop procedure if exist my_procedure;
create procedure my_procedure(in value int)
begin
    declare value1 int;
    declare value2 int;
    declare total int;
    devlare done int default false;

    declare mycursor cursor for
    select id, num from db where value=value;
    declare continue handler for not found set done=true;
    set total = 0

    open mycursor;
    my_loop:loop
        fetch mycursor into value1, value2;
        if done
            then
            leave my_loop;
        end if;
        set total = total + 1;
    end loop;
    close mycursor;
end;
delimiter ;













