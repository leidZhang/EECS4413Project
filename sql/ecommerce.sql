-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (2,'administrator'),(1,'customer');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`) USING BTREE,
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Token',7,'add_token'),(26,'Can change Token',7,'change_token'),(27,'Can delete Token',7,'delete_token'),(28,'Can view Token',7,'view_token'),(29,'Can add token',8,'add_tokenproxy'),(30,'Can change token',8,'change_tokenproxy'),(31,'Can delete token',8,'delete_tokenproxy'),(32,'Can view token',8,'view_tokenproxy'),(33,'Can add brand',9,'add_brand'),(34,'Can change brand',9,'change_brand'),(35,'Can delete brand',9,'delete_brand'),(36,'Can view brand',9,'view_brand'),(37,'Can add category',10,'add_category'),(38,'Can change category',10,'change_category'),(39,'Can delete category',10,'delete_category'),(40,'Can view category',10,'view_category'),(41,'Can add administrator',11,'add_administrator'),(42,'Can change administrator',11,'change_administrator'),(43,'Can delete administrator',11,'delete_administrator'),(44,'Can view administrator',11,'view_administrator'),(45,'Can add customer',12,'add_customer'),(46,'Can change customer',12,'change_customer'),(47,'Can delete customer',12,'delete_customer'),(48,'Can view customer',12,'view_customer'),(49,'Can add product',13,'add_product'),(50,'Can change product',13,'change_product'),(51,'Can delete product',13,'delete_product'),(52,'Can view product',13,'view_product'),(53,'Can add order',14,'add_order'),(54,'Can change order',14,'change_order'),(55,'Can delete order',14,'delete_order'),(56,'Can view order',14,'view_order'),(57,'Can add order item',15,'add_orderitem'),(58,'Can change order item',15,'change_orderitem'),(59,'Can delete order item',15,'delete_orderitem'),(60,'Can view order item',15,'view_orderitem'),(61,'Can add cart',16,'add_cart'),(62,'Can change cart',16,'change_cart'),(63,'Can delete cart',16,'delete_cart'),(64,'Can view cart',16,'view_cart'),(65,'Can add cart item',17,'add_cartitem'),(66,'Can change cart item',17,'change_cartitem'),(67,'Can delete cart item',17,'delete_cartitem'),(68,'Can view cart item',17,'view_cartitem'),(69,'Can add color',18,'add_color'),(70,'Can change color',18,'change_color'),(71,'Can delete color',18,'delete_color'),(72,'Can view color',18,'view_color'),(73,'Can add size',19,'add_size'),(74,'Can change size',19,'change_size'),(75,'Can delete size',19,'delete_size'),(76,'Can view size',19,'view_size'),(77,'Can add inventory',20,'add_inventory'),(78,'Can change inventory',20,'change_inventory'),(79,'Can delete inventory',20,'delete_inventory'),(80,'Can view inventory',20,'view_inventory'),(81,'Can add customer info',21,'add_customerinfo'),(82,'Can change customer info',21,'change_customerinfo'),(83,'Can delete customer info',21,'delete_customerinfo'),(84,'Can view customer info',21,'view_customerinfo');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$MWT40CKVcjg3ofjl2pAtTV$30W6WVAzYaSsAwM8kwnE00/cGBwLxIDiLGSyQUedicw=','2023-12-19 06:45:11.844572',1,'admin','','','admin@ecommerce.com',1,1,'2023-10-29 21:07:18.552059'),(6,'pbkdf2_sha256$600000$cYgyHCPyoGpEqt5T1SePwz$y4tNPrZO1n2IRvwifCIg9+kn97kL4aIwQbgLxC1VmTU=',NULL,0,'lima','','','',0,1,'2023-10-29 22:25:18.000000'),(7,'pbkdf2_sha256$600000$aypZmBtLLD1S07n7qS9GJe$SAXM1bWrS0c9wOMa5pfYQpzNM1/+XTifuT78QBVBq3c=','2023-10-30 16:03:34.136379',0,'js288c','','','',0,1,'2023-10-29 23:18:39.000000'),(8,'pbkdf2_sha256$600000$L47iA561Zh3bzDjb2zflWy$dERNVp9Tz3TU6mBVmLI7Sue7LKQn0XHqMQw0G7XNrhY=',NULL,0,'cindy','','','',0,1,'2023-10-30 04:34:02.379567'),(9,'pbkdf2_sha256$600000$JsgBQic33qDjFYveyfKB24$Iii1OOL3ZaYPIcogN2MvqpnUI8+dhYuYKK1a/XfuTnc=',NULL,0,'test_user','','','',0,1,'2023-11-04 22:05:37.000000'),(10,'pbkdf2_sha256$600000$9ND0vm7biTc9yoKwX1nxfx$SJFnG6e9rwpluCyfkZENspLBT7WYxuGwaPC+wDQ5RD0=','2023-11-13 05:52:07.524621',0,'test_user_a','','','',0,1,'2023-11-13 04:33:57.480062'),(11,'pbkdf2_sha256$600000$ilUB66TU2n6wKaWktfaYsY$7PmpR/mavgkmc0Q/TVFIwXJ4FJkW9w3fsB72wQxGHk8=','2023-11-13 18:57:33.005584',0,'test_user_c','','','',0,1,'2023-11-13 05:52:28.874859'),(12,'pbkdf2_sha256$600000$SMjoe0CUB2NyWRGoYQQvON$4sedqoM9eFal+W1egYdMI6Y2TxskSJTgargAmLxF6aE=',NULL,1,'user','','','laibazahid16@gmail.com',1,1,'2023-12-19 06:28:43.471569');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`) USING BTREE,
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
INSERT INTO `auth_user_groups` VALUES (5,6,1),(4,7,1),(6,8,1),(7,9,1),(8,10,1),(9,11,1);
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`) USING BTREE,
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  UNIQUE KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('ad3a1a9f1ed58d9893b38a67e2e96f6ab3c7af11','2023-11-13 05:52:07.362556',10);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog_inventory`
--

