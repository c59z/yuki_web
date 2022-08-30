/*
SQLyog Ultimate v10.00 Beta1
MySQL - 8.0.29 : Database - yuki_web
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yuki_web` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `yuki_web`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add article model',7,'add_articlemodel'),(26,'Can change article model',7,'change_articlemodel'),(27,'Can delete article model',7,'delete_articlemodel'),(28,'Can view article model',7,'view_articlemodel'),(29,'Can add tag',8,'add_tag'),(30,'Can change tag',8,'change_tag'),(31,'Can delete tag',8,'delete_tag'),(32,'Can view tag',8,'view_tag'),(33,'Can add tagged item',9,'add_taggeditem'),(34,'Can change tagged item',9,'change_taggeditem'),(35,'Can delete tagged item',9,'delete_taggeditem'),(36,'Can view tagged item',9,'view_taggeditem'),(37,'Can add diary model',10,'add_diarymodel'),(38,'Can change diary model',10,'change_diarymodel'),(39,'Can delete diary model',10,'delete_diarymodel'),(40,'Can view diary model',10,'view_diarymodel'),(41,'Can add read me model',11,'add_readmemodel'),(42,'Can change read me model',11,'change_readmemodel'),(43,'Can delete read me model',11,'delete_readmemodel'),(44,'Can view read me model',11,'view_readmemodel');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values (1,'pbkdf2_sha256$320000$YUEEHWfHUCHUHCxGUNKP1q$Uz7nGOlT5MEdMlATQvvkOhEwNenV/VNBk+OF2LBGTFk=','2022-07-11 00:58:19.807156',1,'yuki','','','1654911578@qq.com',1,1,'2022-05-08 10:40:18.622462');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb3;

/*Data for the table `django_admin_log` */

