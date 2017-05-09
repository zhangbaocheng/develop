/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : nanjing_subway

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2017-05-09 11:32:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `news_id` int(11) NOT NULL,
  `news_theme` varchar(255) DEFAULT NULL,
  `news_content` varchar(255) DEFAULT NULL,
  `news_release_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `news_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`news_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------

-- ----------------------------
-- Table structure for news_join_in
-- ----------------------------
DROP TABLE IF EXISTS `news_join_in`;
CREATE TABLE `news_join_in` (
  `id` int(11) NOT NULL,
  `news_id` int(11) DEFAULT NULL,
  `passenger_id` int(11) DEFAULT NULL,
  `sign_up_date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `news_id` (`news_id`),
  KEY `passenger_id` (`passenger_id`),
  CONSTRAINT `news_join_in_ibfk_1` FOREIGN KEY (`news_id`) REFERENCES `news` (`news_id`),
  CONSTRAINT `news_join_in_ibfk_2` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news_join_in
-- ----------------------------

-- ----------------------------
-- Table structure for passenger
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger` (
  `passenger_id` int(11) NOT NULL AUTO_INCREMENT,
  `id_number` varchar(255) DEFAULT NULL COMMENT '乘客身份证号码,有唯一键约束',
  `name` varchar(255) DEFAULT NULL COMMENT '乘客真实姓名',
  `password` varchar(255) DEFAULT NULL COMMENT '乘客登录密码',
  `email` varchar(255) DEFAULT NULL COMMENT '乘客电子邮箱',
  `phone_number` varchar(255) DEFAULT NULL COMMENT '乘客手机号码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '乘客在项目中显示的昵称',
  `head_image` varchar(255) DEFAULT NULL COMMENT '乘客头像存放的路径',
  `register_time` datetime DEFAULT NULL COMMENT '乘客注册日期',
  PRIMARY KEY (`passenger_id`),
  UNIQUE KEY `passenger_id_number` (`id_number`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='乘客注册，登录，修改信息所用到的表';

-- ----------------------------
-- Records of passenger
-- ----------------------------
INSERT INTO `passenger` VALUES ('1', '321323199409224710', '张宝成', '123456', '839962275@qq.com', '15651695093', 'zhangdabao', '/img/', '2016-10-09 10:34:31');
INSERT INTO `passenger` VALUES ('2', null, 'test', '123456', '193482@qq.com', null, '小白', null, null);
INSERT INTO `passenger` VALUES ('3', null, 'zhangsan', 'asdasd', 'asd@asd.com', null, null, null, null);
INSERT INTO `passenger` VALUES ('4', null, 'zhangsan1', 'asdasd', 'aa@qq.com', null, null, null, null);

-- ----------------------------
-- Table structure for passenger_account
-- ----------------------------
DROP TABLE IF EXISTS `passenger_account`;
CREATE TABLE `passenger_account` (
  `passenger_account_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户的账户id',
  `passenger_account_money` decimal(10,0) DEFAULT NULL COMMENT '用户的账户余额',
  `passenger_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`passenger_account_id`),
  KEY `passenger_id` (`passenger_id`),
  CONSTRAINT `passenger_account_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of passenger_account
-- ----------------------------
INSERT INTO `passenger_account` VALUES ('4', '1', '3');