DROP TABLE IF EXISTS `catalog_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stock` int NOT NULL,
  `color_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `size_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `catalog_inventory_product_id_size_id_color_id_5ef39032_uniq` (`product_id`,`size_id`,`color_id`),
  KEY `catalog_inventory_color_id_85767061_fk_data_access_color_id` (`color_id`),
  KEY `catalog_inventory_size_id_8beb3028_fk_data_access_size_id` (`size_id`),
  CONSTRAINT `catalog_inventory_color_id_85767061_fk_data_access_color_id` FOREIGN KEY (`color_id`) REFERENCES `data_access_color` (`id`),
  CONSTRAINT `catalog_inventory_product_id_6f683a4a_fk_data_access_product_id` FOREIGN KEY (`product_id`) REFERENCES `data_access_product` (`id`),
  CONSTRAINT `catalog_inventory_size_id_8beb3028_fk_data_access_size_id` FOREIGN KEY (`size_id`) REFERENCES `data_access_size` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog_inventory`
--

LOCK TABLES `catalog_inventory` WRITE;
/*!40000 ALTER TABLE `catalog_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalog_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_access_brand`
--

DROP TABLE IF EXISTS `data_access_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_access_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_access_brand`
--

LOCK TABLES `data_access_brand` WRITE;
/*!40000 ALTER TABLE `data_access_brand` DISABLE KEYS */;
INSERT INTO `data_access_brand` VALUES (1,'test_brand_1',''),(2,'test_brand_2','');
/*!40000 ALTER TABLE `data_access_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_access_category`
--

DROP TABLE IF EXISTS `data_access_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_access_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_access_category`
--

LOCK TABLES `data_access_category` WRITE;
/*!40000 ALTER TABLE `data_access_category` DISABLE KEYS */;
INSERT INTO `data_access_category` VALUES (1,'Men'),(2,'Women'),(3,'Kids');
/*!40000 ALTER TABLE `data_access_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_access_color`
--

DROP TABLE IF EXISTS `data_access_color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_access_color` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_access_color`
--

