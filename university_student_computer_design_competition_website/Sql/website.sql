/*
大学生计算机设计大赛报名网站-数据库

所用数据库：MariaDB
数据库版本：10.6.5
*/

-- ------------------------------
-- 创建数据库:  `website`
-- ------------------------------
DROP DATABASE IF EXISTS `website`;
CREATE DATABASE `website` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
use `website`;

-- ----------------------------
-- 创建用户组表:  `groups`
-- ----------------------------
DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
	`group_id` INT NOT NULL AUTO_INCREMENT COMMENT '组id',
	`group_name` VARCHAR(10) NOT NULL COMMENT '组名',
	`encoding` CHAR(5) NULL COMMENT '组编码',
	PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;
-- 插入数据
INSERT INTO 'groups' VALUES (DEFAULT,'管理员',NULL);
INSERT INTO 'groups' VALUES (DEFAULT,'学生',NULL);
INSERT INTO 'groups' VALUES (DEFAULT,'计算机设计','YVN1U');
INSERT INTO 'groups' VALUES (DEFAULT,'算法设计','OY5TT');

-- ----------------------------
-- 创建用户表:  `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
	`user_id` INT NOT NULL AUTO_INCREMENT COMMENT '用户id',
	`name` VARCHAR(10) NOT NULL COMMENT '姓名',
	`sex` TINYINT(1) COMMENT '性别',
	`birthday` DATE COMMENT '出生日期',
	`school` VARCHAR(20) COMMENT '学校',
	`address` VARCHAR(50) COMMENT '地址',
	`phone` CHAR(11) COMMENT '手机号',
	`email` CHAR(100) COMMENT '邮箱',
	`group_id` INT COMMENT '用户组（用户组.组id）',
	`password` CHAR(32) NOT NULL COMMENT '密码',
	PRIMARY KEY (`user_id`),
	CONSTRAINT `users_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;
