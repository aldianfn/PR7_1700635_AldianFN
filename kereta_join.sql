/*
 Navicat Premium Data Transfer

 Source Server         : connect
 Source Server Type    : MySQL
 Source Server Version : 100130
 Source Host           : localhost:3306
 Source Schema         : kereta_join

 Target Server Type    : MySQL
 Target Server Version : 100130
 File Encoding         : 65001

 Date: 15/04/2019 13:55:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gerbong
-- ----------------------------
DROP TABLE IF EXISTS `gerbong`;
CREATE TABLE `gerbong`  (
  `id_gerbong` int(255) NOT NULL AUTO_INCREMENT,
  `kd_gerbong` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_kereta` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_gerbong`) USING BTREE,
  INDEX `fk_1`(`kd_kereta`) USING BTREE,
  INDEX `kd_gerbong`(`kd_gerbong`) USING BTREE,
  CONSTRAINT `fk_1` FOREIGN KEY (`kd_kereta`) REFERENCES `lokomotif` (`kd_kereta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of gerbong
-- ----------------------------
INSERT INTO `gerbong` VALUES (1, 'GRB0001', 'KRT0002', 'A01');
INSERT INTO `gerbong` VALUES (2, 'GRB0002', 'KRT0002', 'B01');
INSERT INTO `gerbong` VALUES (3, 'GRB0003', 'KRT0003', 'C01');

-- ----------------------------
-- Table structure for kursi
-- ----------------------------
DROP TABLE IF EXISTS `kursi`;
CREATE TABLE `kursi`  (
  `int_kursi` int(255) NOT NULL AUTO_INCREMENT,
  `kd_kursi` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_gerbong` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kd_kereta` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`int_kursi`) USING BTREE,
  INDEX `fk_2`(`kd_gerbong`) USING BTREE,
  INDEX `fk_3`(`kd_kereta`) USING BTREE,
  CONSTRAINT `fk_2` FOREIGN KEY (`kd_gerbong`) REFERENCES `gerbong` (`kd_gerbong`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_3` FOREIGN KEY (`kd_kereta`) REFERENCES `lokomotif` (`kd_kereta`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of kursi
-- ----------------------------
INSERT INTO `kursi` VALUES (1, 'KRS0001', 'GRB0001', 'KRT0001');
INSERT INTO `kursi` VALUES (2, 'KRS0002', 'GRB0001', 'KRT0001');

-- ----------------------------
-- Table structure for lokomotif
-- ----------------------------
DROP TABLE IF EXISTS `lokomotif`;
CREATE TABLE `lokomotif`  (
  `id_lokomotif` int(255) NOT NULL AUTO_INCREMENT,
  `kd_kereta` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nama` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_lokomotif`) USING BTREE,
  INDEX `kd_kereta`(`kd_kereta`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of lokomotif
-- ----------------------------
INSERT INTO `lokomotif` VALUES (1, 'KRT0001', 'Argo Wilis');
INSERT INTO `lokomotif` VALUES (2, 'KRT0002', 'MALABAR');
INSERT INTO `lokomotif` VALUES (3, 'KRT0003', 'KURTOJOYO');

SET FOREIGN_KEY_CHECKS = 1;