insert  into `django_admin_log`(`id`,`action_time`,`object_id`,`object_repr`,`action_flag`,`change_message`,`content_type_id`,`user_id`) values (1,'2022-05-08 10:50:56.817915','1','本站的第一篇文章',1,'[{\"added\": {}}]',7,1),(2,'2022-05-08 11:12:47.674514','1','本站的第一篇文章',2,'[{\"changed\": {\"fields\": [\"Subtitle\", \"Text\"]}}]',7,1),(3,'2022-05-08 11:58:00.224260','2','本站的第二篇文章',1,'[{\"added\": {}}]',7,1),(4,'2022-05-09 11:34:31.884288','3','markdown语法测试',1,'[{\"added\": {}}]',7,1),(5,'2022-05-09 11:39:27.298939','3','markdown语法测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(6,'2022-05-09 11:45:21.980217','3','markdown语法测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(7,'2022-05-09 11:46:15.070105','3','markdown语法测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(8,'2022-05-09 11:46:58.773839','3','markdown语法测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(9,'2022-05-09 12:29:58.589268','4','test4',1,'[{\"added\": {}}]',7,1),(10,'2022-05-09 12:30:17.888973','5','test5',1,'[{\"added\": {}}]',7,1),(11,'2022-05-09 12:30:39.153892','6','test6',1,'[{\"added\": {}}]',7,1),(12,'2022-05-09 12:31:18.289977','5','test5',3,'',7,1),(13,'2022-05-12 12:13:18.685282','7','django后台图片上传测试',1,'[{\"added\": {}}]',7,1),(14,'2022-05-12 12:18:06.496663','8','django上传图片测试其二',1,'[{\"added\": {}}]',7,1),(15,'2022-05-12 12:20:36.648246','9','django测试上传图片其三',1,'[{\"added\": {}}]',7,1),(16,'2022-05-12 12:22:03.613654','9','django测试上传图片其三',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(17,'2022-05-12 12:23:11.615183','9','django测试上传图片其三',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(18,'2022-05-12 12:31:46.706009','9','django测试上传图片其三',2,'[{\"changed\": {\"fields\": [\"Subtitle\"]}}]',7,1),(19,'2022-05-15 10:14:50.662832','9','django测试上传图片其三',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(20,'2022-05-15 10:18:04.668504','9','django测试上传图片其三',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(21,'2022-05-15 10:18:35.736222','9','django测试上传图片其三',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(22,'2022-05-15 11:10:18.313894','10','远程图床传图测试',1,'[{\"added\": {}}]',7,1),(23,'2022-05-16 11:21:02.642662','1','python',1,'[{\"added\": {}}]',8,1),(24,'2022-05-16 11:21:14.462800','2','Django',1,'[{\"added\": {}}]',8,1),(25,'2022-05-16 11:21:22.625615','1','Python',2,'[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]',8,1),(26,'2022-05-16 11:21:33.772638','3','test',1,'[{\"added\": {}}]',8,1),(27,'2022-05-16 11:21:47.542523','10','远程图床传图测试',2,'[{\"changed\": {\"fields\": [\"Tags\"]}}]',7,1),(28,'2022-05-19 10:18:05.718050','11','ReadMe测试',1,'[{\"added\": {}}]',7,1),(29,'2022-05-19 10:26:37.716367','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(30,'2022-05-19 10:27:21.720690','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(31,'2022-05-19 10:30:55.581674','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(32,'2022-05-19 10:31:43.681775','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(33,'2022-05-19 10:33:17.383248','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(34,'2022-05-19 10:34:32.679362','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(35,'2022-05-19 10:35:34.837851','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(36,'2022-05-19 10:38:01.455365','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(37,'2022-05-19 10:44:21.802553','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(38,'2022-05-19 10:45:36.241826','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(39,'2022-05-19 10:46:16.863915','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(40,'2022-05-19 10:46:48.419891','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(41,'2022-05-19 10:47:45.522718','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(42,'2022-05-19 10:48:39.809017','11','ReadMe测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(43,'2022-05-19 11:04:09.740316','11','ReadMe测试',3,'',7,1),(44,'2022-05-20 11:07:13.144409','1','日记测试',1,'[{\"added\": {}}]',10,1),(45,'2022-05-20 11:33:34.098143','1','日记测试',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,1),(46,'2022-05-22 08:59:59.700120','1','日记测试',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,1),(47,'2022-05-22 09:23:46.882600','2','第二篇测试日记',1,'[{\"added\": {}}]',10,1),(48,'2022-05-22 09:48:39.511769','1','日记测试',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,1),(49,'2022-05-23 12:13:03.918976','3','第三篇日记测试',1,'[{\"added\": {}}]',10,1),(50,'2022-05-25 12:02:44.922548','12','图片布局测试',1,'[{\"added\": {}}]',7,1),(51,'2022-05-25 12:15:41.798417','12','图片布局测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(52,'2022-05-25 12:16:50.605343','10','远程图床传图测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(53,'2022-05-25 12:21:50.773711','12','图片布局测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(54,'2022-05-25 12:22:36.943526','12','图片布局测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(55,'2022-05-27 04:25:04.917182','12','图片布局测试',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(56,'2022-05-27 13:23:02.183203','4','Mysql',1,'[{\"added\": {}}]',8,1),(57,'2022-05-27 13:24:33.580520','13','「Mysql」将Ubuntu中的Mysql数据库迁移',1,'[{\"added\": {}}]',7,1),(58,'2022-05-27 13:25:16.426806','13','「Mysql」将Ubuntu中的Mysql数据库迁移',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(59,'2022-05-27 13:28:56.089823','13','「Mysql」将Ubuntu中的Mysql数据库迁移',2,'[{\"changed\": {\"fields\": [\"Subtitle\"]}}]',7,1),(60,'2022-05-27 13:29:59.608809','13','「Mysql」将Ubuntu中的Mysql数据库迁移',2,'[{\"changed\": {\"fields\": [\"Subtitle\"]}}]',7,1),(61,'2022-05-27 13:30:26.772164','13','「Mysql」将Ubuntu中的Mysql数据库迁移',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(62,'2022-05-29 03:36:35.698273','4','图片缩放测试',1,'[{\"added\": {}}]',10,1),(63,'2022-05-29 03:38:17.059945','3','第三篇日记测试',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,1),(64,'2022-05-29 03:38:58.186293','2','第二篇测试日记',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,1),(65,'2022-05-29 03:39:09.240968','1','日记测试',2,'[{\"changed\": {\"fields\": [\"Image\"]}}]',10,1),(66,'2022-05-29 03:48:46.522895','1','日记测试',2,'[{\"changed\": {\"fields\": [\"Image\", \"Image thumbnail\"]}}]',10,1),(67,'2022-05-29 03:49:07.188653','3','第三篇日记测试',2,'[{\"changed\": {\"fields\": [\"Image\", \"Image thumbnail\"]}}]',10,1),(68,'2022-05-29 03:49:20.604245','2','第二篇测试日记',2,'[{\"changed\": {\"fields\": [\"Image\", \"Image thumbnail\"]}}]',10,1),(69,'2022-05-29 03:49:25.572593','1','日记测试',2,'[{\"changed\": {\"fields\": [\"Image\", \"Image thumbnail\"]}}]',10,1),(70,'2022-05-29 03:49:37.480099','1','日记测试',2,'[{\"changed\": {\"fields\": [\"Image\", \"Image thumbnail\"]}}]',10,1),(71,'2022-05-29 03:51:42.498336','4','图片缩放测试',2,'[{\"changed\": {\"fields\": [\"Image thumbnail\"]}}]',10,1),(72,'2022-05-29 11:55:57.920041','1','ReadMe',1,'[{\"added\": {}}]',11,1),(73,'2022-05-29 12:01:37.541411','1','ReadMe',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',11,1),(74,'2022-06-02 11:52:32.119832','13','「Mysql」将Ubuntu中的Mysql数据库迁移',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(75,'2022-06-02 12:40:50.999063','14','python虚拟环境迁移',1,'[{\"added\": {}}]',7,1),(76,'2022-06-03 10:20:23.183926','14','python虚拟环境迁移',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(77,'2022-06-03 10:22:08.305251','5','scrapy',1,'[{\"added\": {}}]',8,1),(78,'2022-06-03 10:23:29.635186','15','scrapy爬取B站指定视频的所有弹幕并保存到txt或mongodb',1,'[{\"added\": {}}]',7,1),(79,'2022-06-03 10:24:39.967933','15','scrapy爬取B站指定视频的所有弹幕并保存到txt或mongodb',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(80,'2022-06-05 12:44:40.935864','15','scrapy爬取B站指定视频的所有弹幕并保存到txt或mongodb',2,'[{\"changed\": {\"fields\": [\"Text\"]}}]',7,1),(81,'2022-06-07 11:18:32.909874','3','test',3,'',8,1),(82,'2022-07-11 01:11:54.140556','5','云服务存储测试',1,'[{\"added\": {}}]',10,1),(83,'2022-07-11 01:12:21.690906','5','云服务存储测试',2,'[{\"changed\": {\"fields\": [\"Image\", \"Image thumbnail\"]}}]',10,1);

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session'),(8,'taggit','tag'),(9,'taggit','taggeditem'),(7,'web','articlemodel'),(10,'web','diarymodel'),(11,'web','readmemodel');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb3;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2022-05-08 10:32:22.523771'),(2,'auth','0001_initial','2022-05-08 10:32:23.037052'),(3,'admin','0001_initial','2022-05-08 10:32:23.147757'),(4,'admin','0002_logentry_remove_auto_add','2022-05-08 10:32:23.156734'),(5,'admin','0003_logentry_add_action_flag_choices','2022-05-08 10:32:23.168702'),(6,'contenttypes','0002_remove_content_type_name','2022-05-08 10:32:23.245496'),(7,'auth','0002_alter_permission_name_max_length','2022-05-08 10:32:23.298355'),(8,'auth','0003_alter_user_email_max_length','2022-05-08 10:32:23.355204'),(9,'auth','0004_alter_user_username_opts','2022-05-08 10:32:23.365176'),(10,'auth','0005_alter_user_last_login_null','2022-05-08 10:32:23.429034'),(11,'auth','0006_require_contenttypes_0002','2022-05-08 10:32:23.433013'),(12,'auth','0007_alter_validators_add_error_messages','2022-05-08 10:32:23.440979'),(13,'auth','0008_alter_user_username_max_length','2022-05-08 10:32:23.492835'),(14,'auth','0009_alter_user_last_name_max_length','2022-05-08 10:32:23.533746'),(15,'auth','0010_alter_group_name_max_length','2022-05-08 10:32:23.576612'),(16,'auth','0011_update_proxy_permissions','2022-05-08 10:32:23.588580'),(17,'auth','0012_alter_user_first_name_max_length','2022-05-08 10:32:23.645989'),(18,'sessions','0001_initial','2022-05-08 10:32:23.680896'),(19,'web','0001_initial','2022-05-08 10:32:23.755713'),(20,'web','0002_alter_articlemodel_table','2022-05-08 10:34:12.900069'),(21,'web','0003_articlemodel_subtitle','2022-05-08 11:10:50.913438'),(22,'web','0004_articlemodel_pageviews','2022-05-10 11:31:25.872220'),(23,'web','0005_alter_articlemodel_text','2022-05-15 10:10:28.349128'),(24,'web','0006_alter_articlemodel_text','2022-05-15 10:17:44.494584'),(25,'taggit','0001_initial','2022-05-16 11:18:11.225990'),(26,'taggit','0002_auto_20150616_2121','2022-05-16 11:18:11.240984'),(27,'taggit','0003_taggeditem_add_unique_index','2022-05-16 11:18:11.264969'),(28,'taggit','0004_alter_taggeditem_content_type_alter_taggeditem_tag','2022-05-16 11:18:11.289953'),(29,'taggit','0005_auto_20220424_2025','2022-05-16 11:18:11.297949'),(30,'web','0007_articlemodel_tags','2022-05-16 11:18:11.310942'),(31,'web','0008_diarymodel','2022-05-20 10:37:33.376548'),(32,'web','0009_alter_diarymodel_options_alter_diarymodel_table','2022-05-20 10:38:39.716118'),(33,'web','0010_alter_diarymodel_image','2022-05-20 10:55:56.314102'),(34,'web','0011_remove_diarymodel_tags','2022-05-20 11:02:48.085931'),(35,'web','0012_alter_diarymodel_image','2022-05-20 11:32:36.717921'),(36,'web','0013_alter_diarymodel_image','2022-05-29 03:16:07.262223'),(37,'web','0014_diarymodel_image_thumbnail_alter_diarymodel_image','2022-05-29 03:47:48.096665'),(38,'web','0015_readmemodel','2022-05-29 11:44:41.732601');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values ('75tiw83g3kg325wszcddrh65jrwk20ua','.eJxVjDsOwyAQBe9CHaHl47VJmd5nQLALwUmEJWNXUe4eIblI2jcz7y18OPbij5Y2v7C4CiUuv1sM9Ey1A36Eel8lrXXflii7Ik_a5Lxyet1O9--ghFZ6DZGRnQlghmyUmrLTTJkmgkxmhOQ0ZotgKVi0EWBkCwnRYh5YsxKfL-uEN8Y:1np7NZ:lQ-nN-e4bEDJGniVc9PcEfiUNAJ_tRVl4v6ANRvHVMA','2022-05-26 11:53:13.617677'),('773y1jzmz3zxfdkof865pcp00l7e1mcg','.eJxVjDsOwyAQBe9CHaHl47VJmd5nQLALwUmEJWNXUe4eIblI2jcz7y18OPbij5Y2v7C4CiUuv1sM9Ey1A36Eel8lrXXflii7Ik_a5Lxyet1O9--ghFZ6DZGRnQlghmyUmrLTTJkmgkxmhOQ0ZotgKVi0EWBkCwnRYh5YsxKfL-uEN8Y:1oAhkh:rbDpJ3UnDSoxwbY4CpRw7RG5SKdHvXaXEAujWyX2O4w','2022-07-25 00:58:19.813650'),('98zai4qrm3drambbgvr29ux4tmart0xw','.eJxVjDsOwyAQBe9CHaHl47VJmd5nQLALwUmEJWNXUe4eIblI2jcz7y18OPbij5Y2v7C4CiUuv1sM9Ey1A36Eel8lrXXflii7Ik_a5Lxyet1O9--ghFZ6DZGRnQlghmyUmrLTTJkmgkxmhOQ0ZotgKVi0EWBkCwnRYh5YsxKfL-uEN8Y:1nuRVf:w4BoFT7bdtycTwdQG7N1gI3MFPvIurdAbtokCo0HeB4','2022-06-10 04:23:35.768241'),('vudoer1kbb70j2s3qn9jouiosc5thipd','.eJxVjDsOwyAQBe9CHaHl47VJmd5nQLALwUmEJWNXUe4eIblI2jcz7y18OPbij5Y2v7C4CiUuv1sM9Ey1A36Eel8lrXXflii7Ik_a5Lxyet1O9--ghFZ6DZGRnQlghmyUmrLTTJkmgkxmhOQ0ZotgKVi0EWBkCwnRYh5YsxKfL-uEN8Y:1npSV6:UBct43bXh5sXjjLlWt7m1Yiw6-tYVPDIFGUACbi7MEI','2022-05-27 10:26:24.176346');

/*Table structure for table `taggit_tag` */

DROP TABLE IF EXISTS `taggit_tag`;

CREATE TABLE `taggit_tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

/*Data for the table `taggit_tag` */

insert  into `taggit_tag`(`id`,`name`,`slug`) values (1,'Python','Python'),(2,'Django','django'),(4,'Mysql','mysql'),(5,'scrapy','scrapy');

/*Table structure for table `taggit_taggeditem` */

DROP TABLE IF EXISTS `taggit_taggeditem`;

CREATE TABLE `taggit_taggeditem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int NOT NULL,
  `content_type_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggit_taggeditem_content_type_id_object_id_tag_id_4bb97a8e_uniq` (`content_type_id`,`object_id`,`tag_id`),
  KEY `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` (`tag_id`),
  KEY `taggit_taggeditem_object_id_e2d7d1df` (`object_id`),
  KEY `taggit_taggeditem_content_type_id_object_id_196cc965_idx` (`content_type_id`,`object_id`),
  CONSTRAINT `taggit_taggeditem_content_type_id_9957a03c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `taggit_tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

/*Data for the table `taggit_taggeditem` */

insert  into `taggit_taggeditem`(`id`,`object_id`,`content_type_id`,`tag_id`) values (1,10,7,2),(4,13,7,4),(5,14,7,1),(6,15,7,1),(7,15,7,5);

/*Table structure for table `yuki_diary` */

DROP TABLE IF EXISTS `yuki_diary`;

CREATE TABLE `yuki_diary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `subtitle` varchar(1024) NOT NULL,
  `image` varchar(100) NOT NULL,
  `text` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `image_thumbnail` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_diarymodel_author_id_d387027d_fk_auth_user_id` (`author_id`),
  CONSTRAINT `web_diarymodel_author_id_d387027d_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

/*Data for the table `yuki_diary` */

insert  into `yuki_diary`(`id`,`title`,`subtitle`,`image`,`text`,`created`,`updated`,`author_id`,`image_thumbnail`) values (1,'日记测试','模板别炸，求你了','static/diary_img/202205/20220529/44873217_p0_8PO1c48.jpg','### 2022年5月20日\r\n\r\nanmi老师yyds','2022-05-20 11:05:00.000000','2022-05-29 03:49:37.478165',1,'static/diary_img/202205/20220529/thumbnail/44873217_p0_w2NOCZe.jpg'),(2,'第二篇测试日记','佛祖保佑我别炸了','static/diary_img/202205/20220529/63754669_p0.png','winwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwinwin','2022-05-22 09:22:00.000000','2022-05-29 03:49:20.601378',1,'static/diary_img/202205/20220529/thumbnail/63754669_p0.jpg'),(3,'第三篇日记测试','哼哼，哼啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊','static/diary_img/202205/20220529/IMG_068520211224-075638_RQoq4aw.JPG','# 测试测试测试测试\r\n## 测试测试测试测试\r\n### 测试测试测试测试\r\n#### 测试测试测试测试\r\n##### 测试测试测试测试','2022-05-23 11:47:00.000000','2022-05-29 03:49:07.186575',1,'static/diary_img/202205/20220529/thumbnail/IMG_068520211224-075638.JPG'),(4,'图片缩放测试','佛祖保我，没有bug','static/diary_img/202205/20220529/51842023_p0.jpg','### 扣1送地狱火','2022-05-29 03:35:00.000000','2022-05-29 03:51:42.497407',1,'static/diary_img/202205/20220529/thumbnail/51842023_p0.jpg'),(5,'云服务存储测试','好久没上传了，我账号怎么被删了[流汗黄豆.jpg]','static/diary_img/202207/20220711/76081770_p0.jpg','### 这里是远程图床测试\r\n\r\n#### pid:62406788\r\n![LOwwd.png](https://s1.328888.xyz/2022/07/11/LOwwd.png)\r\n#### pid:63754669\r\n![LOG8U.png](https://s1.328888.xyz/2022/07/11/LOG8U.png)\r\n#### pid:65897535\r\n![LOCRB.jpg](https://s1.328888.xyz/2022/07/11/LOCRB.jpg)\r\n#### pid:70060680\r\n![LOk6R.png](https://s1.328888.xyz/2022/07/11/LOk6R.png)\r\n#### pid:76081770\r\n![LO1VP.jpg](https://s1.328888.xyz/2022/07/11/LO1VP.jpg)','2022-07-11 00:58:00.000000','2022-07-11 01:12:21.688908',1,'static/diary_img/202207/20220711/thumbnail/76081770_p0.jpg');

/*Table structure for table `yuki_readme` */

DROP TABLE IF EXISTS `yuki_readme`;

CREATE TABLE `yuki_readme` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `image` varchar(100) NOT NULL,
  `text` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `yuki_ReadMe_author_id_aa7faea9_fk_auth_user_id` (`author_id`),
  CONSTRAINT `yuki_ReadMe_author_id_aa7faea9_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

/*Data for the table `yuki_readme` */

insert  into `yuki_readme`(`id`,`title`,`image`,`text`,`created`,`updated`,`author_id`) values (1,'ReadMe','','### 关于站长\r\n(｡･∀･)ﾉﾞ嗨呀~你好,我是初雪,目前是一个平凡的大一新生\r\n编程方面比较擅长Python和Java,前端苦手,正在自学日语,7月去考n2\r\n### 关于本站\r\n本站于2022年5月由一个高三的学生创作，目的是为了学习前后端的交互。\r\n本站后端采用了Django,前端使用了bootstrap。\r\n因为初出茅庐,经验稀少,网站可能会发生意想不到的bug（不过我自己测试倒是没问题） 还请见谅。\r\n\r\n虽说人生只有一次无论做出哪个选择都会后悔，但即便如此我还是想坚持做自己喜欢的事情,通过这个网站来分享一下微薄的经验\r\n\r\n我在这里,正是因为我还有没做完的事情在等着我\r\n\r\n### 联系我\r\n- 我的QQ邮箱:1654911578@qq.com\r\n- 我的网站:(现在还没有域名呜呜呜)','2022-05-29 11:55:00.000000','2022-05-29 12:01:37.538411',1);

/*Table structure for table `yuki_web` */

DROP TABLE IF EXISTS `yuki_web`;

CREATE TABLE `yuki_web` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `text` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `author_id` int NOT NULL,
  `subtitle` varchar(1024) NOT NULL,
  `pageviews` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_articlemodel_author_id_39d4428e_fk_auth_user_id` (`author_id`),
  CONSTRAINT `web_articlemodel_author_id_39d4428e_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `yuki_web_chk_1` CHECK ((`pageviews` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3;

/*Data for the table `yuki_web` */

insert  into `yuki_web`(`id`,`title`,`text`,`created`,`updated`,`author_id`,`subtitle`,`pageviews`) values (1,'本站的第一篇文章','啦啦啦这里是正文~~~\r\n\r\n贵安，本篇文章是本站在创建时所创建的第一篇文章~\r\n仅供测试，学习，没有别的意思~','2022-05-08 10:46:00.000000','2022-05-08 11:12:47.672546',1,'贵安，本篇文章是本站在创建时所创建的第一篇文章~ 仅供测试，学习，没有别的意思~',0),(2,'本站的第二篇文章','测试文本2333','2022-05-08 11:56:00.000000','2022-05-08 11:58:00.223261',1,'贵安，这是第二篇文章desu~',0),(3,'markdown语法测试','# 一级标题\r\n## 二级标题\r\n### 三级标题\r\n#### 四级标题\r\n##### 五级标题\r\n###### 六级标题\r\n\r\n\r\n- 列表1\r\n- 2\r\n- 3\r\n\r\n---\r\n+ 列表一\r\n+ 列表二\r\n    + 列表二-1\r\n    + 列表二-2\r\n---\r\n\r\n\r\n\r\n```python\r\nprint(\"你好，世界\")\r\n```\r\n\r\n```json\r\n{\r\n  \"test1\": \"本子昊\",\r\n  \"test2\": \"牛逼\",\r\n}\r\n```','2022-05-09 11:34:00.000000','2022-05-09 11:46:58.771844',1,'这是第一次使用markdown编写文章~',0),(4,'test4','# 标题','2022-05-09 12:29:00.000000','2022-05-09 12:29:58.584875',1,'test4',0),(6,'test6','```python\r\nimport pymysql\r\n```','2022-05-09 12:30:00.000000','2022-05-09 12:30:39.150899',1,'test6',0),(7,'django后台图片上传测试','### 这里是关于django后台上传图片的测试\r\n#### 写于2022年5月12日\r\n\r\n![anmi](/anmi.jpg)','2022-05-12 12:12:00.000000','2022-05-12 12:13:18.682262',1,'图片上传测试...',0),(8,'django上传图片测试其二','### 来い！\r\n#### 写于2022年5月12日\r\n\r\n![anmi]({% static \'/article_img/anmi.jpg\' %})','2022-05-12 12:14:00.000000','2022-05-12 12:18:06.493670',1,'很显然上一个文章失败了',0),(9,'django测试上传图片其三','### 这里是关于django后台上传图片的测试 \r\n#### 写于2022年5月12日 \r\n#### 来い！ \r\n![anmi](/static/article_img/anmi.jpg)','2022-05-12 12:19:00.000000','2022-05-15 10:18:35.734223',1,'anmi老师插画',0),(10,'远程图床传图测试','#### PixivID:89478080\r\n##### anmi老师yyds\r\n[![XkvR8x.jpg](https://s1.ax1x.com/2022/05/25/XkvR8x.jpg)](https://imgtu.com/i/XkvR8x)','2022-05-15 11:08:00.000000','2022-05-25 12:16:50.600345',1,'该文章中出现的图片，并未储存在服务器中',0),(12,'图片布局测试','### 不同图片的测试\r\n\r\n![57793944_p0.png](https://s2.loli.net/2022/05/25/63XDVxd5ZBNtSFG.png)\r\n\r\n![89478080.jpg](https://s2.loli.net/2022/05/15/NYV3RZxCQqE1t9b.jpg)\r\n\r\n![20985074_p0.jpg](https://s2.loli.net/2022/01/24/lYEGKZt5wxhUuzX.jpg)','2022-05-25 12:01:00.000000','2022-05-27 04:25:04.907019',1,'本文章主要测试图片与主体的布局',0),(13,'「Mysql」将Ubuntu中的Mysql数据库迁移','# 前言\r\n\r\n这几天更新了win11,更新之后vm很容易炸故将数据库迁移至物理机中\r\n注意:本篇文章为数据库迁移而并非数据表迁移\r\n\r\n### 1.查找mysql安装路径\r\n\r\n```\r\nwhereis mysql\r\n```\r\n![tAkJS.png](https://s1.328888.xyz/2022/05/27/tAkJS.png)\r\n\r\n### 2.如图,切换到第一个路径\r\n\r\n```\r\ncd /usr/bin/\r\n```\r\n\r\n### 3.查找 mysqldump 命令文件\r\n\r\n```\r\nfind ./ -name mysqldump\r\n```\r\n发现该目录下确实有这个命令文件\r\n\r\n### 4.使用命令导出数据库\r\n\r\n```\r\nmysqldump -u用户名 -p密码 -d 数据库名 > 数据库名.sql\r\n\r\n例子:\r\nmysqldump -u yuki -p yuki_web >/home/yuki/yuki_web.sql\r\n记得把生成的sql文件复制到物理机中\r\n\r\n```\r\n![tAOvA.png](https://s1.328888.xyz/2022/05/27/tAOvA.png)\r\n\r\n![tA11i.png](https://s1.328888.xyz/2022/05/27/tA11i.png)\r\n\r\n### 5.导入数据库\r\n在物理机中进入mysql,创建一个空数据库并设置utf-8编码\r\n\r\n```\r\ncreate database 数据库名 charset=utf8;\r\n例：\r\ncreate database yuki_web charset=utf8;\r\n```\r\n![tAnzR.png](https://s1.328888.xyz/2022/05/27/tAnzR.png)\r\n进入该数据库,导入sql文件即可\r\n```\r\nuse yuki_web\r\n\r\nsource D:/code/SQL/yuki_web.sql\r\n```\r\n![tAFev.png](https://s1.328888.xyz/2022/05/27/tAFev.png)','2022-05-27 13:23:00.000000','2022-06-02 11:52:32.115850',1,'这几天更新了win11,更新之后vm很容易炸故将数据库迁移至物理机中    注意:本篇文章为数据库迁移而并非数据表迁移',0),(14,'python虚拟环境迁移','# 前言\r\n\r\n我相信肯定有人直接把虚拟环境打个压缩包转移到新环境后各种报错..<br>\r\n方法分为无网络连接和有网络连接两种\r\n\r\n### 方法一:新电脑可以连接网络\r\n- 请先确认原电脑中python的版本,新电脑中的python版本需要与其一致\r\n\r\n```\r\npython -V\r\n```\r\n\r\n- 进入原电脑的虚拟环境,生成包列表,文件会在执行命令的当前路径下生成\r\n\r\n```\r\npip freeze > requirements.txt\r\n```\r\n![W9PDW.png](https://s1.328888.xyz/2022/06/02/W9PDW.png)\r\n\r\n- 进入新电脑,创建新的空白虚拟环境(python版本需要与旧电脑的python版本一致)\r\n\r\n```\r\n执行之后即可,记得把从旧电脑生成出来的文件拷到新电脑中\r\npip install -r requirements.txt\r\n```\r\n![W9x3y.png](https://s1.328888.xyz/2022/06/02/W9x3y.png)\r\n\r\n### 方法二:新电脑无法连接网络\r\n- 还是和方法一一样,请先确认python版本\r\n\r\n```\r\npython -V\r\n```\r\n\r\n- 进入原电脑的虚拟环境,先生成需要打包的列表再将文件下载<br>\r\n会自动生成一个名为\"offline_packages\"的文件夹不用担心\r\n\r\n```\r\npip freeze > requirements.txt\r\npip download -d offline_packages -r requirements.txt\r\n```\r\n![WJpRS.png](https://s1.328888.xyz/2022/06/02/WJpRS.png)\r\n\r\n- 进入新电脑,创建新的空白虚拟环境,记得把从旧电脑生成出来的文件和文件夹拷到新电脑中\r\n\r\n```\r\npip install --no-index --find-links=offline_packages -r requirements.txt\r\n```\r\n![WJCAA.png](https://s1.328888.xyz/2022/06/02/WJCAA.png)\r\n\r\n### 大功告成','2022-06-02 12:38:00.000000','2022-06-03 10:20:23.172512',1,'我相信肯定有人直接把虚拟环境打个压缩包转移到新环境后各种报错.. 方法分为无网络连接和有网络连接两种',0),(15,'scrapy爬取B站指定视频的所有弹幕并保存到txt或mongodb','# 前言\r\n\r\n以爬我自己视频下的弹幕为例\r\n\r\n### 思路\r\n- 接口:\"https://comment.bilibili.com/\" + cid + \".xml\"\r\n可以返回xml文件,之后用xpath提取\r\n\r\n![Wq7f2.png](https://s1.328888.xyz/2022/06/03/Wq7f2.png)\r\n\r\n- cid 通过在右键 检查源代码 搜索\"cid\"第一个就是,通过正则提取\r\n\r\n![WqCh4.png](https://s1.328888.xyz/2022/06/03/WqCh4.png)\r\n\r\n### items 文件中定义字段\r\n\r\n```py\r\nimport scrapy\r\n\r\n\r\nclass BilibiliItem(scrapy.Item):\r\n    # 弹幕字段,可以根据需求自由添加\r\n    text = scrapy.Field()\r\n\r\n```\r\n\r\n### bili.py 实现主要逻辑\r\n\r\n```py\r\nimport scrapy\r\nimport re\r\nfrom bilibili.items import BilibiliItem\r\n\r\n\r\nclass BiliSpider(scrapy.Spider):\r\n    name = \'bili\'\r\n    allowed_domains = [\'bilibili.com\']\r\n    # 这里是起始url,可以根据需求自行改进\r\n    start_urls = [\'https://www.bilibili.com/video/BV164411u7WB\']\r\n\r\n    def parse(self, response):\r\n        # 从相应中获取cid\r\n        cid = re.findall(r\'\"cid\":(\\d+),\"dimension\"\', response.text)[0]\r\n        danmu_url = \"https://comment.bilibili.com/{}.xml\".format(cid)\r\n        # 进入回调函数\r\n        yield scrapy.Request(url=danmu_url, callback=self.get_danmu)\r\n\r\n\r\n    def get_danmu(self, response):\r\n        # print(response.text)\r\n        item = BilibiliItem()\r\n        # xpath匹配弹幕\r\n        item[\'text\'] = response.xpath(\"//d/text()\").extract()\r\n        yield item\r\n```\r\n\r\n### pipelines.py 自定义管道操作\r\n\r\n```py\r\nfrom itemadapter import ItemAdapter\r\nfrom pymongo import MongoClient\r\n\r\n\r\nclass BilibiliPipeline:\r\n\r\n    def open_spider(self, spider):\r\n        print(\">>>>>开始<<<<<\")\r\n        # host和端口号 根据实际情况可灵活运用77\r\n        client = MongoClient(host=\'192.168.3.17\', port=27017)\r\n        self.collection = client[\'spider_test\'][\'bili\']\r\n        # 如果要保存到txt文件请取消注释下一行\r\n        # self.f = open(\'弹幕.txt\', \'w\', encoding=\'utf-8\')\r\n\r\n    def process_item(self, item, spider):\r\n        for danmu in item[\'text\']:\r\n            print(danmu)\r\n            self.collection.insert_one({\"text\": danmu})\r\n            # 如果要保存到txt文件请取消注释下一行\r\n            # self.f.write(danmu + \'\\n\')\r\n        return item\r\n\r\n    def close_spider(self, spider):\r\n        # 如果要保存到txt文件请取消注释下一行\r\n        # self.f.close()\r\n        print(\">>>>>结束<<<<<\")\r\n```\r\n\r\n### 运行程序\r\n\r\n```\r\nscrapy crawl bili\r\n```\r\n\r\n## 查看进入mongodb查看数据即可\r\n\r\n![WqpYB.png](https://s1.328888.xyz/2022/06/03/WqpYB.png)','2022-06-03 10:22:00.000000','2022-06-05 12:44:40.926189',1,'以爬我自己视频下的弹幕为例,通过正则提取cid,使用xpath获取弹幕数据',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
