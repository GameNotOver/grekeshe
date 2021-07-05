/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80020
 Source Host           : localhost:3306
 Source Schema         : keshe

 Target Server Type    : MySQL
 Target Server Version : 80020
 File Encoding         : 65001

 Date: 05/07/2021 09:31:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for location
-- ----------------------------
DROP TABLE IF EXISTS `location`;
CREATE TABLE `location`  (
  `loc_id` int NOT NULL,
  `capicity` double(10, 2) NULL DEFAULT NULL,
  `area` double(10, 2) NULL DEFAULT NULL,
  `altitude` double(10, 2) NULL DEFAULT NULL,
  `longtitude` double(10, 2) NULL DEFAULT NULL,
  `latitude` double(10, 2) NULL DEFAULT NULL,
  `best_angles` double(10, 2) NULL DEFAULT NULL,
  `radiation` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`loc_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of location
-- ----------------------------
INSERT INTO `location` VALUES (1, 131.00, 131.00, 1231.00, 1231.00, 1231.00, 131.00, 131.00);
INSERT INTO `location` VALUES (2, 3000.00, 1234.00, 2342.00, 234.00, 23423.00, 4223.00, 2342.00);
INSERT INTO `location` VALUES (9, 100.00, 200.00, 35.00, 27.00, 13.80, 89.00, 90.20);

-- ----------------------------
-- Table structure for meteorology
-- ----------------------------
DROP TABLE IF EXISTS `meteorology`;
CREATE TABLE `meteorology`  (
  `loc_id` int NOT NULL,
  `avg_year_tem` double(10, 2) NULL DEFAULT NULL,
  `max_year_tem` double(10, 2) NULL DEFAULT NULL,
  `max_soil_depth` double(10, 2) NULL DEFAULT NULL,
  `min_year_tem` double(10, 2) NULL DEFAULT NULL,
  `avg_wind_speed` double(10, 2) NULL DEFAULT NULL,
  `avg_strom_days` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`loc_id`) USING BTREE,
  CONSTRAINT `meteorology_ibfk_1` FOREIGN KEY (`loc_id`) REFERENCES `location` (`loc_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of meteorology
-- ----------------------------
INSERT INTO `meteorology` VALUES (1, 132.00, 123.00, 1312.00, 1231.00, 342.00, 242.00);

-- ----------------------------
-- Table structure for owner
-- ----------------------------
DROP TABLE IF EXISTS `owner`;
CREATE TABLE `owner`  (
  `owner_id` int NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `group` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`owner_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of owner
-- ----------------------------
INSERT INTO `owner` VALUES (3, '张三', '12356', '122321', '河海大学');
INSERT INTO `owner` VALUES (4, '李四', '12213', '131231', '河海大学');
INSERT INTO `owner` VALUES (29, '吴芋航', '123', '123', '河海大学');

-- ----------------------------
-- Table structure for project
-- ----------------------------
DROP TABLE IF EXISTS `project`;
CREATE TABLE `project`  (
  `pj_id` int NOT NULL COMMENT '项目录入编号',
  `owner_id` int NULL DEFAULT NULL,
  `loc_id` int NULL DEFAULT NULL COMMENT '项目地址',
  `pv_area` int NULL DEFAULT NULL COMMENT '项目光伏区',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `disign` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目类型',
  `stage` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目阶段',
  `date` date NULL DEFAULT NULL COMMENT '项目日期',
  `invest` double(20, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`pj_id`) USING BTREE,
  INDEX `location`(`loc_id`) USING BTREE,
  INDEX `搭建`(`pv_area`) USING BTREE,
  INDEX `管理`(`owner_id`) USING BTREE,
  CONSTRAINT `位于` FOREIGN KEY (`loc_id`) REFERENCES `location` (`loc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `管理` FOREIGN KEY (`owner_id`) REFERENCES `owner` (`owner_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of project
-- ----------------------------
INSERT INTO `project` VALUES (1, 29, 1, 1, '青海省海南州100MW地面电站项目', '中国能源建设集团山西省电力勘测设计院有限公司', '平地光伏', '在研', '2020-09-01', 2000.50);
INSERT INTO `project` VALUES (2, 3, 2, 123, '黄龙县三岔镇10万千瓦平价上网光伏发电项目', '西安隆基清洁能源有限公司', '山地光伏', '可研', '2020-09-23', 21312312.60);

-- ----------------------------
-- Table structure for pv_area
-- ----------------------------
DROP TABLE IF EXISTS `pv_area`;
CREATE TABLE `pv_area`  (
  `pj_id` int NOT NULL COMMENT '光伏区编号',
  `pv_set` int NOT NULL COMMENT '光伏区配置',
  `pv_system` int NULL DEFAULT NULL COMMENT '光伏发电系统',
  `pv_booster` int NULL DEFAULT NULL COMMENT '光伏升压站',
  `area` double(10, 2) NULL DEFAULT NULL COMMENT '光伏区面积',
  `road_length` double(10, 2) NULL DEFAULT NULL COMMENT '厂区道路长度',
  `inverter` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pv_module` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pad_mounted` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pj_id`) USING BTREE,
  INDEX `pv_set`(`pv_set`) USING BTREE,
  INDEX `pv_system`(`pv_system`) USING BTREE,
  INDEX `pv_booster`(`pv_booster`) USING BTREE,
  CONSTRAINT `pv_area_ibfk_2` FOREIGN KEY (`pv_system`) REFERENCES `pv_system` (`system_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pv_area_ibfk_3` FOREIGN KEY (`pv_booster`) REFERENCES `pv_booster` (`booster_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pv_area_ibfk_4` FOREIGN KEY (`pj_id`) REFERENCES `project` (`pj_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pv_area
-- ----------------------------
INSERT INTO `pv_area` VALUES (1, 132, 1, 11, 3000.00, 400.00, '3000.9', 'mod_1', 'mounte_1');

-- ----------------------------
-- Table structure for pv_booster
-- ----------------------------
DROP TABLE IF EXISTS `pv_booster`;
CREATE TABLE `pv_booster`  (
  `booster_id` int NOT NULL,
  `capicity` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`booster_id`) USING BTREE,
  INDEX `搭建`(`booster_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pv_booster
-- ----------------------------
INSERT INTO `pv_booster` VALUES (11, '成都');

-- ----------------------------
-- Table structure for pv_system
-- ----------------------------
DROP TABLE IF EXISTS `pv_system`;
CREATE TABLE `pv_system`  (
  `system_id` int NOT NULL,
  `capcity` double(10, 2) NULL DEFAULT NULL,
  `merge_date` datetime NULL DEFAULT NULL,
  `scheme` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ratio` double(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`system_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pv_system
-- ----------------------------
INSERT INTO `pv_system` VALUES (1, 1.00, '2021-07-04 00:00:00', 'scheme_1', 0.28);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `authority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (14, 'wuyuhang', NULL, '123@mail.com', '123', NULL);
INSERT INTO `t_user` VALUES (16, 'keshe', '123456', 'keshe@hhu.cn', '123456', NULL);
INSERT INTO `t_user` VALUES (17, '351681578', '351681578wdp', 'www', '123', NULL);
INSERT INTO `t_user` VALUES (19, '1e1231', NULL, 'ada', 'das', NULL);
INSERT INTO `t_user` VALUES (20, 'heello', NULL, 'la', '21131', NULL);

SET FOREIGN_KEY_CHECKS = 1;