-- 插入数据
INSERT INTO users VALUES (DEFAULT,'admin',NULL,NULL,NULL,NULL,NULL,NULL,'1','admin');
INSERT INTO users VALUES (DEFAULT,'张瓜皮皮','1','1999-11-20','西南财经大学'	,'天门','13886961359','13886961359@qq.com','3','13886961359');
INSERT INTO users VALUES (DEFAULT,'小江云子','0','1999-07-29','西安交通大学'	,'黄石','18453887612','18453887612@qq.com','3','18453887612');
INSERT INTO users VALUES (DEFAULT,'德隆东墙','1','2000-04-05','武汉设计工程学院','抚顺','13866039800','13866039800@qq.com','4','13866039800');
INSERT INTO users VALUES (DEFAULT,'五号五号','1','1999-12-12','中国人民公安大学','吉林','13027048577','13027048577@qq.com','4','13027048577');
INSERT INTO users VALUES (DEFAULT,'阿兽涛受','1','2000-12-24','武汉首义学院'	,'南宁','17247196444','17247196444@qq.com','4','17247196444');
INSERT INTO users VALUES (DEFAULT,'小赵同学','0','1998-05-10','武汉科技大学'	,'鄂州','13704131948','13704131948@qq.com','2','13704131948');
INSERT INTO users VALUES (DEFAULT,'小钱同学','1','2002-01-16','华中科技大学'	,'仙桃','13742968739','13742968739@qq.com','2','13742968739');
INSERT INTO users VALUES (DEFAULT,'小孙同学','0','2002-12-30','电子科技大学'	,'成都','15319493760','15319493760@qq.com','2','15319493760');
INSERT INTO users VALUES (DEFAULT,'小李同学','1','2001-10-10','北京大学'		,'青海','18282876997','18282876997@qq.com','2','18282876997');
INSERT INTO users VALUES (DEFAULT,'小周同学','1','2000-02-15','武汉城市学院'	,'辽阳','14984342228','14984342228@qq.com','2','14984342228');
INSERT INTO users VALUES (DEFAULT,'小吴同学','1','1998-10-08','华中师范大学'	,'西安','14912959902','14912959902@qq.com','2','14912959902');
INSERT INTO users VALUES (DEFAULT,'小郑同学','0','2002-04-16','复旦大学'		,'南通','15089652824','15089652824@qq.com','2','15089652824');
INSERT INTO users VALUES (DEFAULT,'小王同学','0','2003-09-09','哈尔滨工业大学'	,'惠州','15939648850','15939648850@qq.com','2','15939648850');
INSERT INTO users VALUES (DEFAULT,'6',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6');

-- ----------------------------
-- 创建比赛表:  `contests`
-- ----------------------------
DROP TABLE IF EXISTS `contests`;
CREATE TABLE `contests` (
	`contest_id` INT NOT NULL AUTO_INCREMENT COMMENT '比赛id',
	`contest_title` varchar(150) NOT NULL COMMENT '比赛标题',
	`contest_text` longtext NOT NULL COMMENT '比赛内容',
	`promulgator` INT NOT NULL COMMENT '发布人（组.组id）',
	`group_id` INT NOT NULL COMMENT '所属组（用户.用户id）',
	`start_time` DATETIME NOT NULL COMMENT '开始时间',
	`end_time` DATETIME NOT NULL COMMENT '截止时间',
	PRIMARY KEY (`contest_id`),
	CONSTRAINT `contests_1` FOREIGN KEY (`promulgator`) REFERENCES `users` (`user_id`),
	CONSTRAINT `contests_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;
-- 插入数据
INSERT INTO contests VALUES
(DEFAULT,'2021年度全国大学生算法设计编程挑战赛','2021年度全国大学生算法设计编程挑战赛的内容',
'2','3','2021-01-01 10:00:00','2021-02-01 23:59:59');
INSERT INTO contests VALUES
(DEFAULT,'2021年度阿里巴巴人工智能对抗算法竞赛','2021年度阿里巴巴人工智能对抗算法竞赛的内容',
'5','4','2021-08-01 10:00:00','2022-10-01 23:59:59');
INSERT INTO contests VALUES
(DEFAULT,'2021年度中国国际艺术博览会设计视觉形象设计大赛','2021年度中国国际艺术博览会设计视觉形象设计大赛的内容',
'6','4','2021-12-01 10:00:00','2022-02-01 23:59:59');
INSERT INTO contests VALUES
(DEFAULT,'2022年度世界大学生超级计算机竞赛','2022年度世界大学生超级计算机竞赛',
'3','4','2022-01-01 10:00:00','2022-03-01 23:59:59');
INSERT INTO contests VALUES
(DEFAULT,'2022年度中国高校计算机大赛-网络技术挑战赛','2022年度中国高校计算机大赛-网络技术挑战赛的内容',
'4','3','2022-02-01 10:00:00','2022-05-01 23:59:59');
INSERT INTO contests VALUES
(DEFAULT,'ACM国际大学生程序设计竞赛','ACM国际大学生程序设计竞赛的内容',
'2','3','2022-03-01 10:00:00','2022-03-20 23:59:59');

-- ----------------------------
-- 创建消息表:  `messages`
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
	`message_id` INT NOT NULL AUTO_INCREMENT COMMENT '消息id',
	`recipient` INT NOT NULL COMMENT '接收人（用户.用户id）',
	`text` text NOT NULL COMMENT '消息内容',
	`sender` INT NOT NULL COMMENT '发布人（用户.用户id）',
	`time` DATETIME NOT NULL DEFAULT(now()) COMMENT '发布时间',
	`state` TINYINT(1) NOT NULL DEFAULT(0) COMMENT '消息读取状态',
	PRIMARY KEY (`message_id`),
	CONSTRAINT `messages_1` FOREIGN KEY (`recipient`) REFERENCES `users` (`user_id`),
	CONSTRAINT `messages_2` FOREIGN KEY (`sender`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;
-- 插入数据
INSERT INTO messages VALUES (DEFAULT,'2','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'3','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'4','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'5','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'6','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'7','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'8','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'9','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'10','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'11','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'12','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'13','数据库测试','1','2021-10-10 10:10:10','0');
INSERT INTO messages VALUES (DEFAULT,'14','数据库测试','1','2021-10-10 10:10:10','0');

-- ----------------------------
-- 创建报名评分表:  `scores `
-- ----------------------------
DROP TABLE IF EXISTS `scores`;
CREATE TABLE `scores` (
	`scores_id` INT NOT NULL AUTO_INCREMENT COMMENT '报名id',
	`contest_id` INT NOT NULL COMMENT '比赛id（比赛.比赛id）',
	`contestant` INT NOT NULL COMMENT '参赛者（用户.用户id）',
	`state` TINYINT(1) NOT NULL COMMENT '评审状态（0或1）',
	`judge` INT COMMENT '评委（用户.用户id）',
	`text` text COMMENT '评审内容',
	`result` TINYINT(3) COMMENT '成绩',
	PRIMARY KEY (`scores_id`),
	CONSTRAINT `enter_1` FOREIGN KEY (`contest_id`) REFERENCES `contests` (`contest_id`),
	CONSTRAINT `enter_2` FOREIGN KEY (`contestant`) REFERENCES `users` (`user_id`),
	CONSTRAINT `enter_3` FOREIGN KEY (`judge`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1;
-- 插入数据
INSERT INTO scores VALUES (DEFAULT,'1','7','1','3','优秀','85');
INSERT INTO scores VALUES (DEFAULT,'1','8','1','2','出彩','91');
INSERT INTO scores VALUES (DEFAULT,'1','9','1','3','良好','70');
INSERT INTO scores VALUES (DEFAULT,'1','10','1','2','优秀','84');
INSERT INTO scores VALUES (DEFAULT,'1','11','1','3','不行','53');
INSERT INTO scores VALUES (DEFAULT,'1','12','1','2','太差','71');
INSERT INTO scores VALUES (DEFAULT,'1','13','1','2','优秀','100');
INSERT INTO scores VALUES (DEFAULT,'1','14','1','2','优秀','98');

INSERT INTO scores VALUES (DEFAULT,'2','7','1','5','没有评语','48');
INSERT INTO scores VALUES (DEFAULT,'2','8','1','6','评价1','16');
INSERT INTO scores VALUES (DEFAULT,'2','9','1','4','我得龙东墙觉得不错','80');
INSERT INTO scores VALUES (DEFAULT,'2','12','1','5','该作品有待改进','71');
INSERT INTO scores VALUES (DEFAULT,'2','14','1','6','我觉得冠军非你莫属','98');

INSERT INTO scores VALUES (DEFAULT,'3','9','1','4','评价1','52');
INSERT INTO scores VALUES (DEFAULT,'3','12','1','5','评价2','78');
INSERT INTO scores VALUES (DEFAULT,'3','14','1','6','评价3','89');

INSERT INTO scores VALUES (DEFAULT,'4','7','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'4','8','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'4','10','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'4','13','0',NULL,NULL,NULL);

INSERT INTO scores VALUES (DEFAULT,'5','7','1','4','我得龙东墙觉得不错','80');
INSERT INTO scores VALUES (DEFAULT,'5','8','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'5','9','1','4','我得龙东墙觉得不错','80');
INSERT INTO scores VALUES (DEFAULT,'5','10','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'5','11','0',NULL,NULL,NULL);

INSERT INTO scores VALUES (DEFAULT,'6','7','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'6','8','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'6','9','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'6','10','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'6','11','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'6','12','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'6','13','0',NULL,NULL,NULL);
INSERT INTO scores VALUES (DEFAULT,'6','14','0',NULL,NULL,NULL);