LOCK TABLES `data_access_color` WRITE;
/*!40000 ALTER TABLE `data_access_color` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_access_color` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_access_product`
--

DROP TABLE IF EXISTS `data_access_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_access_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `brand_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `data_access_product_brand_id_99f569a1_fk_data_access_brand_id` (`brand_id`) USING BTREE,
  KEY `data_access_product_category_id_c488bb0a_fk_data_acce` (`category_id`) USING BTREE,
  CONSTRAINT `data_access_product_brand_id_99f569a1_fk_data_access_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `data_access_brand` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `data_access_product_category_id_c488bb0a_fk_data_acce` FOREIGN KEY (`category_id`) REFERENCES `data_access_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_access_product`
--

LOCK TABLES `data_access_product` WRITE;
/*!40000 ALTER TABLE `data_access_product` DISABLE KEYS */;
INSERT INTO `data_access_product` VALUES (1,'test_product_1','test_description',10.24,1,2,'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/1150px-React-icon.svg.png'),(2,'test_product_2','test_description',10.24,1,1,'https://vuejs.org/images/logo.png'),(3,'test_product_3','test_description',10.24,1,1,'https://static-00.iconduck.com/assets.00/file-type-angular-icon-1907x2048-tobdkjt1.png'),(4,'test_product_4','test_description',10.24,1,3,'https://gitlab.com/uploads/-/system/project/avatar/31295677/pngwing.com__1_.png'),(5,'test_product_5','test_description',10.24,1,1,'https://vscjava.gallerycdn.vsassets.io/extensions/vscjava/vscode-spring-boot-dashboard/0.13.2023072200/1689984300042/Microsoft.VisualStudio.Services.Icons.Default'),(6,'Nike Air Max 90','Lace up and feel the legacy. Produced at the intersection of art, music and culture, this champion running shoe helped define the ‘90s.',130.00,1,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/323fe23a-d7ff-4ecc-98a1-9c9ca472a91a/air-max-90-mens-shoes-JdKKmQ.png'),(7,'Nike Air Max Alpha Trainer 5','Finish your last rep with power and rack it with a roar that stuns the gym floor in the Nike Air Max Alpha Trainer 5.',95.00,1,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c70443ce-eea5-4c0c-a8a1-44c645165882/air-max-alpha-trainer-5-mens-workout-shoes-7LjRM6.png'),(8,'Nike Air Max 1 SC','Premium leather adorns the wavy mudguard and Swoosh logo, while soft suede and airy underlays nod to the \'87 original. It\'s timeless for a reason.',150.00,1,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/56630978-24cf-4364-a876-7eeb525a0246/air-max-1-sc-mens-shoes-bNNbQl.png'),(9,'Nike Air Max 90','Lace up and feel the legacy. Produced at the intersection of art, music and culture, this champion running shoe helped define the ‘90s',110.97,1,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/23fd664e-2962-4ea1-8389-cf98ac2dd2fc/air-max-90-mens-shoes-mVHjHQ.png'),(10,'Nike Air Max 90 GORE-TEX','Lace up and feel the legacy. These AM90s will keep up with you on all your adventures thanks to a mix of GORE-TEX and mesh materials.',160.00,1,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/2bfeb732-b691-4a21-b8fe-2a4fd3a1cbc7/air-max-90-gore-tex-mens-shoes-cZwz8t.png'),(11,'Nike Air Max 1 Premium','The Air Max 1 \"Dirty Denim\" nods to the coveted 2003 drop that brought an aged-to-perfection look to the leader of the sneaker pack',150.00,1,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/2bfeb732-b691-4a21-b8fe-2a4fd3a1cbc7/air-max-90-gore-tex-mens-shoes-cZwz8t.png'),(12,'Nike Air Max Genome','The low-profile, full-length Air unit adds comfort to match its sleek design that\'s sure to become your new favorite Air Max. This product is made with at least 20% recycled materials by weight.',180.00,1,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/8dcf0af6-4fc8-4f0d-b8b2-0f8104ede799/air-max-genome-mens-shoes-f4SHr3.png'),(13,'Nike Air Max 90','Lace up and feel the legacy. Produced at the intersection of art, music and culture, this champion running shoe helped define the \'90s.',140.00,1,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/693986ef-9586-461d-acbd-88fe9163d733/air-max-90-shoes-NKzt71.png'),(14,'Nike Air Max 97','Push your look full speed ahead with the Nike Air Max 97. Its iconic design takes inspiration from Japanese bullet trains while fresh colors and prints add fast-paced style.',185.00,1,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/1019e829-18a1-452e-80c4-bff500c2750b/air-max-97-mens-shoes-6mZC1L.png'),(15,'Nike Air Max 1 Premium 2','Casual flair 101: Hemp canvas, check. Suede mudguard, check. Crepe outsole aesthetic, check.',180.00,1,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/15030137-f3e4-44c6-8c90-1ec2f210f3bb/air-max-1-premium-2-shoes-Zl7x8b.png'),(16,'Nike Air Max 1 \'86 OG G NRG','It sports the vintage Air Max 1 details you love: Clean lines, no-sew overlays, unmistakable colors and melds them with an outsole ready for the links. Details throughout nod to this prestigious tournament.',180.00,1,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/f7a97c2b-22c3-4a3f-bfd6-7f33960fc723/air-max-1-86-og-g-nrg-mens-golf-shoes-q2mp7S.png'),(17,'Nike Air Force 1 Shadow','Layered materials like linen-evoking textiles and synthetic leather pair with an exaggerated midsole and a pop of pastels to bring you double the style.',170.00,1,2,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0a588d2e-8d93-4937-8091-ec1270a953cf/air-force-1-shadow-shoes-FP6HDr.png'),(18,'Nike Dunk Low LX NBHD','It\'s always a good day when a fresh Dunk drops. This one pairs smooth leather with denim for a look that\'s harmonious but never boring.',165.00,1,2,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d015d68b-1318-4c9d-bc79-9ac67c01cae4/dunk-low-lx-nbhd-shoes-FSR49l.png'),(19,'Nike Dunk Low By You','Created for the hardwood but taken to the streets, the \'80s b-ball icon returns with a new design thought up by you',160.00,1,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/faaf3507-02d4-4e48-b7d9-899b2a971988/custom-nike-dunk-low-by-you.png'),(20,'Nike Dunk Low','Durable synthetic leather gives you a classic \'80s feel while the rubber sole offers grip and traction.',120.00,1,3,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a499ec53-6b2e-4ec9-81b3-2438f991c362/dunk-low-older-shoes-M4W67n.png'),(21,'Air Jordan 1 Low SE','These season-ready kicks come with a bevy of wintry details: iced clear outsole, \"frozen\" textured leather overlays and that glitter-filled Swoosh inspired by a swirling snow globe. Shake up your winter look.',110.00,1,3,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/dbacc76d-503e-44ba-9311-6e25ddc70372/air-jordan-1-low-se-older-shoes-nMMSgD.png'),(22,'Air Jordan 1 Low SE','And with premium materials and Nike Air cushioning, this pair will stay in your sneaker rotation for seasons to come.',110.00,1,3,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/b1ec68c1-af29-49c6-908b-50053f33ff60/air-jordan-1-low-se-older-shoes-L4whnR.png'),(23,'Superfly 9 Pro','Zoom Air cushioning under the heel gives them bouncy comfort that lasts the entire game. Plus, they\'re laceless for a slip-on fit.',155.00,2,3,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/7de822b1-2a73-4997-b1bd-ea68ccdd50cd/jr-mercurial-superfly-9-pro-mercurial-dream-speed-younger-older-fg-high-top-football-boot-GB97x6.png'),(24,'Marcus Rashford','Designed for players who want to take their game to the next level, the Nike Jr. football boot helps you play with confidence.',170.00,2,3,'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/7ecc716d-8ba8-4526-87fd-19af3ff76003/jr-mercurial-superfly-9-pro-marcus-rashford-younger-older-football-boot-6s6PLZ.png'),(25,'KM FG/MG','Designed for versatility from artificial grass to real grass, they have the traction you need to run and cut on all different types of pitches.',150.00,2,3,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/5634ed97-c418-4d45-b48f-027cfb26d481/jr-mercurial-superfly-9-pro-km-fg-mg-younger-older-multi-ground-high-top-football-boot-m91NFk.png'),(26,'Nike Phantom Luna FG By You','Empower your design eye and open a world of on-pitch possibilities in the Phantom Luna By You.',190.00,2,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/7a350330-cbf0-43d2-b51f-f22de99ce74f/custom-phantom-luna-academy-by-you.png'),(27,'Superfly 9 Academy By You','Express your creative side with an array of vibrant, eye-catching colours that are tuned for your distinct, brash style.',165.00,2,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/5b636d2d-0487-4151-97aa-7d9a150839a8/custom-mercurial-superfly-9-academy-shoes-by-you.png'),(28,'9 Academy Mercurial Dream','Loaded with a football-specific Zoom Air unit, the Academy boot helps you take your game to the next level and put the pedal down in the waning minutes of a match—when it matters most.',145.00,2,2,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/31d522b5-cd12-4593-b2da-02ce5563d978/superfly-9-academy-mercurial-dream-speed-mg-high-top-football-boot-39fWKG.png'),(29,'Nike Phantom GX Elite SE','Designed for those obsessed with perfecting their craft, it helps you make precision cuts when the game\'s intensity heats up, while innovative Nike Gripknit offers exceptional touch.',375.00,2,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d7a05137-69bd-4e56-825b-498f5617360c/phantom-gx-elite-se-fg-low-top-football-boot-kDqHBX.png'),(30,'9 Elite Mercurial Dream','You\'ve perfected your skill through endless training and channelled your inner fire into your craft. Now, when the weight of the match is squarely on your shoulders, rise to the occasion and deliver',385.00,2,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/36a7d256-5bf5-4eb8-a73a-26c483bd7329/superfly-9-elite-mercurial-dream-speed-fg-high-top-football-boot-5bSdgn.png'),(31,'Nike Phantom Luna Elite SE','Designed for those obsessed with perfecting their craft, it helps you make precision cuts when the game\'s intensity heats up, while innovative Nike Gripknit offers exceptional touch.',385.00,2,1,'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/4cdc966c-3c8c-469e-90b8-9373b5f59e04/phantom-luna-elite-se-fg-football-boot-5JHJmH.png');
/*!40000 ALTER TABLE `data_access_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `data_access_size`
--

DROP TABLE IF EXISTS `data_access_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `data_access_size` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `data_access_size`
--

LOCK TABLES `data_access_size` WRITE;
/*!40000 ALTER TABLE `data_access_size` DISABLE KEYS */;
/*!40000 ALTER TABLE `data_access_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`) USING BTREE,
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-10-29 21:09:43.185004','1','customer',1,'[{\"added\": {}}]',3,1),(2,'2023-10-29 21:10:05.169603','2','administrator',1,'[{\"added\": {}}]',3,1),(3,'2023-10-29 21:10:57.477876','2','test_customer_1',1,'[{\"added\": {}}]',4,1),(4,'2023-10-29 21:11:07.476354','2','test_customer_1',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(5,'2023-10-29 21:11:45.711605','3','test_customer_2',1,'[{\"added\": {}}]',4,1),(6,'2023-10-29 21:11:53.578384','3','test_customer_2',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(7,'2023-10-29 21:12:18.193594','4','test_admin_1',1,'[{\"added\": {}}]',4,1),(8,'2023-10-29 22:23:51.700338','4','test_admin_1',3,'',4,1),(9,'2023-10-29 22:23:52.226336','2','test_customer_1',3,'',4,1),(10,'2023-10-29 22:23:52.340339','3','test_customer_2',3,'',4,1),(11,'2023-10-29 22:24:12.454165','5','lima',1,'[{\"added\": {}}]',4,1),(12,'2023-10-29 22:24:23.846297','5','lima',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(13,'2023-10-29 22:24:54.673562','5','lima',3,'',4,1),(14,'2023-10-29 22:25:18.595877','6','lima',1,'[{\"added\": {}}]',4,1),(15,'2023-10-30 04:31:18.418658','7','js288c',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(16,'2023-10-30 04:31:23.893906','6','lima',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(17,'2023-10-30 14:17:50.412504','1','test_brand',1,'[{\"added\": {}}]',9,1),(18,'2023-10-30 14:17:59.481918','1','test_category',1,'[{\"added\": {}}]',10,1),(19,'2023-10-30 14:36:02.022424','1','test_product',1,'[{\"added\": {}}]',13,1),(20,'2023-11-04 22:05:37.376774','9','test_user',1,'[{\"added\": {}}]',4,1),(21,'2023-11-04 22:05:43.550791','9','test_user',2,'[{\"changed\": {\"fields\": [\"Groups\"]}}]',4,1),(22,'2023-11-25 18:05:43.823461','7','js288c',1,'[{\"added\": {}}, {\"added\": {\"name\": \"cart item\", \"object\": \"product\"}}]',16,1),(23,'2023-12-19 06:45:50.969304','3','Kids',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',10,1),(24,'2023-12-19 06:45:57.712769','2','Women',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',10,1),(25,'2023-12-19 06:46:03.673022','1','Men',2,'[{\"changed\": {\"fields\": [\"Title\"]}}]',10,1),(26,'2023-12-19 06:49:04.713136','5','test_product_5',3,'',13,1),(27,'2023-12-19 06:49:04.733352','3','test_product_3',3,'',13,1),(28,'2023-12-19 06:49:04.741536','2','test_product_2',3,'',13,1),(29,'2023-12-19 06:57:13.416232','17','Nike Air Force 1 Shadow',1,'[{\"added\": {}}]',13,1),(30,'2023-12-19 06:58:08.498514','18','Nike Dunk Low LX NBHD',1,'[{\"added\": {}}]',13,1),(31,'2023-12-19 06:59:06.858808','19','Nike Dunk Low By You',1,'[{\"added\": {}}]',13,1),(32,'2023-12-19 07:00:28.305670','20','Nike Dunk Low',1,'[{\"added\": {}}]',13,1),(33,'2023-12-19 07:01:21.983380','21','Air Jordan 1 Low SE',1,'[{\"added\": {}}]',13,1),(34,'2023-12-19 07:03:29.693252','22','Air Jordan 1 Low SE',1,'[{\"added\": {}}]',13,1),(35,'2023-12-19 07:05:05.070972','23','Superfly 9 Pro',1,'[{\"added\": {}}]',13,1),(36,'2023-12-19 07:05:59.768509','24','Marcus Rashford',1,'[{\"added\": {}}]',13,1),(37,'2023-12-19 07:07:10.769935','25','KM FG/MG',1,'[{\"added\": {}}]',13,1),(38,'2023-12-19 07:08:57.844752','26','Nike Phantom Luna FG By You',1,'[{\"added\": {}}]',13,1),(39,'2023-12-19 07:09:38.765044','27','Superfly 9 Academy By You',1,'[{\"added\": {}}]',13,1),(40,'2023-12-19 07:10:27.671559','28','9 Academy Mercurial Dream',1,'[{\"added\": {}}]',13,1),(41,'2023-12-19 07:11:35.101355','29','Nike Phantom GX Elite SE',1,'[{\"added\": {}}]',13,1),(42,'2023-12-19 07:12:28.527947','30','9 Elite Mercurial Dream',1,'[{\"added\": {}}]',13,1),(43,'2023-12-19 07:13:09.549813','31','Nike Phantom Luna Elite SE',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(8,'authtoken','tokenproxy'),(20,'catalog','inventory'),(5,'contenttypes','contenttype'),(9,'data_access','brand'),(10,'data_access','category'),(18,'data_access','color'),(13,'data_access','product'),(19,'data_access','size'),(11,'identity','administrator'),(12,'identity','customer'),(21,'identity','customerinfo'),(14,'ordering','order'),(15,'ordering','orderitem'),(6,'sessions','session'),(16,'shopping_cart','cart'),(17,'shopping_cart','cartitem');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-10-29 21:06:03.093861'),(2,'auth','0001_initial','2023-10-29 21:06:06.068990'),(3,'admin','0001_initial','2023-10-29 21:06:06.623821'),(4,'admin','0002_logentry_remove_auto_add','2023-10-29 21:06:06.662564'),(5,'admin','0003_logentry_add_action_flag_choices','2023-10-29 21:06:06.698130'),(6,'contenttypes','0002_remove_content_type_name','2023-10-29 21:06:07.044659'),(7,'auth','0002_alter_permission_name_max_length','2023-10-29 21:06:07.345578'),(8,'auth','0003_alter_user_email_max_length','2023-10-29 21:06:07.427114'),(9,'auth','0004_alter_user_username_opts','2023-10-29 21:06:07.469319'),(10,'auth','0005_alter_user_last_login_null','2023-10-29 21:06:07.699112'),(11,'auth','0006_require_contenttypes_0002','2023-10-29 21:06:07.731619'),(12,'auth','0007_alter_validators_add_error_messages','2023-10-29 21:06:07.762524'),(13,'auth','0008_alter_user_username_max_length','2023-10-29 21:06:07.982393'),(14,'auth','0009_alter_user_last_name_max_length','2023-10-29 21:06:08.252163'),(15,'auth','0010_alter_group_name_max_length','2023-10-29 21:06:08.321783'),(16,'auth','0011_update_proxy_permissions','2023-10-29 21:06:08.362438'),(17,'auth','0012_alter_user_first_name_max_length','2023-10-29 21:06:08.618237'),(18,'sessions','0001_initial','2023-10-29 21:06:08.830195'),(19,'authtoken','0001_initial','2023-10-29 22:11:47.172795'),(20,'authtoken','0002_auto_20160226_1747','2023-10-29 22:11:47.224235'),(21,'authtoken','0003_tokenproxy','2023-10-29 22:11:47.249164'),(22,'data_access','0001_initial','2023-10-30 14:13:09.085872'),(23,'identity','0001_initial','2023-10-30 14:13:09.247704'),(24,'data_access','0002_brand_image','2023-10-30 14:25:32.959807'),(25,'data_access','0003_product','2023-10-30 14:34:46.209490'),(26,'ordering','0001_initial','2023-11-04 21:29:22.970086'),(27,'shopping_cart','0001_initial','2023-11-04 21:29:23.884596'),(28,'shopping_cart','0002_rename_items_cart_products_and_more','2023-11-04 22:17:27.602342'),(29,'ordering','0002_rename_items_order_products_and_more','2023-11-04 22:44:42.498651'),(30,'data_access','0004_product_inventory','2023-11-04 23:14:02.287708'),(31,'ordering','0003_order_status','2023-11-04 23:58:45.976459'),(32,'data_access','0005_product_image_url','2023-11-25 23:21:15.931318'),(33,'data_access','0006_rename_image_url_product_image','2023-11-26 00:08:16.456304'),(34,'data_access','0002_color_size_remove_product_inventory_inventory','2023-12-14 21:36:05.692123'),(35,'data_access','0003_rename_color_id_inventory_color_and_more','2023-12-14 21:36:06.394942'),(36,'data_access','0004_delete_inventory','2023-12-14 21:36:06.455096'),(37,'catalog','0001_initial','2023-12-14 21:36:06.915075'),(38,'identity','0002_customerinfo','2023-12-18 02:58:22.388948'),(39,'identity','0003_remove_customerinfo_id_alter_customerinfo_customer','2023-12-18 02:58:23.055266'),(40,'identity','0004_alter_customerinfo_address_2','2023-12-18 02:58:23.087709'),(41,'shopping_cart','0002_alter_cart_total','2023-12-18 02:58:23.139262'),(42,'ordering','0002_alter_order_status','2023-12-19 01:15:55.400718'),(43,'ordering','0003_alter_orderitem_options_alter_order_status','2023-12-19 04:46:12.754893');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  KEY `django_session_expire_date_a5c62663` (`expire_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4qgcyovx2r3rox4czscz7v2cla4jjzwx','.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1r40MW:crm3r0NmT45pN8fqQE-4FyNPzBTDIXiuP16nvQ0UnSE','2023-12-01 15:02:28.480215'),('5jx26tvub3gi2or49y5ak4veb9b534pc','.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1rFTqp:qIF-7WSJ589aPqiWKCQDolDCbkXjdCaxS1ls6XtWjHE','2024-01-02 06:45:11.855573'),('7kbt2bk2nknmyjag85cakahhn99e07r5','.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1qxUCR:rJd59Ee2Cw8TJc_EDSNaKK6U-d5geX0RlaFP7zk4rL8','2023-11-13 15:29:07.696748'),('7nlew0pqj9jvol1u1sskqmvoazbv68ru','.eJxVjD0OwyAUg-_CXCF-HgE6ds8ZEDygpK1ACslU9e4NUoZ2sSx_tt_E-X0rbu9pdUskV8LJ5TcLHp-pDhAfvt4bxVa3dQl0VOhJO51bTK_b2f07KL6XsfZZMWvRCIHaGAYcWeJZCJVsiOCnSbLDMtBKQwZpEkcU-hCulTRAPl_Mjjbo:1qxD0V:4Z3AuRHumOYauBNaT_Y26f1VZaomOXImfDQfnq3g2xQ','2023-11-12 21:07:39.652874'),('gfxpzji35fhqxqhpe69akl24d5s6s6wk','.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1qzOlZ:PhGt4YP0UT-tnt2FTNBc9RPYcKDTNwfLY-QE_zuzP0s','2023-11-18 22:05:17.577668'),('gmyj5ak95qq1558m55nfg96vy0bcq71h','.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1r3KlA:6DQ1uulptici9KOoaD8bu3Zrje1gCngyJ484zm8lzag','2023-11-29 18:37:08.031665'),('qkhu7c38owwhma0pytcvvmp64ga67im4','.eJxVjD0OwyAUg-_CXCF-HgE6ds8ZEDygpK1ACslU9e4NUoZ2sSx_tt_E-X0rbu9pdUskV8LJ5TcLHp-pDhAfvt4bxVa3dQl0VOhJO51bTK_b2f07KL6XsfZZMWvRCIHaGAYcWeJZCJVsiOCnSbLDMtBKQwZpEkcU-hCulTRAPl_Mjjbo:1qxF3Y:lDPdtOHdF2W8R-4PWjRw1CfX-N8ajBDeHNCqK2j4WiI','2023-11-12 23:18:56.906549'),('qovrewrw9i1de7j96f44767ywbbv01ha','.eJxVjMEOwiAQRP-FsyHFXSj16N1vIEt3kaqBpLQn47_bJj3obTLvzbxVoHXJYW0yh4nVRRmjTr9lpPEpZSf8oHKveqxlmaeod0UftOlbZXldD_fvIFPL21pYkMgx2YiDt4aSG2AAJHQevJyNT5YjYOoJtuxGQGQnmGwnfYegPl8TeDfj:1r2c7p:Ve9zbjeI90JW9HUQAdlo26Izd0MZBYrEe6tBLLDW0vg','2023-11-27 18:57:33.070914'),('xfsu8qqtn8wsiy288diuhj7nqlr7yebh','.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1r38YG:A6NQmuAjC8_MQqj5jYKDFE2kxkvUlc3bGli-a-Rrqd4','2023-11-29 05:35:00.461903');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `identity_customerinfo`
--

DROP TABLE IF EXISTS `identity_customerinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `identity_customerinfo` (
  `phone_num` varchar(10) NOT NULL,
  `address_1` varchar(255) NOT NULL,
  `address_2` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `province` varchar(2) NOT NULL,
  `postal_code` varchar(7) NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`customer_id`),
  CONSTRAINT `identity_customerinfo_customer_id_6263a0a4_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `identity_customerinfo`
--

LOCK TABLES `identity_customerinfo` WRITE;
/*!40000 ALTER TABLE `identity_customerinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `identity_customerinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordering_checkout`
--

DROP TABLE IF EXISTS `ordering_checkout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordering_checkout` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` decimal(6,2) NOT NULL,
  `date` date NOT NULL,
  `customer_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordering_checkout`
--

LOCK TABLES `ordering_checkout` WRITE;
/*!40000 ALTER TABLE `ordering_checkout` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordering_checkout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordering_order`
--

DROP TABLE IF EXISTS `ordering_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordering_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` decimal(6,2) NOT NULL,
  `date` date NOT NULL,
  `customer_id` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ordering_order_customer_id_db5570b3_fk_auth_user_id` (`customer_id`) USING BTREE,
  KEY `ordering_order_date_69350568` (`date`) USING BTREE,
  CONSTRAINT `ordering_order_customer_id_db5570b3_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordering_order`
--

LOCK TABLES `ordering_order` WRITE;
/*!40000 ALTER TABLE `ordering_order` DISABLE KEYS */;
INSERT INTO `ordering_order` VALUES (1,0.00,'2023-11-04',1,'processing'),(2,0.00,'2023-11-04',1,'processing'),(3,0.00,'2023-11-13',9,'processing'),(4,0.00,'2023-11-13',11,'processing'),(8,71.68,'2023-11-26',1,'processing'),(9,10.24,'2023-11-26',1,'processing'),(10,117.76,'2023-11-28',1,'processing');
/*!40000 ALTER TABLE `ordering_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordering_orderitem`
--

DROP TABLE IF EXISTS `ordering_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordering_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `product_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ordering_orderitem_order_id_050e4dc5_fk_ordering_order_id` (`order_id`) USING BTREE,
  KEY `ordering_orderitem_product_id_174724c2_fk_data_access_product_id` (`product_id`) USING BTREE,
  CONSTRAINT `ordering_orderitem_order_id_050e4dc5_fk_ordering_order_id` FOREIGN KEY (`order_id`) REFERENCES `ordering_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordering_orderitem_product_id_174724c2_fk_data_access_product_id` FOREIGN KEY (`product_id`) REFERENCES `data_access_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordering_orderitem`
--

LOCK TABLES `ordering_orderitem` WRITE;
/*!40000 ALTER TABLE `ordering_orderitem` DISABLE KEYS */;
INSERT INTO `ordering_orderitem` VALUES (1,1,1,1),(2,2,1,2),(4,2,1,8),(5,1,2,8),(6,2,3,8),(7,2,4,8),(8,1,1,9),(9,4,1,10),(10,2,2,10),(11,4,3,10);
/*!40000 ALTER TABLE `ordering_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_cart`
--

DROP TABLE IF EXISTS `shopping_cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_cart` (
  `customer_id` int NOT NULL,
  `total` decimal(6,2) NOT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE,
  CONSTRAINT `shopping_cart_cart_customer_id_154999cc_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_cart`
--

LOCK TABLES `shopping_cart_cart` WRITE;
/*!40000 ALTER TABLE `shopping_cart_cart` DISABLE KEYS */;
INSERT INTO `shopping_cart_cart` VALUES (1,30.72),(6,0.00),(7,0.00);
/*!40000 ALTER TABLE `shopping_cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shopping_cart_cartitem`
--

DROP TABLE IF EXISTS `shopping_cart_cartitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shopping_cart_cartitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `cart_id` int NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `shopping_cart_cartit_cart_id_adaf8330_fk_shopping_` (`cart_id`) USING BTREE,
  KEY `shopping_cart_cartit_product_id_327be483_fk_data_acce` (`product_id`) USING BTREE,
  CONSTRAINT `shopping_cart_cartit_cart_id_adaf8330_fk_shopping_` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart_cart` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shopping_cart_cartit_product_id_327be483_fk_data_acce` FOREIGN KEY (`product_id`) REFERENCES `data_access_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shopping_cart_cartitem`
--

LOCK TABLES `shopping_cart_cartitem` WRITE;
/*!40000 ALTER TABLE `shopping_cart_cartitem` DISABLE KEYS */;
INSERT INTO `shopping_cart_cartitem` VALUES (19,1,7,1),(30,2,1,1),(31,1,1,2);
/*!40000 ALTER TABLE `shopping_cart_cartitem` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-19  2:15:36
