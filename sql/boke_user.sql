
drop database if exists boke;

create database boke default charset=utf8;

use boke;

create table user
(
id int not null primary key auto_increment COMMENT "用户id",
user_name varchar(255) not null default '' COMMENT "用户名",
password  varchar(255) not null default '' COMMENT "用户密码",
telephone varchar(255) not null default '' COMMENT "用户电话",
sex varchar(255) not null  default '' COMMENT "用户性别",
birthday timestamp null  default null COMMENT "用户生日",
create_time timestamp null  DEFAULT CURRENT_TIMESTAMP   COMMENT "用户创建时间",
delete_time timestamp  null DEFAULT '0' COMMENT "用户注销时间",
update_time timestamp  null DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT "用户修改时间",
is_delete int  not null default '0' COMMENT "用户已删除1,未删除0",
picture varchar(255)not null default '' COMMENT "用户头像",
user_type int(10) not null default '0' COMMENT "普通用户0,管理员用户1"
) default charset=utf8;


INSERT INTO `user` ( `user_name`, `password`, `telephone`,`sex`,`birthday`,`is_delete`, `pictrue`,`user_type`) VALUES
("lzp","1234","12345678901","男","1995-11-23",0,"xxxxxxxxxxxxx",0),
("gcj","1234","12345678901","男","1995-11-23",0,"xxxxxxxxxxxxx",0),
("jxl","1234","12345678901","男","1995-11-23",0,"xxxxxxxxxxxxx",0),
("sjy","1234","12345678901","男","1995-11-23",0,"xxxxxxxxxxxxx",0),
("lj","1234","12345678901","男","1995-11-23",0,"xxxxxxxxxxxxx",0);



--贴子列表--
CREATE TABLE IF NOT EXISTS `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '帖子ID',
  `user_id` int(11) NOT NULL COMMENT '发帖人id',
  `post_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  `delete_time` timestamp NULL DEFAULT UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `title` varchar(200) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `kind_id` int(4) NOT NULL COMMENT '发布板块',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=13 ;









--贴子分类--

drop table kind;
CREATE TABLE IF NOT EXISTS `kind` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '板块id',
  `type_name` varchar(255) NOT NULL COMMENT '板块名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 ;











--回帖表--


CREATE TABLE IF NOT EXISTS `reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '回复id',
  `topic_id` int(11) NOT NULL COMMENT '主题id',
  `reply_user_id` int(11) NOT NULL COMMENT '用户id',
  `reply_content` text CHARACTER SET utf8mb4 NOT NULL COMMENT '回复内容',
  `reply_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci AUTO_INCREMENT=29 ;









--登录记录--

CREATE TABLE IF NOT EXISTS `login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '登陆时间',
  `delete_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '退出时间',
  `ip` varchar(30) NOT NULL COMMENT '登陆IP',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8mb4 AUTO_INCREMENT=80 ;



