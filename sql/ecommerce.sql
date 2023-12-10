/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : ecommerce

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 09/12/2023 23:13:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES (2, 'administrator');
INSERT INTO `auth_group` VALUES (1, 'customer');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id` ASC, `codename` ASC) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 85 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add Token', 7, 'add_token');
INSERT INTO `auth_permission` VALUES (26, 'Can change Token', 7, 'change_token');
INSERT INTO `auth_permission` VALUES (27, 'Can delete Token', 7, 'delete_token');
INSERT INTO `auth_permission` VALUES (28, 'Can view Token', 7, 'view_token');
INSERT INTO `auth_permission` VALUES (29, 'Can add token', 8, 'add_tokenproxy');
INSERT INTO `auth_permission` VALUES (30, 'Can change token', 8, 'change_tokenproxy');
INSERT INTO `auth_permission` VALUES (31, 'Can delete token', 8, 'delete_tokenproxy');
INSERT INTO `auth_permission` VALUES (32, 'Can view token', 8, 'view_tokenproxy');
INSERT INTO `auth_permission` VALUES (33, 'Can add brand', 9, 'add_brand');
INSERT INTO `auth_permission` VALUES (34, 'Can change brand', 9, 'change_brand');
INSERT INTO `auth_permission` VALUES (35, 'Can delete brand', 9, 'delete_brand');
INSERT INTO `auth_permission` VALUES (36, 'Can view brand', 9, 'view_brand');
INSERT INTO `auth_permission` VALUES (37, 'Can add category', 10, 'add_category');
INSERT INTO `auth_permission` VALUES (38, 'Can change category', 10, 'change_category');
INSERT INTO `auth_permission` VALUES (39, 'Can delete category', 10, 'delete_category');
INSERT INTO `auth_permission` VALUES (40, 'Can view category', 10, 'view_category');
INSERT INTO `auth_permission` VALUES (41, 'Can add administrator', 11, 'add_administrator');
INSERT INTO `auth_permission` VALUES (42, 'Can change administrator', 11, 'change_administrator');
INSERT INTO `auth_permission` VALUES (43, 'Can delete administrator', 11, 'delete_administrator');
INSERT INTO `auth_permission` VALUES (44, 'Can view administrator', 11, 'view_administrator');
INSERT INTO `auth_permission` VALUES (45, 'Can add customer', 12, 'add_customer');
INSERT INTO `auth_permission` VALUES (46, 'Can change customer', 12, 'change_customer');
INSERT INTO `auth_permission` VALUES (47, 'Can delete customer', 12, 'delete_customer');
INSERT INTO `auth_permission` VALUES (48, 'Can view customer', 12, 'view_customer');
INSERT INTO `auth_permission` VALUES (49, 'Can add product', 13, 'add_product');
INSERT INTO `auth_permission` VALUES (50, 'Can change product', 13, 'change_product');
INSERT INTO `auth_permission` VALUES (51, 'Can delete product', 13, 'delete_product');
INSERT INTO `auth_permission` VALUES (52, 'Can view product', 13, 'view_product');
INSERT INTO `auth_permission` VALUES (53, 'Can add order', 14, 'add_order');
INSERT INTO `auth_permission` VALUES (54, 'Can change order', 14, 'change_order');
INSERT INTO `auth_permission` VALUES (55, 'Can delete order', 14, 'delete_order');
INSERT INTO `auth_permission` VALUES (56, 'Can view order', 14, 'view_order');
INSERT INTO `auth_permission` VALUES (57, 'Can add order item', 15, 'add_orderitem');
INSERT INTO `auth_permission` VALUES (58, 'Can change order item', 15, 'change_orderitem');
INSERT INTO `auth_permission` VALUES (59, 'Can delete order item', 15, 'delete_orderitem');
INSERT INTO `auth_permission` VALUES (60, 'Can view order item', 15, 'view_orderitem');
INSERT INTO `auth_permission` VALUES (61, 'Can add cart', 16, 'add_cart');
INSERT INTO `auth_permission` VALUES (62, 'Can change cart', 16, 'change_cart');
INSERT INTO `auth_permission` VALUES (63, 'Can delete cart', 16, 'delete_cart');
INSERT INTO `auth_permission` VALUES (64, 'Can view cart', 16, 'view_cart');
INSERT INTO `auth_permission` VALUES (65, 'Can add cart item', 17, 'add_cartitem');
INSERT INTO `auth_permission` VALUES (66, 'Can change cart item', 17, 'change_cartitem');
INSERT INTO `auth_permission` VALUES (67, 'Can delete cart item', 17, 'delete_cartitem');
INSERT INTO `auth_permission` VALUES (68, 'Can view cart item', 17, 'view_cartitem');
INSERT INTO `auth_permission` VALUES (69, 'Can add color', 18, 'add_color');
INSERT INTO `auth_permission` VALUES (70, 'Can change color', 18, 'change_color');
INSERT INTO `auth_permission` VALUES (71, 'Can delete color', 18, 'delete_color');
INSERT INTO `auth_permission` VALUES (72, 'Can view color', 18, 'view_color');
INSERT INTO `auth_permission` VALUES (73, 'Can add size', 19, 'add_size');
INSERT INTO `auth_permission` VALUES (74, 'Can change size', 19, 'change_size');
INSERT INTO `auth_permission` VALUES (75, 'Can delete size', 19, 'delete_size');
INSERT INTO `auth_permission` VALUES (76, 'Can view size', 19, 'view_size');
INSERT INTO `auth_permission` VALUES (77, 'Can add inventory', 20, 'add_inventory');
INSERT INTO `auth_permission` VALUES (78, 'Can change inventory', 20, 'change_inventory');
INSERT INTO `auth_permission` VALUES (79, 'Can delete inventory', 20, 'delete_inventory');
INSERT INTO `auth_permission` VALUES (80, 'Can view inventory', 20, 'view_inventory');
INSERT INTO `auth_permission` VALUES (81, 'Can add inventory', 21, 'add_inventory');
INSERT INTO `auth_permission` VALUES (82, 'Can change inventory', 21, 'change_inventory');
INSERT INTO `auth_permission` VALUES (83, 'Can delete inventory', 21, 'delete_inventory');
INSERT INTO `auth_permission` VALUES (84, 'Can view inventory', 21, 'view_inventory');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(254) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$600000$MWT40CKVcjg3ofjl2pAtTV$30W6WVAzYaSsAwM8kwnE00/cGBwLxIDiLGSyQUedicw=', '2023-12-10 04:09:14.245452', 1, 'admin', '', '', 'admin@ecommerce.com', 1, 1, '2023-10-29 21:07:18.552059');
INSERT INTO `auth_user` VALUES (6, 'pbkdf2_sha256$600000$cYgyHCPyoGpEqt5T1SePwz$y4tNPrZO1n2IRvwifCIg9+kn97kL4aIwQbgLxC1VmTU=', NULL, 0, 'lima', '', '', '', 0, 1, '2023-10-29 22:25:18.000000');
INSERT INTO `auth_user` VALUES (7, 'pbkdf2_sha256$600000$aypZmBtLLD1S07n7qS9GJe$SAXM1bWrS0c9wOMa5pfYQpzNM1/+XTifuT78QBVBq3c=', '2023-10-30 16:03:34.136379', 0, 'js288c', '', '', '', 0, 1, '2023-10-29 23:18:39.000000');
INSERT INTO `auth_user` VALUES (8, 'pbkdf2_sha256$600000$L47iA561Zh3bzDjb2zflWy$dERNVp9Tz3TU6mBVmLI7Sue7LKQn0XHqMQw0G7XNrhY=', NULL, 0, 'cindy', '', '', '', 0, 1, '2023-10-30 04:34:02.379567');
INSERT INTO `auth_user` VALUES (9, 'pbkdf2_sha256$600000$JsgBQic33qDjFYveyfKB24$Iii1OOL3ZaYPIcogN2MvqpnUI8+dhYuYKK1a/XfuTnc=', NULL, 0, 'test_user', '', '', '', 0, 1, '2023-11-04 22:05:37.000000');
INSERT INTO `auth_user` VALUES (10, 'pbkdf2_sha256$600000$9ND0vm7biTc9yoKwX1nxfx$SJFnG6e9rwpluCyfkZENspLBT7WYxuGwaPC+wDQ5RD0=', '2023-11-13 05:52:07.524621', 0, 'test_user_a', '', '', '', 0, 1, '2023-11-13 04:33:57.480062');
INSERT INTO `auth_user` VALUES (11, 'pbkdf2_sha256$600000$ilUB66TU2n6wKaWktfaYsY$7PmpR/mavgkmc0Q/TVFIwXJ4FJkW9w3fsB72wQxGHk8=', '2023-11-13 18:57:33.005584', 0, 'test_user_c', '', '', '', 0, 1, '2023-11-13 05:52:28.874859');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_groups_user_id_group_id_94350c0c_uniq`(`user_id` ASC, `group_id` ASC) USING BTREE,
  INDEX `auth_user_groups_group_id_97559544_fk_auth_group_id`(`group_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------
INSERT INTO `auth_user_groups` VALUES (5, 6, 1);
INSERT INTO `auth_user_groups` VALUES (4, 7, 1);
INSERT INTO `auth_user_groups` VALUES (6, 8, 1);
INSERT INTO `auth_user_groups` VALUES (7, 9, 1);
INSERT INTO `auth_user_groups` VALUES (8, 10, 1);
INSERT INTO `auth_user_groups` VALUES (9, 11, 1);

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq`(`user_id` ASC, `permission_id` ASC) USING BTREE,
  INDEX `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm`(`permission_id` ASC) USING BTREE,
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for authtoken_token
-- ----------------------------
DROP TABLE IF EXISTS `authtoken_token`;
CREATE TABLE `authtoken_token`  (
  `key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of authtoken_token
-- ----------------------------
INSERT INTO `authtoken_token` VALUES ('84da652429c0742ca61cbc89e84b437cda41d65a', '2023-11-25 18:58:33.291151', 1);
INSERT INTO `authtoken_token` VALUES ('ad3a1a9f1ed58d9893b38a67e2e96f6ab3c7af11', '2023-11-13 05:52:07.362556', 10);

-- ----------------------------
-- Table structure for catalog_inventory
-- ----------------------------
DROP TABLE IF EXISTS `catalog_inventory`;
CREATE TABLE `catalog_inventory`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `stock` int NOT NULL,
  `color_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `size_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `catalog_inventory_color_id_85767061_fk_data_access_color_id`(`color_id` ASC) USING BTREE,
  INDEX `catalog_inventory_size_id_8beb3028_fk_data_access_size_id`(`size_id` ASC) USING BTREE,
  UNIQUE INDEX `catalog_inventory_product_id_size_id_color_id_5ef39032_uniq`(`product_id` ASC, `size_id` ASC, `color_id` ASC) USING BTREE,
  CONSTRAINT `catalog_inventory_color_id_85767061_fk_data_access_color_id` FOREIGN KEY (`color_id`) REFERENCES `data_access_color` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `catalog_inventory_product_id_6f683a4a_fk_data_access_product_id` FOREIGN KEY (`product_id`) REFERENCES `data_access_product` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `catalog_inventory_size_id_8beb3028_fk_data_access_size_id` FOREIGN KEY (`size_id`) REFERENCES `data_access_size` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of catalog_inventory
-- ----------------------------
INSERT INTO `catalog_inventory` VALUES (1, 100, 1, 1, 6);
INSERT INTO `catalog_inventory` VALUES (2, 100, 3, 2, 4);
INSERT INTO `catalog_inventory` VALUES (3, 100, 3, 3, 6);
INSERT INTO `catalog_inventory` VALUES (4, 0, 2, 4, 5);
INSERT INTO `catalog_inventory` VALUES (5, 0, 3, 5, 6);
INSERT INTO `catalog_inventory` VALUES (6, 100, 2, 1, 6);

-- ----------------------------
-- Table structure for data_access_brand
-- ----------------------------
DROP TABLE IF EXISTS `data_access_brand`;
CREATE TABLE `data_access_brand`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_access_brand
-- ----------------------------
INSERT INTO `data_access_brand` VALUES (1, 'test_brand_1', '');
INSERT INTO `data_access_brand` VALUES (2, 'test_brand_2', '');
INSERT INTO `data_access_brand` VALUES (3, 'test_brand_3', '');

-- ----------------------------
-- Table structure for data_access_category
-- ----------------------------
DROP TABLE IF EXISTS `data_access_category`;
CREATE TABLE `data_access_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_access_category
-- ----------------------------
INSERT INTO `data_access_category` VALUES (1, 'test_category_1');
INSERT INTO `data_access_category` VALUES (2, 'test_category_2');
INSERT INTO `data_access_category` VALUES (3, 'test_category_3');

-- ----------------------------
-- Table structure for data_access_color
-- ----------------------------
DROP TABLE IF EXISTS `data_access_color`;
CREATE TABLE `data_access_color`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_access_color
-- ----------------------------
INSERT INTO `data_access_color` VALUES (1, 'Blue');
INSERT INTO `data_access_color` VALUES (2, 'Red');
INSERT INTO `data_access_color` VALUES (3, 'Green');

-- ----------------------------
-- Table structure for data_access_product
-- ----------------------------
DROP TABLE IF EXISTS `data_access_product`;
CREATE TABLE `data_access_product`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `brand_id` bigint NOT NULL,
  `category_id` bigint NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `data_access_product_brand_id_99f569a1_fk_data_access_brand_id`(`brand_id` ASC) USING BTREE,
  INDEX `data_access_product_category_id_c488bb0a_fk_data_acce`(`category_id` ASC) USING BTREE,
  CONSTRAINT `data_access_product_brand_id_99f569a1_fk_data_access_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `data_access_brand` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `data_access_product_category_id_c488bb0a_fk_data_acce` FOREIGN KEY (`category_id`) REFERENCES `data_access_category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_access_product
-- ----------------------------
INSERT INTO `data_access_product` VALUES (1, 'test_product_1', 'test_description', 10.25, 2, 2, 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a7/React-icon.svg/1150px-React-icon.svg.png');
INSERT INTO `data_access_product` VALUES (2, 'test_product_2', 'test_description', 10.24, 3, 1, 'https://vuejs.org/images/logo.png');
INSERT INTO `data_access_product` VALUES (3, 'test_product_3', 'test_description', 10.26, 2, 1, 'https://static-00.iconduck.com/assets.00/file-type-angular-icon-1907x2048-tobdkjt1.png');
INSERT INTO `data_access_product` VALUES (4, 'test_product_4', 'test_description', 10.24, 1, 3, 'https://gitlab.com/uploads/-/system/project/avatar/31295677/pngwing.com__1_.png');
INSERT INTO `data_access_product` VALUES (5, 'test_product_5', 'test_description', 10.24, 1, 1, 'https://vscjava.gallerycdn.vsassets.io/extensions/vscjava/vscode-spring-boot-dashboard/0.13.2023072200/1689984300042/Microsoft.VisualStudio.Services.Icons.Default');

-- ----------------------------
-- Table structure for data_access_size
-- ----------------------------
DROP TABLE IF EXISTS `data_access_size`;
CREATE TABLE `data_access_size`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of data_access_size
-- ----------------------------
INSERT INTO `data_access_size` VALUES (1, '5');
INSERT INTO `data_access_size` VALUES (2, '5.5');
INSERT INTO `data_access_size` VALUES (3, '6');
INSERT INTO `data_access_size` VALUES (4, '6.5');
INSERT INTO `data_access_size` VALUES (5, '7');
INSERT INTO `data_access_size` VALUES (6, '7 Wide');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content_type_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id` ASC) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_auth_user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_chk_1` CHECK (`action_flag` >= 0)
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2023-10-29 21:09:43.185004', '1', 'customer', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (2, '2023-10-29 21:10:05.169603', '2', 'administrator', 1, '[{\"added\": {}}]', 3, 1);
INSERT INTO `django_admin_log` VALUES (3, '2023-10-29 21:10:57.477876', '2', 'test_customer_1', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (4, '2023-10-29 21:11:07.476354', '2', 'test_customer_1', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (5, '2023-10-29 21:11:45.711605', '3', 'test_customer_2', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (6, '2023-10-29 21:11:53.578384', '3', 'test_customer_2', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (7, '2023-10-29 21:12:18.193594', '4', 'test_admin_1', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (8, '2023-10-29 22:23:51.700338', '4', 'test_admin_1', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (9, '2023-10-29 22:23:52.226336', '2', 'test_customer_1', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (10, '2023-10-29 22:23:52.340339', '3', 'test_customer_2', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (11, '2023-10-29 22:24:12.454165', '5', 'lima', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (12, '2023-10-29 22:24:23.846297', '5', 'lima', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (13, '2023-10-29 22:24:54.673562', '5', 'lima', 3, '', 4, 1);
INSERT INTO `django_admin_log` VALUES (14, '2023-10-29 22:25:18.595877', '6', 'lima', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (15, '2023-10-30 04:31:18.418658', '7', 'js288c', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (16, '2023-10-30 04:31:23.893906', '6', 'lima', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (17, '2023-10-30 14:17:50.412504', '1', 'test_brand', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (18, '2023-10-30 14:17:59.481918', '1', 'test_category', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (19, '2023-10-30 14:36:02.022424', '1', 'test_product', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (20, '2023-11-04 22:05:37.376774', '9', 'test_user', 1, '[{\"added\": {}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (21, '2023-11-04 22:05:43.550791', '9', 'test_user', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 4, 1);
INSERT INTO `django_admin_log` VALUES (22, '2023-11-25 18:05:43.823461', '7', 'js288c', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"cart item\", \"object\": \"product\"}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (23, '2023-12-10 02:03:09.389053', '1', 'Blue', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (24, '2023-12-10 02:03:14.106511', '2', 'Red', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (25, '2023-12-10 02:03:18.314768', '3', 'Green', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (26, '2023-12-10 02:04:47.113241', '1', '5', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (27, '2023-12-10 02:04:51.671868', '2', '5.5', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (28, '2023-12-10 02:04:59.147377', '3', '6', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (29, '2023-12-10 02:05:06.174476', '4', '6.5', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (30, '2023-12-10 02:05:09.514635', '5', '7', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (31, '2023-12-10 02:05:16.586506', '6', '7 Wide', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (32, '2023-12-10 02:10:17.236696', '1', 'Inventory object (1)', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (33, '2023-12-10 02:11:48.256671', '2', 'Inventory object (2)', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (34, '2023-12-10 02:13:28.686317', '3', 'Inventory object (3)', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (35, '2023-12-10 02:20:13.971531', '4', 'Inventory object (4)', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (36, '2023-12-10 02:20:22.406269', '5', 'Inventory object (5)', 1, '[{\"added\": {}}]', 21, 1);
INSERT INTO `django_admin_log` VALUES (37, '2023-12-10 02:59:30.232001', '6', 'Inventory object (6)', 1, '[{\"added\": {}}]', 21, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label` ASC, `model` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (7, 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES (8, 'authtoken', 'tokenproxy');
INSERT INTO `django_content_type` VALUES (21, 'catalog', 'inventory');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (9, 'data_access', 'brand');
INSERT INTO `django_content_type` VALUES (10, 'data_access', 'category');
INSERT INTO `django_content_type` VALUES (18, 'data_access', 'color');
INSERT INTO `django_content_type` VALUES (20, 'data_access', 'inventory');
INSERT INTO `django_content_type` VALUES (13, 'data_access', 'product');
INSERT INTO `django_content_type` VALUES (19, 'data_access', 'size');
INSERT INTO `django_content_type` VALUES (11, 'identity', 'administrator');
INSERT INTO `django_content_type` VALUES (12, 'identity', 'customer');
INSERT INTO `django_content_type` VALUES (14, 'ordering', 'order');
INSERT INTO `django_content_type` VALUES (15, 'ordering', 'orderitem');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (16, 'shopping_cart', 'cart');
INSERT INTO `django_content_type` VALUES (17, 'shopping_cart', 'cartitem');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2023-10-29 21:06:03.093861');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2023-10-29 21:06:06.068990');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2023-10-29 21:06:06.623821');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2023-10-29 21:06:06.662564');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2023-10-29 21:06:06.698130');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2023-10-29 21:06:07.044659');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2023-10-29 21:06:07.345578');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2023-10-29 21:06:07.427114');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2023-10-29 21:06:07.469319');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2023-10-29 21:06:07.699112');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2023-10-29 21:06:07.731619');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2023-10-29 21:06:07.762524');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2023-10-29 21:06:07.982393');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2023-10-29 21:06:08.252163');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2023-10-29 21:06:08.321783');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2023-10-29 21:06:08.362438');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2023-10-29 21:06:08.618237');
INSERT INTO `django_migrations` VALUES (18, 'sessions', '0001_initial', '2023-10-29 21:06:08.830195');
INSERT INTO `django_migrations` VALUES (19, 'authtoken', '0001_initial', '2023-10-29 22:11:47.172795');
INSERT INTO `django_migrations` VALUES (20, 'authtoken', '0002_auto_20160226_1747', '2023-10-29 22:11:47.224235');
INSERT INTO `django_migrations` VALUES (21, 'authtoken', '0003_tokenproxy', '2023-10-29 22:11:47.249164');
INSERT INTO `django_migrations` VALUES (22, 'data_access', '0001_initial', '2023-10-30 14:13:09.085872');
INSERT INTO `django_migrations` VALUES (23, 'identity', '0001_initial', '2023-10-30 14:13:09.247704');
INSERT INTO `django_migrations` VALUES (24, 'data_access', '0002_brand_image', '2023-10-30 14:25:32.959807');
INSERT INTO `django_migrations` VALUES (25, 'data_access', '0003_product', '2023-10-30 14:34:46.209490');
INSERT INTO `django_migrations` VALUES (26, 'ordering', '0001_initial', '2023-11-04 21:29:22.970086');
INSERT INTO `django_migrations` VALUES (27, 'shopping_cart', '0001_initial', '2023-11-04 21:29:23.884596');
INSERT INTO `django_migrations` VALUES (28, 'shopping_cart', '0002_rename_items_cart_products_and_more', '2023-11-04 22:17:27.602342');
INSERT INTO `django_migrations` VALUES (29, 'ordering', '0002_rename_items_order_products_and_more', '2023-11-04 22:44:42.498651');
INSERT INTO `django_migrations` VALUES (30, 'data_access', '0004_product_inventory', '2023-11-04 23:14:02.287708');
INSERT INTO `django_migrations` VALUES (31, 'ordering', '0003_order_status', '2023-11-04 23:58:45.976459');
INSERT INTO `django_migrations` VALUES (32, 'data_access', '0005_product_image_url', '2023-11-25 23:21:15.931318');
INSERT INTO `django_migrations` VALUES (33, 'data_access', '0006_rename_image_url_product_image', '2023-11-26 00:08:16.456304');
INSERT INTO `django_migrations` VALUES (34, 'ordering', '0002_order_address_1_order_address_2_order_city_and_more', '2023-12-08 21:26:58.355338');
INSERT INTO `django_migrations` VALUES (35, 'data_access', '0002_color_size_remove_product_inventory_inventory', '2023-12-10 02:01:12.123009');
INSERT INTO `django_migrations` VALUES (36, 'data_access', '0003_rename_color_id_inventory_color_and_more', '2023-12-10 02:01:54.196665');
INSERT INTO `django_migrations` VALUES (37, 'data_access', '0004_delete_inventory', '2023-12-10 02:08:55.142318');
INSERT INTO `django_migrations` VALUES (38, 'catalog', '0001_initial', '2023-12-10 02:08:56.121673');
INSERT INTO `django_migrations` VALUES (39, 'catalog', '0002_alter_inventory_unique_together', '2023-12-10 02:13:03.859564');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('4qgcyovx2r3rox4czscz7v2cla4jjzwx', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1r40MW:crm3r0NmT45pN8fqQE-4FyNPzBTDIXiuP16nvQ0UnSE', '2023-12-01 15:02:28.480215');
INSERT INTO `django_session` VALUES ('7kbt2bk2nknmyjag85cakahhn99e07r5', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1qxUCR:rJd59Ee2Cw8TJc_EDSNaKK6U-d5geX0RlaFP7zk4rL8', '2023-11-13 15:29:07.696748');
INSERT INTO `django_session` VALUES ('7nlew0pqj9jvol1u1sskqmvoazbv68ru', '.eJxVjD0OwyAUg-_CXCF-HgE6ds8ZEDygpK1ACslU9e4NUoZ2sSx_tt_E-X0rbu9pdUskV8LJ5TcLHp-pDhAfvt4bxVa3dQl0VOhJO51bTK_b2f07KL6XsfZZMWvRCIHaGAYcWeJZCJVsiOCnSbLDMtBKQwZpEkcU-hCulTRAPl_Mjjbo:1qxD0V:4Z3AuRHumOYauBNaT_Y26f1VZaomOXImfDQfnq3g2xQ', '2023-11-12 21:07:39.652874');
INSERT INTO `django_session` VALUES ('anyd7ant53rf5jdlcq8ewtesigocvtk7', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1r8jxr:vjLH2JrOCR1ZZWtKdx8-01bOzxr63SY2d5vgR2tSj4Q', '2023-12-14 16:32:35.498684');
INSERT INTO `django_session` VALUES ('gfxpzji35fhqxqhpe69akl24d5s6s6wk', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1qzOlZ:PhGt4YP0UT-tnt2FTNBc9RPYcKDTNwfLY-QE_zuzP0s', '2023-11-18 22:05:17.577668');
INSERT INTO `django_session` VALUES ('gmyj5ak95qq1558m55nfg96vy0bcq71h', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1r3KlA:6DQ1uulptici9KOoaD8bu3Zrje1gCngyJ484zm8lzag', '2023-11-29 18:37:08.031665');
INSERT INTO `django_session` VALUES ('qkhu7c38owwhma0pytcvvmp64ga67im4', '.eJxVjD0OwyAUg-_CXCF-HgE6ds8ZEDygpK1ACslU9e4NUoZ2sSx_tt_E-X0rbu9pdUskV8LJ5TcLHp-pDhAfvt4bxVa3dQl0VOhJO51bTK_b2f07KL6XsfZZMWvRCIHaGAYcWeJZCJVsiOCnSbLDMtBKQwZpEkcU-hCulTRAPl_Mjjbo:1qxF3Y:lDPdtOHdF2W8R-4PWjRw1CfX-N8ajBDeHNCqK2j4WiI', '2023-11-12 23:18:56.906549');
INSERT INTO `django_session` VALUES ('qovrewrw9i1de7j96f44767ywbbv01ha', '.eJxVjMEOwiAQRP-FsyHFXSj16N1vIEt3kaqBpLQn47_bJj3obTLvzbxVoHXJYW0yh4nVRRmjTr9lpPEpZSf8oHKveqxlmaeod0UftOlbZXldD_fvIFPL21pYkMgx2YiDt4aSG2AAJHQevJyNT5YjYOoJtuxGQGQnmGwnfYegPl8TeDfj:1r2c7p:Ve9zbjeI90JW9HUQAdlo26Izd0MZBYrEe6tBLLDW0vg', '2023-11-27 18:57:33.070914');
INSERT INTO `django_session` VALUES ('tj5jmjrm2eza95oc0sfuz5md2912hgcj', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1rCB7y:P5itP1uvwcADUHyE9IbBVWMeJH2I3Tsb5AHoZ-8kz_U', '2023-12-24 04:09:14.293322');
INSERT INTO `django_session` VALUES ('xfsu8qqtn8wsiy288diuhj7nqlr7yebh', '.eJxVjEEOwiAQRe_C2pBC6VBduvcMZGZgpGogKe3KeHfbpAvd_vfef6uA65LD2tIcpqguyqjT70bIz1R2EB9Y7lVzLcs8kd4VfdCmbzWm1_Vw_w4ytrzVePYDgQxg2GLksUvSi2OyBg11CAnAO8vkI_eb2rMAS_JudERRHKnPF_7-OPE:1r38YG:A6NQmuAjC8_MQqj5jYKDFE2kxkvUlc3bGli-a-Rrqd4', '2023-11-29 05:35:00.461903');

-- ----------------------------
-- Table structure for ordering_order
-- ----------------------------
DROP TABLE IF EXISTS `ordering_order`;
CREATE TABLE `ordering_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `total` decimal(6, 2) NOT NULL,
  `date` date NOT NULL,
  `customer_id` int NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `phone_num` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `postal_code` varchar(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `province` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ordering_order_customer_id_db5570b3_fk_auth_user_id`(`customer_id` ASC) USING BTREE,
  INDEX `ordering_order_date_69350568`(`date` ASC) USING BTREE,
  CONSTRAINT `ordering_order_customer_id_db5570b3_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordering_order
-- ----------------------------
INSERT INTO `ordering_order` VALUES (13, 0.00, '2023-12-09', 1, 'processing', 'aa', 'aa', 'dfas', 'dsaf', 'afsd', 'dfsa', 'asdf', 'asdf', 'OO');
INSERT INTO `ordering_order` VALUES (14, 0.00, '2023-12-09', 1, 'processing', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'aa', 'OO');

-- ----------------------------
-- Table structure for ordering_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `ordering_orderitem`;
CREATE TABLE `ordering_orderitem`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `inventory_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ordering_orderitem_inventory_id_452852de_fk_catalog_inventory_id`(`inventory_id` ASC) USING BTREE,
  INDEX `ordering_orderitem_order_id_050e4dc5_fk_ordering_order_id`(`order_id` ASC) USING BTREE,
  CONSTRAINT `ordering_orderitem_ibfk_1` FOREIGN KEY (`inventory_id`) REFERENCES `catalog_inventory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ordering_orderitem_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `ordering_order` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordering_orderitem
-- ----------------------------
INSERT INTO `ordering_orderitem` VALUES (1, 1, 1, 13);
INSERT INTO `ordering_orderitem` VALUES (2, 1, 2, 13);

-- ----------------------------
-- Table structure for shopping_cart_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart_cart`;
CREATE TABLE `shopping_cart_cart`  (
  `customer_id` int NOT NULL,
  `total` decimal(6, 2) NOT NULL,
  PRIMARY KEY (`customer_id`) USING BTREE,
  CONSTRAINT `shopping_cart_cart_customer_id_154999cc_fk_auth_user_id` FOREIGN KEY (`customer_id`) REFERENCES `auth_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart_cart
-- ----------------------------
INSERT INTO `shopping_cart_cart` VALUES (1, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (6, 0.00);
INSERT INTO `shopping_cart_cart` VALUES (7, 0.00);

-- ----------------------------
-- Table structure for shopping_cart_cartitem
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart_cartitem`;
CREATE TABLE `shopping_cart_cartitem`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `quantity` int NOT NULL,
  `cart_id` int NOT NULL,
  `inventory_id` bigint NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `shopping_cart_cartit_cart_id_adaf8330_fk_shopping_`(`cart_id` ASC) USING BTREE,
  INDEX `shopping_cart_cartit_inventory_id_d1a64bb4_fk_catalog_i`(`inventory_id` ASC) USING BTREE,
  CONSTRAINT `shopping_cart_cartitem_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `shopping_cart_cart` (`customer_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `shopping_cart_cartitem_ibfk_2` FOREIGN KEY (`inventory_id`) REFERENCES `catalog_inventory` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shopping_cart_cartitem
-- ----------------------------
INSERT INTO `shopping_cart_cartitem` VALUES (1, 1, 1, 1);

SET FOREIGN_KEY_CHECKS = 1;