-- ----------------------------
-- Table structure for passenger_android_feedback
-- ----------------------------
DROP TABLE IF EXISTS `passenger_android_feedback`;
CREATE TABLE `passenger_android_feedback` (
  `android_feedback_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户Android端用户反馈的主键id',
  `passenger_id` int(11) DEFAULT NULL,
  `feedback_type` varchar(255) DEFAULT NULL COMMENT '用户Android端用户反馈的类型',
  `feedback_content` varchar(255) DEFAULT NULL COMMENT '用户Android端用户反馈的内容',
  PRIMARY KEY (`android_feedback_id`),
  KEY `android_feedback_passenger_id` (`passenger_id`),
  CONSTRAINT `android_feedback_passenger_id` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户使用Android客户端软件遇到的问题，提交的用户反馈所用到的表';

-- ----------------------------
-- Records of passenger_android_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for passenger_buy_ticket
-- ----------------------------
DROP TABLE IF EXISTS `passenger_buy_ticket`;
CREATE TABLE `passenger_buy_ticket` (
  `buy_ticket_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'd地铁票的id，主键',
  `start_place` varchar(255) DEFAULT NULL COMMENT '票的出发点',
  `end_place` varchar(255) DEFAULT NULL COMMENT '票的终点',
  `price` decimal(6,2) DEFAULT NULL COMMENT '票的价格',
  `buy_date` datetime DEFAULT NULL,
  `passenger_id` int(11) DEFAULT NULL COMMENT '关联乘客表的passenger_id',
  `start_time` date DEFAULT NULL COMMENT '出发日期，以天为单位',
  `is_used` varchar(255) DEFAULT NULL COMMENT '该票是否已经使用过',
  `lines_pass_by` varchar(255) DEFAULT NULL COMMENT '经过的线路，以路线图表的结构，中间以->分隔',
  `sites_number_pass_by` int(11) DEFAULT NULL COMMENT '经过的站点数',
  PRIMARY KEY (`buy_ticket_id`),
  KEY `buy_ticket_passenger_id` (`passenger_id`),
  CONSTRAINT `buy_ticket_passenger_id` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='乘客购买地铁票所关联的地铁票表';

-- ----------------------------
-- Records of passenger_buy_ticket
-- ----------------------------
INSERT INTO `passenger_buy_ticket` VALUES ('10', '', '', '3.00', '2017-03-16 00:00:00', '3', '2017-03-07', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('11', '', '', '3.00', '2017-03-17 00:00:00', '3', null, 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('12', '', '', '3.00', '2017-03-17 00:00:00', '3', null, 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('13', '', '', '3.00', '2017-03-17 00:00:00', '3', '2017-03-15', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('14', '', '', '3.00', '2017-03-17 00:00:00', '3', '2017-03-15', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('15', '', '', '3.00', '2017-03-17 00:00:00', '3', '2017-03-15', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('16', '', '', '3.00', '2017-03-17 00:00:00', '3', '2017-03-15', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('17', '', '', '3.00', '2017-03-08 00:00:00', '3', '2017-03-06', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('18', '', '', '3.00', '2017-03-17 00:00:00', '3', '2017-03-06', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('19', '', '', '3.00', '2017-03-17 00:00:00', '3', '2017-03-06', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('20', '', '', '3.00', '2017-03-17 00:00:00', '3', null, 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('21', '', '', '3.00', '2017-03-17 00:00:00', '3', '2017-03-07', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('22', '', '', '3.00', '2017-03-17 00:00:00', '3', '2017-03-07', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('23', '', '', '3.00', '2017-03-17 00:00:00', '3', '2017-03-07', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('24', '', '', '3.00', '2017-03-01 00:00:00', '3', '2017-03-07', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('25', '', '', '3.00', '2017-03-17 00:00:00', '3', '2017-03-07', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('26', '', '', '3.00', '2017-03-17 00:00:00', '3', '2017-03-07', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('27', '南京站', '南京南站', '3.00', '2017-03-18 00:00:00', '3', '2017-03-07', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('28', '南京交院', '南京南站', '3.00', '2017-03-18 00:00:00', '3', '2017-03-15', 'n', '1', '10');
INSERT INTO `passenger_buy_ticket` VALUES ('29', '南京站', '南京南站', '3.00', '2017-04-15 00:00:00', '3', '2017-04-12', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('30', '南京站', '南京南站', '3.00', '2017-04-15 00:00:00', '3', '2017-04-12', 'n', '3', '12');
INSERT INTO `passenger_buy_ticket` VALUES ('31', '仙鹤门', '油坊桥', '5.00', '2017-04-15 00:00:00', '3', '2017-04-06', 'n', '2', '20');
INSERT INTO `passenger_buy_ticket` VALUES ('32', '明故宫', '新街口', '2.00', '2017-04-15 00:00:00', '3', '2017-04-16', 'n', '2', '3');

-- ----------------------------
-- Table structure for passenger_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `passenger_evaluation`;
CREATE TABLE `passenger_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户乘车评价表的主键id',
  `passenger_id` int(18) DEFAULT NULL COMMENT '关联乘客表的乘客身份证id',
  `buy_ticket_id` int(11) DEFAULT NULL COMMENT '关联售票表的售票id',
  `evaluation_stars` varchar(255) DEFAULT NULL COMMENT '用户评价的星级',
  `evaluation_content` varchar(255) DEFAULT NULL COMMENT '用户乘车评价的内容',
  PRIMARY KEY (`id`),
  KEY `passenger_evaluation_passenger_id` (`passenger_id`),
  KEY `passenger_evaluation_buy_ticket_id` (`buy_ticket_id`),
  CONSTRAINT `passenger_evaluation_buy_ticket_id` FOREIGN KEY (`buy_ticket_id`) REFERENCES `passenger_buy_ticket` (`buy_ticket_id`),
  CONSTRAINT `passenger_evaluation_passenger_id` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户乘车后进行评价用到的关联表';

-- ----------------------------
-- Records of passenger_evaluation
-- ----------------------------

-- ----------------------------
-- Table structure for passenger_web_feedback
-- ----------------------------
DROP TABLE IF EXISTS `passenger_web_feedback`;
CREATE TABLE `passenger_web_feedback` (
  `web_feedback_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '乘客web端用户反馈表的主键id',
  `passenger_id` int(11) DEFAULT NULL COMMENT '乘客的id，来自关联乘客表的主键id',
  `feedback_type` varchar(255) DEFAULT NULL COMMENT '乘客web用户反馈的类型',
  `feedback_content` varchar(255) DEFAULT NULL COMMENT '乘客web端用户反馈的内容',
  PRIMARY KEY (`web_feedback_id`),
  KEY `web_feedback_passenger_id` (`passenger_id`),
  CONSTRAINT `web_feedback_passenger_id` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of passenger_web_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for recharge_history
-- ----------------------------
DROP TABLE IF EXISTS `recharge_history`;
CREATE TABLE `recharge_history` (
  `recharge_history_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '充值历史的id',
  `passenger_id` int(11) DEFAULT NULL COMMENT '乘客的id',
  `recharge_date` date DEFAULT NULL COMMENT '充值日期',
  `recharge_money` decimal(10,0) DEFAULT NULL COMMENT '充值的金额',
  PRIMARY KEY (`recharge_history_id`),
  KEY `passenger_id` (`passenger_id`),
  CONSTRAINT `recharge_history_ibfk_1` FOREIGN KEY (`passenger_id`) REFERENCES `passenger` (`passenger_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recharge_history
-- ----------------------------

-- ----------------------------
-- Table structure for subway_line1
-- ----------------------------
DROP TABLE IF EXISTS `subway_line1`;
CREATE TABLE `subway_line1` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '一号地铁线主键id',
  `site_number` int(11) DEFAULT NULL COMMENT '站点序号',
  `line_number` varchar(255) DEFAULT NULL COMMENT '所在的几号线',
  `site_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `site_details` varchar(255) DEFAULT NULL COMMENT '站点播报详细内容',
  `transfered` varchar(255) DEFAULT NULL COMMENT '是否可换乘(格式：[y|n]）',
  `transfered_lines` varchar(255) DEFAULT NULL COMMENT '可换乘的线路(格式:线路~线路~线路，中间的符号为英文版的符号）',
  `recharged` varchar(255) DEFAULT NULL COMMENT '该站点是否可充值',
  `toilet` varchar(255) DEFAULT NULL COMMENT '是否有卫生间',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subway_line1
-- ----------------------------
INSERT INTO `subway_line1` VALUES ('1', '1', '1', '迈皋桥', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('2', '2', '1', '红山动物园', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('3', '3', '1', '南京站', null, 'y', '3', null, null);
INSERT INTO `subway_line1` VALUES ('4', '4', '1', '新模范马路', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('5', '5', '1', '玄武门', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('6', '6', '1', '鼓楼', null, 'y', '4', null, null);
INSERT INTO `subway_line1` VALUES ('7', '7', '1', '珠江路', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('8', '8', '1', '新街口', null, 'y', '2', null, null);
INSERT INTO `subway_line1` VALUES ('9', '9', '1', '张府园', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('10', '10', '1', '三山街', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('11', '11', '1', '中华门', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('12', '12', '1', '安德门', null, 'y', '10', null, null);
INSERT INTO `subway_line1` VALUES ('13', '13', '1', '天隆寺', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('14', '14', '1', '软件大道', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('15', '15', '1', '花神庙', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('16', '16', '1', '南京南站', null, 'y', 's1~3', null, null);
INSERT INTO `subway_line1` VALUES ('17', '17', '1', '双龙大道', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('18', '18', '1', '河定桥', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('19', '19', '1', '胜太路', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('20', '20', '1', '百家湖', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('21', '21', '1', '小龙湾', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('22', '22', '1', '竹山路', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('23', '23', '1', '天印大道', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('24', '24', '1', '龙眠大道', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('25', '25', '1', '南医大·江苏经贸学院', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('26', '26', '1', '南京交院', null, 'n', null, null, null);
INSERT INTO `subway_line1` VALUES ('27', '27', '1', '中国药科大学', null, 'n', null, null, null);

-- ----------------------------
-- Table structure for subway_line10
-- ----------------------------
DROP TABLE IF EXISTS `subway_line10`;
CREATE TABLE `subway_line10` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '十号地铁线主键id',
  `site_number` int(11) DEFAULT NULL COMMENT '站点序号',
  `line_number` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `site_details` varchar(255) DEFAULT NULL COMMENT '站点播报详细内容',
  `transfered` varchar(255) DEFAULT NULL COMMENT '是否可换乘(格式：[y|n]）',
  `transfered_lines` varchar(255) DEFAULT NULL COMMENT '可换乘的线路(格式:线路~线路~线路，中间的符号为英文版的符号）',
  `recharged` varchar(255) DEFAULT NULL COMMENT '改站点是否可充值',
  `toilet` varchar(255) DEFAULT NULL COMMENT '是否有卫生间',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of subway_line10
-- ----------------------------
INSERT INTO `subway_line10` VALUES ('1', '1', '10', '安德门', null, 'y', '1', null, null);
INSERT INTO `subway_line10` VALUES ('2', '2', '10', '小行', null, 'n', null, null, null);
INSERT INTO `subway_line10` VALUES ('3', '3', '10', '中胜', null, 'n', null, null, null);
INSERT INTO `subway_line10` VALUES ('4', '4', '10', '元通', null, 'y', '2', null, null);
INSERT INTO `subway_line10` VALUES ('5', '5', '10', '奥体中心', null, 'n', null, null, null);
INSERT INTO `subway_line10` VALUES ('6', '6', '10', '梦都大街', null, 'n', null, null, null);
INSERT INTO `subway_line10` VALUES ('7', '7', '10', '绿博园', null, 'n', null, null, null);
INSERT INTO `subway_line10` VALUES ('8', '8', '10', '江心洲', null, 'n', null, null, null);
INSERT INTO `subway_line10` VALUES ('9', '9', '10', '临江', null, 'n', null, null, null);
INSERT INTO `subway_line10` VALUES ('10', '10', '10', '浦口万汇城', null, 'n', null, null, null);
INSERT INTO `subway_line10` VALUES ('11', '11', '10', '南京工业大学', null, 'n', null, null, null);
INSERT INTO `subway_line10` VALUES ('12', '12', '10', '龙华路', null, 'n', null, null, null);
INSERT INTO `subway_line10` VALUES ('13', '13', '10', '文德路', null, 'n', null, null, null);
INSERT INTO `subway_line10` VALUES ('14', '14', '10', '雨山路', null, 'n', null, null, null);

-- ----------------------------
-- Table structure for subway_line2
-- ----------------------------
DROP TABLE IF EXISTS `subway_line2`;
CREATE TABLE `subway_line2` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '一号地铁线主键id',
  `site_number` int(11) DEFAULT NULL COMMENT '站点序号',
  `line_number` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `site_details` varchar(255) DEFAULT NULL COMMENT '站点播报详细内容',
  `transfered` varchar(255) DEFAULT NULL COMMENT '是否可换乘(格式：[y|n]）',
  `transfered_lines` varchar(255) DEFAULT NULL COMMENT '可换乘的线路(格式:线路~线路~线路，中间的符号为英文版的符号）',
  `recharged` varchar(255) DEFAULT NULL COMMENT '改站点是否可充值',
  `toilet` varchar(255) DEFAULT NULL COMMENT '是否有卫生间',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of subway_line2
-- ----------------------------
INSERT INTO `subway_line2` VALUES ('1', '1', '2', '油坊桥', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('2', '2', '2', '雨润大街', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('3', '3', '2', '元通', null, 'y', '10', null, null);
INSERT INTO `subway_line2` VALUES ('4', '4', '2', '奥体东', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('5', '5', '2', '兴隆大街', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('6', '6', '2', '集庆门大街', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('7', '7', '2', '元锦路', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('8', '8', '2', '莫愁湖', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('9', '9', '2', '汉中门', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('10', '10', '2', '上海路', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('11', '11', '2', '新街口', null, 'y', '1', null, null);
INSERT INTO `subway_line2` VALUES ('12', '12', '2', '大行宫', null, 'y', '3', null, null);
INSERT INTO `subway_line2` VALUES ('13', '13', '2', '西安门', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('14', '14', '2', '明故宫', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('15', '15', '2', '苜蓿园', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('16', '16', '2', '下马坊', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('17', '17', '2', '孝陵卫', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('18', '18', '2', '钟灵街', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('19', '19', '2', '马群', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('20', '20', '2', '金马路', null, 'y', '4', null, null);
INSERT INTO `subway_line2` VALUES ('21', '21', '2', '仙鹤门', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('22', '22', '2', '学则路', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('23', '23', '2', '仙林中心', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('24', '24', '2', '羊山公园', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('25', '25', '2', '南大仙林校区', null, 'n', null, null, null);
INSERT INTO `subway_line2` VALUES ('26', '26', '2', '经天路', null, 'n', null, null, null);

-- ----------------------------
-- Table structure for subway_line3
-- ----------------------------
DROP TABLE IF EXISTS `subway_line3`;
CREATE TABLE `subway_line3` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '三号地铁线主键id',
  `site_number` int(11) DEFAULT NULL COMMENT '站点序号',
  `line_number` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `site_details` varchar(255) DEFAULT NULL COMMENT '站点播报详细内容',
  `transfered` varchar(255) DEFAULT NULL COMMENT '是否可换乘(格式：[y|n]）',
  `transfered_lines` varchar(255) DEFAULT NULL COMMENT '可换乘的线路(格式:线路~线路~线路，中间的符号为英文版的符号）',
  `recharged` varchar(255) DEFAULT NULL COMMENT '改站点是否可充值',
  `toilet` varchar(255) DEFAULT NULL COMMENT '是否有卫生间',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of subway_line3
-- ----------------------------
INSERT INTO `subway_line3` VALUES ('1', '1', '3', '林场', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('2', '2', '3', '星火路', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('3', '3', '3', '东大成贤学院', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('4', '4', '3', '泰冯路', null, 'y', 's8', null, null);
INSERT INTO `subway_line3` VALUES ('5', '5', '3', '天润城', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('6', '6', '3', '柳州东路', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('7', '7', '3', '上元门', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('8', '8', '3', '五塘广场', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('9', '9', '3', '小市', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('10', '10', '3', '南京站', null, 'y', '1', null, null);
INSERT INTO `subway_line3` VALUES ('11', '11', '3', '南京林业大学·新庄', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('12', '12', '3', '鸡鸣寺', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('13', '13', '3', '浮桥', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('14', '14', '3', '大行宫', null, 'y', '2', null, null);
INSERT INTO `subway_line3` VALUES ('15', '15', '3', '常府街', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('16', '16', '3', '夫子庙', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('17', '17', '3', '武定门', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('18', '18', '3', '雨花门', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('19', '19', '3', '卡子门', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('20', '20', '3', '大明路', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('21', '21', '3', '明发广场', null, 'n', '', null, null);
INSERT INTO `subway_line3` VALUES ('22', '22', '3', '南京南站', null, 'y', '1~s1', null, null);
INSERT INTO `subway_line3` VALUES ('23', '23', '3', '宏运大道', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('24', '24', '3', '胜太西路', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('25', '25', '3', '天元西路', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('26', '26', '3', '九龙湖', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('27', '27', '3', '诚信大道', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('28', '28', '3', '东大九龙湖校区', null, 'n', null, null, null);
INSERT INTO `subway_line3` VALUES ('29', '29', '3', '秣周东路', null, 'n', null, null, null);

-- ----------------------------
-- Table structure for subway_line4
-- ----------------------------
DROP TABLE IF EXISTS `subway_line4`;
CREATE TABLE `subway_line4` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '四号地铁线主键id',
  `site_number` int(11) DEFAULT NULL COMMENT '站点序号',
  `line_number` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `site_details` varchar(255) DEFAULT NULL COMMENT '站点播报详细内容',
  `transfered` varchar(255) DEFAULT NULL COMMENT '是否可换乘(格式：[y|n]）',
  `transfered_lines` varchar(255) DEFAULT NULL COMMENT '可换乘的线路(格式:线路~线路~线路，中间的符号为英文版的符号）',
  `recharged` varchar(255) DEFAULT NULL COMMENT '该站点是否可充值',
  `toilet` varchar(255) DEFAULT NULL COMMENT '是否有卫生间',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subway_line4
-- ----------------------------
INSERT INTO `subway_line4` VALUES ('1', '1', '4', '仙林湖', '', 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('2', '2', '4', '西岗桦墅', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('3', '3', '4', '孟北', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('4', '4', '4', '东流', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('5', '5', '4', '灵山', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('6', '6', '4', '汇通路', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('7', '7', '4', '金马路', null, 'y', '2', null, null);
INSERT INTO `subway_line4` VALUES ('8', '8', '4', '苏宁总部·徐庄', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('9', '9', '4', '聚宝山', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('10', '10', '4', '王家湾', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('11', '11', '4', '蒋王庙', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('12', '12', '4', '岗子村', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('13', '13', '4', '九华山', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('14', '14', '4', '鸡鸣寺', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('15', '15', '4', '鼓楼', null, 'y', '1', null, null);
INSERT INTO `subway_line4` VALUES ('16', '16', '4', '云南路', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('17', '17', '4', '南艺·二师·草场门', null, 'n', null, null, null);
INSERT INTO `subway_line4` VALUES ('18', '18', '4', '龙江', null, 'n', null, null, null);

-- ----------------------------
-- Table structure for subway_lineadd
-- ----------------------------
DROP TABLE IF EXISTS `subway_lineadd`;
CREATE TABLE `subway_lineadd` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '一号地铁线主键id',
  `site_number` int(11) DEFAULT NULL COMMENT '站点序号',
  `line_number` varchar(11) DEFAULT NULL COMMENT '对应的地铁几号线',
  `site_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `site_details` varchar(255) DEFAULT NULL COMMENT '站点播报详细内容',
  `transfered` varchar(255) DEFAULT NULL COMMENT '是否可换乘(格式：[y|n]）',
  `transfered_lines` varchar(255) DEFAULT NULL COMMENT '可换乘的线路(格式:线路~线路~线路，中间的符号为英文版的符号）',
  `recharged` varchar(255) DEFAULT NULL COMMENT '该站点是否可充值',
  `toilet` varchar(255) DEFAULT NULL COMMENT '是否有卫生间',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of subway_lineadd
-- ----------------------------

-- ----------------------------
-- Table structure for subway_lines1
-- ----------------------------
DROP TABLE IF EXISTS `subway_lines1`;
CREATE TABLE `subway_lines1` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 's1号地铁线主键id',
  `site_number` int(11) DEFAULT NULL COMMENT '站点序号',
  `line_number` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `site_details` varchar(255) DEFAULT NULL COMMENT '站点播报详细内容',
  `transfered` varchar(255) DEFAULT NULL COMMENT '是否可换乘(格式：[y|n]）',
  `transfered_lines` varchar(255) DEFAULT NULL COMMENT '可换乘的线路(格式:线路~线路~线路，中间的符号为英文版的符号）',
  `recharged` varchar(255) DEFAULT NULL COMMENT '改站点是否可充值',
  `toilet` varchar(255) DEFAULT NULL COMMENT '是否有卫生间',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of subway_lines1
-- ----------------------------
INSERT INTO `subway_lines1` VALUES ('1', '1', 's1', '南京南站', null, 'y', '1~3', null, null);
INSERT INTO `subway_lines1` VALUES ('2', '2', 's1', '翠屏山站', null, 'n', null, null, null);
INSERT INTO `subway_lines1` VALUES ('3', '3', 's1', '河海大学·佛城西路站', null, 'n', null, null, null);
INSERT INTO `subway_lines1` VALUES ('4', '4', 's1', '吉印大道站', null, 'n', null, null, null);
INSERT INTO `subway_lines1` VALUES ('5', '5', 's1', '正方中路站', null, 'n', null, null, null);
INSERT INTO `subway_lines1` VALUES ('6', '6', 's1', '翔宇路北站', null, 'n', null, null, null);
INSERT INTO `subway_lines1` VALUES ('7', '7', 's1', '翔宇路南站', null, 'n', null, null, null);
INSERT INTO `subway_lines1` VALUES ('8', '8', 's1', '禄口机场站', null, 'n', null, null, null);

-- ----------------------------
-- Table structure for subway_lines8
-- ----------------------------
DROP TABLE IF EXISTS `subway_lines8`;
CREATE TABLE `subway_lines8` (
  `site_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 's8号地铁线主键id',
  `site_number` int(11) DEFAULT NULL COMMENT '站点序号',
  `line_number` varchar(255) DEFAULT NULL,
  `site_name` varchar(255) DEFAULT NULL COMMENT '站点名称',
  `site_details` varchar(255) DEFAULT NULL COMMENT '站点播报详细内容',
  `transfered` varchar(255) DEFAULT NULL COMMENT '是否可换乘(格式：[y|n]）',
  `transfered_lines` varchar(255) DEFAULT NULL COMMENT '可换乘的线路(格式:线路~线路~线路，中间的符号为英文版的符号）',
  `recharged` varchar(255) DEFAULT NULL COMMENT '改站点是否可充值',
  `toilet` varchar(255) DEFAULT NULL COMMENT '是否有卫生间',
  PRIMARY KEY (`site_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of subway_lines8
-- ----------------------------
INSERT INTO `subway_lines8` VALUES ('1', '1', 's8', '泰山新村站', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('2', '2', 's8', '泰冯路', null, 'y', '3', null, null);
INSERT INTO `subway_lines8` VALUES ('3', '3', 's8', '高新开发区', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('4', '4', 's8', '信息工程大学', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('5', '5', 's8', '卸甲甸', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('6', '6', 's8', '大厂', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('7', '7', 's8', '葛塘', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('8', '8', 's8', '长芦', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('9', '9', 's8', '化工园', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('10', '10', 's8', '六合开发区', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('11', '11', 's8', '龙池', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('12', '12', 's8', '雄州', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('13', '13', 's8', '凤凰山公园', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('14', '14', 's8', '方州广场', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('15', '15', 's8', '八百桥', null, 'n', null, null, null);
INSERT INTO `subway_lines8` VALUES ('16', '16', 's8', '金牛湖', null, 'n', null, null, null);

-- ----------------------------
-- Table structure for transfered_lines
-- ----------------------------
DROP TABLE IF EXISTS `transfered_lines`;
CREATE TABLE `transfered_lines` (
  `transfered_lines_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '查看两表之间的线路的表的id',
  `line_other` varchar(255) DEFAULT NULL COMMENT '一个线路',
  `line_another` varchar(255) DEFAULT NULL COMMENT '另一个线路',
  `lines_pass_by` varchar(255) DEFAULT NULL COMMENT '经过的路线，可能性中间以;分割,线路中间以->分割，都是英文版的符号',
  PRIMARY KEY (`transfered_lines_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of transfered_lines
-- ----------------------------
INSERT INTO `transfered_lines` VALUES ('1', '1', '2', '1->2;1->10->2;1->3->2');
INSERT INTO `transfered_lines` VALUES ('2', '1', '3', '1->3;1->2->3;1->s1->3');
INSERT INTO `transfered_lines` VALUES ('3', '1', '4', '1->4;1->2->4');
INSERT INTO `transfered_lines` VALUES ('4', '1', 's1', '1->s1;1->3->s1');
INSERT INTO `transfered_lines` VALUES ('5', '1', 's8', '1->3->s8');
INSERT INTO `transfered_lines` VALUES ('6', '1', '10', '1->10;1->2->10');
INSERT INTO `transfered_lines` VALUES ('7', '2', '3', '2->3;2->1->3');
INSERT INTO `transfered_lines` VALUES ('8', '2', '4', '2->4;2->1->4');
INSERT INTO `transfered_lines` VALUES ('9', '2', 's1', '2->1->s1;2->3->s1');
INSERT INTO `transfered_lines` VALUES ('10', '2', 's8', '2->3->s8');
INSERT INTO `transfered_lines` VALUES ('11', '2', '10', '2->10;2->1->10');
INSERT INTO `transfered_lines` VALUES ('12', '3', '4', '3->1->4;3->2->4');
INSERT INTO `transfered_lines` VALUES ('13', '3', 's1', '3->s1');
INSERT INTO `transfered_lines` VALUES ('14', '3', 's8', '3->s8');
INSERT INTO `transfered_lines` VALUES ('15', '3', '10', '3->1->10;3->2->10');
INSERT INTO `transfered_lines` VALUES ('16', '4', 's1', '4->1->s1');
INSERT INTO `transfered_lines` VALUES ('17', '4', 's8', '4->1->3->s8;4->2->3->s8');
INSERT INTO `transfered_lines` VALUES ('18', '4', '10', '4->1->10;4->2->10');
INSERT INTO `transfered_lines` VALUES ('19', 's1', 's8', 's1->3->s8');
INSERT INTO `transfered_lines` VALUES ('20', 's1', '10', 's1->1->10');
INSERT INTO `transfered_lines` VALUES ('21', 's8', '10', 's8->3->10');

-- ----------------------------
-- View structure for subway_lines
-- ----------------------------
DROP VIEW IF EXISTS `subway_lines`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `subway_lines` AS select
   `subway_line1`.`site_id` AS `site_id`,
   `subway_line1`.`site_number` AS `site_number`,
   `subway_line1`.`line_number` AS `line_number`,
   `subway_line1`.`site_name` AS `site_name`,
   `subway_line1`.`site_details` AS `site_details`,
   `subway_line1`.`transfered` AS `transfered`,
   `subway_line1`.`transfered_lines` AS `transfered_lines`,
   `subway_line1`.`recharged` AS `recharged`,
   `subway_line1`.`toilet` AS `toilet`
from `subway_line1` union select `subway_line2`.`site_id` AS `site_id`,`subway_line2`.`site_number` AS `site_number`,`subway_line2`.`line_number` AS `line_number`,`subway_line2`.`site_name` AS `site_name`,`subway_line2`.`site_details` AS `site_details`,`subway_line2`.`transfered` AS `transfered`,`subway_line2`.`transfered_lines` AS `transfered_lines`,`subway_line2`.`recharged` AS `recharged`,`subway_line2`.`toilet` AS `toilet` from `subway_line2` union select `subway_line3`.`site_id` AS `site_id`,`subway_line3`.`site_number` AS `site_number`,`subway_line3`.`line_number` AS `line_number`,`subway_line3`.`site_name` AS `site_name`,`subway_line3`.`site_details` AS `site_details`,`subway_line3`.`transfered` AS `transfered`,`subway_line3`.`transfered_lines` AS `transfered_lines`,`subway_line3`.`recharged` AS `recharged`,`subway_line3`.`toilet` AS `toilet` from `subway_line3` union select `subway_line4`.`site_id` AS `site_id`,`subway_line4`.`site_number` AS `site_number`,`subway_line4`.`line_number` AS `line_number`,`subway_line4`.`site_name` AS `site_name`,`subway_line4`.`site_details` AS `site_details`,`subway_line4`.`transfered` AS `transfered`,`subway_line4`.`transfered_lines` AS `transfered_lines`,`subway_line4`.`recharged` AS `recharged`,`subway_line4`.`toilet` AS `toilet` from `subway_line4` union select `subway_lines1`.`site_id` AS `site_id`,`subway_lines1`.`site_number` AS `site_number`,`subway_lines1`.`line_number` AS `line_number`,`subway_lines1`.`site_name` AS `site_name`,`subway_lines1`.`site_details` AS `site_details`,`subway_lines1`.`transfered` AS `transfered`,`subway_lines1`.`transfered_lines` AS `transfered_lines`,`subway_lines1`.`recharged` AS `recharged`,`subway_lines1`.`toilet` AS `toilet` from `subway_lines1` union select `subway_lines8`.`site_id` AS `site_id`,`subway_lines8`.`site_number` AS `site_number`,`subway_lines8`.`line_number` AS `line_number`,`subway_lines8`.`site_name` AS `site_name`,`subway_lines8`.`site_details` AS `site_details`,`subway_lines8`.`transfered` AS `transfered`,`subway_lines8`.`transfered_lines` AS `transfered_lines`,`subway_lines8`.`recharged` AS `recharged`,`subway_lines8`.`toilet` AS `toilet` from `subway_lines8` union select `subway_line10`.`site_id` AS `site_id`,`subway_line10`.`site_number` AS `site_number`,`subway_line10`.`line_number` AS `line_number`,`subway_line10`.`site_name` AS `site_name`,`subway_line10`.`site_details` AS `site_details`,`subway_line10`.`transfered` AS `transfered`,`subway_line10`.`transfered_lines` AS `transfered_lines`,`subway_line10`.`recharged` AS `recharged`,`subway_line10`.`toilet` AS `toilet` from `subway_line10`; ;

-- ----------------------------
-- View structure for view_subway_lines
-- ----------------------------
DROP VIEW IF EXISTS `view_subway_lines`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `view_subway_lines` AS select
   `subway_line1`.`site_id` AS `site_id`,
   `subway_line1`.`site_number` AS `site_number`,
   `subway_line1`.`line_number` AS `line_number`,
   `subway_line1`.`site_name` AS `site_name`,
   `subway_line1`.`site_details` AS `site_details`,
   `subway_line1`.`transfered` AS `transfered`,
   `subway_line1`.`transfered_lines` AS `transfered_lines`,
   `subway_line1`.`recharged` AS `recharged`,
   `subway_line1`.`toilet` AS `toilet`
from `subway_line1` union select `subway_line10`.`site_id` AS `site_id`,`subway_line10`.`site_number` AS `site_number`,`subway_line10`.`line_number` AS `line_number`,`subway_line10`.`site_name` AS `site_name`,`subway_line10`.`site_details` AS `site_details`,`subway_line10`.`transfered` AS `transfered`,`subway_line10`.`transfered_lines` AS `transfered_lines`,`subway_line10`.`recharged` AS `recharged`,`subway_line10`.`toilet` AS `toilet` from `subway_line10` union select `subway_line2`.`site_id` AS `site_id`,`subway_line2`.`site_number` AS `site_number`,`subway_line2`.`line_number` AS `line_number`,`subway_line2`.`site_name` AS `site_name`,`subway_line2`.`site_details` AS `site_details`,`subway_line2`.`transfered` AS `transfered`,`subway_line2`.`transfered_lines` AS `transfered_lines`,`subway_line2`.`recharged` AS `recharged`,`subway_line2`.`toilet` AS `toilet` from `subway_line2` union select `subway_line3`.`site_id` AS `site_id`,`subway_line3`.`site_number` AS `site_number`,`subway_line3`.`line_number` AS `line_number`,`subway_line3`.`site_name` AS `site_name`,`subway_line3`.`site_details` AS `site_details`,`subway_line3`.`transfered` AS `transfered`,`subway_line3`.`transfered_lines` AS `transfered_lines`,`subway_line3`.`recharged` AS `recharged`,`subway_line3`.`toilet` AS `toilet` from `subway_line3` union select `subway_line4`.`site_id` AS `site_id`,`subway_line4`.`site_number` AS `site_number`,`subway_line4`.`line_number` AS `line_number`,`subway_line4`.`site_name` AS `site_name`,`subway_line4`.`site_details` AS `site_details`,`subway_line4`.`transfered` AS `transfered`,`subway_line4`.`transfered_lines` AS `transfered_lines`,`subway_line4`.`recharged` AS `recharged`,`subway_line4`.`toilet` AS `toilet` from `subway_line4` union select `subway_lines1`.`site_id` AS `site_id`,`subway_lines1`.`site_number` AS `site_number`,`subway_lines1`.`line_number` AS `line_number`,`subway_lines1`.`site_name` AS `site_name`,`subway_lines1`.`site_details` AS `site_details`,`subway_lines1`.`transfered` AS `transfered`,`subway_lines1`.`transfered_lines` AS `transfered_lines`,`subway_lines1`.`recharged` AS `recharged`,`subway_lines1`.`toilet` AS `toilet` from `subway_lines1` union select `subway_lines8`.`site_id` AS `site_id`,`subway_lines8`.`site_number` AS `site_number`,`subway_lines8`.`line_number` AS `line_number`,`subway_lines8`.`site_name` AS `site_name`,`subway_lines8`.`site_details` AS `site_details`,`subway_lines8`.`transfered` AS `transfered`,`subway_lines8`.`transfered_lines` AS `transfered_lines`,`subway_lines8`.`recharged` AS `recharged`,`subway_lines8`.`toilet` AS `toilet` from `subway_lines8`; ;
