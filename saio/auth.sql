/*
Navicat MySQL Data Transfer

Source Server         : 192.168.111.69
Source Server Version : 50628
Source Host           : 192.168.111.69:3306
Source Database       : auth

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2016-08-11 01:19:49
*/
DROP DATABASE IF EXISTS auth;
CREATE DATABASE auth;
use auth;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissions_0e939a4f` (`group_id`) USING BTREE,
  KEY `auth_group_permissions_8373b171` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissions_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`) USING BTREE,
  KEY `auth_permission_417f1b1c` (`content_type_id`) USING BTREE,
  CONSTRAINT `auth_permission_ibfk_1` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add tgroup', '7', 'add_tgroup');
INSERT INTO `auth_permission` VALUES ('20', 'Can change tgroup', '7', 'change_tgroup');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete tgroup', '7', 'delete_tgroup');
INSERT INTO `auth_permission` VALUES ('22', 'Can add tgroupsecfieldrelation', '8', 'add_tgroupsecfieldrelation');
INSERT INTO `auth_permission` VALUES ('23', 'Can change tgroupsecfieldrelation', '8', 'change_tgroupsecfieldrelation');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete tgroupsecfieldrelation', '8', 'delete_tgroupsecfieldrelation');
INSERT INTO `auth_permission` VALUES ('25', 'Can add tseclass', '9', 'add_tseclass');
INSERT INTO `auth_permission` VALUES ('26', 'Can change tseclass', '9', 'change_tseclass');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete tseclass', '9', 'delete_tseclass');
INSERT INTO `auth_permission` VALUES ('28', 'Can add tpolicy', '10', 'add_tpolicy');
INSERT INTO `auth_permission` VALUES ('29', 'Can change tpolicy', '10', 'change_tpolicy');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete tpolicy', '10', 'delete_tpolicy');
INSERT INTO `auth_permission` VALUES ('31', 'Can add tsecfield', '11', 'add_tsecfield');
INSERT INTO `auth_permission` VALUES ('32', 'Can change tsecfield', '11', 'change_tsecfield');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete tsecfield', '11', 'delete_tsecfield');
INSERT INTO `auth_permission` VALUES ('34', 'Can add tusersecfieldrelation', '12', 'add_tusersecfieldrelation');
INSERT INTO `auth_permission` VALUES ('35', 'Can change tusersecfieldrelation', '12', 'change_tusersecfieldrelation');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete tusersecfieldrelation', '12', 'delete_tusersecfieldrelation');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$15000$9K7czAIGCbuV$y8CZIWOISFrtATjcSz/TtNdCOcAoXOkYAg0pPS1vFMo=', '2015-08-13 07:37:39', '1', 'sany', '', '', 'sany@sandy.com', '1', '1', '2015-08-13 07:37:39');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`) USING BTREE,
  KEY `auth_user_groups_e8701ad4` (`user_id`) USING BTREE,
  KEY `auth_user_groups_0e939a4f` (`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_permissions_e8701ad4` (`user_id`) USING BTREE,
  KEY `auth_user_user_permissions_8373b171` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_e8701ad4` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_ibfk_2` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('7', 'blog', 'tgroup');
INSERT INTO `django_content_type` VALUES ('8', 'blog', 'tgroupsecfieldrelation');
INSERT INTO `django_content_type` VALUES ('10', 'blog', 'tpolicy');
INSERT INTO `django_content_type` VALUES ('11', 'blog', 'tsecfield');
INSERT INTO `django_content_type` VALUES ('9', 'blog', 'tseclass');
INSERT INTO `django_content_type` VALUES ('12', 'blog', 'tusersecfieldrelation');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2015-07-09 03:14:32');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2015-07-09 03:14:33');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2015-07-09 03:14:33');
INSERT INTO `django_migrations` VALUES ('4', 'blog', '0001_initial', '2015-07-09 03:14:33');
INSERT INTO `django_migrations` VALUES ('5', 'sessions', '0001_initial', '2015-07-09 03:14:33');
INSERT INTO `django_migrations` VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2015-11-30 15:48:19');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2015-11-30 15:48:19');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2015-11-30 15:48:19');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0004_alter_user_username_opts', '2015-11-30 15:48:19');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2015-11-30 15:48:19');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2015-11-30 15:48:19');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for `TAdmin`
-- ----------------------------
DROP TABLE IF EXISTS `TAdmin`;
CREATE TABLE `TAdmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `passwd` char(32) NOT NULL,
  `seclevel` int(11) NOT NULL DEFAULT '0',
  `parent_secl_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of TAdmin
-- ----------------------------
INSERT INTO `TAdmin` VALUES ('1', 'Admin', 'admin', '0', '0');
INSERT INTO `TAdmin` VALUES ('5', '147', '147', '0', '0');

-- ----------------------------
-- Table structure for `TGroup`
-- ----------------------------
DROP TABLE IF EXISTS `TGroup`;
CREATE TABLE `TGroup` (
  `idTGroup` int(11) NOT NULL,
  `tg_id` int(11) NOT NULL,
  `group_name` varchar(64) DEFAULT NULL,
  `parent_tg_id` int(11) DEFAULT NULL,
  `gen_time` datetime DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`idTGroup`,`tg_id`),
  UNIQUE KEY `tg_id_UNIQUE` (`tg_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TGroup
-- ----------------------------
INSERT INTO `TGroup` VALUES ('1', '1', 'admin', '1', '2015-05-20 00:00:00', 'admin');

