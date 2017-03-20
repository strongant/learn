-- 数据库初始化脚本

-- 创建数据表
CREATE DATABASE seckill;

-- 使用数据库
use seckill;

--创建表

--秒杀库存表
create table seckill(
`seckill_id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
`name` varchar(120) NOT NULL COMMENT '商品名称',
`number` int NOT NULL COMMENT '库存数量',
`start_time` timestamp NOT NULL COMMENT '秒杀开始时间',
`end_time` timestamp NOT NULL COMMENT '秒杀结束时间',
`create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
PRIMARY KEY (seckill_id),
KEY idx_start_time(start_time),
KEY idx_end_time(end_time),
KEY idx_create_time(create_time)
) ENGINE=InnoDB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';
--当在创建表时候，如果确保DDL语句语法没有错误,那么有可能出现此错误：
--ERROR 1046 (3D000): No database selected
--以上错误的原因主要是mysql默认sql_mode不允许日期为空值类型，可以通过一下命令进行查看：
-- show variables like 'sql_mode';
--输出结果如下：
--ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION
--此时发现NO_ZERO_IN_DATE,NO_ZERO_DATE存在，解决方案:
--sudo vi /etc/mysql/my.cnf
-- 设置sql_mode默认值为：
-- [mysqld]
--sql_mode = "STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION"
--然后重启mysql服务即可：
-- sudo service mysql restart
--修改完毕后进入mysql，使用 show variables like 'sql_mode';发现NO_ZERO_IN_DATE,NO_ZERO_DATE已经不存在了，
-- 此时便可以进行继续创建表的操作了
--查看创建表：show create table seckill;






insert into seckill(name,number,start_time,end_time)
values('100元秒杀IPhone6s',100,'2017-11-01 00:00:00','2017-11-02 00:00:00');
insert into seckill(name,number,start_time,end_time)
values('200元秒杀IPad2',200,'2017-11-01 00:00:00','2017-11-02 00:00:00');
insert into seckill(name,number,start_time,end_time)
values('500元秒杀小米Note2',300,'2017-11-01 00:00:00','2017-11-02 00:00:00');
insert into seckill(name,number,start_time,end_time)
values('200元秒杀红米Note',400,'2017-11-01 00:00:00','2017-11-02 00:00:00');


--秒杀功能明细表
--用户登录认证相关的信息
CREATE TABLE success_killed(
`seckill_id` bigint NOT NULL COMMENT '秒杀商品id',
`user_phone` bigint NOT NULL COMMENT '用户手机号',
`state` tinyint NOT NULL DEFAULT -1 COMMENT '状态表示:-1无效 0：成功 1：已付款',
`create_time` TIMESTAMP NOT NULL COMMENT '创建时间',
PRIMARY KEY(seckill_id,user_phone), /*联合主键*/
KEY idx_create_time(create_time)
) ENGINE=Innodb DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表';

-- 查看创建表
-- show create table success_killed;

--连接数据库控制台
mysql -uroot -proot

--为什么手写DDL？
--记录每次上线的DDL修改
--上线v1.1
/*ALTER TABLE seckill
DROP INDEX idx_create_time,
ADD INDEX idx_c_s(start_time,end_time)*/






