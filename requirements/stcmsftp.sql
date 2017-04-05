/*
Navicat MySQL Data Transfer

Source Server         : mysql5.7@127.0.0.1
Source Server Version : 50716
Source Host           : 127.0.0.1:3306
Source Database       : stcmsftp

Target Server Type    : MYSQL
Target Server Version : 50716
File Encoding         : 65001

Date: 2017-03-28 18:12:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add user', '2', 'add_user');
INSERT INTO `auth_permission` VALUES ('5', 'Can change user', '2', 'change_user');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete user', '2', 'delete_user');
INSERT INTO `auth_permission` VALUES ('7', 'Can add permission', '3', 'add_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can change permission', '3', 'change_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete permission', '3', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('10', 'Can add group', '4', 'add_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can change group', '4', 'change_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete group', '4', 'delete_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('22', 'Can add post', '8', 'add_post');
INSERT INTO `auth_permission` VALUES ('23', 'Can change post', '8', 'change_post');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete post', '8', 'delete_post');
INSERT INTO `auth_permission` VALUES ('25', 'Can add comment', '9', 'add_comment');
INSERT INTO `auth_permission` VALUES ('26', 'Can change comment', '9', 'change_comment');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete comment', '9', 'delete_comment');
INSERT INTO `auth_permission` VALUES ('28', 'Can add Tagged Item', '10', 'add_taggeditem');
INSERT INTO `auth_permission` VALUES ('29', 'Can change Tagged Item', '10', 'change_taggeditem');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete Tagged Item', '10', 'delete_taggeditem');
INSERT INTO `auth_permission` VALUES ('31', 'Can add Tag', '11', 'add_tag');
INSERT INTO `auth_permission` VALUES ('32', 'Can change Tag', '11', 'change_tag');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete Tag', '11', 'delete_tag');
INSERT INTO `auth_permission` VALUES ('34', 'Can add server', '12', 'add_server');
INSERT INTO `auth_permission` VALUES ('35', 'Can change server', '12', 'change_server');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete server', '12', 'delete_server');
INSERT INTO `auth_permission` VALUES ('37', 'Can add ftp', '13', 'add_ftp');
INSERT INTO `auth_permission` VALUES ('38', 'Can change ftp', '13', 'change_ftp');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete ftp', '13', 'delete_ftp');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$30000$9HbO06pEPurY$H7hmYygcS/d8tctyEpQfJndaoeDrMpfsGx+oPWdcbT8=', '2017-03-23 02:08:47', '1', 'zam', '', '', '254227751@qq.com', '1', '1', '2017-03-08 03:34:55');
INSERT INTO `auth_user` VALUES ('2', 'pbkdf2_sha256$30000$8AxD2uUeeHl3$5anVDg9PP6EeFYybYaU+6x0Qnwnz15UHlgT1yJszKmk=', null, '0', 'admin', '', '', '', '0', '1', '2017-03-08 03:37:08');

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `blog_comment`
-- ----------------------------
DROP TABLE IF EXISTS `blog_comment`;
CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `email` varchar(254) NOT NULL,
  `body` longtext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `active` tinyint(1) NOT NULL,
  `post_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_comment_f3aa1999` (`post_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_comment
-- ----------------------------
INSERT INTO `blog_comment` VALUES ('1', 'zam', '254227751@qq.com', '第十章评论一', '2017-03-23 07:19:22', '2017-03-23 07:24:08', '0', '10');
INSERT INTO `blog_comment` VALUES ('2', 'zam', '254227751@qq.com', '第十章评论二', '2017-03-23 07:19:38', '2017-03-23 07:24:34', '0', '10');
INSERT INTO `blog_comment` VALUES ('3', 'zam', '254227751@qq.com', '第十章评论三', '2017-03-23 07:19:45', '2017-03-23 07:19:45', '1', '10');
INSERT INTO `blog_comment` VALUES ('4', 'zam', '254227751@qq.com', '第十章评论四', '2017-03-23 07:19:50', '2017-03-23 07:19:50', '1', '10');
INSERT INTO `blog_comment` VALUES ('5', 'zam', '254227751@qq.com', '第十章评论五', '2017-03-23 07:20:00', '2017-03-23 07:20:00', '1', '10');
INSERT INTO `blog_comment` VALUES ('6', 'zam', '254227751@qq.com', '第十章评论五', '2017-03-23 07:20:06', '2017-03-23 07:20:06', '1', '10');
INSERT INTO `blog_comment` VALUES ('7', 'zam', '254227751@qq.com', '第十章评论五', '2017-03-23 07:24:38', '2017-03-23 07:24:38', '1', '10');
INSERT INTO `blog_comment` VALUES ('8', 'zam', '254227751@qq.com', '第十章评论五', '2017-03-23 07:24:40', '2017-03-23 07:24:40', '1', '10');
INSERT INTO `blog_comment` VALUES ('9', 'zam', '254227751@qq.com', '第十章评论五', '2017-03-23 07:24:43', '2017-03-23 07:24:43', '1', '10');
INSERT INTO `blog_comment` VALUES ('10', 'zam', '254227751@qq.com', '第十章评论五', '2017-03-23 07:24:44', '2017-03-23 07:24:44', '1', '10');
INSERT INTO `blog_comment` VALUES ('11', '2423', '4234@qq.com', '第十章评论五', '2017-03-23 07:39:40', '2017-03-23 07:39:40', '1', '10');

-- ----------------------------
-- Table structure for `blog_post`
-- ----------------------------
DROP TABLE IF EXISTS `blog_post`;
CREATE TABLE `blog_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(250) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `body` longtext NOT NULL,
  `publish` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id`),
  KEY `blog_post_2dbcba41` (`slug`),
  CONSTRAINT `blog_post_author_id_dd7a8485_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog_post
-- ----------------------------
INSERT INTO `blog_post` VALUES ('1', '第一章', 'one', '第一章内容', '2017-03-22 14:06:02', '2017-03-22 14:15:19', '2017-03-22 14:15:19', 'published', '1');
INSERT INTO `blog_post` VALUES ('2', '第二章', 'two', '第二章内容', '2017-03-22 14:15:39', '2017-03-22 14:16:03', '2017-03-22 14:16:03', 'published', '1');
INSERT INTO `blog_post` VALUES ('3', '第三章', 'three', '第三章内容', '2017-03-22 14:16:06', '2017-03-22 14:16:29', '2017-03-24 06:13:00', 'draft', '1');
INSERT INTO `blog_post` VALUES ('4', '第四章', 'four', '第四章内容', '2017-03-22 14:16:29', '2017-03-22 14:16:50', '2017-03-24 06:13:13', 'draft', '1');
INSERT INTO `blog_post` VALUES ('5', '第五章', 'five', '第五章内容', '2017-03-22 14:16:50', '2017-03-22 14:17:09', '2017-03-24 06:13:18', 'published', '1');
INSERT INTO `blog_post` VALUES ('6', '第六章', 'six', '第六章内容', '2017-03-22 14:17:17', '2017-03-22 14:17:36', '2017-03-22 14:17:36', 'published', '1');
INSERT INTO `blog_post` VALUES ('7', '第七章', 'seven', '第六章内容', '2017-03-22 14:17:36', '2017-03-22 14:17:56', '2017-03-22 14:17:56', 'published', '1');
INSERT INTO `blog_post` VALUES ('8', '第八章', 'eight', '第八章内容', '2017-03-22 14:17:56', '2017-03-22 14:18:11', '2017-03-24 06:13:22', 'published', '1');
INSERT INTO `blog_post` VALUES ('9', '第九章', 'nine', '第九章内容', '2017-03-22 14:18:11', '2017-03-22 14:18:30', '2017-03-22 14:18:30', 'published', '1');
INSERT INTO `blog_post` VALUES ('10', '第十章', 'ten', '>>> from myapp.models import Article\r\n>>> from myapp.forms import ArticleForm\r\n\r\n# Create a form instance from POST data.\r\n>>> f = ArticleForm(request.POST)\r\n\r\n# Save a new Article object from the form\'s data.\r\n>>> new_article = f.save()\r\n\r\n# Create a form to edit an existing Article, but use\r\n# POST data to populate the form.\r\n>>> a = Article.objects.get(pk=1)\r\n>>> f = ArticleForm(request.POST, instance=a)\r\n>>> f.save()', '2017-03-22 14:18:30', '2017-03-22 14:18:52', '2017-03-24 06:14:07', 'published', '1');

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
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2017-03-08 03:37:08', '2', 'admin', '1', '[{\"added\": {}}]', '2', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2017-03-08 03:57:45', '1', 'ftpdb object', '1', '[{\"added\": {}}]', null, '1');
INSERT INTO `django_admin_log` VALUES ('3', '2017-03-09 01:56:20', '1', 'ftpdb object', '2', '[]', null, '1');
INSERT INTO `django_admin_log` VALUES ('4', '2017-03-10 02:29:44', '2', 'ftpdb object', '1', '[{\"added\": {}}]', null, '1');
INSERT INTO `django_admin_log` VALUES ('5', '2017-03-10 02:38:58', '2', 'ftpdb object', '2', '[{\"changed\": {\"fields\": [\"Background\"]}}]', null, '1');
INSERT INTO `django_admin_log` VALUES ('6', '2017-03-10 02:40:02', '1', 'ftpdb object', '2', '[{\"changed\": {\"fields\": [\"foreground\"]}}]', null, '1');
INSERT INTO `django_admin_log` VALUES ('7', '2017-03-15 07:16:13', '2', '第一个ie标题', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2017-03-15 07:17:00', '2', '第一个标题', '2', '[{\"changed\": {\"fields\": [\"title\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2017-03-15 07:17:11', '2', '第一个标题', '2', '[{\"changed\": {\"fields\": [\"status\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2017-03-15 10:21:13', '3', '第二个标题', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2017-03-15 10:21:46', '3', '第二个标题', '2', '[{\"changed\": {\"fields\": [\"status\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2017-03-15 10:22:21', '4', '第三个', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2017-03-15 10:23:10', '5', '第四个翻页', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2017-03-20 08:38:24', '6', '第五章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2017-03-20 08:38:43', '7', '第六章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2017-03-20 08:38:58', '8', '第七章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2017-03-20 08:39:20', '2', '第一章', '2', '[{\"changed\": {\"fields\": [\"title\", \"slug\", \"body\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2017-03-20 08:39:37', '3', '第二章', '2', '[{\"changed\": {\"fields\": [\"title\", \"slug\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2017-03-20 08:39:50', '4', '第三章', '2', '[{\"changed\": {\"fields\": [\"title\", \"slug\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2017-03-20 08:40:01', '5', '第四章', '2', '[{\"changed\": {\"fields\": [\"title\", \"slug\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2017-03-20 10:13:32', '2', '第一章', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2017-03-20 10:13:35', '3', '第二章', '2', '[]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2017-03-20 13:26:34', '3', '第二章', '2', '[{\"changed\": {\"fields\": [\"slug\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2017-03-20 13:27:22', '2', '第一章', '2', '[{\"changed\": {\"fields\": [\"status\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2017-03-20 13:28:33', '3', '第二章', '2', '[{\"changed\": {\"fields\": [\"slug\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2017-03-22 13:21:33', '3', '第二章', '2', '[{\"changed\": {\"fields\": [\"publish\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2017-03-22 13:21:43', '2', '第一章', '2', '[{\"changed\": {\"fields\": [\"publish\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2017-03-22 13:23:34', '3', '第二章', '2', '[]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2017-03-22 13:23:40', '3', '第二章', '2', '[]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2017-03-22 14:02:18', '2', '第一章', '2', '[]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2017-03-22 14:15:19', '1', '第一章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2017-03-22 14:16:03', '2', '第二章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2017-03-22 14:16:29', '3', '第三章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2017-03-22 14:16:50', '4', '第四章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2017-03-22 14:17:09', '5', '第五章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2017-03-22 14:17:36', '6', '第六章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2017-03-22 14:17:56', '7', '第七章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2017-03-22 14:18:11', '8', '第八章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2017-03-22 14:18:30', '9', '第九章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2017-03-22 14:18:52', '10', '第十章', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2017-03-23 07:24:08', '1', 'Comment by zam on 第十章', '2', '[{\"changed\": {\"fields\": [\"active\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2017-03-23 07:24:34', '2', 'Comment by zam on 第十章', '2', '[{\"changed\": {\"fields\": [\"active\"]}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2017-03-23 07:41:20', '10', '第十章', '2', '[{\"changed\": {\"fields\": [\"body\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2017-03-23 08:06:24', '10', '第十章', '2', '[{\"changed\": {\"fields\": [\"tags\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2017-03-23 08:08:17', '10', '第十章', '2', '[{\"changed\": {\"fields\": [\"tags\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2017-03-23 08:10:24', '10', '第十章', '2', '[{\"changed\": {\"fields\": [\"tags\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2017-03-23 08:12:39', '10', '第十章', '2', '[{\"changed\": {\"fields\": [\"tags\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2017-03-24 06:13:00', '3', '第三章', '2', '[{\"changed\": {\"fields\": [\"tags\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2017-03-24 06:13:13', '4', '第四章', '2', '[{\"changed\": {\"fields\": [\"tags\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2017-03-24 06:13:18', '5', '第五章', '2', '[{\"changed\": {\"fields\": [\"tags\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2017-03-24 06:13:22', '8', '第八章', '2', '[{\"changed\": {\"fields\": [\"tags\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2017-03-24 06:14:07', '10', '第十章', '2', '[{\"changed\": {\"fields\": [\"tags\"]}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2017-03-24 08:46:13', '1', 'Server object', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2017-03-24 09:18:18', '1', 'Server object', '2', '[]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2017-03-24 09:25:07', '2', 'Server object', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2017-03-24 09:31:53', '1', '1号服务器', '2', '[{\"changed\": {\"fields\": [\"name\"]}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2017-03-24 09:32:16', '1', 'Ftp object', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2017-03-28 05:59:19', '2', '4号服务器', '3', '', '12', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2017-03-28 05:59:22', '1', '1号服务器', '3', '', '12', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2017-03-28 05:59:57', '3', '二号服务器', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2017-03-28 06:01:16', '4', '三号服务器', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2017-03-28 06:10:14', '5', '一号服务器', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2017-03-28 06:11:33', '5', '一号服务器', '2', '[{\"changed\": {\"fields\": [\"system\"]}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2017-03-28 06:13:27', '6', '四号服务器', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2017-03-28 06:13:46', '7', '五号服务器', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2017-03-28 06:14:07', '8', '六号服务器', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2017-03-28 06:14:33', '9', '七号服务器', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2017-03-28 06:16:22', '2', 'Ftp object', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2017-03-28 06:17:43', '3', 'Ftp object', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2017-03-28 06:38:35', '2', 'Ftp object', '2', '[{\"changed\": {\"fields\": [\"active\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2017-03-28 09:49:13', '2', 'Ftp object', '2', '[{\"changed\": {\"fields\": [\"active\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2017-03-28 10:03:59', '4', 'Ftp object', '1', '[{\"added\": {}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2017-03-28 10:05:51', '4', 'Ftp object', '2', '[{\"changed\": {\"fields\": [\"server\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2017-03-28 10:10:40', '2', 'Ftp object', '2', '[{\"changed\": {\"fields\": [\"server\"]}}]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2017-03-28 10:10:51', '2', 'Ftp object', '2', '[]', '13', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2017-03-28 10:10:57', '2', 'Ftp object', '2', '[{\"changed\": {\"fields\": [\"server\"]}}]', '13', '1');

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('9', 'blog', 'comment');
INSERT INTO `django_content_type` VALUES ('8', 'blog', 'post');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('13', 'stcmsftp', 'ftp');
INSERT INTO `django_content_type` VALUES ('12', 'stcmsftp', 'server');
INSERT INTO `django_content_type` VALUES ('11', 'taggit', 'tag');
INSERT INTO `django_content_type` VALUES ('10', 'taggit', 'taggeditem');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0008_alter_user_username_max_length', '2017-03-08 02:48:42');
INSERT INTO `django_migrations` VALUES ('13', 'sessions', '0001_initial', '2017-03-08 02:48:43');
INSERT INTO `django_migrations` VALUES ('14', 'stcmsftp', '0001_initial', '2017-03-08 02:48:43');
INSERT INTO `django_migrations` VALUES ('15', 'stcmsftp', '0002_auto_20170308_1109', '2017-03-08 03:09:40');
INSERT INTO `django_migrations` VALUES ('16', 'stcmsftp', '0003_ftpdb_severid', '2017-03-08 03:25:28');
INSERT INTO `django_migrations` VALUES ('17', 'stcmsftp', '0004_auto_20170308_1200', '2017-03-08 04:00:42');
INSERT INTO `django_migrations` VALUES ('18', 'blog', '0001_initial', '2017-03-14 03:16:39');
INSERT INTO `django_migrations` VALUES ('19', 'stcmsftp', '0005_auto_20170314_2206', '2017-03-20 14:02:04');
INSERT INTO `django_migrations` VALUES ('20', 'blog', '0002_comment', '2017-03-22 13:52:49');
INSERT INTO `django_migrations` VALUES ('21', 'taggit', '0001_initial', '2017-03-23 07:57:41');
INSERT INTO `django_migrations` VALUES ('22', 'taggit', '0002_auto_20150616_2121', '2017-03-23 07:57:41');
INSERT INTO `django_migrations` VALUES ('23', 'blog', '0003_post_tags', '2017-03-23 07:57:41');
INSERT INTO `django_migrations` VALUES ('24', 'stcmsftp', '0006_server', '2017-03-24 08:26:48');
INSERT INTO `django_migrations` VALUES ('25', 'stcmsftp', '0007_remove_server_publish', '2017-03-24 08:56:47');
INSERT INTO `django_migrations` VALUES ('26', 'stcmsftp', '0008_auto_20170324_1715', '2017-03-24 09:16:00');
INSERT INTO `django_migrations` VALUES ('27', 'stcmsftp', '0009_auto_20170324_1725', '2017-03-24 09:26:08');
INSERT INTO `django_migrations` VALUES ('28', 'stcmsftp', '0010_auto_20170324_1726', '2017-03-24 09:26:08');
INSERT INTO `django_migrations` VALUES ('29', 'stcmsftp', '0011_auto_20170324_1726', '2017-03-24 09:26:26');
INSERT INTO `django_migrations` VALUES ('30', 'stcmsftp', '0012_auto_20170324_1728', '2017-03-24 09:28:16');
INSERT INTO `django_migrations` VALUES ('31', 'stcmsftp', '0013_auto_20170328_1358', '2017-03-28 05:58:25');
INSERT INTO `django_migrations` VALUES ('32', 'stcmsftp', '0014_auto_20170328_1410', '2017-03-28 06:10:32');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0e6dfogio0ykizaezcemo9yqi0w3kfnf', 'N2RhYmFmNWI5Y2RlOTE5Y2Y0YmM2NThjMzlmMmYzNzRjMjI5NTM3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYmZlYjQ2MmMxMTNjZTU1YmM1ZGRmMjRjZGFjYTIwMTFjNDUxNGUwIn0=', '2017-04-03 13:26:21');
INSERT INTO `django_session` VALUES ('1mah201sfv4ej3pbv89zx3mzdstuhevn', 'N2RhYmFmNWI5Y2RlOTE5Y2Y0YmM2NThjMzlmMmYzNzRjMjI5NTM3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYmZlYjQ2MmMxMTNjZTU1YmM1ZGRmMjRjZGFjYTIwMTFjNDUxNGUwIn0=', '2017-03-23 01:55:59');
INSERT INTO `django_session` VALUES ('alsn54ju13n1cjnwdkv7cwy8f62vz0x9', 'N2RhYmFmNWI5Y2RlOTE5Y2Y0YmM2NThjMzlmMmYzNzRjMjI5NTM3ZTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiYmZlYjQ2MmMxMTNjZTU1YmM1ZGRmMjRjZGFjYTIwMTFjNDUxNGUwIn0=', '2017-04-06 02:08:47');

-- ----------------------------
-- Table structure for `stcmsftp_ftp`
-- ----------------------------
DROP TABLE IF EXISTS `stcmsftp_ftp`;
CREATE TABLE `stcmsftp_ftp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmpurl` varchar(250) NOT NULL,
  `formalurl` varchar(250) NOT NULL,
  `account` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `bindurl` varchar(250) NOT NULL,
  `remark` longtext NOT NULL,
  `active` tinyint(1) NOT NULL,
  `server_id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stcmsftp_ftp_server_id_f65381e5_fk_stcmsftp_server_id` (`server_id`),
  CONSTRAINT `stcmsftp_ftp_server_id_f65381e5_fk_stcmsftp_server_id` FOREIGN KEY (`server_id`) REFERENCES `stcmsftp_server` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stcmsftp_ftp
-- ----------------------------
INSERT INTO `stcmsftp_ftp` VALUES ('2', 'www.beesit.cn', 'www.beesit.cn', 'beesit_cn', 'beesit_cn', 'www.beesit.cn', '测试', '1', '8', '2017-03-28 06:16:22.094775', '2017-03-28 10:10:56.953344');
INSERT INTO `stcmsftp_ftp` VALUES ('3', 'www.woyaoqulvyou.com.cn', 'www.woyaoqulvyou.com.cn', 'woyaoqulvyou', 'woyaoqulvyou', 'www.woyaoqulvyou.com.cn', 'www.woyaoqulvyou.com.cn', '1', '3', '2017-03-28 06:17:42.849000', '2017-03-28 06:17:42.849000');
INSERT INTO `stcmsftp_ftp` VALUES ('4', '123213', '412412', '421421', '4124', '124124', '124', '1', '3', '2017-03-28 10:03:59.253453', '2017-03-28 10:05:51.113851');

-- ----------------------------
-- Table structure for `stcmsftp_server`
-- ----------------------------
DROP TABLE IF EXISTS `stcmsftp_server`;
CREATE TABLE `stcmsftp_server` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `system` varchar(10) NOT NULL,
  `name` varchar(250) NOT NULL,
  `number` varchar(250) NOT NULL,
  `ipaddr` varchar(250) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `cname` varchar(250),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stcmsftp_server
-- ----------------------------
INSERT INTO `stcmsftp_server` VALUES ('3', 'linux', '二号服务器', '2', '114.80.67.242', '2017-03-28 05:59:57.395192', '2017-03-28 05:59:57.395192', '1', 'srv2.souxw.com');
INSERT INTO `stcmsftp_server` VALUES ('4', 'linux', '三号服务器', '3', '114.80.67.210', '2017-03-28 06:01:15.621064', '2017-03-28 06:01:15.621064', '1', 'srv3.souxw.com');
INSERT INTO `stcmsftp_server` VALUES ('5', 'windows', '一号服务器', '1', '180.153.98.43', '2017-03-28 06:10:14.314650', '2017-03-28 06:11:32.821789', '1', 'srv1.souxw.com');
INSERT INTO `stcmsftp_server` VALUES ('6', 'linux', '四号服务器', '4', '114.80.67.243', '2017-03-28 06:13:27.228982', '2017-03-28 06:13:27.228982', '1', 'srv4.souxw.com');
INSERT INTO `stcmsftp_server` VALUES ('7', 'linux', '五号服务器', '5', '114.80.67.241', '2017-03-28 06:13:46.091989', '2017-03-28 06:13:46.091989', '1', 'srv5.souxw.com');
INSERT INTO `stcmsftp_server` VALUES ('8', 'linux', '六号服务器', '6', '114.80.67.4', '2017-03-28 06:14:07.458958', '2017-03-28 06:14:07.458958', '1', 'srv6.souxw.com');
INSERT INTO `stcmsftp_server` VALUES ('9', 'linux', '七号服务器', '7', '114.80.67.245', '2017-03-28 06:14:32.626622', '2017-03-28 06:14:32.626622', '1', 'srv7.souxw.com');

-- ----------------------------
-- Table structure for `taggit_tag`
-- ----------------------------
DROP TABLE IF EXISTS `taggit_tag`;
CREATE TABLE `taggit_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taggit_tag
-- ----------------------------
INSERT INTO `taggit_tag` VALUES ('1', 'jazz', 'jazz');
INSERT INTO `taggit_tag` VALUES ('2', 'music', 'music');
INSERT INTO `taggit_tag` VALUES ('3', 'django', 'django');
INSERT INTO `taggit_tag` VALUES ('4', 'food', 'food');
INSERT INTO `taggit_tag` VALUES ('5', 'history', 'history');
INSERT INTO `taggit_tag` VALUES ('6', 'milk', 'milk');

-- ----------------------------
-- Table structure for `taggit_taggeditem`
-- ----------------------------
DROP TABLE IF EXISTS `taggit_taggeditem`;
CREATE TABLE `taggit_taggeditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_af31437c` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_196cc965_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_tagged_content_type_id_9957a03c_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of taggit_taggeditem
-- ----------------------------
INSERT INTO `taggit_taggeditem` VALUES ('1', '1', '8', '1');
INSERT INTO `taggit_taggeditem` VALUES ('2', '1', '8', '2');
INSERT INTO `taggit_taggeditem` VALUES ('3', '1', '8', '3');
INSERT INTO `taggit_taggeditem` VALUES ('5', '10', '8', '1');
INSERT INTO `taggit_taggeditem` VALUES ('6', '10', '8', '2');
INSERT INTO `taggit_taggeditem` VALUES ('7', '10', '8', '5');
INSERT INTO `taggit_taggeditem` VALUES ('8', '3', '8', '1');
INSERT INTO `taggit_taggeditem` VALUES ('9', '3', '8', '2');
INSERT INTO `taggit_taggeditem` VALUES ('10', '3', '8', '3');
INSERT INTO `taggit_taggeditem` VALUES ('11', '4', '8', '1');
INSERT INTO `taggit_taggeditem` VALUES ('12', '4', '8', '3');
INSERT INTO `taggit_taggeditem` VALUES ('13', '4', '8', '6');
INSERT INTO `taggit_taggeditem` VALUES ('14', '5', '8', '1');
INSERT INTO `taggit_taggeditem` VALUES ('15', '5', '8', '3');
INSERT INTO `taggit_taggeditem` VALUES ('16', '5', '8', '6');
INSERT INTO `taggit_taggeditem` VALUES ('17', '8', '8', '1');
INSERT INTO `taggit_taggeditem` VALUES ('18', '8', '8', '6');
INSERT INTO `taggit_taggeditem` VALUES ('19', '10', '8', '4');
