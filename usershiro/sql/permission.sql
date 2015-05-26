/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : usermanage

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2015-05-26 14:14:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `ID` int(11) NOT NULL auto_increment,
  `PID` int(11) default NULL COMMENT '父节点名称',
  `NAME` varchar(50) NOT NULL COMMENT '名称',
  `TYPE` varchar(20) default NULL COMMENT '类型:菜单or功能',
  `SORT` int(11) default NULL COMMENT '排序',
  `URL` varchar(255) default NULL,
  `PERM_CODE` varchar(50) default NULL COMMENT '菜单编码',
  `ICON` varchar(255) default NULL,
  `STATE` varchar(10) default NULL,
  `DESCRIPTION` text,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', null, '系统管理', 'F', '1', null, null, null, null, null);
INSERT INTO `permission` VALUES ('2', '1', '用户权限', 'O', '2', '/user-permission', 'staff', null, null, null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL auto_increment,
  `NAME` varchar(20) NOT NULL,
  `ROLE_CODE` varchar(20) NOT NULL,
  `DESCRIPTION` text,
  `SORT` smallint(6) default NULL,
  `DEL_FLAG` varchar(255) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `ID` int(11) NOT NULL auto_increment,
  `ROLE_ID` int(11) default NULL,
  `PERMISSION_ID` int(11) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_ROLE_PER_REFERENCE_PERMISSI` (`PERMISSION_ID`),
  KEY `FK_ROLE_PER_REFERENCE_ROLE` (`ROLE_ID`),
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`ID`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL auto_increment,
  `LOGIN_NAME` varchar(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `SALT` varchar(255) default NULL,
  `BIRTHDAY` datetime default NULL,
  `GENDER` smallint(6) default NULL,
  `EMAIL` varchar(255) default NULL,
  `PHONE` varchar(20) default NULL,
  `ICON` varchar(500) default NULL,
  `CREATE_DATE` datetime default NULL,
  `STATE` char(1) default NULL,
  `DESCRIPTION` text,
  `LOGIN_COUNT` int(11) default NULL,
  `PREVIOUS_VISIT` datetime default NULL,
  `LAST_VISIT` datetime default NULL,
  `DEL_FLAG` varchar(1) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '超级管理员', '123456', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('2', 'staff', '员工', '123456', null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `ID` int(11) NOT NULL auto_increment,
  `USER_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_USER_ROL_REFERENCE_ROLE` (`ROLE_ID`),
  KEY `FK_USER_ROL_REFERENCE_USERS` (`USER_ID`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
