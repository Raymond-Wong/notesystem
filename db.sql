-- MySQL dump 10.13  Distrib 5.6.26, for Win64 (x86_64)
--
-- Host: localhost    Database: notesystem
-- ------------------------------------------------------
-- Server version	5.6.26-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_image`
--

DROP TABLE IF EXISTS `api_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_image`
--

LOCK TABLES `api_image` WRITE;
/*!40000 ALTER TABLE `api_image` DISABLE KEYS */;
INSERT INTO `api_image` VALUES (1,'images/1465662045_闇€姹俖v0.jpg'),(2,'images/1465662120_闇€姹俖v0.jpg'),(3,'images/1465662238_闇€姹俖v0.jpg'),(4,'images/1465662313_闇€姹俖v0.jpg'),(5,'images/1465662345_闇€姹俖v0.jpg'),(6,'images/1465662373_闇€姹俖v0.jpg'),(7,'images/1465662462_闇€姹俖v0.jpg'),(8,'images/1465662483_闇€姹俖v0.jpg'),(9,'images/1465662594_闇€姹俖v0.jpg'),(10,'images/1465662628_闇€姹俖v0.jpg'),(11,'images/1465662805_闇€姹俖v0.jpg'),(12,'images/1465662816_闇€姹俖v0.jpg'),(13,'images/1465662842_闇€姹俖v0.jpg'),(14,'images/1465662879_闇€姹俖v0.jpg'),(15,'images/1465662898_闇€姹俖v0.jpg'),(16,'images/1465662918_闇€姹俖v0.jpg'),(17,'images/1465662951_闇€姹俖v0.jpg'),(18,'images/1465663052_闇€姹俖v0.jpg'),(19,'images/1465663192_闇€姹俖v0.jpg'),(20,'images/1465663241_闇€姹俖v0.jpg'),(21,'images/1465663356_闇€姹俖v0.jpg'),(22,'images/1465663397_闇€姹俖v0.jpg'),(23,'images/1465663452_闇€姹俖v0.jpg'),(24,'images/1465663504_闇€姹俖v0.jpg'),(25,'images/1465663566_闇€姹俖v0.jpg'),(26,'images/1465663624_闇€姹俖v0.jpg'),(27,'images/1465663665_闇€姹俖v0.jpg'),(28,'images/1465663679_闇€姹俖v0.jpg'),(29,'images/1465663709_闇€姹俖v0.jpg');
/*!40000 ALTER TABLE `api_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add item',7,'add_item'),(20,'Can change item',7,'change_item'),(21,'Can delete item',7,'delete_item'),(22,'Can add folder',8,'add_folder'),(23,'Can change folder',8,'change_folder'),(24,'Can delete folder',8,'delete_folder'),(25,'Can add note',9,'add_note'),(26,'Can change note',9,'change_note'),(27,'Can delete note',9,'delete_note'),(28,'Can add user',10,'add_user'),(29,'Can change user',10,'change_user'),(30,'Can delete user',10,'delete_user'),(31,'Can add knowledge_ point',11,'add_knowledge_point'),(32,'Can change knowledge_ point',11,'change_knowledge_point'),(33,'Can delete knowledge_ point',11,'delete_knowledge_point'),(34,'Can add image',12,'add_image'),(35,'Can change image',12,'change_image'),(36,'Can delete image',12,'delete_image');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$9eJnDOSa5DxE$caCebfQWpVd1ZDX7Dp+SpM5h6/4U5iXUBuEKvnY6xlI=','2016-06-06 05:38:51',1,'admin','','','',1,1,'2016-06-06 05:38:51');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'item','pc','item'),(8,'folder','pc','folder'),(9,'note','pc','note'),(10,'user','pc','user'),(11,'knowledge_ point','pc','knowledge_point'),(12,'image','api','image');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('f8g73fslwip6cas3p72i0f4mwhr6bkcs','YzYzYTFlZWI3NWNmOGExZTBmZDI1MDhhNmJhYjJhNjc2YTk2MGNkNDqAAn1xAVUDdWlkcQKKAQFzLg==','2016-07-06 02:01:52'),('mwra4dm9j6o6hi1s5eol1kdf1mc7thl8','YzYzYTFlZWI3NWNmOGExZTBmZDI1MDhhNmJhYjJhNjc2YTk2MGNkNDqAAn1xAVUDdWlkcQKKAQFzLg==','2016-06-23 08:38:55'),('o7lwixuw3hemvzarji107gk9j4pn51ox','YzYzYTFlZWI3NWNmOGExZTBmZDI1MDhhNmJhYjJhNjc2YTk2MGNkNDqAAn1xAVUDdWlkcQKKAQFzLg==','2016-06-20 05:39:21');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_folder`
--

DROP TABLE IF EXISTS `pc_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_folder` (
  `item_ptr_id` int(11) NOT NULL,
  `item_type` varchar(20) NOT NULL,
  PRIMARY KEY (`item_ptr_id`),
  CONSTRAINT `item_ptr_id_refs_id_b208f2e0` FOREIGN KEY (`item_ptr_id`) REFERENCES `pc_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_folder`
--

LOCK TABLES `pc_folder` WRITE;
/*!40000 ALTER TABLE `pc_folder` DISABLE KEYS */;
INSERT INTO `pc_folder` VALUES (1,'folder'),(2,'folder'),(3,'folder'),(9,'folder');
/*!40000 ALTER TABLE `pc_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_item`
--

DROP TABLE IF EXISTS `pc_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `created_time` datetime NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pc_item_410d0aac` (`parent_id`),
  CONSTRAINT `parent_id_refs_id_ee8866fa` FOREIGN KEY (`parent_id`) REFERENCES `pc_item` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_item`
