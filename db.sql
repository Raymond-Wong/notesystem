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

/*!40000 ALTER TABLE `api_image` DISABLE KEYS */;
INSERT INTO `api_image` VALUES (1,'images/1465662045_需求_v0.jpg'),(2,'images/1465662120_需求_v0.jpg'),(3,'images/1465662238_需求_v0.jpg'),(4,'images/1465662313_需求_v0.jpg'),(5,'images/1465662345_需求_v0.jpg'),(6,'images/1465662373_需求_v0.jpg'),(7,'images/1465662462_需求_v0.jpg'),(8,'images/1465662483_需求_v0.jpg'),(9,'images/1465662594_需求_v0.jpg'),(10,'images/1465662628_需求_v0.jpg'),(11,'images/1465662805_需求_v0.jpg'),(12,'images/1465662816_需求_v0.jpg'),(13,'images/1465662842_需求_v0.jpg'),(14,'images/1465662879_需求_v0.jpg'),(15,'images/1465662898_需求_v0.jpg'),(16,'images/1465662918_需求_v0.jpg'),(17,'images/1465662951_需求_v0.jpg'),(18,'images/1465663052_需求_v0.jpg'),(19,'images/1465663192_需求_v0.jpg'),(20,'images/1465663241_需求_v0.jpg'),(21,'images/1465663356_需求_v0.jpg'),(22,'images/1465663397_需求_v0.jpg'),(23,'images/1465663452_需求_v0.jpg'),(24,'images/1465663504_需求_v0.jpg'),(25,'images/1465663566_需求_v0.jpg'),(26,'images/1465663624_需求_v0.jpg'),(27,'images/1465663665_需求_v0.jpg'),(28,'images/1465663679_需求_v0.jpg'),(29,'images/1465663709_需求_v0.jpg');
/*!40000 ALTER TABLE `api_image` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add item',7,'add_item'),(20,'Can change item',7,'change_item'),(21,'Can delete item',7,'delete_item'),(22,'Can add folder',8,'add_folder'),(23,'Can change folder',8,'change_folder'),(24,'Can delete folder',8,'delete_folder'),(25,'Can add note',9,'add_note'),(26,'Can change note',9,'change_note'),(27,'Can delete note',9,'delete_note'),(28,'Can add user',10,'add_user'),(29,'Can change user',10,'change_user'),(30,'Can delete user',10,'delete_user'),(31,'Can add knowledge_ point',11,'add_knowledge_point'),(32,'Can change knowledge_ point',11,'change_knowledge_point'),(33,'Can delete knowledge_ point',11,'delete_knowledge_point'),(34,'Can add image',12,'add_image'),(35,'Can change image',12,'change_image'),(36,'Can delete image',12,'delete_image');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$9eJnDOSa5DxE$caCebfQWpVd1ZDX7Dp+SpM5h6/4U5iXUBuEKvnY6xlI=','2016-06-06 05:38:51',1,'admin','','','',1,1,'2016-06-06 05:38:51');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'item','pc','item'),(8,'folder','pc','folder'),(9,'note','pc','note'),(10,'user','pc','user'),(11,'knowledge_ point','pc','knowledge_point'),(12,'image','api','image');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('f8g73fslwip6cas3p72i0f4mwhr6bkcs','YzYzYTFlZWI3NWNmOGExZTBmZDI1MDhhNmJhYjJhNjc2YTk2MGNkNDqAAn1xAVUDdWlkcQKKAQFzLg==','2016-07-06 02:01:52'),('mwra4dm9j6o6hi1s5eol1kdf1mc7thl8','YzYzYTFlZWI3NWNmOGExZTBmZDI1MDhhNmJhYjJhNjc2YTk2MGNkNDqAAn1xAVUDdWlkcQKKAQFzLg==','2016-06-23 08:38:55'),('o7lwixuw3hemvzarji107gk9j4pn51ox','YzYzYTFlZWI3NWNmOGExZTBmZDI1MDhhNmJhYjJhNjc2YTk2MGNkNDqAAn1xAVUDdWlkcQKKAQFzLg==','2016-06-20 05:39:21');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `pc_folder` DISABLE KEYS */;
INSERT INTO `pc_folder` VALUES (1,'folder'),(2,'folder'),(3,'folder'),(9,'folder');
/*!40000 ALTER TABLE `pc_folder` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `pc_item` DISABLE KEYS */;
INSERT INTO `pc_item` VALUES (1,'549425036@qq.com\'s root','2016-06-06 05:39:21',NULL),(2,'计算机视觉','2016-06-06 05:39:35',1),(3,'人脸识别','2016-06-06 05:39:42',2),(9,'IJCB 2014','2016-06-06 14:57:42',3),(10,'IJCB 2014','2016-06-06 14:57:58',9),(11,'ADSC','2016-06-06 14:58:31',9),(12,'CPqD','2016-06-06 14:58:42',9),(13,'SIT','2016-06-06 14:58:47',9),(14,'Ljubljana','2016-06-06 14:59:06',9),(15,'Eigen-PEP','2016-06-10 02:46:23',9),(16,'PEP','2016-06-10 10:23:38',9),(17,'test','2016-06-11 15:56:27',1),(18,'Template Adaptation','2016-06-14 05:13:54',3),(19,'Face Search At Scale','2016-06-15 08:04:15',3);
/*!40000 ALTER TABLE `pc_item` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `pc_knowledge_point` DISABLE KEYS */;
INSERT INTO `pc_knowledge_point` VALUES (13,1,'LBP','2016-06-06 15:00:53','+ **L**ocal **B**inary **P**atterns：局部二值模式）是一种用来描述图像局部纹理特征的算子；它具有旋转不变性和灰度不变性等显著的优点\n+ 原始的LBP算子定义为在3×3的窗口内，以窗口中心像素为阈值，将相邻的8个像素的灰度值与其进行比较，若周围像素值大于中心像素值，则该像素点的位置被标记为1，否则为0。这样，3×3邻域内的8个点经比较可产生8位二进制数（通常转换为十进制数即LBP码，共256种），即得到该窗口中心像素点的LBP值，并用这个值来反映该区域的纹理信息\n+ **LBP旋转不变式**：不断旋转圆形邻域得到一系列初始定义的 LBP值，取其最小值作为该邻域的 LBP 值\n+ **LBP等价模式(Uniform Pattern)**：对LBP特征进行降维的一种方式。当某个LBP所对应的循环二进制数从0到1或从1到0最多有两次跳变时，该LBP所对应的二进制就称为一个等价模式类。如00000000（0次跳变），00000111（只含一次从0到1的跳变），10001111（先由1跳到0，再由0跳到1，共两次跳变）都是等价模式类。除等价模式类以外的模式都归为另一类，称为混合模式类，例如10010111',11),(14,1,'SIFT','2016-06-06 15:01:14','### 简介\n+ **S**cale-**i**nvariant **f**eature **t**ransform：一种检测局部特征的算法，该算法通过求一幅图中的特征点（interest points,or corner points）及其有关scale 和 orientation 的描述子得到特征并进行图像特征点匹配\n+ SIFT特征不只具有尺度不变性，即使改变旋转角度，图像亮度或拍摄视角\n### 具体算法\n没看懂，看上面链接里第二第三条。。。',11),(15,1,'图像降采样','2016-06-06 15:01:34','在原始图片中，每隔n个像素点采集一个像素点',11),(16,1,'WPCA','2016-06-06 15:02:05','+ Whitened Principle Component Analysis\n+ 如果要对矩阵A进行降维，那么要求矩阵A的特征值和特征向量，且取大的特征值与其对应的特征向量相乘，获得一个较矩阵A而言维度较小的矩阵，则为结果矩阵\n+ 见参考链接4',11),(17,1,'GMM','2016-06-06 15:02:52','+ Gaussian mixture models：混合高斯模型\n+ 指对样本的概率密度分布进行估计，而估计的模型是几个高斯模型加权之和（具体是几个要在模型训练前建立好）。每个高斯模型就代表了一个类（一个Cluster）。对样本中的数据分别在几个高斯模型上投影，就会分别得到在各个类上的概率。然后我们可以选取概率最大的类所为判决结果\n+ 参考链接1，2',12),(18,1,'DCT','2016-06-06 16:18:16','+ Discrete Cosine Transform：余弦离散变换\n+ 有一个固定的变换系数矩阵，将图像矩阵和系数矩阵相乘后得到该图像在频域上的矩阵，保留绝对值大的（低频）丢弃绝对值小的（高频），然后再编码传入，可起到压缩作用\n+ 参考链接2',12),(21,1,'Garbor magnitude Feature','2016-06-07 11:26:45','+ Garbor幅值特征\n+ 对原图像的每个点做一个Garbor变换后得到的新图像即为该图像的特征矩阵\n+ 见参考链接1',14),(27,1,'Transfer learning','2016-06-14 05:47:06','+ TL：迁移学习\n+ 简介见参考链接2',18),(28,1,'Face identification','2016-06-14 05:47:06','+ 在一些列图片中找出出现了查询图片中人物的图片\n+ 常用于监控系统以及法医搜索人物',18),(29,1,'Face verification','2016-06-14 05:47:06','+ 计算一张图片和另外一张图片的相似度，以此判定两张图片中的人是否是同一个人\n+ 常用于权限控制以及re-identification',18);
/*!40000 ALTER TABLE `pc_knowledge_point` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `pc_note` DISABLE KEYS */;
INSERT INTO `pc_note` VALUES (10,'note','PaSC(The Point-and-Shoot Face Recognition Challenge)是指直接拍摄人脸识别问题，该paper概述了一个针对PaSC问题的比赛中四个获奖队伍的算法，这个比赛分为两个部分，分别为video-to-video和video-to-still。在video-to-video部分中，算法需要在目标视频集合中找出在待查询视频中出现同样人物的视频。而在video-to-still部分中，算法需要在目标图片集合中找出在待查询视频中出现同样人物的图片。四个获奖队伍分别为：\n\n+ Advanced Digital Science Center(ADSC)\n+ CPqD\n+ Stevens Institute of Technology(SIT)\n+ University of Ljubljana','[\"http://ieeexplore.ieee.org/stamp/stamp.jsp?tp=&arnumber=6996256\"]','The IJCB 2014 PaSC Video Face and Person Recognition Competition'),(11,'note','1. （预处理）将每张图片或者视频中的每一个帧进行一定变换，获得其对应的一张64*64的图片，且在该图片中两个眼睛的坐标在一个固定的位置，且两眼之间的距离恒定为28个像素点\n2. 对于每张预处理后的图片，使用8×8的LBP(Local Binary Patterns)和4×4的SIFT(Scale-Invariant Feature Transform)对图像进行特征提取，分别提取出一个3776维的特征向量和一个2048维的特征向量，再利用WPCA(Whitened Principle Component Analysis)对两个特征向量进行降维，分别降到700和500维\n3. 视频和视频或者视频和图像之间的最终相似度根据以下规则计算：\n	1. 计算待查询视频中每一帧和目标视频中每一帧或者目标图片的cosine similarity\n	2. 对以上计算的结果使用SILD进行投影区分\n	3. 最终平均相似度用于待查询视频中每一帧对目标视频中每一帧或目标图片的相似度','[\"http://blog.csdn.net/zouxy09/article/details/7929531\", \"http://www.360doc.com/content/14/1013/15/18306241_416576994.shtml\", \"http://www.360doc.com/content/14/1013/15/18306241_416573596.shtml\", \"http://www.cnblogs.com/zhangchaoyang/articles/2222048.html\"]','Advanced Digital Science Center'),(12,'note','1. （预处理）将每张图片或者视频中的每一个帧进行一定变换，获得其对应的一张64×80的图片\n2. 对每一张预处理后的图片使用Tan & Triggs normalization进行归一化，以便减小光照的影响\n3. 将图像切分成12×12的块，且每个块在每个方向上有11个像素点的重叠\n4. 将每个块进行归一化使得均值为0，方差为固定值\n5. 对每一个归一化的块，提取其中45个最低2D-DCT系数作为其特征向量\n6. 将待查询视频中的每一个帧和对目标视频的每一个帧或者每一张图片从5中提取出的特征向量进行UBM-GMM算法，推断出该帧与其他所有帧或图片的相似概率，作为client offset（对象偏差）\n7. 还有一个session offset（场景偏差）用于衡量姿势，光照，表情等对相似性可能造成的影响的，但方法没看懂\n8. 将6中的client offset和7中的session offset合起来，就是最终的待查询视频帧和目标视频帧或图片的相似概率','[\"http://blog.csdn.net/hevc_cjl/article/details/9733945\", \"http://blog.csdn.net/manji_lee/article/details/41335307\", \"http://blog.csdn.net/jubincn/article/details/6882179\"]','CPqD'),(13,'note','','[\"\"]','Stevens Institute of Technology'),(14,'note','1. 根据比赛提供的每张图片的眼睛坐标，切割出每张图片中的人脸，且进行归一化处理，且缩放成50×50像素大小\n2. 将1中获取的图片变成灰度图片，然后用一种retina-based normalization的方法进行归一化。这一步最终生成两张照片，一张灰度图，一张归一化后的照片\n3. 接着在特征提取过程中，分别提取两张图的Gabor magnitude features, DCT, LBP, LPQ这四种特征向量，然后用PLDA处理每张图的四个特征向量，再将每一个特征向量用WPCA进行白化降为处理\n4. 最终，每张图片的8个特征向量（2张子图 × 4个特征向量提取方式）分别被基于余弦的评分方法以及基于SVM的评分方法进行评分，并获得16个评分\n5. 4中的16个评分用ZT-normalization进行归一化后通过Linear-logistic-regression-based fusion进行融合，并将融合的结果作为最终的评分','[\"http://www.hcii-lab.net/lianwen/Course/Machine%20Learning/main/notes/Lecture%205%20%CC%D8%D5%F7%CC%E1%C8%A1--Gabor%C2%CB%B2%A8%C6%F7%BC%B0%C6%E4%D3%A6%D3%C3.pdf\"]','University of Ljubljana'),(15,'note','+ PEP representation被证明对人的姿势的鲁棒性非常强\n+ 当PEP representation被运用到视频人脸识别时，他会从所有视频帧中提取出一些图像块，并将这些图像块的描述子链接成一个向量，作为这个视频的PEP representation\n+ 传统PEP representation存在的问题包括：\n	+ 维度过高\n	+ 使用SVM来匹配两个PEP representation这种方法是不可度量的\n	+ 由于PEP是从视频帧中提取出局部信息，因此会丢失很多人脸的外形特征，且同时，PEP可以不断将新的观测对象加入到模型中，但无法及时将旧的观测对象移除出模型\n### 流程\n1. 利用训练视频集合训练一个PEP model\n2. for each frame in the testing video, the PEP representation is partially visualized as the selected image patches of which the patches at the same location are consistent in semantics but varied in appearance across the video frames\n3. visualization of the intermediate video level representation as the pixellevel mean\n4. apply PCA to project the intermediate video level representation into a low-dimensional space to build the Eigen-PEP; the PCA is trained over all video level intermediate representations','[\"\"]','Eigen-PEP for Video Face Recognition'),(16,'note','### 空间-外观特征向量提取\n1. 对于一张图片，将其视为一堆空间-外观特征向量\n2. 对于每一张图片，我们对其进行一定比例的缩放，构建一个三层高斯图像金字塔\n3. 然后针对金字塔的每一层，我们提取出具有重叠的图像块，并将不同层中提取出的图像块等同看待，即一个金字塔可以提取出一个图像块集合\n4. 针对图像块集合中的每一个图像块，生成一个特征向量，该特征向量则为该图像块的外观特征。此外，针对该图像块，我们以其坐标点(x,y)作为其空间特征向量。最后将空间特征向量和外观特征向量连在一起，作为这个图像块的空间-外观特征向量（以下简称特征向量）\n5. 每一个图像块可以以1-4提及的方法生成一个特征向量，那么针对一张图片产生的所有图像块则可以产生一个特征向量集合\n6. 对于一个视频（视频中假设只出现了一个人），那么则针对视频中的每一个帧生成一个特征向量集合，并将所有帧的特征向量集合做并操作，得到的并集合则为该视频的特征向量集合\n7. 5和6中的特征向量集合则为图像或者视频的PEP representation\n### PEM: Probabilistic Elastic Matching\n1. 用训练集中的图像或视频提取出的特征向量集合训练GMM\n2. 对于每一对图片/视频对，我们针对其训练得的GMM模型中的每一个高斯模型，找出其中相似性最高的一堆特征向量，并称其为对应特征对\n3. 将上述对应特征对里两个特征值不完全相同的对应特征对全部联合起来成为一个很长的向量，并传入SVM中对SVM进行训练\n4. 另一个改进就是在GMM中使用贝叶斯网络，并用这个模型来取代初始的GMM。用这种方式的模型，我们称为APEM，而用传统GMM的则称为PEM\n5. ','[\"\"]','Probabilistic Elastic Matching for Pose Variant Face Verification'),(17,'note','<img src=\"/media/images/1465663709_需求_v0.jpg\" />','[\"\"]',''),(18,'note','+ Face Recognition包括Face identification和Face verification\n+ Template是指同一个对象的所有图片或video一起产生的一个representation，可用于匹配\n+ Template adaptation is an example of transfer learning, where the target domain is defined by the set of media of a subject in a template. In general, transfer learning includes a source domain for feature encoding of subjects trained offline, and a specific target domain with limited available observations of new subjects\n+ template adaptation是transfer learning的一种形式。利用一些带标签的数据来训练一个深度卷积神经网络模型，再用template中的所有media来训练一个linear SVM模型。将上述两个模型结合在一起\n+ template adaptation可进一步细分成probe adaptation和gallery adaptation。前者适用于face verification，后者适用于face identification\n#### **probe adaptation**\n##### 目标是训练一个计算相似度的函数s(P, Q)，其中P为目标图像，Q为参考图像。\n1. 对P的所有图片和视频都生成特征向量\n2. 取1中所有特征向量的平均值，并平均向量进行unit normalized，将这个向量作为P的正样本\n3. 针对除了P的其它所有对象，取他们的任意一张图片或视频生成特征向量并进行unit normalized，得到一个特征向量集合作为P的负样本\n4. 利用上面P的正负样本训练一个linear SVM模型，并将模型记为P(x)。P(x)值则代表向量x和3中特征向量的相似度\n5. 针对Q利用1-4的方法同样训练一个linear SVM模型，并将模型记为Q(x)\n6. 把目标P的特征向量记为p，Q的特征向量记为q。计算P(q)和Q(p)。那么s(P,Q)=1/2 * P(q) + 1/2 * Q(p)\n#### **Gallery adaptation**\n##### 形式和probe adaptation差不多，只是计算一个目标图片和所有已知对象之间的相似度。且负样本不是取某个对象的一张图片生成特征向量，而是除自身以外每个对象的平均特征向量的集合作为负样本集合\n#### Media encoding\n##### 针对一个视频，计算每一个帧的特征向量，然后取均值，做unit normalized，得到的向量则为该视频的特诊向量\n1. 用一个最小矩形切除人脸，并不按比例的将图片拉伸成224*224*3的尺寸，以此作为CNN的输入\n2. 通过VGG-Face netword将1中的输入做encoding，对视频的话则取encoding均值，然后做unit normalized\n3. 同一个对象存在多张图片或者视频，根据每一个media生成一个特征向量，则一个对象有一个特征矩阵，这个特征矩阵就是该用户的template。使用该template训练一个linear SVM\n4. ','[\"http://blog.sina.com.cn/s/blog_4a1853330100lui7.html\", \"http://arxiv.org/pdf/1603.03958.pdf\"]','Template Adaptation for Face Verification and Identification'),(19,'note','### 其它\n+ 大规模搜索的两个重要问题：\n	1. 随着图像库规模增大，搜索精度的下降\n	2. 随着图像库规模增大，搜索复杂度上升\n### 步骤\n1. 使用一个根据图片特征值训练的CNN网络，从巨大的图片库中过滤出top-k张和待查询图片相似度最高的图片（快速过滤）\n2. 将这k张图片根据deep features和COTS matcher输出的结合来进行重排序（重排序）\n### 三种主要的近似人脸搜索方法\n1. Inverted Indexing\n2. Hashing\n3. Product Quantization','[\"\"]','Face Search At Scale');
/*!40000 ALTER TABLE `pc_note` ENABLE KEYS */;

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

/*!40000 ALTER TABLE `pc_user` DISABLE KEYS */;
INSERT INTO `pc_user` VALUES (1,'',0,1,'549425036@qq.com','123852');
/*!40000 ALTER TABLE `pc_user` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-26 11:13:44