-- ----------------------------
-- Table structure for `TGroupSecfieldRelation`
-- ----------------------------
DROP TABLE IF EXISTS `TGroupSecfieldRelation`;
CREATE TABLE `TGroupSecfieldRelation` (
  `idTGroupSecfieldRelation` int(11) NOT NULL,
  `tg_id` int(11) DEFAULT NULL,
  `secfield_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of TGroupSecfieldRelation
-- ----------------------------

-- ----------------------------
-- Table structure for `TMeta`
-- ----------------------------
DROP TABLE IF EXISTS `TMeta`;
CREATE TABLE `TMeta` (
  `object_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_name` varchar(64) DEFAULT NULL,
  `parent_secl_id` int(11) DEFAULT NULL,
  `obj_seclevel` int(11) DEFAULT NULL,
  `author` varchar(64) DEFAULT NULL,
  `gen_time` datetime DEFAULT NULL,
  `path` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `subject` varchar(256) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `language` varchar(64) DEFAULT NULL,
  `source` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`object_id`),
  UNIQUE KEY `object_id_UNIQUE` (`object_id`) USING BTREE,
  UNIQUE KEY `path` (`path`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1038247 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TMeta
-- ----------------------------
/*
INSERT INTO `TMeta` VALUES ('1038161', '小酒窝', '7', '5', 'pad1', '2016-01-11 16:17:00', 'ytf/1.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038162', '小酒窝1', '7', '2', 'mobile', '2016-01-20 01:38:54', 'ytf1/2.wma', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038164', '铃声', '7', '4', 'mobile', '2016-01-20 01:58:47', 'zjj/iphone.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038171', 'test2', '2', '1', 'tn5', '2016-01-21 01:39:26', 'ytf/test2.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038172', 'jay2', '10', '1', 'tn5', '2016-01-21 12:48:49', 'ytf/jay2.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038176', '1232', '5', '1', 'qwe', '2016-01-22 19:09:33', 'ytf/tmp/file/2016/01/22/19/09/32/2.txt', 'text/plain', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038188', '小酒窝', '7', '5', 'pad1', '2016-01-25 12:41:16', 'zjj/3.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038189', '1123', '2', '5', 'testwzl10161', '2016-01-26 01:44:11', 'ytf/tmp/file/2016/01/26/01/44/10/maikongtiao.txt', 'text/plain', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038193', '小', '54', '4', 'qwe', '2016-01-28 08:11:58', 'zjj/xinzuo.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038195', 'ring', '5', '4', 'cloudms', '2016-02-01 06:47:52', 'zjj/ring.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038196', 'iphone??', '5', '4', 'cloudms', '2016-02-18 07:12:47', 'zjj/iphone', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038197', '小酒窝', '7', '4', 'cloudms', '2016-03-31 02:47:19', 'ytf/2.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038198', 'qwer', '5', '5', 'cloudms', '2016-06-02 01:41:04', 'zjj/qwer.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038199', 'tests', '5', '5', 'cloudms', '2016-06-02 02:29:36', 'zjj/tests.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038200', 'test3', '5', '5', 'cloudms', '2016-06-02 03:01:08', 'zjj/test3.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038201', 'test5', '5', '4', 'cloudms', '2016-06-02 03:15:05', 'zjj/test5.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038202', 'test6', '5', '4', 'cloudms', '2016-06-02 03:17:37', 'zjj/test6.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038203', 'test7', '5', '4', 'cloudms', '2016-06-02 03:22:55', 'zjj/test7.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038205', 'ftp2', '5', '4', 'cloudms', '2016-06-06 03:40:54', 'zjj/ftp2.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038206', 'ftp3', '5', '4', 'cloudms', '2016-06-06 07:50:42', 'zjj/ftp3.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038208', 'ftp4', '5', '4', 'cloudms', '2016-06-06 08:04:55', 'zjj/ftp4.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038209', 'ftp7', '5', '4', 'cloudms', '2016-06-15 03:13:11', 'zjj/ftp7.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038214', 'ftp8', '5', '4', 'cloudms', '2016-06-17 07:52:29', 'zjj/ftp8.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038215', 'ftp9', '5', '4', 'cloudms', '2016-06-17 08:03:02', 'zjj/ftp9.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038216', '33', '5', '5', 'cloudms', '2016-06-24 02:13:53', 'zjj/33.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038217', 'test', '5', '5', 'cloudms', '2016-06-24 02:42:13', 'zjj/test.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038218', '333', '5', '5', 'cloudms', '2016-06-24 02:56:29', 'zjj/333.mp3', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038219', 'qaz', '5', '5', 'cloudms', '2016-06-24 03:03:40', 'zjj/qaz.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038220', 'ftp2ceshi', '5', '5', 'cloudms', '2016-06-29 06:24:41', 'zjj/ftp2ceshi.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038221', '22', '5', '5', 'cloudms', '2016-06-29 06:30:31', 'zjj/22.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038222', '11', '5', '5', 'cloudms', '2016-06-29 06:38:36', 'zjj/11.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038223', 'ftp74', '5', '5', 'cloudms', '2016-07-04 01:13:20', 'zjj/ftp74.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038224', '74ceshi', '5', '5', 'cloudms', '2016-07-04 01:58:07', 'zjj/74ceshi.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038226', 'ftp22', '5', '5', 'cloudms', '2016-07-04 03:31:43', 'zjj/ftp22.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038227', '1', '5', '5', 'cloudms', '2016-07-04 03:35:37', 'zjj/1.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038228', 'ytf0809', '5', '5', 'cloudms', '2016-08-09 07:18:07', 'zjj/ytf0809.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038233', '0809curl', '5', '4', 'cloudms', '2016-08-09 07:41:54', 'zjj/1.txt', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038244', '小酒窝', '5', '4', 'cloudms', '2016-08-09 08:07:10', 'zjj/0809.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038245', '080901', '5', '4', 'cloudms', '2016-08-09 08:08:32', 'zjj/080901.m4a', 'audio/mp3', '', '', '', '');
INSERT INTO `TMeta` VALUES ('1038246', '080902', '5', '4', 'cloudms', '2016-08-09 08:10:21', 'zjj/080902.m4a', 'audio/mp3', '', '', '', '');
*/
-- ----------------------------
-- Table structure for `TPolicy`
-- ----------------------------
DROP TABLE IF EXISTS `TPolicy`;
CREATE TABLE `TPolicy` (
  `idTUserSecfieldRelation` int(11) NOT NULL AUTO_INCREMENT,
  `secfield_id` int(11) NOT NULL,
  `seclass_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idTUserSecfieldRelation`),
  UNIQUE KEY `secfield_id_UNIQUE` (`secfield_id`) USING BTREE,
  KEY `seclass_id_idx` (`seclass_id`) USING BTREE,
  KEY `secfield_id_idx` (`secfield_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TPolicy
-- ----------------------------
INSERT INTO `TPolicy` VALUES ('1', '2', '3,4,35');
INSERT INTO `TPolicy` VALUES ('2', '3', '3');
INSERT INTO `TPolicy` VALUES ('3', '1', '2');
INSERT INTO `TPolicy` VALUES ('14', '7', '10');
INSERT INTO `TPolicy` VALUES ('15', '8', '');
INSERT INTO `TPolicy` VALUES ('21', '17', '16');
INSERT INTO `TPolicy` VALUES ('22', '5', '5,6,7');
INSERT INTO `TPolicy` VALUES ('28', '24', '2,3,4,5,7');
INSERT INTO `TPolicy` VALUES ('29', '26', '2,3,4,37');
INSERT INTO `TPolicy` VALUES ('32', '47', '2,5');
INSERT INTO `TPolicy` VALUES ('33', '49', '3');
INSERT INTO `TPolicy` VALUES ('41', '55', '54');
INSERT INTO `TPolicy` VALUES ('42', '4', '4');

-- ----------------------------
-- Table structure for `TSecfield`
-- ----------------------------
DROP TABLE IF EXISTS `TSecfield`;
CREATE TABLE `TSecfield` (
  `secfield_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_secfd_id` int(11) DEFAULT NULL,
  `secfield_name` varchar(64) DEFAULT NULL,
  `gen_time` datetime DEFAULT NULL,
  PRIMARY KEY (`secfield_id`),
  UNIQUE KEY `secfield_id` (`secfield_id`) USING BTREE,
  UNIQUE KEY `secfield_name` (`secfield_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TSecfield
-- ----------------------------
INSERT INTO `TSecfield` VALUES ('1', '0', 'vip1 JAY音乐', '2015-05-20 00:00:00');
INSERT INTO `TSecfield` VALUES ('2', '1', 'vip2 周杰伦', '2015-05-20 00:00:00');
INSERT INTO `TSecfield` VALUES ('3', '2', 'vip3 叶惠美', '2015-05-20 00:00:00');
INSERT INTO `TSecfield` VALUES ('4', '2', 'vip4 范特西', '2015-05-20 00:00:00');
INSERT INTO `TSecfield` VALUES ('5', '1', 'vip2 林俊杰', '2015-07-27 19:12:37');
INSERT INTO `TSecfield` VALUES ('6', '1', 'vip3 曹操', '2015-07-27 19:13:18');
INSERT INTO `TSecfield` VALUES ('7', '0', 'vip1 相声', '2015-07-14 09:27:44');
INSERT INTO `TSecfield` VALUES ('8', '7', 'vip2 侯宝林', '2015-07-28 09:29:52');
INSERT INTO `TSecfield` VALUES ('9', '0', '戏曲', '2015-07-28 16:25:10');
INSERT INTO `TSecfield` VALUES ('14', '8', '对口相声', '2015-07-29 01:20:31');
INSERT INTO `TSecfield` VALUES ('15', '9', '京剧', '2015-08-13 08:47:38');
INSERT INTO `TSecfield` VALUES ('16', '0', 'vip0 音乐', '2015-08-19 05:09:53');
INSERT INTO `TSecfield` VALUES ('17', '0', 'vip1 庄心妍', '2015-08-19 05:43:31');
INSERT INTO `TSecfield` VALUES ('18', '0', 'bb', '2015-11-30 09:55:03');
INSERT INTO `TSecfield` VALUES ('19', '9', '昆剧', '2015-12-05 14:07:32');
INSERT INTO `TSecfield` VALUES ('20', '2', 'mojiezuo', '2015-12-05 18:29:35');
INSERT INTO `TSecfield` VALUES ('21', '1', 'test1001', '2015-12-09 05:59:14');
INSERT INTO `TSecfield` VALUES ('22', '0', 'test3000', '2015-12-09 06:20:25');
INSERT INTO `TSecfield` VALUES ('23', '22', 'testabcd', '2015-12-14 02:28:38');
INSERT INTO `TSecfield` VALUES ('24', '5', 'test4', '2015-12-17 13:34:05');
INSERT INTO `TSecfield` VALUES ('25', '5', 'test5', '2015-12-17 15:04:02');
INSERT INTO `TSecfield` VALUES ('26', '0', 'test6', '2015-12-17 15:12:37');
INSERT INTO `TSecfield` VALUES ('28', '1', 'ytf', '2015-12-22 02:57:27');
INSERT INTO `TSecfield` VALUES ('29', '2', 'aaaaa', '2015-12-22 03:11:23');
INSERT INTO `TSecfield` VALUES ('30', '2', 'bbbbbbb', '2015-12-22 03:15:20');
INSERT INTO `TSecfield` VALUES ('31', '1', 'cccc', '2015-12-22 03:22:43');
INSERT INTO `TSecfield` VALUES ('32', '2', 'dddd', '2015-12-22 03:37:08');
INSERT INTO `TSecfield` VALUES ('33', '0', 'eeee', '2015-12-22 03:38:52');
INSERT INTO `TSecfield` VALUES ('34', '1', 'fffff', '2015-12-22 04:34:18');
INSERT INTO `TSecfield` VALUES ('35', '6', 'gggg', '2015-12-22 04:36:05');
INSERT INTO `TSecfield` VALUES ('36', '0', 'hhh', '2015-12-22 04:37:37');
INSERT INTO `TSecfield` VALUES ('37', '0', 'iiii', '2015-12-22 04:38:12');
INSERT INTO `TSecfield` VALUES ('38', '0', 'kkk', '2015-12-22 04:39:46');
INSERT INTO `TSecfield` VALUES ('39', '0', 'llll', '2015-12-22 04:40:05');
INSERT INTO `TSecfield` VALUES ('40', '0', 'mmm', '2015-12-22 05:02:17');
INSERT INTO `TSecfield` VALUES ('41', '0', 'nnn', '2015-12-22 05:04:08');
INSERT INTO `TSecfield` VALUES ('42', '0', 'ooo', '2015-12-22 05:06:32');
INSERT INTO `TSecfield` VALUES ('43', '40', 'pppp', '2015-12-22 05:19:37');
INSERT INTO `TSecfield` VALUES ('44', '42', '234d', '2015-12-22 06:20:40');
INSERT INTO `TSecfield` VALUES ('45', '44', '234a', '2015-12-22 07:51:42');
INSERT INTO `TSecfield` VALUES ('46', '1', 'jay1', '2015-12-24 02:36:50');
INSERT INTO `TSecfield` VALUES ('47', '5', 'ffuueee', '2015-12-24 03:01:11');
INSERT INTO `TSecfield` VALUES ('48', '1', 'jay2', '2015-12-24 03:08:56');
INSERT INTO `TSecfield` VALUES ('49', '1', 'jay3', '2015-12-24 06:46:13');
INSERT INTO `TSecfield` VALUES ('55', '1', '十二新作', '2016-01-22 12:15:41');

-- ----------------------------
-- Table structure for `TSeclass`
-- ----------------------------
DROP TABLE IF EXISTS `TSeclass`;
CREATE TABLE `TSeclass` (
  `seclass_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_secl_id` int(11) DEFAULT NULL,
  `seclass_name` varchar(64) DEFAULT NULL,
  `gen_time` datetime DEFAULT NULL,
  PRIMARY KEY (`seclass_id`),
  UNIQUE KEY `seclass_id_UNIQUE` (`seclass_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TSeclass
-- ----------------------------
INSERT INTO `TSeclass` VALUES ('1', '0', '音乐', '2015-05-20 00:00:00');
INSERT INTO `TSeclass` VALUES ('2', '1', '周杰伦', '2015-05-20 00:00:00');
INSERT INTO `TSeclass` VALUES ('3', '2', '叶惠美', '2015-05-20 00:00:00');
INSERT INTO `TSeclass` VALUES ('4', '2', '范特西', '2015-05-20 00:00:00');
INSERT INTO `TSeclass` VALUES ('5', '1', '林俊杰', '2015-06-29 15:19:26');
INSERT INTO `TSeclass` VALUES ('6', '5', '新地球', '2015-06-29 15:19:31');
INSERT INTO `TSeclass` VALUES ('7', '5', '她说', '2015-06-29 15:19:36');
INSERT INTO `TSeclass` VALUES ('10', '0', '北京话', '2015-07-29 09:28:28');
INSERT INTO `TSeclass` VALUES ('14', '0', '戏曲', '2015-08-04 01:52:40');
INSERT INTO `TSeclass` VALUES ('15', '14', '京剧', '2015-08-13 08:50:05');
INSERT INTO `TSeclass` VALUES ('16', '1', '庄心妍', '2015-08-19 05:09:06');
INSERT INTO `TSeclass` VALUES ('17', '1', '韩红', '2015-08-19 05:58:16');
INSERT INTO `TSeclass` VALUES ('20', '1', '许嵩', '2015-12-05 14:59:46');
INSERT INTO `TSeclass` VALUES ('35', '1', '迈克尔', '2015-12-05 18:22:27');
INSERT INTO `TSeclass` VALUES ('37', '1', '田馥甄', '2015-12-22 05:51:46');
INSERT INTO `TSeclass` VALUES ('44', '15', '京剧1', '2015-12-22 06:27:26');
INSERT INTO `TSeclass` VALUES ('50', '1', '蔡依林', '2015-12-22 07:26:01');
INSERT INTO `TSeclass` VALUES ('51', '50', '蔡依林音乐1', '2015-12-22 07:26:20');
INSERT INTO `TSeclass` VALUES ('52', '17', '韩红音乐1', '2015-12-22 07:40:26');
INSERT INTO `TSeclass` VALUES ('53', '37', '小幸运', '2015-12-22 07:43:19');
INSERT INTO `TSeclass` VALUES ('54', '2', '十二星座', '2015-12-24 06:49:37');

-- ----------------------------
-- Table structure for `TUser`
-- ----------------------------
DROP TABLE IF EXISTS `TUser`;
CREATE TABLE `TUser` (
  `tu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户标识',
  `uniqueid` varchar(64) DEFAULT NULL,
  `user_id_code` varchar(64) DEFAULT NULL,
  `login_name` varchar(64) DEFAULT NULL,
  `password` varchar(64) NOT NULL,
  `username` varchar(64) NOT NULL,
  `seclevel` int(11) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `gen_time` datetime DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`tu_id`),
  UNIQUE KEY `tu_id_UNIQUE` (`tu_id`) USING BTREE,
  UNIQUE KEY `login_name_UNIQUE` (`login_name`) USING BTREE,
  KEY `Index_user` (`tu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=330 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TUser
-- ----------------------------
INSERT INTO `TUser` VALUES ('2', null, null, 'hanmeimei', 'hanmeimei', 'hanmeimei', '2', '15216791876', 'htjf@sina.com', '2015-05-20 00:00:00', null, '1');
INSERT INTO `TUser` VALUES ('5', null, null, 'sun', 'sun', 'sun', '3', '18810877876', 'tank@126.com', '2015-08-14 16:09:55', null, null);
INSERT INTO `TUser` VALUES ('19', '9279428cfbb64126a7dc1fe6e56c9209', '9279428cfbb64126a7dc1fe6e56c9209', 'qwe', 'qwe', 'qwe', '4', '15210877876', '741852@bjca.org.cn', '2015-07-01 03:55:04', '2015-07-01 03:55:04', null);
INSERT INTO `TUser` VALUES ('25', 'e9e95bf348024dd79f012498f767cfd2', 'e9e95bf348024dd79f012498f767cfd2', 'mobile', 'mobile', 'mobile', '3', '15612312344', 'hbhdutf@163.com', '2015-07-09 05:11:25', '2015-07-09 05:11:25', null);
INSERT INTO `TUser` VALUES ('33', '0780eaae1cd24ef9a83b7ce4cdbec4a2', '0780eaae1cd24ef9a83b7ce4cdbec4a2', 'pad1', 'pad1', 'pad1', '4', '18701639091', 'dtjbcdf@qq.com', '2015-09-30 09:43:45', null, null);
INSERT INTO `TUser` VALUES ('35', '10e61e634240442f826487c88443d3e1', '10e61e634240442f826487c88443d3e1', 'wzlpc1', 'wzlpc1', 'wzlpc1', '5', '18701639091', '305848581@qq.com', '2015-08-31 10:05:52', null, null);
INSERT INTO `TUser` VALUES ('36', '11451201e7bb4cd7b3a396c68e3b45ea', '11451201e7bb4cd7b3a396c68e3b45ea', 'ytf', 'ytf', 'ytf', '4', '15652264480', 'ytf@163.com', '2015-08-16 22:51:38', null, null);
INSERT INTO `TUser` VALUES ('37', '1263f8e9869d413ab0ab1905a197ed6c', '1263f8e9869d413ab0ab1905a197ed6c', 'tn5', 'tn5', 'tn5', '4', '11222222220', '0@8.com', '2015-09-17 10:40:28', null, null);
INSERT INTO `TUser` VALUES ('42', '1c95680d8c0b4337931bb7fc56a57e3b', '1c95680d8c0b4337931bb7fc56a57e3b', 'Wzl4', 'Wzl4', 'Wzl4', '5', '15842368521', 'qq@qq.com', '2015-08-27 16:41:14', null, null);
INSERT INTO `TUser` VALUES ('43', '1f8b3b11fcd94f52b1f842b5116e83ca', '1f8b3b11fcd94f52b1f842b5116e83ca', 'liyade8', 'liyade8', 'liyade8', '5', '13121018582', 'liyade@qqqqqqqqqq.co', '2015-08-26 21:05:27', null, null);
INSERT INTO `TUser` VALUES ('45', '205fc62e55904f8cbc84d8117a3ab5dc', '205fc62e55904f8cbc84d8117a3ab5dc', '147', '147', '147', '5', '15336982541', '123@163.com', '2015-10-20 09:49:06', null, null);
INSERT INTO `TUser` VALUES ('46', '2191d3770fbc4f22924a366667619bdc', '2191d3770fbc4f22924a366667619bdc', '1234', '1234', '1234', '5', '13152588442', '11@qq.com', '2015-08-26 16:59:08', null, null);
INSERT INTO `TUser` VALUES ('49', '258c28f475bf4bf0abe1cc272b8a624d', '258c28f475bf4bf0abe1cc272b8a624d', 'gz1', 'gz1', 'gz1', '3', '11111111111', '362156051@qq.com', '2015-08-24 09:51:40', null, null);
INSERT INTO `TUser` VALUES ('53', '2aafcb73e6904160bbd404c577df2e90', '2aafcb73e6904160bbd404c577df2e90', 'qaz', 'qaz', 'qaz', '5', '15247859632', 'a@163.com', '2015-08-14 05:09:40', null, null);
INSERT INTO `TUser` VALUES ('57', '31564f1ac88b49c8aa3cba698ce26de4', '31564f1ac88b49c8aa3cba698ce26de4', 'test10', 'test10', 'test10', '5', '13370111761', 'lizhong@bjca.org.cn', '2015-09-15 17:11:49', null, null);
INSERT INTO `TUser` VALUES ('60', '3ba365450fd1402587f027b6e12a1085', '3ba365450fd1402587f027b6e12a1085', 'bbbb', 'bbbb', 'bbbb', '5', '', '111@qq.com', '2015-11-14 01:53:26', null, null);
INSERT INTO `TUser` VALUES ('61', '3bbcea676d284274bac3787da0a72722', '3bbcea676d284274bac3787da0a72722', 'w51', 'w51', 'w51', '5', '18801639091', 'qqw@qq.com', '2015-08-28 10:05:41', null, null);
INSERT INTO `TUser` VALUES ('62', '3c61c01382ac41458b4a42a7e17cb571', '3c61c01382ac41458b4a42a7e17cb571', 'lizhong12', 'lizhong12', 'lizhong12', '5', '13370111761', 'lizhong@bjca.org.cn', '2015-09-15 17:32:32', null, null);
INSERT INTO `TUser` VALUES ('68', '40fc04360eaf45459523c27b91a65cdb', '40fc04360eaf45459523c27b91a65cdb', '346329226', '346329226', '346329226', '5', '18610196534', '346329229@qq.com', '2015-10-20 11:34:59', null, null);
INSERT INTO `TUser` VALUES ('69', '4131a8a1aeee4e83949c52b400ea9375', '4131a8a1aeee4e83949c52b400ea9375', 'sandy', 'sandy', 'sandy', '5', '15652264480', 'sandy@163.com', '2015-08-18 09:35:23', null, null);
INSERT INTO `TUser` VALUES ('71', '4463ef3961b7406997ad0473f480e116', '4463ef3961b7406997ad0473f480e116', 'liyade2', 'liyade2', 'liyade2', '5', '13121018582', 'liyas@dd.com', '2015-08-26 21:08:42', null, null);
INSERT INTO `TUser` VALUES ('74', '4d016af301a4488099b6848d7870d5da', '4d016af301a4488099b6848d7870d5da', 'zzzz', 'zzzz', 'zzzz', '5', '18310196534', '18310196534@qq.com', '2015-10-28 15:16:24', null, null);
INSERT INTO `TUser` VALUES ('85', '679bddf25f394616aa3b7c7e18c5cd28', '679bddf25f394616aa3b7c7e18c5cd28', 'vvvv', 'vvvv', 'vvvv', '5', '', '', '2015-10-29 15:14:19', null, null);
INSERT INTO `TUser` VALUES ('87', '6c5f6368e6f143509607f9ea9e691111', '6c5f6368e6f143509607f9ea9e691111', 'testwzl10161', 'testwzl10161', 'testwzl10161', '5', '18701639091', 'wwwwww@qq.com', '2015-10-16 17:30:36', null, null);
INSERT INTO `TUser` VALUES ('94', '74bf3a2b72304f258d2c2f818042d61e', '74bf3a2b72304f258d2c2f818042d61e', 'wzltest22', 'wzltest22', 'wzltest22', '5', '18701639091', 'rtyggg@rty163.com', '2015-09-28 17:19:48', null, null);
INSERT INTO `TUser` VALUES ('96', '795f3c63a1314ef7997d80e8f6f63b41', '795f3c63a1314ef7997d80e8f6f63b41', '222333', '222333', '222333', '5', '11111111111', '1404388058@qq.com', '2015-09-17 11:46:14', null, null);
INSERT INTO `TUser` VALUES ('98', '7ccae32e7bda4a74b3ac140c2f6e3040', '7ccae32e7bda4a74b3ac140c2f6e3040', 'test32101', 'test32101', 'test32101', '5', '', '123123@qq.com', '2015-11-30 19:44:59', null, null);
INSERT INTO `TUser` VALUES ('99', '7e05d28424ab43e48e996bce1baf01b4', '7e05d28424ab43e48e996bce1baf01b4', '456', '456', '456', '5', '13111111111', 'qwe@163.com', '2015-11-25 11:00:10', null, null);
INSERT INTO `TUser` VALUES ('101', '835ba715f4f34e21aa1409c2cf981269', '835ba715f4f34e21aa1409c2cf981269', 'wzll33', 'wzll33', 'wzll33', '5', '18701639091', '11@qq.com', '2015-08-27 15:51:10', null, null);
INSERT INTO `TUser` VALUES ('110', '8b4c7369fde04101b89aa6c259de840a', '8b4c7369fde04101b89aa6c259de840a', '1233', '1233', '1233', '3', '12312312317', 'hbhd1ytf@163.com', '2015-11-18 00:39:29', null, null);
INSERT INTO `TUser` VALUES ('111', '8f848ed7cc814188a81775cee139d44d', '8f848ed7cc814188a81775cee139d44d', 'wzl10221', 'wzl10221', 'wzl10221', '5', '18781639592', 'tgvdfghy@163.com', '2015-10-22 16:56:14', null, null);
INSERT INTO `TUser` VALUES ('118', 'a7752a819f7e490aa2e24f7e7fda91c1', 'a7752a819f7e490aa2e24f7e7fda91c1', 'wzl88', 'wzl88', 'wzl88', '5', '18701639091', 'rygdtuhft@qq.com', '2015-10-20 09:29:34', null, null);
INSERT INTO `TUser` VALUES ('119', 'a9366b1e15bd422a91ab0b2da66829dd', 'a9366b1e15bd422a91ab0b2da66829dd', 'wzltest2', 'wzltest2', 'wzltest2', '5', '18701639091', '305848581@qq.com', '2015-08-25 17:52:41', null, null);
INSERT INTO `TUser` VALUES ('120', 'aa1f1e654cae467fba31e7ac88d4fc25', 'aa1f1e654cae467fba31e7ac88d4fc25', 'wzltest24', 'wzltest24', 'wzltest24', '5', '18701639091', 'rtygfftyyygfffftt@sina.com', '2015-09-29 11:10:39', null, null);
INSERT INTO `TUser` VALUES ('124', 'ae6cd5207dc24d52b2d12f055f839b7e', 'ae6cd5207dc24d52b2d12f055f839b7e', 'wzltest3', 'wzltest3', 'wzltest3', '5', '18701639091', '1234@qq.com', '2015-08-26 14:04:58', null, null);
INSERT INTO `TUser` VALUES ('125', 'afd1cc2d6c9542a69abb8ef2d29e0416', 'afd1cc2d6c9542a69abb8ef2d29e0416', 'w26', 'w26', 'w26', '5', '18701639091', 'wughhhh@vgg163.com', '2015-09-29 10:23:18', null, null);
INSERT INTO `TUser` VALUES ('127', 'b75d6c3c30fd43d6b12bfd3bb84e4ee6', 'b75d6c3c30fd43d6b12bfd3bb84e4ee6', 'wzltest25', 'wzltest25', 'wzltest25', '5', '15812345652', 'fhbvg@163.com', '2015-09-29 11:16:27', null, null);
INSERT INTO `TUser` VALUES ('129', 'b9d72a41b73c4e0b8d73dca7236f9ab0', 'b9d72a41b73c4e0b8d73dca7236f9ab0', '121', '121', '121', '5', '12121212121', '362156051@qq.com', '2015-08-28 13:53:55', null, null);
INSERT INTO `TUser` VALUES ('134', 'c77de91bde4a4054ace01290908d54da', 'c77de91bde4a4054ace01290908d54da', 'wzltest1', 'wzltest1', 'wzltest1', '5', '18701639091', 'qwe@qwy.com', '2015-08-25 17:36:52', null, null);
INSERT INTO `TUser` VALUES ('139', 'd7342677900e4789a00643e5d8da0c37', 'd7342677900e4789a00643e5d8da0c37', 'wzl88888', 'wzl88888', 'wzl88888', '5', '18701639098', 'ghuythuuu@qq.com', '2015-10-20 15:22:42', null, null);
INSERT INTO `TUser` VALUES ('144', 'e1c41e3d15cc45aab61911aad3392c6c', 'e1c41e3d15cc45aab61911aad3392c6c', 'wzltest23', 'wzltest23', 'wzltest23', '5', '18701639091', 'wuzhouling@bjca.org.cn', '2015-09-29 09:50:06', null, null);
INSERT INTO `TUser` VALUES ('148', 'e8b69d5c3903417290360c93e9109a71', 'e8b69d5c3903417290360c93e9109a71', 'wzl7', 'wzl7', 'wzl7', '5', '18701639092', 'qq@qq.com', '2015-08-28 11:34:35', null, null);
INSERT INTO `TUser` VALUES ('151', 'f441c0cf14c8499980e457e25a2e3dc3', 'f441c0cf14c8499980e457e25a2e3dc3', 'lydd', 'lydd', 'lydd', '5', '13121018582', 'li@con.com', '2015-08-19 21:25:38', null, null);
INSERT INTO `TUser` VALUES ('152', 'f49a0c14d73d44719ad31d545c2b051f', 'f49a0c14d73d44719ad31d545c2b051f', 'wjt123', 'wjt123', 'wjt123', '5', '18611581476', '18611581476@163.com', '2015-08-18 09:44:34', null, null);
INSERT INTO `TUser` VALUES ('154', 'f86111ee23d149a98e554c52ed757e07', 'f86111ee23d149a98e554c52ed757e07', '111', '111', '111', '5', '', '', '2015-09-24 14:03:59', null, null);
INSERT INTO `TUser` VALUES ('155', 'fd60849e1b724aee8723d51cbf99b0f1', 'fd60849e1b724aee8723d51cbf99b0f1', 'Zongdan', 'Zongdan', 'Zongdan', '5', '', '1@1.com', '2015-08-26 17:28:13', null, null);
INSERT INTO `TUser` VALUES ('164', '92ae407d1f0a435387beda570ad3d1e6', '92ae407d1f0a435387beda570ad3d1e6', 'test1130', 'test1130', 'test1130', '5', '13311111111', '321321@1234.c6', '2015-11-30 18:31:52', null, null);
INSERT INTO `TUser` VALUES ('168', '8f28832efd824c838711eead071532f6', '8f28832efd824c838711eead071532f6', 'zhoukuo', 'zhoukuo', 'zhoukuo', '5', '', '', '2015-12-02 15:18:24', null, null);
INSERT INTO `TUser` VALUES ('202', '975a84972feb40848c5dca5f5ade661a', '975a84972feb40848c5dca5f5ade661a', 'qweas', 'qweas', 'qweas', '5', '', '', '2015-12-08 14:32:18', null, null);
INSERT INTO `TUser` VALUES ('228', '8a4ff5cf71b140729f62a284a0ed89f9', '8a4ff5cf71b140729f62a284a0ed89f9', 'lc', 'lc', 'lc', '5', '', '', '2015-12-08 16:27:54', null, null);
INSERT INTO `TUser` VALUES ('238', '29b74acde15345b4822ec7587486fe21', '29b74acde15345b4822ec7587486fe21', 'zyl123', 'zyl1234', 'zyl1234', '5', '', 'liangce@123.cn', '2015-12-08 16:36:55', null, null);
INSERT INTO `TUser` VALUES ('239', '616031b204644c709a253521c46612b6', '616031b204644c709a253521c46612b6', 'kov', 'kov', 'kov', '5', '15652204480', '123@163.com', '2015-12-08 17:27:26', null, null);
INSERT INTO `TUser` VALUES ('275', '8b2a1642c8a34ad497cb7c6618937148', '8b2a1642c8a34ad497cb7c6618937148', 'lizhong', 'lizhong', 'lizhong', '5', '13370111763', 'zhangyunlong@bjca.org.cn', '2015-07-29 04:37:09', null, null);
INSERT INTO `TUser` VALUES ('284', '30f6c8c034f847a88756f71c4d0c2c1e', '30f6c8c034f847a88756f71c4d0c2c1e', 'zongdan1', 'zongdan', 'zongdan', '5', '15210533929', '362156051@qq.com', '2015-12-17 16:25:07', null, null);
INSERT INTO `TUser` VALUES ('285', 'f26329ba96f245e98c6f9c4fb166d694', 'f26329ba96f245e98c6f9c4fb166d694', 'zongdan6', 'zongdan6', 'zongdan6', '5', '15210533929', '362156051@qq.com', '2015-12-17 16:28:46', null, null);
INSERT INTO `TUser` VALUES ('286', '965d9b2657c745c5a2718d772e827ac5', '965d9b2657c745c5a2718d772e827ac5', 'zd', 'zd', 'zd', '5', '', 'zongdan@bjca.org.cn', '2015-12-17 16:51:14', null, null);
INSERT INTO `TUser` VALUES ('287', '58c50629ccc84f4d9a363ef7149d32d0', '58c50629ccc84f4d9a363ef7149d32d0', 'zd8', 'zd8', 'zd8', '5', '', '362156051@qq.com', '2015-12-17 16:53:29', null, null);
INSERT INTO `TUser` VALUES ('299', '010f526624e747a092bae7785c222780', '010f526624e747a092bae7785c222780', 'zyf112', 'zyf123', 'zyf123', '5', '', '', '2015-12-28 16:36:05', null, null);
INSERT INTO `TUser` VALUES ('313', '52ef704c7d924eb4af16112833d3199c', '52ef704c7d924eb4af16112833d3199c', '', 'qwe', 'qwe', '5', '15652264480', 'sandy@luo.bo', '2015-09-15 16:55:21', null, null);
INSERT INTO `TUser` VALUES ('315', '347aaef47aa34d1db0208c0e00a38553', '347aaef47aa34d1db0208c0e00a38553', 'cloudms', 'cloudms', 'cloudms', '4', '15652264482', 'hbhdytf@163.com', '2016-01-28 09:52:25', null, null);
INSERT INTO `TUser` VALUES ('316', '4884a9b49da84ee99e5799b8825374e8', '4884a9b49da84ee99e5799b8825374e8', 'tn', 'tn', 'tn', '5', '11111122223', '1@1111111111111111111111111111111111111111111.com', '2015-09-17 10:28:27', null, null);
INSERT INTO `TUser` VALUES ('317', 'a6920534235341ffaf5f3d3f0cadcec0', 'a6920534235341ffaf5f3d3f0cadcec0', 'lizhong3', 'lizhong3', 'lizhong3', '5', '13199999998', 'lizhong@qqq.com', '2016-04-07 14:18:11', null, null);
INSERT INTO `TUser` VALUES ('319', '2207c71d29e84f888f201d7c5b08f0a3', '2207c71d29e84f888f201d7c5b08f0a3', 'tn2', 'å°å†…ç®¡ç†å‘˜æ·»åŠ ', 'å°å†…ç®¡ç†å‘˜æ·»åŠ ', '5', '', '', '2015-08-24 10:15:23', null, null);
INSERT INTO `TUser` VALUES ('320', '86fd0eef86c8474ebb46f31e6876575a', '86fd0eef86c8474ebb46f31e6876575a', 'lizhong2', 'lizhong2', 'lizhong2', '5', '13199999999', 'lizhong@qq.com', '2016-04-07 14:16:48', null, null);
INSERT INTO `TUser` VALUES ('321', '5e8e17784ffc420ea0fd758eab4e4e54', '5e8e17784ffc420ea0fd758eab4e4e54', 'wjt', 'wjt', 'wjt', '5', '18611581476', '123@163.com', '2015-07-14 05:28:48', null, null);
INSERT INTO `TUser` VALUES ('322', '1973fb483c44455e8931071de20108cd', '1973fb483c44455e8931071de20108cd', 'æ¨è…¾é£ž', 'æ¨è…¾é£ž', 'æ¨è…¾é£ž', '5', '15652223478', 'ytf@cnr.cn', '2016-02-29 11:09:27', null, null);
INSERT INTO `TUser` VALUES ('323', '9fee04e72ae64bdc89069573cac1d4f4', '9fee04e72ae64bdc89069573cac1d4f4', 'zhangjijie', 'å¼ åŸºæ°', 'å¼ åŸºæ°', '5', '12334444444', 'zhangjijie@bjca.org.cn', '2016-03-15 15:14:30', null, null);
INSERT INTO `TUser` VALUES ('324', 'b5d324775aa140388b047e2ba6d774be', 'b5d324775aa140388b047e2ba6d774be', 'çŽ‹æ—­', 'çŽ‹æ—­', 'çŽ‹æ—­', '5', '13111111110', 'wangxu@13.com', '2016-03-23 15:21:26', null, null);
INSERT INTO `TUser` VALUES ('325', '4354dd2413304c738be27443e2c7a580', '4354dd2413304c738be27443e2c7a580', 'lizhong19', 'lizhong19', 'lizhong19', '5', '13111115111', 'lizhong19@qq.com', '2016-04-08 14:00:09', null, null);
INSERT INTO `TUser` VALUES ('326', 'c56a59675eec4a95a0674c70bb8b0d18', 'c56a59675eec4a95a0674c70bb8b0d18', 'lizhong21', 'lizhong21', 'lizhong21', '5', '13111111112', 'lizhong21@qq.com', '2016-04-08 14:15:45', null, null);
INSERT INTO `TUser` VALUES ('328', 'c463936044324b098d3beb4a75f82bb6', 'c463936044324b098d3beb4a75f82bb6', 'sdafas', 'sdafas', 'sdafas', '5', '13422223332', 'asdf@c.cnx', '2016-04-06 18:19:36', null, null);
INSERT INTO `TUser` VALUES ('329', null, null, 'lizhong22', 'lizhong22', 'lizhong22', '5', '13111111112', 'lizhong22@qq.com', '2016-08-11 01:15:46', null, null);

-- ----------------------------
-- Table structure for `TUserGroupRelation`
-- ----------------------------
DROP TABLE IF EXISTS `TUserGroupRelation`;
CREATE TABLE `TUserGroupRelation` (
  `idTUserGroupRelation` int(11) NOT NULL DEFAULT '0',
  `tu_id` int(11) NOT NULL,
  `tg_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTUserGroupRelation`),
  KEY `Index_Relation` (`tu_id`) USING BTREE,
  CONSTRAINT `TUserGroupRelation_ibfk_1` FOREIGN KEY (`tu_id`) REFERENCES `TUser` (`tu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of TUserGroupRelation
-- ----------------------------

-- ----------------------------
-- Table structure for `TUserSecfieldRelation`
-- ----------------------------
DROP TABLE IF EXISTS `TUserSecfieldRelation`;
CREATE TABLE `TUserSecfieldRelation` (
  `idTUserSecfieldRelation` int(11) NOT NULL AUTO_INCREMENT,
  `tu_id` int(11) NOT NULL,
  `secfield_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`idTUserSecfieldRelation`),
  UNIQUE KEY `tu_id_UNIQUE` (`tu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TUserSecfieldRelation
-- ----------------------------
INSERT INTO `TUserSecfieldRelation` VALUES ('2', '2', '2');
INSERT INTO `TUserSecfieldRelation` VALUES ('16', '110', '2,40');
INSERT INTO `TUserSecfieldRelation` VALUES ('17', '36', '2');
INSERT INTO `TUserSecfieldRelation` VALUES ('18', '33', '2,5');
INSERT INTO `TUserSecfieldRelation` VALUES ('22', '37', '2');
INSERT INTO `TUserSecfieldRelation` VALUES ('28', '57', '2,3');
INSERT INTO `TUserSecfieldRelation` VALUES ('34', '275', '4,42');
INSERT INTO `TUserSecfieldRelation` VALUES ('49', '19', '2,49,55');
INSERT INTO `TUserSecfieldRelation` VALUES ('61', '315', '4,5');
