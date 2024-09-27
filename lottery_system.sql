/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : lottery_system

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 27/09/2024 22:08:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for availablerewards
-- ----------------------------
DROP TABLE IF EXISTS `availablerewards`;
CREATE TABLE `availablerewards`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rewardType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `quantity` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of availablerewards
-- ----------------------------
INSERT INTO `availablerewards` VALUES (1, '現金奬勵', '500 元現金', '2024-09-26 22:09:11', '2024-09-27 13:16:23', 0);
INSERT INTO `availablerewards` VALUES (2, '電子產品', 'iPhome 16', '2024-09-26 22:09:43', '2024-09-27 13:02:24', 0);
INSERT INTO `availablerewards` VALUES (3, '現金奬勵', '1000 元奬金', '2024-09-26 22:10:31', '2024-09-27 13:14:18', 0);
INSERT INTO `availablerewards` VALUES (4, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', '2024-09-27 13:17:26', '2024-09-27 13:32:05', 0);
INSERT INTO `availablerewards` VALUES (5, 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', '2024-09-27 13:19:10', '2024-09-27 13:31:07', 0);
INSERT INTO `availablerewards` VALUES (6, 'Logitech 鍵盤', 'Logitech 鍵盤', '2024-09-27 13:29:31', '2024-09-27 13:32:51', 21);
INSERT INTO `availablerewards` VALUES (7, 'Logitech 滑鼠', 'Logitech 滑鼠', '2024-09-27 13:29:47', '2024-09-27 13:32:53', 169);

-- ----------------------------
-- Table structure for rewards
-- ----------------------------
DROP TABLE IF EXISTS `rewards`;
CREATE TABLE `rewards`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `rewardType` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `userId` int NULL DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_user`(`userId` ASC) USING BTREE,
  CONSTRAINT `fk_user` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 213 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rewards
-- ----------------------------
INSERT INTO `rewards` VALUES (11, '現金奬勵', '500 元現金', 102, '2024-09-27 13:07:54', '2024-09-27 13:07:54');
INSERT INTO `rewards` VALUES (12, '現金奬勵', '1000 元奬金', 192, '2024-09-27 13:07:56', '2024-09-27 13:07:56');
INSERT INTO `rewards` VALUES (13, '現金奬勵', '500 元現金', 167, '2024-09-27 13:07:58', '2024-09-27 13:07:58');
INSERT INTO `rewards` VALUES (14, '現金奬勵', '500 元現金', 132, '2024-09-27 13:08:00', '2024-09-27 13:08:00');
INSERT INTO `rewards` VALUES (15, '現金奬勵', '500 元現金', 140, '2024-09-27 13:08:02', '2024-09-27 13:08:02');
INSERT INTO `rewards` VALUES (16, '現金奬勵', '500 元現金', 180, '2024-09-27 13:08:04', '2024-09-27 13:08:04');
INSERT INTO `rewards` VALUES (17, '現金奬勵', '500 元現金', 56, '2024-09-27 13:08:06', '2024-09-27 13:08:06');
INSERT INTO `rewards` VALUES (18, '現金奬勵', '500 元現金', 150, '2024-09-27 13:08:08', '2024-09-27 13:08:08');
INSERT INTO `rewards` VALUES (19, '現金奬勵', '500 元現金', 5, '2024-09-27 13:08:10', '2024-09-27 13:08:10');
INSERT INTO `rewards` VALUES (20, '現金奬勵', '500 元現金', 120, '2024-09-27 13:08:12', '2024-09-27 13:08:12');
INSERT INTO `rewards` VALUES (21, '現金奬勵', '500 元現金', 160, '2024-09-27 13:08:14', '2024-09-27 13:08:14');
INSERT INTO `rewards` VALUES (22, '現金奬勵', '500 元現金', 112, '2024-09-27 13:08:16', '2024-09-27 13:08:16');
INSERT INTO `rewards` VALUES (23, '現金奬勵', '1000 元奬金', 131, '2024-09-27 13:08:18', '2024-09-27 13:08:18');
INSERT INTO `rewards` VALUES (24, '現金奬勵', '500 元現金', 90, '2024-09-27 13:08:20', '2024-09-27 13:08:20');
INSERT INTO `rewards` VALUES (25, '現金奬勵', '500 元現金', 139, '2024-09-27 13:08:22', '2024-09-27 13:08:22');
INSERT INTO `rewards` VALUES (26, '現金奬勵', '500 元現金', 93, '2024-09-27 13:08:24', '2024-09-27 13:08:24');
INSERT INTO `rewards` VALUES (27, '現金奬勵', '500 元現金', 22, '2024-09-27 13:13:05', '2024-09-27 13:13:05');
INSERT INTO `rewards` VALUES (28, '現金奬勵', '500 元現金', 124, '2024-09-27 13:13:07', '2024-09-27 13:13:07');
INSERT INTO `rewards` VALUES (29, '現金奬勵', '500 元現金', 65, '2024-09-27 13:13:09', '2024-09-27 13:13:09');
INSERT INTO `rewards` VALUES (30, '現金奬勵', '1000 元奬金', 114, '2024-09-27 13:13:11', '2024-09-27 13:13:11');
INSERT INTO `rewards` VALUES (31, '現金奬勵', '500 元現金', 49, '2024-09-27 13:13:13', '2024-09-27 13:13:13');
INSERT INTO `rewards` VALUES (32, '現金奬勵', '500 元現金', 148, '2024-09-27 13:13:15', '2024-09-27 13:13:15');
INSERT INTO `rewards` VALUES (33, '現金奬勵', '1000 元奬金', 161, '2024-09-27 13:13:17', '2024-09-27 13:13:17');
INSERT INTO `rewards` VALUES (34, '現金奬勵', '500 元現金', 175, '2024-09-27 13:13:19', '2024-09-27 13:13:19');
INSERT INTO `rewards` VALUES (35, '現金奬勵', '500 元現金', 128, '2024-09-27 13:13:21', '2024-09-27 13:13:21');
INSERT INTO `rewards` VALUES (36, '現金奬勵', '1000 元奬金', 157, '2024-09-27 13:13:23', '2024-09-27 13:13:23');
INSERT INTO `rewards` VALUES (37, '現金奬勵', '1000 元奬金', 61, '2024-09-27 13:13:25', '2024-09-27 13:13:25');
INSERT INTO `rewards` VALUES (38, '現金奬勵', '500 元現金', 145, '2024-09-27 13:13:27', '2024-09-27 13:13:27');
INSERT INTO `rewards` VALUES (39, '現金奬勵', '500 元現金', 141, '2024-09-27 13:13:29', '2024-09-27 13:13:29');
INSERT INTO `rewards` VALUES (40, '現金奬勵', '500 元現金', 191, '2024-09-27 13:13:32', '2024-09-27 13:13:32');
INSERT INTO `rewards` VALUES (41, '現金奬勵', '500 元現金', 121, '2024-09-27 13:13:33', '2024-09-27 13:13:33');
INSERT INTO `rewards` VALUES (42, '現金奬勵', '1000 元奬金', 63, '2024-09-27 13:13:35', '2024-09-27 13:13:35');
INSERT INTO `rewards` VALUES (43, '現金奬勵', '1000 元奬金', 116, '2024-09-27 13:13:38', '2024-09-27 13:13:38');
INSERT INTO `rewards` VALUES (44, '現金奬勵', '1000 元奬金', 19, '2024-09-27 13:13:40', '2024-09-27 13:13:40');
INSERT INTO `rewards` VALUES (45, '現金奬勵', '500 元現金', 144, '2024-09-27 13:13:42', '2024-09-27 13:13:42');
INSERT INTO `rewards` VALUES (46, '現金奬勵', '500 元現金', 43, '2024-09-27 13:13:44', '2024-09-27 13:13:44');
INSERT INTO `rewards` VALUES (47, '現金奬勵', '500 元現金', 172, '2024-09-27 13:13:46', '2024-09-27 13:13:46');
INSERT INTO `rewards` VALUES (48, '現金奬勵', '500 元現金', 189, '2024-09-27 13:13:48', '2024-09-27 13:13:48');
INSERT INTO `rewards` VALUES (49, '現金奬勵', '500 元現金', 179, '2024-09-27 13:13:50', '2024-09-27 13:13:50');
INSERT INTO `rewards` VALUES (50, '現金奬勵', '1000 元奬金', 110, '2024-09-27 13:13:52', '2024-09-27 13:13:52');
INSERT INTO `rewards` VALUES (51, '現金奬勵', '500 元現金', 163, '2024-09-27 13:13:54', '2024-09-27 13:13:54');
INSERT INTO `rewards` VALUES (52, '現金奬勵', '1000 元奬金', 1, '2024-09-27 13:13:56', '2024-09-27 13:13:56');
INSERT INTO `rewards` VALUES (53, '現金奬勵', '1000 元奬金', 108, '2024-09-27 13:13:58', '2024-09-27 13:13:58');
INSERT INTO `rewards` VALUES (54, '現金奬勵', '500 元現金', 30, '2024-09-27 13:14:00', '2024-09-27 13:14:00');
INSERT INTO `rewards` VALUES (55, '現金奬勵', '500 元現金', 118, '2024-09-27 13:14:02', '2024-09-27 13:14:02');
INSERT INTO `rewards` VALUES (56, '現金奬勵', '1000 元奬金', 137, '2024-09-27 13:14:04', '2024-09-27 13:14:04');
INSERT INTO `rewards` VALUES (57, '現金奬勵', '500 元現金', 151, '2024-09-27 13:14:06', '2024-09-27 13:14:06');
INSERT INTO `rewards` VALUES (58, '現金奬勵', '500 元現金', 54, '2024-09-27 13:14:08', '2024-09-27 13:14:08');
INSERT INTO `rewards` VALUES (59, '現金奬勵', '1000 元奬金', 80, '2024-09-27 13:14:10', '2024-09-27 13:14:10');
INSERT INTO `rewards` VALUES (60, '現金奬勵', '500 元現金', 45, '2024-09-27 13:14:12', '2024-09-27 13:14:12');
INSERT INTO `rewards` VALUES (61, '現金奬勵', '1000 元奬金', 9, '2024-09-27 13:14:14', '2024-09-27 13:14:14');
INSERT INTO `rewards` VALUES (62, '現金奬勵', '1000 元奬金', 130, '2024-09-27 13:14:16', '2024-09-27 13:14:16');
INSERT INTO `rewards` VALUES (63, '現金奬勵', '1000 元奬金', 125, '2024-09-27 13:14:18', '2024-09-27 13:14:18');
INSERT INTO `rewards` VALUES (64, '現金奬勵', '500 元現金', 97, '2024-09-27 13:14:20', '2024-09-27 13:14:20');
INSERT INTO `rewards` VALUES (65, '現金奬勵', '500 元現金', 127, '2024-09-27 13:14:22', '2024-09-27 13:14:22');
INSERT INTO `rewards` VALUES (66, '現金奬勵', '500 元現金', 100, '2024-09-27 13:14:24', '2024-09-27 13:14:24');
INSERT INTO `rewards` VALUES (67, '現金奬勵', '500 元現金', 123, '2024-09-27 13:14:26', '2024-09-27 13:14:26');
INSERT INTO `rewards` VALUES (68, '現金奬勵', '500 元現金', 190, '2024-09-27 13:14:28', '2024-09-27 13:14:28');
INSERT INTO `rewards` VALUES (69, '現金奬勵', '500 元現金', 7, '2024-09-27 13:14:30', '2024-09-27 13:14:30');
INSERT INTO `rewards` VALUES (70, '現金奬勵', '500 元現金', 88, '2024-09-27 13:14:32', '2024-09-27 13:14:32');
INSERT INTO `rewards` VALUES (71, '現金奬勵', '500 元現金', 24, '2024-09-27 13:14:34', '2024-09-27 13:14:34');
INSERT INTO `rewards` VALUES (72, '現金奬勵', '500 元現金', 27, '2024-09-27 13:14:38', '2024-09-27 13:14:38');
INSERT INTO `rewards` VALUES (73, '現金奬勵', '500 元現金', 81, '2024-09-27 13:14:39', '2024-09-27 13:14:39');
INSERT INTO `rewards` VALUES (74, '現金奬勵', '500 元現金', 136, '2024-09-27 13:14:41', '2024-09-27 13:14:41');
INSERT INTO `rewards` VALUES (75, '現金奬勵', '500 元現金', 197, '2024-09-27 13:14:43', '2024-09-27 13:14:43');
INSERT INTO `rewards` VALUES (76, '現金奬勵', '500 元現金', 193, '2024-09-27 13:14:45', '2024-09-27 13:14:45');
INSERT INTO `rewards` VALUES (77, '現金奬勵', '500 元現金', 183, '2024-09-27 13:14:47', '2024-09-27 13:14:47');
INSERT INTO `rewards` VALUES (78, '現金奬勵', '500 元現金', 8, '2024-09-27 13:14:49', '2024-09-27 13:14:49');
INSERT INTO `rewards` VALUES (79, '現金奬勵', '500 元現金', 156, '2024-09-27 13:14:51', '2024-09-27 13:14:51');
INSERT INTO `rewards` VALUES (80, '現金奬勵', '500 元現金', 169, '2024-09-27 13:14:54', '2024-09-27 13:14:54');
INSERT INTO `rewards` VALUES (81, '現金奬勵', '500 元現金', 95, '2024-09-27 13:14:56', '2024-09-27 13:14:56');
INSERT INTO `rewards` VALUES (82, '現金奬勵', '500 元現金', 119, '2024-09-27 13:14:58', '2024-09-27 13:14:58');
INSERT INTO `rewards` VALUES (83, '現金奬勵', '500 元現金', 44, '2024-09-27 13:15:00', '2024-09-27 13:15:00');
INSERT INTO `rewards` VALUES (84, '現金奬勵', '500 元現金', 126, '2024-09-27 13:15:02', '2024-09-27 13:15:02');
INSERT INTO `rewards` VALUES (85, '現金奬勵', '500 元現金', 67, '2024-09-27 13:15:04', '2024-09-27 13:15:04');
INSERT INTO `rewards` VALUES (86, '現金奬勵', '500 元現金', 14, '2024-09-27 13:15:06', '2024-09-27 13:15:06');
INSERT INTO `rewards` VALUES (87, '現金奬勵', '500 元現金', 195, '2024-09-27 13:15:08', '2024-09-27 13:15:08');
INSERT INTO `rewards` VALUES (88, '現金奬勵', '500 元現金', 201, '2024-09-27 13:15:10', '2024-09-27 13:15:10');
INSERT INTO `rewards` VALUES (89, '現金奬勵', '500 元現金', 20, '2024-09-27 13:15:12', '2024-09-27 13:15:12');
INSERT INTO `rewards` VALUES (90, '現金奬勵', '500 元現金', 34, '2024-09-27 13:15:14', '2024-09-27 13:15:14');
INSERT INTO `rewards` VALUES (91, '現金奬勵', '500 元現金', 35, '2024-09-27 13:15:16', '2024-09-27 13:15:16');
INSERT INTO `rewards` VALUES (92, '現金奬勵', '500 元現金', 42, '2024-09-27 13:15:18', '2024-09-27 13:15:18');
INSERT INTO `rewards` VALUES (93, '現金奬勵', '500 元現金', 15, '2024-09-27 13:15:20', '2024-09-27 13:15:20');
INSERT INTO `rewards` VALUES (94, '現金奬勵', '500 元現金', 11, '2024-09-27 13:15:22', '2024-09-27 13:15:22');
INSERT INTO `rewards` VALUES (95, '現金奬勵', '500 元現金', 83, '2024-09-27 13:15:24', '2024-09-27 13:15:24');
INSERT INTO `rewards` VALUES (96, '現金奬勵', '500 元現金', 158, '2024-09-27 13:15:26', '2024-09-27 13:15:26');
INSERT INTO `rewards` VALUES (97, '現金奬勵', '500 元現金', 154, '2024-09-27 13:15:28', '2024-09-27 13:15:28');
INSERT INTO `rewards` VALUES (98, '現金奬勵', '500 元現金', 59, '2024-09-27 13:15:30', '2024-09-27 13:15:30');
INSERT INTO `rewards` VALUES (99, '現金奬勵', '500 元現金', 51, '2024-09-27 13:15:32', '2024-09-27 13:15:32');
INSERT INTO `rewards` VALUES (100, '現金奬勵', '500 元現金', 60, '2024-09-27 13:15:34', '2024-09-27 13:15:34');
INSERT INTO `rewards` VALUES (101, '現金奬勵', '500 元現金', 142, '2024-09-27 13:15:36', '2024-09-27 13:15:36');
INSERT INTO `rewards` VALUES (102, '現金奬勵', '500 元現金', 174, '2024-09-27 13:15:38', '2024-09-27 13:15:38');
INSERT INTO `rewards` VALUES (103, '現金奬勵', '500 元現金', 86, '2024-09-27 13:15:40', '2024-09-27 13:15:40');
INSERT INTO `rewards` VALUES (104, '現金奬勵', '500 元現金', 194, '2024-09-27 13:15:42', '2024-09-27 13:15:42');
INSERT INTO `rewards` VALUES (105, '現金奬勵', '500 元現金', 10, '2024-09-27 13:15:44', '2024-09-27 13:15:44');
INSERT INTO `rewards` VALUES (106, '現金奬勵', '500 元現金', 177, '2024-09-27 13:15:46', '2024-09-27 13:15:46');
INSERT INTO `rewards` VALUES (107, '現金奬勵', '500 元現金', 62, '2024-09-27 13:15:48', '2024-09-27 13:15:48');
INSERT INTO `rewards` VALUES (108, '現金奬勵', '500 元現金', 89, '2024-09-27 13:15:50', '2024-09-27 13:15:50');
INSERT INTO `rewards` VALUES (109, '現金奬勵', '500 元現金', 91, '2024-09-27 13:15:54', '2024-09-27 13:15:54');
INSERT INTO `rewards` VALUES (110, '現金奬勵', '500 元現金', 36, '2024-09-27 13:15:59', '2024-09-27 13:15:59');
INSERT INTO `rewards` VALUES (111, '現金奬勵', '500 元現金', 85, '2024-09-27 13:16:01', '2024-09-27 13:16:01');
INSERT INTO `rewards` VALUES (112, '現金奬勵', '500 元現金', 106, '2024-09-27 13:16:03', '2024-09-27 13:16:03');
INSERT INTO `rewards` VALUES (113, '現金奬勵', '500 元現金', 68, '2024-09-27 13:16:05', '2024-09-27 13:16:05');
INSERT INTO `rewards` VALUES (114, '現金奬勵', '500 元現金', 111, '2024-09-27 13:16:07', '2024-09-27 13:16:07');
INSERT INTO `rewards` VALUES (115, '現金奬勵', '500 元現金', 92, '2024-09-27 13:16:09', '2024-09-27 13:16:09');
INSERT INTO `rewards` VALUES (116, '現金奬勵', '500 元現金', 149, '2024-09-27 13:16:11', '2024-09-27 13:16:11');
INSERT INTO `rewards` VALUES (117, '現金奬勵', '500 元現金', 72, '2024-09-27 13:16:13', '2024-09-27 13:16:13');
INSERT INTO `rewards` VALUES (118, '現金奬勵', '500 元現金', 17, '2024-09-27 13:16:15', '2024-09-27 13:16:15');
INSERT INTO `rewards` VALUES (119, '現金奬勵', '500 元現金', 168, '2024-09-27 13:16:17', '2024-09-27 13:16:17');
INSERT INTO `rewards` VALUES (120, '現金奬勵', '500 元現金', 52, '2024-09-27 13:16:19', '2024-09-27 13:16:19');
INSERT INTO `rewards` VALUES (121, '現金奬勵', '500 元現金', 98, '2024-09-27 13:16:21', '2024-09-27 13:16:21');
INSERT INTO `rewards` VALUES (122, '現金奬勵', '500 元現金', 32, '2024-09-27 13:16:23', '2024-09-27 13:16:23');
INSERT INTO `rewards` VALUES (123, 'Logitech 鍵盤', 'Logitech 鍵盤', 58, '2024-09-27 13:29:55', '2024-09-27 13:29:55');
INSERT INTO `rewards` VALUES (124, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 38, '2024-09-27 13:29:57', '2024-09-27 13:29:57');
INSERT INTO `rewards` VALUES (125, 'Logitech 滑鼠', 'Logitech 滑鼠', 152, '2024-09-27 13:29:59', '2024-09-27 13:29:59');
INSERT INTO `rewards` VALUES (126, 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 99, '2024-09-27 13:30:01', '2024-09-27 13:30:01');
INSERT INTO `rewards` VALUES (127, 'Logitech 鍵盤', 'Logitech 鍵盤', 16, '2024-09-27 13:30:03', '2024-09-27 13:30:03');
INSERT INTO `rewards` VALUES (128, 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 135, '2024-09-27 13:30:05', '2024-09-27 13:30:05');
INSERT INTO `rewards` VALUES (129, 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 94, '2024-09-27 13:30:07', '2024-09-27 13:30:07');
INSERT INTO `rewards` VALUES (130, 'Logitech 滑鼠', 'Logitech 滑鼠', 33, '2024-09-27 13:30:09', '2024-09-27 13:30:09');
INSERT INTO `rewards` VALUES (131, 'Logitech 鍵盤', 'Logitech 鍵盤', 66, '2024-09-27 13:30:11', '2024-09-27 13:30:11');
INSERT INTO `rewards` VALUES (132, 'Logitech 滑鼠', 'Logitech 滑鼠', 104, '2024-09-27 13:30:13', '2024-09-27 13:30:13');
INSERT INTO `rewards` VALUES (133, 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 71, '2024-09-27 13:30:15', '2024-09-27 13:30:15');
INSERT INTO `rewards` VALUES (134, 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 26, '2024-09-27 13:30:17', '2024-09-27 13:30:17');
INSERT INTO `rewards` VALUES (135, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 25, '2024-09-27 13:30:19', '2024-09-27 13:30:19');
INSERT INTO `rewards` VALUES (136, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 12, '2024-09-27 13:30:21', '2024-09-27 13:30:21');
INSERT INTO `rewards` VALUES (137, 'Logitech 滑鼠', 'Logitech 滑鼠', 187, '2024-09-27 13:30:23', '2024-09-27 13:30:23');
INSERT INTO `rewards` VALUES (138, 'Logitech 鍵盤', 'Logitech 鍵盤', 198, '2024-09-27 13:30:25', '2024-09-27 13:30:25');
INSERT INTO `rewards` VALUES (139, 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 170, '2024-09-27 13:30:27', '2024-09-27 13:30:27');
INSERT INTO `rewards` VALUES (140, 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 162, '2024-09-27 13:30:29', '2024-09-27 13:30:29');
INSERT INTO `rewards` VALUES (141, 'Logitech 鍵盤', 'Logitech 鍵盤', 153, '2024-09-27 13:30:31', '2024-09-27 13:30:31');
INSERT INTO `rewards` VALUES (142, 'Logitech 鍵盤', 'Logitech 鍵盤', 109, '2024-09-27 13:30:33', '2024-09-27 13:30:33');
INSERT INTO `rewards` VALUES (143, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 113, '2024-09-27 13:30:35', '2024-09-27 13:30:35');
INSERT INTO `rewards` VALUES (144, 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 70, '2024-09-27 13:30:37', '2024-09-27 13:30:37');
INSERT INTO `rewards` VALUES (145, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 173, '2024-09-27 13:30:39', '2024-09-27 13:30:39');
INSERT INTO `rewards` VALUES (146, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 138, '2024-09-27 13:30:41', '2024-09-27 13:30:41');
INSERT INTO `rewards` VALUES (147, 'Logitech 鍵盤', 'Logitech 鍵盤', 122, '2024-09-27 13:30:43', '2024-09-27 13:30:43');
INSERT INTO `rewards` VALUES (148, 'Logitech 鍵盤', 'Logitech 鍵盤', 29, '2024-09-27 13:30:45', '2024-09-27 13:30:45');
INSERT INTO `rewards` VALUES (149, 'Logitech 鍵盤', 'Logitech 鍵盤', 202, '2024-09-27 13:30:47', '2024-09-27 13:30:47');
INSERT INTO `rewards` VALUES (150, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 75, '2024-09-27 13:30:49', '2024-09-27 13:30:49');
INSERT INTO `rewards` VALUES (151, 'Logitech 滑鼠', 'Logitech 滑鼠', 74, '2024-09-27 13:30:51', '2024-09-27 13:30:51');
INSERT INTO `rewards` VALUES (152, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 69, '2024-09-27 13:30:53', '2024-09-27 13:30:53');
INSERT INTO `rewards` VALUES (153, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 115, '2024-09-27 13:30:55', '2024-09-27 13:30:55');
INSERT INTO `rewards` VALUES (154, 'Logitech 滑鼠', 'Logitech 滑鼠', 53, '2024-09-27 13:30:57', '2024-09-27 13:30:57');
INSERT INTO `rewards` VALUES (155, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 79, '2024-09-27 13:30:59', '2024-09-27 13:30:59');
INSERT INTO `rewards` VALUES (156, 'Logitech 滑鼠', 'Logitech 滑鼠', 164, '2024-09-27 13:31:01', '2024-09-27 13:31:01');
INSERT INTO `rewards` VALUES (157, 'Logitech 滑鼠', 'Logitech 滑鼠', 171, '2024-09-27 13:31:03', '2024-09-27 13:31:03');
INSERT INTO `rewards` VALUES (158, 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 6, '2024-09-27 13:31:05', '2024-09-27 13:31:05');
INSERT INTO `rewards` VALUES (159, 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 'ASUS mini PC i7 13th 13700k/16G DDR5 Ram/1TB SSD ', 37, '2024-09-27 13:31:07', '2024-09-27 13:31:07');
INSERT INTO `rewards` VALUES (160, 'Logitech 鍵盤', 'Logitech 鍵盤', 181, '2024-09-27 13:31:09', '2024-09-27 13:31:09');
INSERT INTO `rewards` VALUES (161, 'Logitech 滑鼠', 'Logitech 滑鼠', 147, '2024-09-27 13:31:11', '2024-09-27 13:31:11');
INSERT INTO `rewards` VALUES (162, 'Logitech 鍵盤', 'Logitech 鍵盤', 55, '2024-09-27 13:31:13', '2024-09-27 13:31:13');
INSERT INTO `rewards` VALUES (163, 'Logitech 滑鼠', 'Logitech 滑鼠', 165, '2024-09-27 13:31:15', '2024-09-27 13:31:15');
INSERT INTO `rewards` VALUES (164, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 3, '2024-09-27 13:31:17', '2024-09-27 13:31:17');
INSERT INTO `rewards` VALUES (165, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 82, '2024-09-27 13:31:19', '2024-09-27 13:31:19');
INSERT INTO `rewards` VALUES (166, 'Logitech 鍵盤', 'Logitech 鍵盤', 21, '2024-09-27 13:31:21', '2024-09-27 13:31:21');
INSERT INTO `rewards` VALUES (167, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 103, '2024-09-27 13:31:23', '2024-09-27 13:31:23');
INSERT INTO `rewards` VALUES (168, 'Logitech 滑鼠', 'Logitech 滑鼠', 196, '2024-09-27 13:31:25', '2024-09-27 13:31:25');
INSERT INTO `rewards` VALUES (169, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 129, '2024-09-27 13:31:27', '2024-09-27 13:31:27');
INSERT INTO `rewards` VALUES (170, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 39, '2024-09-27 13:31:29', '2024-09-27 13:31:29');
INSERT INTO `rewards` VALUES (171, 'Logitech 鍵盤', 'Logitech 鍵盤', 107, '2024-09-27 13:31:31', '2024-09-27 13:31:31');
INSERT INTO `rewards` VALUES (172, 'Logitech 滑鼠', 'Logitech 滑鼠', 176, '2024-09-27 13:31:33', '2024-09-27 13:31:33');
INSERT INTO `rewards` VALUES (173, 'Logitech 鍵盤', 'Logitech 鍵盤', 76, '2024-09-27 13:31:35', '2024-09-27 13:31:35');
INSERT INTO `rewards` VALUES (174, 'Logitech 鍵盤', 'Logitech 鍵盤', 185, '2024-09-27 13:31:37', '2024-09-27 13:31:37');
INSERT INTO `rewards` VALUES (175, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 143, '2024-09-27 13:31:39', '2024-09-27 13:31:39');
INSERT INTO `rewards` VALUES (176, 'Logitech 鍵盤', 'Logitech 鍵盤', 2, '2024-09-27 13:31:41', '2024-09-27 13:31:41');
INSERT INTO `rewards` VALUES (177, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 87, '2024-09-27 13:31:43', '2024-09-27 13:31:43');
INSERT INTO `rewards` VALUES (178, 'Logitech 滑鼠', 'Logitech 滑鼠', 31, '2024-09-27 13:31:45', '2024-09-27 13:31:45');
INSERT INTO `rewards` VALUES (179, 'Logitech 滑鼠', 'Logitech 滑鼠', 101, '2024-09-27 13:31:47', '2024-09-27 13:31:47');
INSERT INTO `rewards` VALUES (180, 'Logitech 滑鼠', 'Logitech 滑鼠', 47, '2024-09-27 13:31:49', '2024-09-27 13:31:49');
INSERT INTO `rewards` VALUES (181, 'Logitech 滑鼠', 'Logitech 滑鼠', 46, '2024-09-27 13:31:51', '2024-09-27 13:31:51');
INSERT INTO `rewards` VALUES (182, 'Logitech 鍵盤', 'Logitech 鍵盤', 133, '2024-09-27 13:31:53', '2024-09-27 13:31:53');
INSERT INTO `rewards` VALUES (183, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 40, '2024-09-27 13:31:55', '2024-09-27 13:31:55');
INSERT INTO `rewards` VALUES (184, 'Logitech 滑鼠', 'Logitech 滑鼠', 84, '2024-09-27 13:31:57', '2024-09-27 13:31:57');
INSERT INTO `rewards` VALUES (185, 'Logitech 滑鼠', 'Logitech 滑鼠', 78, '2024-09-27 13:31:59', '2024-09-27 13:31:59');
INSERT INTO `rewards` VALUES (186, 'Logitech 滑鼠', 'Logitech 滑鼠', 146, '2024-09-27 13:32:01', '2024-09-27 13:32:01');
INSERT INTO `rewards` VALUES (187, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 50, '2024-09-27 13:32:03', '2024-09-27 13:32:03');
INSERT INTO `rewards` VALUES (188, 'LG OLED 螢幕 32“', 'LG OLED 螢幕 32“', 18, '2024-09-27 13:32:05', '2024-09-27 13:32:05');
INSERT INTO `rewards` VALUES (189, 'Logitech 滑鼠', 'Logitech 滑鼠', 23, '2024-09-27 13:32:07', '2024-09-27 13:32:07');
INSERT INTO `rewards` VALUES (190, 'Logitech 鍵盤', 'Logitech 鍵盤', 178, '2024-09-27 13:32:09', '2024-09-27 13:32:09');
INSERT INTO `rewards` VALUES (191, 'Logitech 鍵盤', 'Logitech 鍵盤', 73, '2024-09-27 13:32:11', '2024-09-27 13:32:11');
INSERT INTO `rewards` VALUES (192, 'Logitech 滑鼠', 'Logitech 滑鼠', 117, '2024-09-27 13:32:13', '2024-09-27 13:32:13');
INSERT INTO `rewards` VALUES (193, 'Logitech 鍵盤', 'Logitech 鍵盤', 184, '2024-09-27 13:32:15', '2024-09-27 13:32:15');
INSERT INTO `rewards` VALUES (194, 'Logitech 滑鼠', 'Logitech 滑鼠', 13, '2024-09-27 13:32:17', '2024-09-27 13:32:17');
INSERT INTO `rewards` VALUES (195, 'Logitech 滑鼠', 'Logitech 滑鼠', 166, '2024-09-27 13:32:19', '2024-09-27 13:32:19');
INSERT INTO `rewards` VALUES (196, 'Logitech 鍵盤', 'Logitech 鍵盤', 199, '2024-09-27 13:32:21', '2024-09-27 13:32:21');
INSERT INTO `rewards` VALUES (197, 'Logitech 鍵盤', 'Logitech 鍵盤', 105, '2024-09-27 13:32:23', '2024-09-27 13:32:23');
INSERT INTO `rewards` VALUES (198, 'Logitech 滑鼠', 'Logitech 滑鼠', 28, '2024-09-27 13:32:25', '2024-09-27 13:32:25');
INSERT INTO `rewards` VALUES (199, 'Logitech 鍵盤', 'Logitech 鍵盤', 4, '2024-09-27 13:32:27', '2024-09-27 13:32:27');
INSERT INTO `rewards` VALUES (200, 'Logitech 滑鼠', 'Logitech 滑鼠', 77, '2024-09-27 13:32:29', '2024-09-27 13:32:29');
INSERT INTO `rewards` VALUES (201, 'Logitech 滑鼠', 'Logitech 滑鼠', 159, '2024-09-27 13:32:31', '2024-09-27 13:32:31');
INSERT INTO `rewards` VALUES (202, 'Logitech 滑鼠', 'Logitech 滑鼠', 41, '2024-09-27 13:32:33', '2024-09-27 13:32:33');
INSERT INTO `rewards` VALUES (203, 'Logitech 滑鼠', 'Logitech 滑鼠', 155, '2024-09-27 13:32:35', '2024-09-27 13:32:35');
INSERT INTO `rewards` VALUES (204, 'Logitech 鍵盤', 'Logitech 鍵盤', 134, '2024-09-27 13:32:37', '2024-09-27 13:32:37');
INSERT INTO `rewards` VALUES (205, 'Logitech 鍵盤', 'Logitech 鍵盤', 200, '2024-09-27 13:32:39', '2024-09-27 13:32:39');
INSERT INTO `rewards` VALUES (206, 'Logitech 鍵盤', 'Logitech 鍵盤', 48, '2024-09-27 13:32:41', '2024-09-27 13:32:41');
INSERT INTO `rewards` VALUES (207, 'Logitech 鍵盤', 'Logitech 鍵盤', 188, '2024-09-27 13:32:43', '2024-09-27 13:32:43');
INSERT INTO `rewards` VALUES (208, 'Logitech 鍵盤', 'Logitech 鍵盤', 96, '2024-09-27 13:32:45', '2024-09-27 13:32:45');
INSERT INTO `rewards` VALUES (209, 'Logitech 滑鼠', 'Logitech 滑鼠', 182, '2024-09-27 13:32:47', '2024-09-27 13:32:47');
INSERT INTO `rewards` VALUES (210, 'Logitech 滑鼠', 'Logitech 滑鼠', 57, '2024-09-27 13:32:49', '2024-09-27 13:32:49');
INSERT INTO `rewards` VALUES (211, 'Logitech 鍵盤', 'Logitech 鍵盤', 186, '2024-09-27 13:32:51', '2024-09-27 13:32:51');
INSERT INTO `rewards` VALUES (212, 'Logitech 滑鼠', 'Logitech 滑鼠', 64, '2024-09-27 13:32:53', '2024-09-27 13:32:53');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `createdAt` datetime NULL DEFAULT NULL,
  `updatedAt` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 203 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'renfu.her@gmail.com', '何人輔', '2024-09-26 22:07:43', '2024-09-26 22:07:46');
INSERT INTO `users` VALUES (2, 'zivhsiao@!gmail.com', 'Ziv Hsiao', '2024-09-26 22:08:07', '2024-09-26 22:08:10');
INSERT INTO `users` VALUES (3, 'Reymundo96@gmail.com', 'Janet Kiehn-Langworth', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (4, 'Alison73@yahoo.com', 'Domingo Weissnat V', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (5, 'Jadyn.Ullrich-Emmerich@gmail.com', 'Andre Jacobson', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (6, 'Abel.Glover@hotmail.com', 'Chris Bayer Jr.', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (7, 'Name_Blanda@yahoo.com', 'Drew Runolfsdottir', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (8, 'Iliana_Bernhard75@yahoo.com', 'Angel Turcotte', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (9, 'Alysha37@hotmail.com', 'Dr. Timmy Beer', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (10, 'Marcellus84@gmail.com', 'Jeanne Labadie', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (11, 'Holden.Flatley94@yahoo.com', 'Phil Mertz', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (12, 'Shaina_Bernhard@hotmail.com', 'Mrs. Agnes McKenzie', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (13, 'Ali96@gmail.com', 'Amy Murray', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (14, 'Otilia_Walsh@yahoo.com', 'Wendy Ankunding', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (15, 'Federico_Kilback@hotmail.com', 'Erika Kessler', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (16, 'Rudolph.Gleason34@yahoo.com', 'Willis Prosacco', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (17, 'Era94@yahoo.com', 'Kirk Reichert', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (18, 'Pearlie_Hand@gmail.com', 'Darryl Nader', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (19, 'Davonte_Labadie62@yahoo.com', 'Mae Rosenbaum', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (20, 'Garry.McGlynn@hotmail.com', 'Alexandra Windler', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (21, 'Eldora.Bartell@gmail.com', 'Hugh Kreiger', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (22, 'Nella83@gmail.com', 'Ms. Juanita Wolff', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (23, 'Deven53@gmail.com', 'Mrs. Patricia Monahan', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (24, 'Armand37@hotmail.com', 'Timothy Borer', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (25, 'Oral22@yahoo.com', 'Vivian Lynch', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (26, 'Edmond11@hotmail.com', 'Mr. Billy Langworth', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (27, 'Alessandro_Morissette@gmail.com', 'Rudolph Lehner', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (28, 'Van_Jacobson83@yahoo.com', 'Dewey Rogahn', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (29, 'Noemy_Weimann30@hotmail.com', 'Dr. Taylor Shields', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (30, 'Salma_Morissette@hotmail.com', 'Debra Lesch', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (31, 'Ottilie16@gmail.com', 'Sophie Monahan', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (32, 'Alda14@hotmail.com', 'Ms. Maryann Brown', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (33, 'Micheal.McLaughlin12@hotmail.com', 'Sadie Hane', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (34, 'Earline_Mitchell46@gmail.com', 'Kelvin Thiel PhD', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (35, 'Gisselle.Hane91@yahoo.com', 'Wilson Donnelly', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (36, 'Arjun_Weissnat-West@hotmail.com', 'Belinda Bailey PhD', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (37, 'Mariah_Muller@yahoo.com', 'Drew Tillman', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (38, 'Reese.Zieme@hotmail.com', 'Earnest Bergnaum', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (39, 'Ian_Ferry67@hotmail.com', 'Claire Feeney', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (40, 'Twila_Hills27@hotmail.com', 'Dr. Shannon Reilly', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (41, 'Lonzo77@hotmail.com', 'Janet Larson DVM', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (42, 'Rollin.Stamm@hotmail.com', 'Mamie Pfannerstill', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (43, 'Shania.Stokes-Labadie76@yahoo.com', 'Mr. Matt Treutel', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (44, 'Astrid.Stehr23@yahoo.com', 'Johnnie Cremin PhD', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (45, 'Noemie_Shanahan@yahoo.com', 'Alex Lesch', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (46, 'Scot_Stokes@hotmail.com', 'Emilio Little', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (47, 'Julia54@hotmail.com', 'Delores Veum', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (48, 'Zackery_McGlynn@yahoo.com', 'Susan Prohaska', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (49, 'Nathen_Paucek31@gmail.com', 'Anita Marvin', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (50, 'Jarrell0@hotmail.com', 'Annette Kemmer', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (51, 'Nathaniel_Fisher@gmail.com', 'Elizabeth Sauer', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (52, 'Gillian.Pfannerstill92@yahoo.com', 'Brandon Jerde', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (53, 'Jeffry_Abshire60@gmail.com', 'Christian Reichel', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (54, 'Spencer.Rogahn@hotmail.com', 'Melanie Lueilwitz-Cummerata', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (55, 'Serena.Becker85@hotmail.com', 'Krista Medhurst', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (56, 'Elwin_Kertzmann74@hotmail.com', 'Isaac Cole', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (57, 'Sven.Lindgren2@hotmail.com', 'Cameron Hane', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (58, 'Rick_Herman83@yahoo.com', 'Helen Witting', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (59, 'Bria_Trantow@yahoo.com', 'Dr. Floyd Lakin', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (60, 'Augustus52@yahoo.com', 'Jacqueline Murphy', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (61, 'Braxton_Wunsch69@gmail.com', 'Shelly Towne', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (62, 'Lesly6@yahoo.com', 'Rudy Effertz', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (63, 'Russel81@yahoo.com', 'Janis Hammes', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (64, 'Ardith.Fahey@gmail.com', 'Lorenzo Tillman', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (65, 'Kennith10@yahoo.com', 'Sylvia Veum', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (66, 'Cicero_Ebert@gmail.com', 'Gene Morissette DVM', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (67, 'Oliver.Brown@gmail.com', 'Austin Grady', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (68, 'Hermann_Stoltenberg@yahoo.com', 'Ms. Jaime Bechtelar', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (69, 'Callie.Volkman88@gmail.com', 'Perry Halvorson', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (70, 'Augusta.Schaefer@gmail.com', 'Fernando Romaguera', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (71, 'Kara.Baumbach@gmail.com', 'Terence Wyman', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (72, 'Gerson94@yahoo.com', 'Ian Hills', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (73, 'Annamae.Schamberger62@gmail.com', 'Franklin Fadel', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (74, 'Jacky49@yahoo.com', 'Laverne Harber', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (75, 'Rene_Murazik@gmail.com', 'Derrick Boehm', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (76, 'Isadore91@yahoo.com', 'Edgar Williamson', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (77, 'Furman13@hotmail.com', 'Amos Volkman III', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (78, 'Samara17@yahoo.com', 'Dr. Jamie Schuster', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (79, 'Rosella56@hotmail.com', 'Ms. Jenna Klein', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (80, 'Kamille_Sauer-Franecki89@yahoo.com', 'Bessie Howell', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (81, 'Elisha63@gmail.com', 'Darin Beahan', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (82, 'Terence_Hansen@gmail.com', 'Ryan Powlowski', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (83, 'Kattie.Watsica60@hotmail.com', 'Terry Schaden', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (84, 'Raphaelle.Little69@gmail.com', 'Melissa Runte IV', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (85, 'Raymundo.Schimmel@gmail.com', 'Floyd Fay', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (86, 'Tyler_OHara-Brekke77@hotmail.com', 'Dr. Stuart Jones V', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (87, 'Brianne.Gorczany@hotmail.com', 'Homer Koelpin', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (88, 'Anahi0@gmail.com', 'Preston Ritchie', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (89, 'Ruben.Kulas@yahoo.com', 'Lucas Sawayn', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (90, 'Alvena_OKeefe@yahoo.com', 'Raymond King', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (91, 'Estefania38@yahoo.com', 'Mr. Lyle Lind', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (92, 'Jonatan.Rau58@hotmail.com', 'Jacob Marquardt DVM', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (93, 'Jack_Collier87@hotmail.com', 'Muriel Jacobs', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (94, 'Marcelina.Stamm-Walter49@yahoo.com', 'Kay Gerlach-Macejkovic', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (95, 'Charlie41@hotmail.com', 'Jeremiah Reichert', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (96, 'Missouri_Tillman82@yahoo.com', 'Josefina McClure', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (97, 'Hailie73@yahoo.com', 'Arturo Okuneva', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (98, 'Miles.Rohan72@gmail.com', 'Eileen Feeney', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (99, 'Amy_Schroeder13@yahoo.com', 'Isaac Thompson', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (100, 'Leif.Kuvalis@gmail.com', 'Sharon Schamberger', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (101, 'Josefa_Bernier@yahoo.com', 'Lydia Frami III', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (102, 'Kiarra66@yahoo.com', 'Angelina Fay', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (103, 'Kurtis_Terry@yahoo.com', 'Vivian Roberts', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (104, 'Christy.Huels@hotmail.com', 'Danny Zieme', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (105, 'Natalia.Frami54@hotmail.com', 'Helen Lubowitz MD', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (106, 'Eric99@hotmail.com', 'Joanna Hudson-Nikolaus', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (107, 'Alexis.Boyle34@gmail.com', 'Damon Pacocha Jr.', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (108, 'Malcolm_Bednar@gmail.com', 'Julian Mueller', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (109, 'Chauncey_Kautzer26@hotmail.com', 'Norman Heaney', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (110, 'Leo21@hotmail.com', 'Edward Hodkiewicz', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (111, 'Adelbert86@gmail.com', 'Nelson Wyman', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (112, 'Aletha_Mills46@gmail.com', 'Madeline Mayert', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (113, 'Grover_Hahn@hotmail.com', 'Leland Monahan', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (114, 'Marianne_Ruecker-Gulgowski@yahoo.com', 'Kyle Bogisich', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (115, 'Garland.Greenholt29@hotmail.com', 'Ella Kunze', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (116, 'Camylle.Zieme@gmail.com', 'Bobby Gerhold', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (117, 'Madie42@gmail.com', 'Daisy Larson III', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (118, 'Milan.Bahringer@hotmail.com', 'Naomi Zboncak MD', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (119, 'Wilbert54@gmail.com', 'Dennis Stehr', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (120, 'Raquel.Casper49@gmail.com', 'Kathryn Crist', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (121, 'Araceli69@gmail.com', 'Dr. Billy Hayes', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (122, 'Elias_Kling@hotmail.com', 'Vicky Gibson', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (123, 'Yessenia.Crona34@hotmail.com', 'Jeff Herzog', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (124, 'Ariane_Shanahan8@yahoo.com', 'Dixie Ruecker Jr.', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (125, 'Adolf83@gmail.com', 'Nettie Nicolas', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (126, 'Brooke47@yahoo.com', 'Jerry Larson', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (127, 'Dustin47@hotmail.com', 'Lynda Jaskolski', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (128, 'Carlotta75@yahoo.com', 'Angelo Braun', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (129, 'Rahsaan77@gmail.com', 'Beverly Batz', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (130, 'Rahul_Lebsack@gmail.com', 'Eva Beahan', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (131, 'Creola_Kris@hotmail.com', 'Mr. Angel Rowe', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (132, 'Bradley6@hotmail.com', 'Sharon Yundt', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (133, 'Citlalli.Jakubowski44@gmail.com', 'Rochelle Tillman', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (134, 'Ola_Waters37@gmail.com', 'Rosemarie Grimes', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (135, 'Caroline_OKon26@gmail.com', 'Roderick Bins', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (136, 'Maryam57@gmail.com', 'Yvonne Hintz', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (137, 'Raegan_Blick52@gmail.com', 'Dr. Leo Cassin MD', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (138, 'Jamison_Beer-Hirthe@gmail.com', 'Gordon Kuphal', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (139, 'Ignacio87@yahoo.com', 'Bridget Deckow', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (140, 'Adelbert65@gmail.com', 'Adam Hansen-Gleichner', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (141, 'Trey50@yahoo.com', 'Noel Huel-Raynor', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (142, 'Prudence.Strosin82@hotmail.com', 'Alice Sporer', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (143, 'Jared.Stracke@hotmail.com', 'Isaac Gibson DDS', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (144, 'Reilly47@gmail.com', 'Ramona Gutmann', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (145, 'Luther.Collier@yahoo.com', 'Lila Pollich', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (146, 'Josephine_Glover@hotmail.com', 'Melba Skiles', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (147, 'Emma.Emard@hotmail.com', 'Maryann Jacobi', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (148, 'Berneice82@gmail.com', 'Lori Wuckert', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (149, 'Nya44@hotmail.com', 'Leland Schulist', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (150, 'Lavon95@yahoo.com', 'Lindsey Hirthe', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (151, 'Destiny.Pouros-Connelly21@gmail.com', 'Cristina McLaughlin', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (152, 'Dock_Wuckert@yahoo.com', 'Josephine Berge', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (153, 'Kristofer68@yahoo.com', 'Allan Crooks', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (154, 'Clementina.Green49@yahoo.com', 'Beatrice Kuhic', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (155, 'Kristina.Padberg93@hotmail.com', 'Kayla Blanda', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (156, 'Freddy.Grant@yahoo.com', 'Wendell Bernier-Willms', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (157, 'Luigi86@gmail.com', 'Pedro Bauch-Blanda', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (158, 'Rosalyn3@hotmail.com', 'Viola Farrell', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (159, 'Viva_Bradtke28@yahoo.com', 'Miss Jill Auer', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (160, 'Marie_Okuneva@yahoo.com', 'Jaime Collier', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (161, 'Albert7@yahoo.com', 'Charlotte Borer', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (162, 'Garrison_OHara38@gmail.com', 'Mrs. Olive Conn', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (163, 'Aylin.Auer31@yahoo.com', 'Cedric Ratke', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (164, 'Milan78@hotmail.com', 'Jerry Berge III', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (165, 'Benedict_Boehm81@gmail.com', 'Desiree Gibson', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (166, 'Skyla_Simonis73@gmail.com', 'Rudolph Emmerich', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (167, 'Trevor10@yahoo.com', 'Darnell Muller', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (168, 'Noah_Beer56@gmail.com', 'Gregg Champlin', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (169, 'Jordane_Pollich@hotmail.com', 'Roberta Bailey', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (170, 'Ruben_Fadel28@gmail.com', 'Aaron Trantow', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (171, 'Johnathan.Keebler@yahoo.com', 'Jeanne Kris', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (172, 'Hellen.Treutel@gmail.com', 'Ms. Cecilia Cummerata', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (173, 'Kyler32@hotmail.com', 'Ralph Gerhold', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (174, 'Vicente_Lueilwitz22@gmail.com', 'Hope Bartoletti', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (175, 'Wilhelm_Ziemann@yahoo.com', 'Preston Simonis', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (176, 'Colby73@gmail.com', 'Denise Pacocha', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (177, 'Iliana77@yahoo.com', 'Maryann Kautzer', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (178, 'Morgan.Adams6@hotmail.com', 'Bertha Gerhold DVM', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (179, 'Jasen.Ondricka53@hotmail.com', 'Enrique Johnson-Armstrong', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (180, 'Napoleon.Satterfield31@gmail.com', 'Lucas Davis', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (181, 'Pierce.Satterfield-White67@gmail.com', 'Charlie Denesik', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (182, 'Kamron29@yahoo.com', 'Ellis Krajcik', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (183, 'Lelah10@gmail.com', 'Rogelio Hermiston', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (184, 'Royal_Jakubowski@gmail.com', 'Tracey Luettgen', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (185, 'Cristina.Hintz36@gmail.com', 'Nick Walker', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (186, 'Constance_Brown84@hotmail.com', 'Jason Turcotte', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (187, 'Bonnie.Rohan@yahoo.com', 'Sergio Marks', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (188, 'Arnold.Shields@hotmail.com', 'Hannah Weimann-Hessel', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (189, 'Shanna.Padberg17@yahoo.com', 'Emily Morar', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (190, 'Corbin42@yahoo.com', 'Tommie Runolfsdottir', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (191, 'Shannon.Kovacek64@hotmail.com', 'Andres Dickinson', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (192, 'Ernestine5@gmail.com', 'Kim McCullough II', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (193, 'Ed_Jast74@gmail.com', 'Miss Pauline Kris', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (194, 'Sigmund29@yahoo.com', 'Kenneth Mosciski', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (195, 'Verda_Tremblay@yahoo.com', 'Clay Cummerata', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (196, 'Nedra_Weissnat11@hotmail.com', 'Tasha Macejkovic', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (197, 'Mackenzie43@hotmail.com', 'Dewey Terry', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (198, 'Norwood_MacGyver27@gmail.com', 'Leticia Grady', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (199, 'Reed.Macejkovic@gmail.com', 'Miss Opal Reichert', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (200, 'Alexandrea44@hotmail.com', 'Mr. Ervin Smitham', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (201, 'Chester_Barrows10@gmail.com', 'Phil Collins', '2024-09-27 13:01:54', '2024-09-27 13:01:54');
INSERT INTO `users` VALUES (202, 'Raquel_Flatley38@hotmail.com', 'Penny Harris', '2024-09-27 13:01:54', '2024-09-27 13:01:54');

SET FOREIGN_KEY_CHECKS = 1;