--

LOCK TABLES `pc_item` WRITE;
/*!40000 ALTER TABLE `pc_item` DISABLE KEYS */;
INSERT INTO `pc_item` VALUES (1,'549425036@qq.com\'s root','2016-06-06 05:39:21',NULL),(2,'璁＄畻鏈鸿瑙?,'2016-06-06 05:39:35',1),(3,'浜鸿劯璇嗗埆','2016-06-06 05:39:42',2),(9,'IJCB 2014','2016-06-06 14:57:42',3),(10,'IJCB 2014','2016-06-06 14:57:58',9),(11,'ADSC','2016-06-06 14:58:31',9),(12,'CPqD','2016-06-06 14:58:42',9),(13,'SIT','2016-06-06 14:58:47',9),(14,'Ljubljana','2016-06-06 14:59:06',9),(15,'Eigen-PEP','2016-06-10 02:46:23',9),(16,'PEP','2016-06-10 10:23:38',9),(17,'test','2016-06-11 15:56:27',1),(18,'Template Adaptation','2016-06-14 05:13:54',3),(19,'Face Search At Scale','2016-06-15 08:04:15',3);
/*!40000 ALTER TABLE `pc_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_knowledge_point`
--

DROP TABLE IF EXISTS `pc_knowledge_point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_knowledge_point` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(50) NOT NULL,
  `created_time` datetime NOT NULL,
  `content` longtext NOT NULL,
  `note_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pc_knowledge_point_6340c63c` (`user_id`),
  KEY `pc_knowledge_point_f6e610e1` (`note_id`),
  CONSTRAINT `note_id_refs_item_ptr_id_609e13be` FOREIGN KEY (`note_id`) REFERENCES `pc_note` (`item_ptr_id`),
  CONSTRAINT `user_id_refs_id_bece958a` FOREIGN KEY (`user_id`) REFERENCES `pc_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_knowledge_point`
--

LOCK TABLES `pc_knowledge_point` WRITE;
/*!40000 ALTER TABLE `pc_knowledge_point` DISABLE KEYS */;
INSERT INTO `pc_knowledge_point` VALUES (13,1,'LBP','2016-06-06 15:00:53','+ **L**ocal **B**inary **P**atterns锛氬眬閮ㄤ簩鍊兼ā寮忥級鏄竴绉嶇敤鏉ユ弿杩板浘鍍忓眬閮ㄧ汗鐞嗙壒寰佺殑绠楀瓙锛涘畠鍏锋湁鏃嬭浆涓嶅彉鎬у拰鐏板害涓嶅彉鎬х瓑鏄捐憲鐨勪紭鐐筡n+ 鍘熷鐨凩BP绠楀瓙瀹氫箟涓哄湪3脳3鐨勭獥鍙ｅ唴锛屼互绐楀彛涓績鍍忕礌涓洪槇鍊硷紝灏嗙浉閭荤殑8涓儚绱犵殑鐏板害鍊间笌鍏惰繘琛屾瘮杈冿紝鑻ュ懆鍥村儚绱犲€煎ぇ浜庝腑蹇冨儚绱犲€硷紝鍒欒鍍忕礌鐐圭殑浣嶇疆琚爣璁颁负1锛屽惁鍒欎负0銆傝繖鏍凤紝3脳3閭诲煙鍐呯殑8涓偣缁忔瘮杈冨彲浜х敓8浣嶄簩杩涘埗鏁帮紙閫氬父杞崲涓哄崄杩涘埗鏁板嵆LBP鐮侊紝鍏?56绉嶏級锛屽嵆寰楀埌璇ョ獥鍙ｄ腑蹇冨儚绱犵偣鐨凩BP鍊硷紝骞剁敤杩欎釜鍊兼潵鍙嶆槧璇ュ尯鍩熺殑绾圭悊淇℃伅\n+ **LBP鏃嬭浆涓嶅彉寮?*锛氫笉鏂棆杞渾褰㈤偦鍩熷緱鍒颁竴绯诲垪鍒濆瀹氫箟鐨?LBP鍊硷紝鍙栧叾鏈€灏忓€间綔涓鸿閭诲煙鐨?LBP 鍊糪n+ **LBP绛変环妯″紡(Uniform Pattern)**锛氬LBP鐗瑰緛杩涜闄嶇淮鐨勪竴绉嶆柟寮忋€傚綋鏌愪釜LBP鎵€瀵瑰簲鐨勫惊鐜簩杩涘埗鏁颁粠0鍒?鎴栦粠1鍒?鏈€澶氭湁涓ゆ璺冲彉鏃讹紝璇BP鎵€瀵瑰簲鐨勪簩杩涘埗灏辩О涓轰竴涓瓑浠锋ā寮忕被銆傚00000000锛?娆¤烦鍙橈級锛?0000111锛堝彧鍚竴娆′粠0鍒?鐨勮烦鍙橈級锛?0001111锛堝厛鐢?璺冲埌0锛屽啀鐢?璺冲埌1锛屽叡涓ゆ璺冲彉锛夐兘鏄瓑浠锋ā寮忕被銆傞櫎绛変环妯″紡绫讳互澶栫殑妯″紡閮藉綊涓哄彟涓€绫伙紝绉颁负娣峰悎妯″紡绫伙紝渚嬪10010111',11),(14,1,'SIFT','2016-06-06 15:01:14','### 绠€浠媆n+ **S**cale-**i**nvariant **f**eature **t**ransform锛氫竴绉嶆娴嬪眬閮ㄧ壒寰佺殑绠楁硶锛岃绠楁硶閫氳繃姹備竴骞呭浘涓殑鐗瑰緛鐐癸紙interest points,or corner points锛夊強鍏舵湁鍏硈cale 鍜?orientation 鐨勬弿杩板瓙寰楀埌鐗瑰緛骞惰繘琛屽浘鍍忕壒寰佺偣鍖归厤\n+ SIFT鐗瑰緛涓嶅彧鍏锋湁灏哄害涓嶅彉鎬э紝鍗充娇鏀瑰彉鏃嬭浆瑙掑害锛屽浘鍍忎寒搴︽垨鎷嶆憚瑙嗚\n### 鍏蜂綋绠楁硶\n娌＄湅鎳傦紝鐪嬩笂闈㈤摼鎺ラ噷绗簩绗笁鏉°€傘€傘€?,11),(15,1,'鍥惧儚闄嶉噰鏍?,'2016-06-06 15:01:34','鍦ㄥ師濮嬪浘鐗囦腑锛屾瘡闅攏涓儚绱犵偣閲囬泦涓€涓儚绱犵偣',11),(16,1,'WPCA','2016-06-06 15:02:05','+ Whitened Principle Component Analysis\n+ 濡傛灉瑕佸鐭╅樀A杩涜闄嶇淮锛岄偅涔堣姹傜煩闃礎鐨勭壒寰佸€煎拰鐗瑰緛鍚戦噺锛屼笖鍙栧ぇ鐨勭壒寰佸€间笌鍏跺搴旂殑鐗瑰緛鍚戦噺鐩镐箻锛岃幏寰椾竴涓緝鐭╅樀A鑰岃█缁村害杈冨皬鐨勭煩闃碉紝鍒欎负缁撴灉鐭╅樀\n+ 瑙佸弬鑰冮摼鎺?',11),(17,1,'GMM','2016-06-06 15:02:52','+ Gaussian mixture models锛氭贩鍚堥珮鏂ā鍨媆n+ 鎸囧鏍锋湰鐨勬鐜囧瘑搴﹀垎甯冭繘琛屼及璁★紝鑰屼及璁＄殑妯″瀷鏄嚑涓珮鏂ā鍨嬪姞鏉冧箣鍜岋紙鍏蜂綋鏄嚑涓鍦ㄦā鍨嬭缁冨墠寤虹珛濂斤級銆傛瘡涓珮鏂ā鍨嬪氨浠ｈ〃浜嗕竴涓被锛堜竴涓狢luster锛夈€傚鏍锋湰涓殑鏁版嵁鍒嗗埆鍦ㄥ嚑涓珮鏂ā鍨嬩笂鎶曞奖锛屽氨浼氬垎鍒緱鍒板湪鍚勪釜绫讳笂鐨勬鐜囥€傜劧鍚庢垜浠彲浠ラ€夊彇姒傜巼鏈€澶х殑绫绘墍涓哄垽鍐崇粨鏋淺n+ 鍙傝€冮摼鎺?锛?',12),(18,1,'DCT','2016-06-06 16:18:16','+ Discrete Cosine Transform锛氫綑寮︾鏁ｅ彉鎹n+ 鏈変竴涓浐瀹氱殑鍙樻崲绯绘暟鐭╅樀锛屽皢鍥惧儚鐭╅樀鍜岀郴鏁扮煩闃电浉涔樺悗寰楀埌璇ュ浘鍍忓湪棰戝煙涓婄殑鐭╅樀锛屼繚鐣欑粷瀵瑰€煎ぇ鐨勶紙浣庨锛変涪寮冪粷瀵瑰€煎皬鐨勶紙楂橀锛夛紝鐒跺悗鍐嶇紪鐮佷紶鍏ワ紝鍙捣鍒板帇缂╀綔鐢╘n+ 鍙傝€冮摼鎺?',12),(21,1,'Garbor magnitude Feature','2016-06-07 11:26:45','+ Garbor骞呭€肩壒寰乗n+ 瀵瑰師鍥惧儚鐨勬瘡涓偣鍋氫竴涓狦arbor鍙樻崲鍚庡緱鍒扮殑鏂板浘鍍忓嵆涓鸿鍥惧儚鐨勭壒寰佺煩闃礬n+ 瑙佸弬鑰冮摼鎺?',14),(27,1,'Transfer learning','2016-06-14 05:47:06','+ TL锛氳縼绉诲涔燶n+ 绠€浠嬭鍙傝€冮摼鎺?',18),(28,1,'Face identification','2016-06-14 05:47:06','+ 鍦ㄤ竴浜涘垪鍥剧墖涓壘鍑哄嚭鐜颁簡鏌ヨ鍥剧墖涓汉鐗╃殑鍥剧墖\n+ 甯哥敤浜庣洃鎺х郴缁熶互鍙婃硶鍖绘悳绱汉鐗?,18),(29,1,'Face verification','2016-06-14 05:47:06','+ 璁＄畻涓€寮犲浘鐗囧拰鍙﹀涓€寮犲浘鐗囩殑鐩镐技搴︼紝浠ユ鍒ゅ畾涓ゅ紶鍥剧墖涓殑浜烘槸鍚︽槸鍚屼竴涓汉\n+ 甯哥敤浜庢潈闄愭帶鍒朵互鍙妑e-identification',18);
/*!40000 ALTER TABLE `pc_knowledge_point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_note`
--

DROP TABLE IF EXISTS `pc_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_note` (
  `item_ptr_id` int(11) NOT NULL,
  `item_type` varchar(20) NOT NULL,
  `content` longtext NOT NULL,
  `links` longtext NOT NULL,
  `name` longtext NOT NULL,
  PRIMARY KEY (`item_ptr_id`),
  CONSTRAINT `item_ptr_id_refs_id_6b71f73f` FOREIGN KEY (`item_ptr_id`) REFERENCES `pc_item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_note`
--

LOCK TABLES `pc_note` WRITE;
/*!40000 ALTER TABLE `pc_note` DISABLE KEYS */;
INSERT INTO `pc_note` VALUES (10,'note','PaSC(The Point-and-Shoot Face Recognition Challenge)鏄寚鐩存帴鎷嶆憚浜鸿劯璇嗗埆闂锛岃paper姒傝堪浜嗕竴涓拡瀵筆aSC闂鐨勬瘮璧涗腑鍥涗釜鑾峰闃熶紞鐨勭畻娉曪紝杩欎釜姣旇禌鍒嗕负涓や釜閮ㄥ垎锛屽垎鍒负video-to-video鍜寁ideo-to-still銆傚湪video-to-video閮ㄥ垎涓紝绠楁硶闇€瑕佸湪鐩爣瑙嗛闆嗗悎涓壘鍑哄湪寰呮煡璇㈣棰戜腑鍑虹幇鍚屾牱浜虹墿鐨勮棰戙€傝€屽湪video-to-still閮ㄥ垎涓紝绠楁硶闇€瑕佸湪鐩爣鍥剧墖闆嗗悎涓壘鍑哄湪寰呮煡璇㈣棰戜腑鍑虹幇鍚屾牱浜虹墿鐨勫浘鐗囥€傚洓涓幏濂栭槦浼嶅垎鍒负锛歕n\n+ Advanced Digital Science Center(ADSC)\n+ CPqD\n+ Stevens Institute of Technology(SIT)\n+ University of Ljubljana','[\"http://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6996256\"]','The IJCB 2014 PaSC Video Face and Person Recognition Competition'),(11,'note','1. 锛堥澶勭悊锛夊皢姣忓紶鍥剧墖鎴栬€呰棰戜腑鐨勬瘡涓€涓抚杩涜涓€瀹氬彉鎹紝鑾峰緱鍏跺搴旂殑涓€寮?4*64鐨勫浘鐗囷紝涓斿湪璇ュ浘鐗囦腑涓や釜鐪肩潧鐨勫潗鏍囧湪涓€涓浐瀹氱殑浣嶇疆锛屼笖涓ょ溂涔嬮棿鐨勮窛绂绘亽瀹氫负28涓儚绱犵偣\n2. 瀵逛簬姣忓紶棰勫鐞嗗悗鐨勫浘鐗囷紝浣跨敤8脳8鐨凩BP(Local Binary Patterns)鍜?脳4鐨凷IFT(Scale-Invariant Feature Transform)瀵瑰浘鍍忚繘琛岀壒寰佹彁鍙栵紝鍒嗗埆鎻愬彇鍑轰竴涓?776缁寸殑鐗瑰緛鍚戦噺鍜屼竴涓?048缁寸殑鐗瑰緛鍚戦噺锛屽啀鍒╃敤WPCA(Whitened Principle Component Analysis)瀵逛袱涓壒寰佸悜閲忚繘琛岄檷缁达紝鍒嗗埆闄嶅埌700鍜?00缁碶n3. 瑙嗛鍜岃棰戞垨鑰呰棰戝拰鍥惧儚涔嬮棿鐨勬渶缁堢浉浼煎害鏍规嵁浠ヤ笅瑙勫垯璁＄畻锛歕n	1. 璁＄畻寰呮煡璇㈣棰戜腑姣忎竴甯у拰鐩爣瑙嗛涓瘡涓€甯ф垨鑰呯洰鏍囧浘鐗囩殑cosine similarity\n	2. 瀵逛互涓婅绠楃殑缁撴灉浣跨敤SILD杩涜鎶曞奖鍖哄垎\n	3. 鏈€缁堝钩鍧囩浉浼煎害鐢ㄤ簬寰呮煡璇㈣棰戜腑姣忎竴甯у鐩爣瑙嗛涓瘡涓€甯ф垨鐩爣鍥剧墖鐨勭浉浼煎害','[\"http://blog.csdn.net/zouxy09/article/details/7929531\", \"http://www.360doc.com/content/14/1013/15/18306241_416576994.shtml\", \"http://www.360doc.com/content/14/1013/15/18306241_416573596.shtml\", \"http://www.cnblogs.com/zhangchaoyang/articles/2222048.html\"]','Advanced Digital Science Center'),(12,'note','1. 锛堥澶勭悊锛夊皢姣忓紶鍥剧墖鎴栬€呰棰戜腑鐨勬瘡涓€涓抚杩涜涓€瀹氬彉鎹紝鑾峰緱鍏跺搴旂殑涓€寮?4脳80鐨勫浘鐗嘰n2. 瀵规瘡涓€寮犻澶勭悊鍚庣殑鍥剧墖浣跨敤Tan & Triggs normalization杩涜褰掍竴鍖栵紝浠ヤ究鍑忓皬鍏夌収鐨勫奖鍝峔n3. 灏嗗浘鍍忓垏鍒嗘垚12脳12鐨勫潡锛屼笖姣忎釜鍧楀湪姣忎釜鏂瑰悜涓婃湁11涓儚绱犵偣鐨勯噸鍙燶n4. 灏嗘瘡涓潡杩涜褰掍竴鍖栦娇寰楀潎鍊间负0锛屾柟宸负鍥哄畾鍊糪n5. 瀵规瘡涓€涓綊涓€鍖栫殑鍧楋紝鎻愬彇鍏朵腑45涓渶浣?D-DCT绯绘暟浣滀负鍏剁壒寰佸悜閲廫n6. 灏嗗緟鏌ヨ瑙嗛涓殑姣忎竴涓抚鍜屽鐩爣瑙嗛鐨勬瘡涓€涓抚鎴栬€呮瘡涓€寮犲浘鐗囦粠5涓彁鍙栧嚭鐨勭壒寰佸悜閲忚繘琛孶BM-GMM绠楁硶锛屾帹鏂嚭璇ュ抚涓庡叾浠栨墍鏈夊抚鎴栧浘鐗囩殑鐩镐技姒傜巼锛屼綔涓篶lient offset锛堝璞″亸宸級\n7. 杩樻湁涓€涓猻ession offset锛堝満鏅亸宸級鐢ㄤ簬琛￠噺濮垮娍锛屽厜鐓э紝琛ㄦ儏绛夊鐩镐技鎬у彲鑳介€犳垚鐨勫奖鍝嶇殑锛屼絾鏂规硶娌＄湅鎳俓n8. 灏?涓殑client offset鍜?涓殑session offset鍚堣捣鏉ワ紝灏辨槸鏈€缁堢殑寰呮煡璇㈣棰戝抚鍜岀洰鏍囪棰戝抚鎴栧浘鐗囩殑鐩镐技姒傜巼','[\"http://blog.csdn.net/hevc_cjl/article/details/9733945\", \"http://blog.csdn.net/manji_lee/article/details/41335307\", \"http://blog.csdn.net/jubincn/article/details/6882179\"]','CPqD'),(13,'note','','[\"\"]','Stevens Institute of Technology'),(14,'note','1. 鏍规嵁姣旇禌鎻愪緵鐨勬瘡寮犲浘鐗囩殑鐪肩潧鍧愭爣锛屽垏鍓插嚭姣忓紶鍥剧墖涓殑浜鸿劯锛屼笖杩涜褰掍竴鍖栧鐞嗭紝涓旂缉鏀炬垚50脳50鍍忕礌澶у皬\n2. 灏?涓幏鍙栫殑鍥剧墖鍙樻垚鐏板害鍥剧墖锛岀劧鍚庣敤涓€绉峳etina-based normalization鐨勬柟娉曡繘琛屽綊涓€鍖栥€傝繖涓€姝ユ渶缁堢敓鎴愪袱寮犵収鐗囷紝涓€寮犵伆搴﹀浘锛屼竴寮犲綊涓€鍖栧悗鐨勭収鐗嘰n3. 鎺ョ潃鍦ㄧ壒寰佹彁鍙栬繃绋嬩腑锛屽垎鍒彁鍙栦袱寮犲浘鐨凣abor magnitude features, DCT, LBP, LPQ杩欏洓绉嶇壒寰佸悜閲忥紝鐒跺悗鐢≒LDA澶勭悊姣忓紶鍥剧殑鍥涗釜鐗瑰緛鍚戦噺锛屽啀灏嗘瘡涓€涓壒寰佸悜閲忕敤WPCA杩涜鐧藉寲闄嶄负澶勭悊\n4. 鏈€缁堬紝姣忓紶鍥剧墖鐨?涓壒寰佸悜閲忥紙2寮犲瓙鍥?脳 4涓壒寰佸悜閲忔彁鍙栨柟寮忥級鍒嗗埆琚熀浜庝綑寮︾殑璇勫垎鏂规硶浠ュ強鍩轰簬SVM鐨勮瘎鍒嗘柟娉曡繘琛岃瘎鍒嗭紝骞惰幏寰?6涓瘎鍒哱n5. 4涓殑16涓瘎鍒嗙敤ZT-normalization杩涜褰掍竴鍖栧悗閫氳繃Linear-logistic-regression-based fusion杩涜铻嶅悎锛屽苟灏嗚瀺鍚堢殑缁撴灉浣滀负鏈€缁堢殑璇勫垎','[\"http://www.hcii-lab.net/lianwen/Course/Machine%20Learning/main/notes/Lecture%205%20%CC%D8%D5%F7%CC%E1%C8%A1--Gabor%C2%CB%B2%A8%C6%F7%BC%B0%C6%E4%D3%A6%D3%C3.pdf\"]','University of Ljubljana'),(15,'note','+ PEP representation琚瘉鏄庡浜虹殑濮垮娍鐨勯瞾妫掓€ч潪甯稿己\n+ 褰揚EP representation琚繍鐢ㄥ埌瑙嗛浜鸿劯璇嗗埆鏃讹紝浠栦細浠庢墍鏈夎棰戝抚涓彁鍙栧嚭涓€浜涘浘鍍忓潡锛屽苟灏嗚繖浜涘浘鍍忓潡鐨勬弿杩板瓙閾炬帴鎴愪竴涓悜閲忥紝浣滀负杩欎釜瑙嗛鐨凱EP representation\n+ 浼犵粺PEP representation瀛樺湪鐨勯棶棰樺寘鎷細\n	+ 缁村害杩囬珮\n	+ 浣跨敤SVM鏉ュ尮閰嶄袱涓狿EP representation杩欑鏂规硶鏄笉鍙害閲忕殑\n	+ 鐢变簬PEP鏄粠瑙嗛甯т腑鎻愬彇鍑哄眬閮ㄤ俊鎭紝鍥犳浼氫涪澶卞緢澶氫汉鑴哥殑澶栧舰鐗瑰緛锛屼笖鍚屾椂锛孭EP鍙互涓嶆柇灏嗘柊鐨勮娴嬪璞″姞鍏ュ埌妯″瀷涓紝浣嗘棤娉曞強鏃跺皢鏃х殑瑙傛祴瀵硅薄绉婚櫎鍑烘ā鍨媆n### 娴佺▼\n1. 鍒╃敤璁粌瑙嗛闆嗗悎璁粌涓€涓狿EP model\n2. for each frame in the testing video, the PEP representation is partially visualized as the selected image patches of which the patches at the same location are consistent in semantics but varied in appearance across the video frames\n3. visualization of the intermediate video level representation as the pixellevel mean\n4. apply PCA to project the intermediate video level representation into a low-dimensional space to build the Eigen-PEP; the PCA is trained over all video level intermediate representations','[\"\"]','Eigen-PEP for Video Face Recognition'),(16,'note','### 绌洪棿-澶栬鐗瑰緛鍚戦噺鎻愬彇\n1. 瀵逛簬涓€寮犲浘鐗囷紝灏嗗叾瑙嗕负涓€鍫嗙┖闂?澶栬鐗瑰緛鍚戦噺\n2. 瀵逛簬姣忎竴寮犲浘鐗囷紝鎴戜滑瀵瑰叾杩涜涓€瀹氭瘮渚嬬殑缂╂斁锛屾瀯寤轰竴涓笁灞傞珮鏂浘鍍忛噾瀛楀\n3. 鐒跺悗閽堝閲戝瓧濉旂殑姣忎竴灞傦紝鎴戜滑鎻愬彇鍑哄叿鏈夐噸鍙犵殑鍥惧儚鍧楋紝骞跺皢涓嶅悓灞備腑鎻愬彇鍑虹殑鍥惧儚鍧楃瓑鍚岀湅寰咃紝鍗充竴涓噾瀛楀鍙互鎻愬彇鍑轰竴涓浘鍍忓潡闆嗗悎\n4. 閽堝鍥惧儚鍧楅泦鍚堜腑鐨勬瘡涓€涓浘鍍忓潡锛岀敓鎴愪竴涓壒寰佸悜閲忥紝璇ョ壒寰佸悜閲忓垯涓鸿鍥惧儚鍧楃殑澶栬鐗瑰緛銆傛澶栵紝閽堝璇ュ浘鍍忓潡锛屾垜浠互鍏跺潗鏍囩偣(x,y)浣滀负鍏剁┖闂寸壒寰佸悜閲忋€傛渶鍚庡皢绌洪棿鐗瑰緛鍚戦噺鍜屽瑙傜壒寰佸悜閲忚繛鍦ㄤ竴璧凤紝浣滀负杩欎釜鍥惧儚鍧楃殑绌洪棿-澶栬鐗瑰緛鍚戦噺锛堜互涓嬬畝绉扮壒寰佸悜閲忥級\n5. 姣忎竴涓浘鍍忓潡鍙互浠?-4鎻愬強鐨勬柟娉曠敓鎴愪竴涓壒寰佸悜閲忥紝閭ｄ箞閽堝涓€寮犲浘鐗囦骇鐢熺殑鎵€鏈夊浘鍍忓潡鍒欏彲浠ヤ骇鐢熶竴涓壒寰佸悜閲忛泦鍚圽n6. 瀵逛簬涓€涓棰戯紙瑙嗛涓亣璁惧彧鍑虹幇浜嗕竴涓汉锛夛紝閭ｄ箞鍒欓拡瀵硅棰戜腑鐨勬瘡涓€涓抚鐢熸垚涓€涓壒寰佸悜閲忛泦鍚堬紝骞跺皢鎵€鏈夊抚鐨勭壒寰佸悜閲忛泦鍚堝仛骞舵搷浣滐紝寰楀埌鐨勫苟闆嗗悎鍒欎负璇ヨ棰戠殑鐗瑰緛鍚戦噺闆嗗悎\n7. 5鍜?涓殑鐗瑰緛鍚戦噺闆嗗悎鍒欎负鍥惧儚鎴栬€呰棰戠殑PEP representation\n### PEM: Probabilistic Elastic Matching\n1. 鐢ㄨ缁冮泦涓殑鍥惧儚鎴栬棰戞彁鍙栧嚭鐨勭壒寰佸悜閲忛泦鍚堣缁僄MM\n2. 瀵逛簬姣忎竴瀵瑰浘鐗?瑙嗛瀵癸紝鎴戜滑閽堝鍏惰缁冨緱鐨凣MM妯″瀷涓殑姣忎竴涓珮鏂ā鍨嬶紝鎵惧嚭鍏朵腑鐩镐技鎬ф渶楂樼殑涓€鍫嗙壒寰佸悜閲忥紝骞剁О鍏朵负瀵瑰簲鐗瑰緛瀵筡n3. 灏嗕笂杩板搴旂壒寰佸閲屼袱涓壒寰佸€间笉瀹屽叏鐩稿悓鐨勫搴旂壒寰佸鍏ㄩ儴鑱斿悎璧锋潵鎴愪负涓€涓緢闀跨殑鍚戦噺锛屽苟浼犲叆SVM涓SVM杩涜璁粌\n4. 鍙︿竴涓敼杩涘氨鏄湪GMM涓娇鐢ㄨ礉鍙舵柉缃戠粶锛屽苟鐢ㄨ繖涓ā鍨嬫潵鍙栦唬鍒濆鐨凣MM銆傜敤杩欑鏂瑰紡鐨勬ā鍨嬶紝鎴戜滑绉颁负APEM锛岃€岀敤浼犵粺GMM鐨勫垯绉颁负PEM\n5. ','[\"\"]','Probabilistic Elastic Matching for Pose Variant Face Verification'),(17,'note','<img src=\"/media/images/1465663709_闇€姹俖v0.jpg\" />','[\"\"]',''),(18,'note','+ Face Recognition鍖呮嫭Face identification鍜孎ace verification\n+ Template鏄寚鍚屼竴涓璞＄殑鎵€鏈夊浘鐗囨垨video涓€璧蜂骇鐢熺殑涓€涓猺epresentation锛屽彲鐢ㄤ簬鍖归厤\n+ Template adaptation is an example of transfer learning, where the target domain is defined by the set of media of a subject in a template. In general, transfer learning includes a source domain for feature encoding of subjects trained offline, and a specific target domain with limited available observations of new subjects\n+ template adaptation鏄痶ransfer learning鐨勪竴绉嶅舰寮忋€傚埄鐢ㄤ竴浜涘甫鏍囩鐨勬暟鎹潵璁粌涓€涓繁搴﹀嵎绉缁忕綉缁滄ā鍨嬶紝鍐嶇敤template涓殑鎵€鏈塵edia鏉ヨ缁冧竴涓猯inear SVM妯″瀷銆傚皢涓婅堪涓や釜妯″瀷缁撳悎鍦ㄤ竴璧穃n+ template adaptation鍙繘涓€姝ョ粏鍒嗘垚probe adaptation鍜実allery adaptation銆傚墠鑰呴€傜敤浜巉ace verification锛屽悗鑰呴€傜敤浜巉ace identification\n#### **probe adaptation**\n##### 鐩爣鏄缁冧竴涓绠楃浉浼煎害鐨勫嚱鏁皊(P, Q)锛屽叾涓璓涓虹洰鏍囧浘鍍忥紝Q涓哄弬鑰冨浘鍍忋€俓n1. 瀵筆鐨勬墍鏈夊浘鐗囧拰瑙嗛閮界敓鎴愮壒寰佸悜閲廫n2. 鍙?涓墍鏈夌壒寰佸悜閲忕殑骞冲潎鍊硷紝骞跺钩鍧囧悜閲忚繘琛寀nit normalized锛屽皢杩欎釜鍚戦噺浣滀负P鐨勬鏍锋湰\n3. 閽堝闄や簡P鐨勫叾瀹冩墍鏈夊璞★紝鍙栦粬浠殑浠绘剰涓€寮犲浘鐗囨垨瑙嗛鐢熸垚鐗瑰緛鍚戦噺骞惰繘琛寀nit normalized锛屽緱鍒颁竴涓壒寰佸悜閲忛泦鍚堜綔涓篜鐨勮礋鏍锋湰\n4. 鍒╃敤涓婇潰P鐨勬璐熸牱鏈缁冧竴涓猯inear SVM妯″瀷锛屽苟灏嗘ā鍨嬭涓篜(x)銆侾(x)鍊煎垯浠ｈ〃鍚戦噺x鍜?涓壒寰佸悜閲忕殑鐩镐技搴n5. 閽堝Q鍒╃敤1-4鐨勬柟娉曞悓鏍疯缁冧竴涓猯inear SVM妯″瀷锛屽苟灏嗘ā鍨嬭涓篞(x)\n6. 鎶婄洰鏍嘝鐨勭壒寰佸悜閲忚涓簆锛孮鐨勭壒寰佸悜閲忚涓簈銆傝绠桺(q)鍜孮(p)銆傞偅涔坰(P,Q)=1/2 * P(q) + 1/2 * Q(p)\n#### **Gallery adaptation**\n##### 褰㈠紡鍜宲robe adaptation宸笉澶氾紝鍙槸璁＄畻涓€涓洰鏍囧浘鐗囧拰鎵€鏈夊凡鐭ュ璞′箣闂寸殑鐩镐技搴︺€備笖璐熸牱鏈笉鏄彇鏌愪釜瀵硅薄鐨勪竴寮犲浘鐗囩敓鎴愮壒寰佸悜閲忥紝鑰屾槸闄よ嚜韬互澶栨瘡涓璞＄殑骞冲潎鐗瑰緛鍚戦噺鐨勯泦鍚堜綔涓鸿礋鏍锋湰闆嗗悎\n#### Media encoding\n##### 閽堝涓€涓棰戯紝璁＄畻姣忎竴涓抚鐨勭壒寰佸悜閲忥紝鐒跺悗鍙栧潎鍊硷紝鍋歶nit normalized锛屽緱鍒扮殑鍚戦噺鍒欎负璇ヨ棰戠殑鐗硅瘖鍚戦噺\n1. 鐢ㄤ竴涓渶灏忕煩褰㈠垏闄や汉鑴革紝骞朵笉鎸夋瘮渚嬬殑灏嗗浘鐗囨媺浼告垚224*224*3鐨勫昂瀵革紝浠ユ浣滀负CNN鐨勮緭鍏n2. 閫氳繃VGG-Face netword灏?涓殑杈撳叆鍋歟ncoding锛屽瑙嗛鐨勮瘽鍒欏彇encoding鍧囧€硷紝鐒跺悗鍋歶nit normalized\n3. 鍚屼竴涓璞″瓨鍦ㄥ寮犲浘鐗囨垨鑰呰棰戯紝鏍规嵁姣忎竴涓猰edia鐢熸垚涓€涓壒寰佸悜閲忥紝鍒欎竴涓璞℃湁涓€涓壒寰佺煩闃碉紝杩欎釜鐗瑰緛鐭╅樀灏辨槸璇ョ敤鎴风殑template銆備娇鐢ㄨtemplate璁粌涓€涓猯inear SVM\n4. ','[\"http://blog.sina.com.cn/s/blog_4a1853330100lui7.html\", \"http://arxiv.org/pdf/1603.03958.pdf\"]','Template Adaptation for Face Verification and Identification'),(19,'note','### 鍏跺畠\n+ 澶ц妯℃悳绱㈢殑涓や釜閲嶈闂锛歕n	1. 闅忕潃鍥惧儚搴撹妯″澶э紝鎼滅储绮惧害鐨勪笅闄峔n	2. 闅忕潃鍥惧儚搴撹妯″澶э紝鎼滅储澶嶆潅搴︿笂鍗嘰n### 姝ラ\n1. 浣跨敤涓€涓牴鎹浘鐗囩壒寰佸€艰缁冪殑CNN缃戠粶锛屼粠宸ㄥぇ鐨勫浘鐗囧簱涓繃婊ゅ嚭top-k寮犲拰寰呮煡璇㈠浘鐗囩浉浼煎害鏈€楂樼殑鍥剧墖锛堝揩閫熻繃婊わ級\n2. 灏嗚繖k寮犲浘鐗囨牴鎹甦eep features鍜孋OTS matcher杈撳嚭鐨勭粨鍚堟潵杩涜閲嶆帓搴忥紙閲嶆帓搴忥級\n### 涓夌涓昏鐨勮繎浼间汉鑴告悳绱㈡柟娉昞n1. Inverted Indexing\n2. Hashing\n3. Product Quantization','[\"\"]','Face Search At Scale');
/*!40000 ALTER TABLE `pc_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pc_user`
--

DROP TABLE IF EXISTS `pc_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) NOT NULL,
  `level` int(11) NOT NULL,
  `root_id` int(11) DEFAULT NULL,
  `account` varchar(50) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `root_id` (`root_id`),
  CONSTRAINT `root_id_refs_item_ptr_id_536362c0` FOREIGN KEY (`root_id`) REFERENCES `pc_folder` (`item_ptr_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pc_user`
--

LOCK TABLES `pc_user` WRITE;
/*!40000 ALTER TABLE `pc_user` DISABLE KEYS */;
INSERT INTO `pc_user` VALUES (1,'',0,1,'549425036@qq.com','123852');
/*!40000 ALTER TABLE `pc_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-22 13:10:01
