/*
 Navicat Premium Data Transfer

 Source Server         : opennote_local
 Source Server Type    : MariaDB
 Source Server Version : 100509
 Source Host           : localhost:3306
 Source Schema         : isp

 Target Server Type    : MariaDB
 Target Server Version : 100509
 File Encoding         : 65001

 Date: 23/04/2021 16:18:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_accs_ip
-- ----------------------------
DROP TABLE IF EXISTS `t_accs_ip`;
CREATE TABLE `t_accs_ip`  (
  `ACCS_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `ACCS_IP` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '접근IP',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `PER_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '허용여부',
  PRIMARY KEY (`ACCS_SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '접근IP 관리' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_accs_ip
-- ----------------------------
INSERT INTO `t_accs_ip` VALUES (1, '123.12.213.13', '2020-02-05 16:46:13', '1', '2020-02-05 17:06:37', '1', 'Y', 'Y');
INSERT INTO `t_accs_ip` VALUES (2, '0.0.0.0', '2020-02-05 17:06:54', '1', NULL, NULL, 'Y', 'N');

-- ----------------------------
-- Table structure for t_ad_user
-- ----------------------------
DROP TABLE IF EXISTS `t_ad_user`;
CREATE TABLE `t_ad_user`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '아이디',
  `PWD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '비밀번호',
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '이름',
  `USE_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용유무',
  `RGST_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RGST_DT` timestamp(0) NOT NULL DEFAULT current_timestamp COMMENT '등록일',
  `RVSE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `RVSE_DT` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '수정일',
  `AUTH_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '권한코드',
  `EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '메일',
  `TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '전화번호',
  `HP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '핸드폰',
  `ATCH_FILE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일',
  `LAST_DATE` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '최종접속일',
  `DPRT` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '부서',
  `EXTNS_NMBR` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '내선번호',
  `SITE_CLCD` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '사이트구분',
  `FAIL_CNT` int(11) NULL DEFAULT 0 COMMENT '로그인실패횟수',
  `ADDR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '관리자관리' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_ad_user
-- ----------------------------
INSERT INTO `t_ad_user` VALUES (1, 'ispadm', '0FFE1ABD1A08215353C233D6E009613E95EEC4253832A761AF28FF37AC5A150C', '관리자', 'Y', NULL, '2020-01-21 15:25:58', '1', '2020-06-10 17:19:27', '1', '', '', '', ' ', '2020-08-03 15:38:10', '010101', '', 'rapa', 1, NULL);
INSERT INTO `t_ad_user` VALUES (2, 'mailTest1', '39743FFCFB179CEBA590B68FFF1A7C65A9DB72B3A5AD63EE01A66C6896A07311', 'mailTest1', 'Y', NULL, '2020-02-06 09:30:21', '1', '2020-05-20 14:16:39', '1', 'thank5214@naver.com', '1111', '1111', '', '0000-00-00 00:00:00', '', '', NULL, 0, NULL);
INSERT INTO `t_ad_user` VALUES (3, 'mailTest2', '39743FFCFB179CEBA590B68FFF1A7C65A9DB72B3A5AD63EE01A66C6896A07311', 'mailTest2', 'Y', NULL, '2020-02-06 09:31:21', '1', '2020-05-20 14:16:53', '1', 'khn5214@nate.com', '1111', '1111', '', '0000-00-00 00:00:00', '', '', NULL, 0, NULL);
INSERT INTO `t_ad_user` VALUES (4, 'mailTest3', '39743FFCFB179CEBA590B68FFF1A7C65A9DB72B3A5AD63EE01A66C6896A07311', 'mailTest3', 'Y', NULL, '2020-02-06 09:31:51', '1', '2020-05-20 14:17:02', '1', 'khn5214@gmail.com', '1111', '1111', '', '0000-00-00 00:00:00', '', '', NULL, 0, NULL);
INSERT INTO `t_ad_user` VALUES (5, 'admin', '0FFE1ABD1A08215353C233D6E009613E95EEC4253832A761AF28FF37AC5A150C', '사용자1', 'Y', NULL, '2020-05-08 12:54:15', '1', '2020-05-20 10:52:15', '1', 'thank5214@naver.com', '0101111111', '1231232222222', '', '0000-00-00 00:00:00', '', '', NULL, 0, NULL);
INSERT INTO `t_ad_user` VALUES (6, 'test1', '1B4F0E9851971998E732078544C96B36C3D01CEDF7CAA332359D6F1D83567014', 'test1', 'Y', NULL, '2021-04-07 14:11:18', NULL, '0000-00-00 00:00:00', NULL, '', NULL, '', NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 0, '');
INSERT INTO `t_ad_user` VALUES (7, 'test2', '60303AE22B998861BCE3B28F33EEC1BE758A213C86C93C076DBE9F558C11C752', 'test2', 'Y', NULL, '2021-04-07 14:13:29', NULL, '0000-00-00 00:00:00', NULL, '', NULL, '', NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 0, '');
INSERT INTO `t_ad_user` VALUES (8, 'test3', 'FD61A03AF4F77D870FC21E05E7E80678095C92D808CFB3B5C279EE04C74ACA13', 'test3', 'Y', NULL, '2021-04-07 19:11:29', NULL, '0000-00-00 00:00:00', NULL, '', NULL, '', NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 0, '');
INSERT INTO `t_ad_user` VALUES (9, 'admin123', '9BA01D9148D0E1F2D6C1597C052C703719E372C0D9C39D809B2B3C6E5EF4B377', 'test1', 'Y', NULL, '2021-04-07 19:14:56', NULL, '0000-00-00 00:00:00', NULL, '', NULL, '', NULL, '0000-00-00 00:00:00', NULL, NULL, NULL, 0, '');

-- ----------------------------
-- Table structure for t_ad_user_auth
-- ----------------------------
DROP TABLE IF EXISTS `t_ad_user_auth`;
CREATE TABLE `t_ad_user_auth`  (
  `SEQ` int(11) NOT NULL COMMENT '일련번호',
  `AUTH_CODE` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '권한그룹코드',
  `AUTH_CODE_NM` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '권한그룹명',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `CTT` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '설명',
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '권한그룹관리' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_ad_user_auth
-- ----------------------------
INSERT INTO `t_ad_user_auth` VALUES (1, '1', '전체관리자', '2020-01-21 15:34:31', NULL, '2021-04-22 15:40:51', '5', 'Y', '');

-- ----------------------------
-- Table structure for t_ad_user_auth_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_ad_user_auth_menu`;
CREATE TABLE `t_ad_user_auth_menu`  (
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '아이디',
  `MENU_SEQ` int(11) NOT NULL COMMENT '메뉴일련번호',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  PRIMARY KEY (`ID`, `MENU_SEQ`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '권한메뉴관리' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_ad_user_auth_menu
-- ----------------------------
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 35, '2021-04-22 15:40:57', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 240, '2021-04-22 15:40:55', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 262, '2021-04-22 15:41:00', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 267, '2021-04-22 15:41:00', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 268, '2021-04-22 15:41:00', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 320, '2021-04-22 15:41:03', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 321, '2021-04-22 15:41:03', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 322, '2021-04-22 15:41:03', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 323, '2021-04-22 15:41:03', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 324, '2021-04-22 15:41:03', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 329, '2021-04-22 15:41:03', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 330, '2021-04-22 15:41:03', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 334, '2021-04-22 15:41:00', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 335, '2021-04-22 15:41:01', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 336, '2021-04-22 15:41:02', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 337, '2021-04-22 15:41:02', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 338, '2021-04-22 15:41:03', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 361, '2021-04-22 15:40:59', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 362, '2021-04-22 15:40:59', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 363, '2021-04-22 15:40:59', '5');
INSERT INTO `t_ad_user_auth_menu` VALUES ('1', 364, '2021-04-22 15:41:03', '5');

-- ----------------------------
-- Table structure for t_as
-- ----------------------------
DROP TABLE IF EXISTS `t_as`;
CREATE TABLE `t_as`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `ATCH_FILE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일 아이디',
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_as
-- ----------------------------
INSERT INTO `t_as` VALUES (1, '1.', '1\r\n1.', '2021-04-07 14:55:06', '6', '2021-04-07 14:55:15', NULL, 'Y', 'FILE0000000000004079');
INSERT INTO `t_as` VALUES (2, '2', '2', '2021-04-07 14:55:24', '6', NULL, NULL, 'Y', '');
INSERT INTO `t_as` VALUES (3, '2.a', '&lt;p&gt;2.\r\n&lt;/p&gt;&lt;p&gt;2a&lt;/p&gt;\r\n.', '2021-04-07 14:55:52', '7', '2021-04-07 15:00:24', NULL, 'Y', 'FILE0000000000004080');
INSERT INTO `t_as` VALUES (4, '3.', '3.', '2021-04-07 17:31:43', '6', '2021-04-07 17:31:55', NULL, 'Y', 'FILE0000000000004103');
INSERT INTO `t_as` VALUES (5, '4', '4', '2021-04-07 17:32:04', '6', NULL, NULL, 'Y', '');
INSERT INTO `t_as` VALUES (6, '12344', '123444', '2021-04-07 19:16:46', '9', '2021-04-07 19:22:14', NULL, 'Y', 'FILE0000000000004107');
INSERT INTO `t_as` VALUES (7, '11', '11', '2021-04-08 10:53:53', '6', '2021-04-08 10:53:58', NULL, 'N', '');
INSERT INTO `t_as` VALUES (8, '글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글', '글자수 테스트\r\n\r\n글자수 테스트\r\n\r\n                                  글자수 테스트\r\n\r\n글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트글자수 테스트', '2021-04-08 14:18:46', '6', NULL, NULL, 'Y', '');

-- ----------------------------
-- Table structure for t_as_reply
-- ----------------------------
DROP TABLE IF EXISTS `t_as_reply`;
CREATE TABLE `t_as_reply`  (
  `BREPLY_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `SUB_SEQ` int(11) NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `ATCH_FILE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일 아이디',
  PRIMARY KEY (`BREPLY_SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_as_reply
-- ----------------------------
INSERT INTO `t_as_reply` VALUES (1, 1, '&lt;p&gt;111&lt;/p&gt;&lt;p&gt;1.&lt;/p&gt;', '2021-04-07 14:56:46', '5', '2021-04-07 14:56:53', NULL, 'Y', 'FILE0000000000004081');
INSERT INTO `t_as_reply` VALUES (2, 3, '&lt;p&gt;3&lt;/p&gt;', '2021-04-07 14:57:12', '5', NULL, NULL, 'N', '');
INSERT INTO `t_as_reply` VALUES (3, 3, '&lt;p&gt;a&lt;/p&gt;', '2021-04-07 15:00:58', '5', NULL, NULL, 'Y', '');
INSERT INTO `t_as_reply` VALUES (4, 6, '&lt;p&gt;asdfsadf12231&lt;/p&gt;', '2021-04-07 19:20:53', '5', '2021-04-07 19:22:02', NULL, 'N', 'FILE0000000000004106');

-- ----------------------------
-- Table structure for t_atch_file
-- ----------------------------
DROP TABLE IF EXISTS `t_atch_file`;
CREATE TABLE `t_atch_file`  (
  `ATCH_FILE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '첨부파일 아이디',
  `USE_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'Y' COMMENT '사용여부',
  `REG_DATE` timestamp(0) NOT NULL DEFAULT current_timestamp COMMENT '등록일시',
  `REG_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자 아이디',
  PRIMARY KEY (`ATCH_FILE_ID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '첨부파일관리' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_atch_file
-- ----------------------------
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004073', 'Y', '2021-04-07 10:14:15', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004074', 'Y', '2021-04-07 10:48:23', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004075', 'Y', '2021-04-07 11:02:05', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004076', 'Y', '2021-04-07 11:11:28', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004077', 'Y', '2021-04-07 13:58:39', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004078', 'Y', '2021-04-07 14:14:20', '7');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004079', 'Y', '2021-04-07 14:55:05', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004080', 'Y', '2021-04-07 14:55:49', '7');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004081', 'Y', '2021-04-07 14:56:51', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004082', 'Y', '2021-04-07 15:25:53', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004083', 'Y', '2021-04-07 15:26:26', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004084', 'Y', '2021-04-07 15:27:53', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004085', 'Y', '2021-04-07 15:28:05', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004086', 'Y', '2021-04-07 15:50:45', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004087', 'Y', '2021-04-07 15:51:06', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004088', 'Y', '2021-04-07 15:51:39', '7');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004089', 'Y', '2021-04-07 15:59:12', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004090', 'Y', '2021-04-07 15:59:38', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004091', 'Y', '2021-04-07 16:00:01', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004092', 'Y', '2021-04-07 16:00:10', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004093', 'Y', '2021-04-07 16:00:24', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004094', 'Y', '2021-04-07 16:01:24', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004095', 'Y', '2021-04-07 16:01:36', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004096', 'Y', '2021-04-07 16:01:51', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004097', 'Y', '2021-04-07 16:06:00', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004098', 'Y', '2021-04-07 16:06:30', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004099', 'Y', '2021-04-07 16:06:53', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004100', 'Y', '2021-04-07 16:07:27', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004101', 'Y', '2021-04-07 16:07:56', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004102', 'Y', '2021-04-07 17:31:02', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004103', 'Y', '2021-04-07 17:31:42', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004104', 'Y', '2021-04-07 17:32:44', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004105', 'Y', '2021-04-07 17:33:09', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004106', 'Y', '2021-04-07 19:20:52', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004107', 'Y', '2021-04-07 19:22:14', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004108', 'Y', '2021-04-07 19:48:41', '9');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004109', 'Y', '2021-04-08 10:24:02', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004110', 'Y', '2021-04-08 10:49:26', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004111', 'Y', '2021-04-08 10:52:33', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004112', 'Y', '2021-04-08 10:52:51', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004113', 'Y', '2021-04-08 10:53:08', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004114', 'Y', '2021-04-08 14:15:39', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004115', 'Y', '2021-04-08 17:40:39', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004116', 'Y', '2021-04-09 10:23:58', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004117', 'Y', '2021-04-09 10:24:18', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004118', 'Y', '2021-04-09 10:24:39', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004119', 'Y', '2021-04-09 10:33:36', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004120', 'Y', '2021-04-09 10:35:15', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004121', 'Y', '2021-04-09 10:36:16', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004122', 'Y', '2021-04-09 10:43:00', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004123', 'Y', '2021-04-09 12:45:20', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004124', 'Y', '2021-04-09 12:45:20', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004125', 'Y', '2021-04-09 12:45:51', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004126', 'Y', '2021-04-09 12:46:23', '6');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004127', 'Y', '2021-04-20 09:41:03', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004128', 'Y', '2021-04-20 09:42:14', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004129', 'Y', '2021-04-20 09:43:40', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004130', 'Y', '2021-04-20 10:04:12', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004131', 'Y', '2021-04-20 10:05:35', '5');
INSERT INTO `t_atch_file` VALUES ('FILE0000000000004132', 'Y', '2021-04-20 10:06:00', '5');

-- ----------------------------
-- Table structure for t_atch_file_detail
-- ----------------------------
DROP TABLE IF EXISTS `t_atch_file_detail`;
CREATE TABLE `t_atch_file_detail`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `ATCH_FILE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '첨부파일 아이디',
  `FILE_SN` int(11) NOT NULL COMMENT '파일 순번',
  `FILE_STRE_COURS` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '물리 파일 경로',
  `STRE_FILE_NM` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '물리 파일 명',
  `ORIGN_FILE_NM` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '실제 파일 명',
  `FILE_EXTSN` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '확장자',
  `FILE_CN` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '파일 내용',
  `FILE_SIZE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '파일 크기',
  `FILE_TYPE` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '파일 타입',
  `DEL_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'N' COMMENT '삭제 여부',
  `REG_DATE` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `REG_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자 ',
  `IMAGE_WIDTH` int(11) NULL DEFAULT 0 COMMENT '이미지 넓이',
  `IMAGE_HEIGHT` int(11) NULL DEFAULT 0 COMMENT '이미지 높이',
  `ATCH_FILE` blob NULL DEFAULT NULL,
  `PARENT_SEQ` int(11) NULL DEFAULT NULL COMMENT '글 일련번호',
  `FILE_IMSI` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '파일임시여부',
  PRIMARY KEY (`SEQ`, `ATCH_FILE_ID`, `FILE_SN`, `DEL_YN`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 86 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '첨부파일 상세관리' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_atch_file_detail
-- ----------------------------
INSERT INTO `t_atch_file_detail` VALUES (1, 'FILE0000000000004073', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\10', 'ATCH20210407101415356FILE00000000000040730', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-07 10:14:15', '5', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (2, 'FILE0000000000004074', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\10', 'ATCH20210407104823507FILE00000000000040740', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-07 10:48:23', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (3, 'FILE0000000000004075', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\11', 'ATCH20210407110205562FILE00000000000040750', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-07 11:02:05', '5', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (4, 'FILE0000000000004076', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\11', 'ATCH20210407111127919FILE00000000000040760', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-07 11:11:28', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (5, 'FILE0000000000004077', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\13', 'ATCH20210407015839629FILE00000000000040770', '5.png', 'png', '', '80277', 'image/png', 'N', '2021-04-07 13:58:39', '5', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (6, 'FILE0000000000004078', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\14', 'ATCH20210407021419994FILE00000000000040780', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-07 14:14:20', '7', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (7, 'FILE0000000000004079', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\14', 'ATCH20210407025505111FILE00000000000040790', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-07 14:55:05', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (8, 'FILE0000000000004080', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\14', 'ATCH20210407025549944FILE00000000000040800', '5.png', 'png', '', '80277', 'image/png', 'N', '2021-04-07 14:55:49', '7', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (9, 'FILE0000000000004081', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\14', 'ATCH20210407025651677FILE00000000000040810', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 14:56:51', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (10, 'FILE0000000000004082', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407032553066FILE00000000000040820', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-07 15:25:53', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (11, 'FILE0000000000004082', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407032556105FILE00000000000040820', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-07 15:25:56', '5', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (12, 'FILE0000000000004082', 2, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407032558645FILE00000000000040820', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 15:25:58', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (13, 'FILE0000000000004083', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407032626179FILE00000000000040830', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-07 15:26:26', '5', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (14, 'FILE0000000000004083', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407032628664FILE00000000000040830', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-07 15:26:28', '5', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (15, 'FILE0000000000004083', 2, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407032734322FILE00000000000040830', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 15:27:34', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (16, 'FILE0000000000004084', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407032753655FILE00000000000040840', '7.png', 'png', '', '93415', 'image/png', 'N', '2021-04-07 15:27:53', '5', 691, 886, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (17, 'FILE0000000000004085', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407032805920FILE00000000000040850', '5.png', 'png', '', '80277', 'image/png', 'Y', '2021-04-07 15:28:05', '5', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (18, 'FILE0000000000004085', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407032809704FILE00000000000040850', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-07 15:28:09', '5', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (19, 'FILE0000000000004086', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407035045556FILE00000000000040860', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-07 15:50:45', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (20, 'FILE0000000000004086', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407035054259FILE00000000000040860', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 15:50:54', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (21, 'FILE0000000000004087', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407035106117FILE00000000000040870', '5.png', 'png', '', '80277', 'image/png', 'N', '2021-04-07 15:51:06', '6', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (22, 'FILE0000000000004088', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407035139548FILE00000000000040880', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 15:51:39', '7', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (23, 'FILE0000000000004088', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407035142032FILE00000000000040880', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-07 15:51:42', '7', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (24, 'FILE0000000000004089', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407035912467FILE00000000000040890', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-07 15:59:12', '5', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (25, 'FILE0000000000004089', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407035924786FILE00000000000040890', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 15:59:24', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (26, 'FILE0000000000004090', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\15', 'ATCH20210407035938505FILE00000000000040900', '5.png', 'png', '', '80277', 'image/png', 'N', '2021-04-07 15:59:38', '5', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (27, 'FILE0000000000004091', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040001617FILE00000000000040910', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-07 16:00:01', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (28, 'FILE0000000000004092', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040010964FILE00000000000040920', '7.png', 'png', '', '93415', 'image/png', 'N', '2021-04-07 16:00:10', '5', 691, 886, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (29, 'FILE0000000000004092', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040014534FILE00000000000040920', '6.png', 'png', '', '65588', 'image/png', 'N', '2021-04-07 16:00:14', '5', 1300, 929, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (30, 'FILE0000000000004093', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040024115FILE00000000000040930', '6.png', 'png', '', '65588', 'image/png', 'N', '2021-04-07 16:00:24', '5', 1300, 929, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (31, 'FILE0000000000004093', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040027264FILE00000000000040930', '5.png', 'png', '', '80277', 'image/png', 'N', '2021-04-07 16:00:27', '5', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (32, 'FILE0000000000004093', 2, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040029619FILE00000000000040930', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 16:00:29', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (33, 'FILE0000000000004093', 3, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040032036FILE00000000000040930', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-07 16:00:32', '5', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (34, 'FILE0000000000004093', 4, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040034254FILE00000000000040930', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-07 16:00:34', '5', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (35, 'FILE0000000000004094', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040124048FILE00000000000040940', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 16:01:24', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (36, 'FILE0000000000004094', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040126466FILE00000000000040940', '5.png', 'png', '', '80277', 'image/png', 'N', '2021-04-07 16:01:26', '5', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (37, 'FILE0000000000004095', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040136159FILE00000000000040950', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-07 16:01:36', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (38, 'FILE0000000000004096', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040151955FILE00000000000040960', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 16:01:51', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (39, 'FILE0000000000004097', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040600786FILE00000000000040970', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-07 16:06:00', '6', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (40, 'FILE0000000000004097', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040603412FILE00000000000040970', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 16:06:03', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (41, 'FILE0000000000004098', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040630379FILE00000000000040980', '5.png', 'png', '', '80277', 'image/png', 'N', '2021-04-07 16:06:30', '6', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (42, 'FILE0000000000004099', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040653413FILE00000000000040990', '5.png', 'png', '', '80277', 'image/png', 'N', '2021-04-07 16:06:53', '6', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (43, 'FILE0000000000004099', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040705682FILE00000000000040990', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 16:07:05', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (44, 'FILE0000000000004100', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040727564FILE00000000000041000', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-07 16:07:27', '6', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (45, 'FILE0000000000004100', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040737519FILE00000000000041000', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 16:07:37', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (46, 'FILE0000000000004100', 2, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040747192FILE00000000000041000', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-07 16:07:47', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (47, 'FILE0000000000004101', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\16', 'ATCH20210407040756220FILE00000000000041010', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 16:07:56', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (48, 'FILE0000000000004102', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\17', 'ATCH20210407053102834FILE00000000000041020', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 17:31:02', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (49, 'FILE0000000000004103', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\17', 'ATCH20210407053142261FILE00000000000041030', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 17:31:42', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (50, 'FILE0000000000004104', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\17', 'ATCH20210407053244307FILE00000000000041040', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 17:32:44', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (51, 'FILE0000000000004105', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\17', 'ATCH20210407053309409FILE00000000000041050', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-07 17:33:09', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (52, 'FILE0000000000004105', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\17', 'ATCH20210407053320387FILE00000000000041050', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-07 17:33:20', '6', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (53, 'FILE0000000000004106', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\19', 'ATCH20210407072052251FILE00000000000041060', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-07 19:20:52', '5', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (54, 'FILE0000000000004106', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\19', 'ATCH20210407072159553FILE00000000000041060', '7.png', 'png', '', '93415', 'image/png', 'N', '2021-04-07 19:21:59', '5', 691, 886, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (55, 'FILE0000000000004107', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\19', 'ATCH20210407072213981FILE00000000000041070', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-07 19:22:14', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (56, 'FILE0000000000004108', 0, 'C:\\isp_attach\\upload\\2021\\04\\07\\19', 'ATCH20210407074841381FILE00000000000041080', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-07 19:48:41', '9', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (57, 'FILE0000000000004108', 1, 'C:\\isp_attach\\upload\\2021\\04\\07\\19', 'ATCH20210407074857342FILE00000000000041080', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-07 19:48:57', '9', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (58, 'FILE0000000000004108', 2, 'C:\\isp_attach\\upload\\2021\\04\\07\\19', 'ATCH20210407074858527FILE00000000000041080', '5.png', 'png', '', '80277', 'image/png', 'N', '2021-04-07 19:48:58', '9', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (59, 'FILE0000000000004108', 3, 'C:\\isp_attach\\upload\\2021\\04\\07\\19', 'ATCH20210407074900181FILE00000000000041080', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-07 19:49:00', '9', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (60, 'FILE0000000000004108', 4, 'C:\\isp_attach\\upload\\2021\\04\\07\\19', 'ATCH20210407074901700FILE00000000000041080', '6.png', 'png', '', '65588', 'image/png', 'N', '2021-04-07 19:49:01', '9', 1300, 929, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (61, 'FILE0000000000004109', 0, 'C:\\isp_attach\\upload\\2021\\04\\08\\10', 'ATCH20210408102402256FILE00000000000041090', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-08 10:24:02', '5', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (62, 'FILE0000000000004110', 0, 'C:\\isp_attach\\upload\\2021\\04\\08\\10', 'ATCH20210408104926030FILE00000000000041100', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-08 10:49:26', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (63, 'FILE0000000000004111', 0, 'C:\\isp_attach\\upload\\2021\\04\\08\\10', 'ATCH20210408105233021FILE00000000000041110', '5.png', 'png', '', '80277', 'image/png', 'N', '2021-04-08 10:52:33', '6', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (64, 'FILE0000000000004112', 0, 'C:\\isp_attach\\upload\\2021\\04\\08\\10', 'ATCH20210408105251529FILE00000000000041120', '5.png', 'png', '', '80277', 'image/png', 'N', '2021-04-08 10:52:51', '6', 634, 951, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (65, 'FILE0000000000004113', 0, 'C:\\isp_attach\\upload\\2021\\04\\08\\10', 'ATCH20210408105308416FILE00000000000041130', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-08 10:53:08', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (66, 'FILE0000000000004077', 1, 'C:\\isp_attach\\upload\\2021\\04\\08\\14', 'ATCH20210408021522447FILE00000000000040770', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-08 14:15:22', '5', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (67, 'FILE0000000000004114', 0, 'C:\\isp_attach\\editor', 'IMG20210408021539279FILE00000000000041140', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-08 14:15:39', '5', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (68, 'FILE0000000000004115', 0, 'C:\\isp_attach\\upload\\2021\\04\\08\\17', 'ATCH20210408054039709FILE00000000000041150', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-08 17:40:39', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (69, 'FILE0000000000004116', 0, 'C:\\isp_attach\\editor', 'IMG20210409102358087FILE00000000000041160', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-09 10:23:58', '6', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (70, 'FILE0000000000004117', 0, 'C:\\isp_attach\\editor', 'IMG20210409102418037FILE00000000000041170', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-09 10:24:18', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (71, 'FILE0000000000004118', 0, 'C:\\isp_attach\\upload\\2021\\04\\09\\10', 'ATCH20210409102439734FILE00000000000041180', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-09 10:24:39', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (72, 'FILE0000000000004119', 0, 'C:\\isp_attach\\editor', 'IMG20210409103336615FILE00000000000041190', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-09 10:33:36', '6', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (73, 'FILE0000000000004120', 0, 'C:\\isp_attach\\editor', 'IMG20210409103515807FILE00000000000041200', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-09 10:35:15', '6', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (74, 'FILE0000000000004121', 0, 'C:\\isp_attach\\editor', 'IMG20210409103616323FILE00000000000041210', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-09 10:36:16', '6', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (75, 'FILE0000000000004122', 0, 'C:\\isp_attach\\editor', 'IMG20210409104300839FILE00000000000041220', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-09 10:43:00', '6', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (76, 'FILE0000000000004123', 0, 'C:\\isp_attach\\editor', 'IMG20210409124520576FILE00000000000041230', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-09 12:45:20', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (77, 'FILE0000000000004124', 0, 'C:\\isp_attach\\editor', 'IMG20210409124520819FILE00000000000041240', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-09 12:45:20', '6', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (78, 'FILE0000000000004125', 0, 'C:\\isp_attach\\editor', 'IMG20210409124550990FILE00000000000041250', '3.png', 'png', '', '119606', 'image/png', 'N', '2021-04-09 12:45:51', '6', 693, 884, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (79, 'FILE0000000000004126', 0, 'C:\\isp_attach\\editor', 'IMG20210409124623419FILE00000000000041260', '4.png', 'png', '', '118681', 'image/png', 'N', '2021-04-09 12:46:23', '6', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (80, 'FILE0000000000004127', 0, 'C:\\isp_attach\\upload\\2021\\04\\20\\09', 'ATCH20210420094103031FILE00000000000041270', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-20 09:41:03', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (81, 'FILE0000000000004128', 0, 'C:\\isp_attach\\upload\\2021\\04\\20\\09', 'ATCH20210420094214790FILE00000000000041280', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-20 09:42:14', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (82, 'FILE0000000000004129', 0, 'C:\\isp_attach\\upload\\2021\\04\\20\\09', 'ATCH20210420094340586FILE00000000000041290', '1.png', 'png', '', '234778', 'image/png', 'N', '2021-04-20 09:43:40', '5', 1350, 900, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (83, 'FILE0000000000004130', 0, 'C:\\isp_attach\\upload\\2021\\04\\20\\10', 'ATCH20210420100412193FILE00000000000041300', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-20 10:04:12', '5', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (84, 'FILE0000000000004131', 0, 'C:\\isp_attach\\upload\\2021\\04\\20\\10', 'ATCH20210420100535288FILE00000000000041310', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-20 10:05:35', '5', 905, 749, NULL, NULL, 'N');
INSERT INTO `t_atch_file_detail` VALUES (85, 'FILE0000000000004132', 0, 'C:\\isp_attach\\upload\\2021\\04\\20\\10', 'ATCH20210420100600704FILE00000000000041320', '2.png', 'png', '', '57822', 'image/png', 'N', '2021-04-20 10:06:00', '5', 905, 749, NULL, NULL, 'N');

-- ----------------------------
-- Table structure for t_bannedip
-- ----------------------------
DROP TABLE IF EXISTS `t_bannedip`;
CREATE TABLE `t_bannedip`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `IP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ALLOW` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N',
  `CONT` varchar(3000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ATCH_FILE_ID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SEQ`) USING BTREE,
  UNIQUE INDEX `t_bannedip_ip_unique`(`IP`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bannedip
-- ----------------------------
INSERT INTO `t_bannedip` VALUES (5, '2021-04-22 16:57:49', '2021-04-22 17:02:25', NULL, 'Y', '2.2.2.2', 'Y', '&lt;p&gt;t2&lt;/p&gt;', NULL, '');
INSERT INTO `t_bannedip` VALUES (6, '2021-04-22 17:04:19', NULL, NULL, 'Y', '3.3.3.3', 'N', '&lt;p&gt;3&lt;/p&gt;', '5', '');
INSERT INTO `t_bannedip` VALUES (7, '2021-04-22 17:04:35', NULL, NULL, 'Y', '1.1.1.1', 'N', '&lt;p&gt;1&lt;/p&gt;', '5', '');

-- ----------------------------
-- Table structure for t_bannedip_conattemp
-- ----------------------------
DROP TABLE IF EXISTS `t_bannedip_conattemp`;
CREATE TABLE `t_bannedip_conattemp`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `IP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bannedip_conattemp
-- ----------------------------
INSERT INTO `t_bannedip_conattemp` VALUES (4, '2021-04-21 17:13:12', NULL, 'Y', '0:0:0:0:0:0:0:1');
INSERT INTO `t_bannedip_conattemp` VALUES (5, '2021-04-21 17:13:34', NULL, 'Y', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for t_bexample
-- ----------------------------
DROP TABLE IF EXISTS `t_bexample`;
CREATE TABLE `t_bexample`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `ATCH_FILE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일 아이디',
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bexample
-- ----------------------------
INSERT INTO `t_bexample` VALUES (1, '1.', '&lt;p&gt;1.&lt;/p&gt;&lt;p&gt;1&lt;/p&gt;', '2021-04-07 15:26:30', '5', '2021-04-07 15:27:36', NULL, 'Y', 'FILE0000000000004083');
INSERT INTO `t_bexample` VALUES (2, '2', '&lt;p&gt;2&lt;/p&gt;', '2021-04-07 15:27:58', '5', NULL, NULL, 'Y', 'FILE0000000000004084');
INSERT INTO `t_bexample` VALUES (3, '3', '&lt;p&gt;3&lt;/p&gt;', '2021-04-07 15:28:10', '5', '2021-04-07 15:28:17', NULL, 'N', 'FILE0000000000004085');
INSERT INTO `t_bexample` VALUES (4, '3.', '3\r\n3.', '2021-04-07 15:50:46', '6', '2021-04-07 15:50:54', NULL, 'Y', 'FILE0000000000004086');
INSERT INTO `t_bexample` VALUES (5, '4', '4', '2021-04-07 15:51:07', '6', NULL, NULL, 'N', 'FILE0000000000004087');
INSERT INTO `t_bexample` VALUES (6, '4.', '4.', '2021-04-07 15:51:42', '7', '2021-04-07 15:51:49', NULL, 'Y', 'FILE0000000000004088');
INSERT INTO `t_bexample` VALUES (7, '5.', '5.\r\n5', '2021-04-07 17:32:44', '6', '2021-04-07 17:32:52', NULL, 'N', 'FILE0000000000004104');
INSERT INTO `t_bexample` VALUES (8, '4444', '123', '2021-04-07 19:48:41', '9', '2021-04-07 19:49:02', NULL, 'Y', 'FILE0000000000004108');
INSERT INTO `t_bexample` VALUES (9, 'dfe', 'dfdfd', '2021-04-08 10:49:26', '6', '2021-04-08 10:52:19', NULL, 'N', 'FILE0000000000004110');

-- ----------------------------
-- Table structure for t_bfield
-- ----------------------------
DROP TABLE IF EXISTS `t_bfield`;
CREATE TABLE `t_bfield`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `ATCH_FILE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일 아이디',
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_bfield
-- ----------------------------
INSERT INTO `t_bfield` VALUES (1, '3', '&lt;p&gt;3&lt;/p&gt;', '2021-04-07 16:00:04', '5', NULL, NULL, 'Y', 'FILE0000000000004091');
INSERT INTO `t_bfield` VALUES (2, '4', '&lt;p&gt;4&lt;/p&gt;', '2021-04-07 16:00:15', '5', NULL, NULL, 'Y', 'FILE0000000000004092');
INSERT INTO `t_bfield` VALUES (3, '5 시공현장', '&lt;p&gt;5&lt;/p&gt;&lt;p&gt;시공현장&lt;/p&gt;', '2021-04-07 16:00:35', '5', '2021-04-07 16:00:59', NULL, 'Y', 'FILE0000000000004093');
INSERT INTO `t_bfield` VALUES (4, '4ㄴ', '4\r\nㄴㅇㄴㅇㅍ', '2021-04-07 16:06:54', '6', '2021-04-07 16:07:06', NULL, 'N', 'FILE0000000000004099');
INSERT INTO `t_bfield` VALUES (5, '1.', '1.', '2021-04-08 10:52:52', '6', '2021-04-08 10:52:58', NULL, 'N', 'FILE0000000000004112');

-- ----------------------------
-- Table structure for t_board
-- ----------------------------
DROP TABLE IF EXISTS `t_board`;
CREATE TABLE `t_board`  (
  `BOARD_SEQ` int(11) NOT NULL COMMENT '일련번호',
  `BOARD_GRP_SEQ` int(110) NULL DEFAULT NULL COMMENT '그룹일련번호',
  `SITE_CLCD` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '사이트구분코드',
  `TITLE` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `ATCH_FILE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일ID',
  `IMAGE_FILE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '이미지첨부파일ID',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `NOTI_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '공지여부',
  `NOTI_ST_DT` timestamp(0) NULL DEFAULT NULL COMMENT '공지시작일',
  `NOTI_END_DT` timestamp(0) NULL DEFAULT NULL COMMENT '공지종료일',
  `BOARD_CD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '게시판코드',
  `BOARD_DIVN` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '게시판구분',
  `VIEW_NUM` int(11) NULL DEFAULT 0 COMMENT '조회수',
  `SECRET_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '비밀글여부',
  `ACPT_ST_DT` timestamp(0) NULL DEFAULT NULL COMMENT '접수시작일자',
  `ACPT_END_DT` timestamp(0) NULL DEFAULT NULL COMMENT '접수종료일자',
  `YEAR` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '년도',
  PRIMARY KEY (`BOARD_SEQ`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '게시판관리' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_board
-- ----------------------------

-- ----------------------------
-- Table structure for t_breco
-- ----------------------------
DROP TABLE IF EXISTS `t_breco`;
CREATE TABLE `t_breco`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `ATCH_FILE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일 아이디',
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_breco
-- ----------------------------
INSERT INTO `t_breco` VALUES (1, '1.', '&lt;p&gt;1.&lt;/p&gt;', '2021-04-07 15:59:13', '5', '2021-04-07 15:59:25', NULL, 'Y', 'FILE0000000000004089');
INSERT INTO `t_breco` VALUES (2, '2', '&lt;p&gt;2&lt;/p&gt;', '2021-04-07 15:59:39', '5', NULL, NULL, 'N', 'FILE0000000000004090');
INSERT INTO `t_breco` VALUES (3, '2추천설계', '2\r\n2추천설계.', '2021-04-07 16:06:04', '6', '2021-04-07 16:06:22', NULL, 'Y', 'FILE0000000000004097');
INSERT INTO `t_breco` VALUES (4, '3', '3', '2021-04-07 16:06:31', '6', NULL, NULL, 'N', 'FILE0000000000004098');
INSERT INTO `t_breco` VALUES (5, '1.', '1.', '2021-04-08 10:52:33', '6', '2021-04-08 10:52:40', NULL, 'N', 'FILE0000000000004111');

-- ----------------------------
-- Table structure for t_exception
-- ----------------------------
DROP TABLE IF EXISTS `t_exception`;
CREATE TABLE `t_exception`  (
  `SEQ` int(11) NOT NULL COMMENT '일련번호',
  `ERR_TYPE` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '에러타입',
  `ERR_MSG` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '에러메세지',
  `FULL_ERR_MSG` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '전체에러메세지',
  `PARAM_VAL` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '파라미터',
  `ERR_MENU_CD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '메뉴코드',
  `ERR_PAGE` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '에러페이지',
  `ERR_PAGE_URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '에러페이지URL',
  `REG_DATE` timestamp(0) NULL DEFAULT current_timestamp COMMENT '에러발생일',
  `USE_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `REG_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '에러관리' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_exception
-- ----------------------------
INSERT INTO `t_exception` VALUES (76, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'image', '/ma/port/image/insertForm.do', 'null', '2021-04-14 09:42:32', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (77, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'image', '/ma/port/image/insertForm.do', 'null', '2021-04-14 09:43:35', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (78, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'image', '/ma/port/image/insertForm.do', 'null', '2021-04-14 09:43:39', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (79, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'IAMGE_DIV\' in \'where clause\'\r\n### The error may exist in file [C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\isp\\WEB-INF\\classes\\sqlmap\\query\\Image_SQL.xml]\r\n### The error may involve com.open.Image.selectCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Image.selectCount */        SELECT      COUNT(SEQ) cnt     FROM T_IMAGE    WHERE USE_YN=\'Y\'    AND IAMGE_DIV=?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'IAMGE_DIV\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'IAMGE_DIV\' in \'where clause\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'image', '/ma/port/image/addList.do', 'null', '2021-04-14 09:52:17', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (80, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\r\n### The error may exist in file [C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\isp\\WEB-INF\\classes\\sqlmap\\query\\Reply_SQL.xml]\r\n### The error may involve com.open.Reply.selectList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Reply.selectList */                 SELECT         SEQ seq     , TITLE title     , CONT cont     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt     , RGST_ID rgstId     , F_USER_NM(RGST_ID) name     , ATCH_FILE_ID atchFileId     , STA_DATE staDate     , END_DATE endDate        FROM T_REPLY TR     WHERE USE_YN=\'Y\'                                             ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'reply', '/ma/board/reply/addList.do', 'null', '2021-04-14 10:10:46', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (81, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\r\n### The error may exist in file [C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\isp\\WEB-INF\\classes\\sqlmap\\query\\Ans_SQL.xml]\r\n### The error may involve com.open.Answer.selectList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Answer.selectList */                 SELECT         SEQ seq     , TITLE title     , CONT cont     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt     , RGST_ID rgstId     , F_USER_NM(RGST_ID) name     , ATCH_FILE_ID atchFileId     , STA_DATE staDate     , END_DATE endDate        FROM T_ANSWER TA     WHERE USE_YN=\'Y\'                                             ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'answer', '/ma/ans/answer/addList.do', 'null', '2021-04-14 10:10:49', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (82, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\r\n### The error may exist in file [C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\isp\\WEB-INF\\classes\\sqlmap\\query\\Ans_SQL.xml]\r\n### The error may involve com.open.Answer.selectList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Answer.selectList */                 SELECT         SEQ seq     , TITLE title     , CONT cont     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt     , RGST_ID rgstId     , F_USER_NM(RGST_ID) name     , ATCH_FILE_ID atchFileId     , STA_DATE staDate     , END_DATE endDate        FROM T_ANSWER TA     WHERE USE_YN=\'Y\'                                             ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'answer', '/ma/ans/answer/addList.do', 'null', '2021-04-14 10:10:52', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (83, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\r\n### The error may exist in file [C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\isp\\WEB-INF\\classes\\sqlmap\\query\\Reply_SQL.xml]\r\n### The error may involve com.open.Reply.selectList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Reply.selectList */                 SELECT         SEQ seq     , TITLE title     , CONT cont     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt     , RGST_ID rgstId     , F_USER_NM(RGST_ID) name     , ATCH_FILE_ID atchFileId     , STA_DATE staDate     , END_DATE endDate        FROM T_REPLY TR     WHERE USE_YN=\'Y\'                                             ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'reply', '/ma/board/reply/addList.do', 'null', '2021-04-14 10:10:57', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (84, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\r\n### The error may exist in file [C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\isp\\WEB-INF\\classes\\sqlmap\\query\\Reply_SQL.xml]\r\n### The error may involve com.open.Reply.selectList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Reply.selectList */                 SELECT         SEQ seq     , TITLE title     , CONT cont     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt     , RGST_ID rgstId     , F_USER_NM(RGST_ID) name     , ATCH_FILE_ID atchFileId     , STA_DATE staDate     , END_DATE endDate        FROM T_REPLY TR     WHERE USE_YN=\'Y\'                                             ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'reply', '/ma/board/reply/addList.do', 'null', '2021-04-14 10:11:00', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (85, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'\'Y\' )AS rCnt\n		     FROM T_REPLY TR\n			 WHERE USE_YN=\'Y\'\n			 AND SEQ = REPLY_...\' at line 11\r\n### The error may exist in file [C:\\workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\isp\\WEB-INF\\classes\\sqlmap\\query\\Reply_SQL.xml]\r\n### The error may involve com.open.Reply.selectList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Reply.selectList */                 SELECT         SEQ seq     , TITLE title     , CONT cont     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt     , RGST_ID rgstId     , F_USER_NM(RGST_ID) name     , ATCH_FILE_ID atchFileId     , (SELECT COUNT(REPLY_SEQ)FROM T_REPLY WHERE TR.SEQ != SEQ AND TR.SEQ =REPLY_SEQ AND USE_YN \'Y\' )AS rCnt        FROM T_REPLY TR     WHERE USE_YN=\'Y\'     AND SEQ = REPLY_SEQ                                             ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'\'Y\' )AS rCnt\n		     FROM T_REPLY TR\n			 WHERE USE_YN=\'Y\'\n			 AND SEQ = REPLY_...\' at line 11\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'\'Y\' )AS rCnt\n		     FROM T_REPLY TR\n			 WHERE USE_YN=\'Y\'\n			 AND SEQ = REPLY_...\' at line 11', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'reply', '/ma/board/reply/addList.do', 'null', '2021-04-14 10:31:22', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (86, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'seq\' in \'class com.open.cmmn.model.CmmnDefaultVO\'', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}]', 'reply', '/ma/board/reply/replyAddList.do', 'null', '2021-04-14 10:35:35', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (87, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'seq\' in \'class com.open.cmmn.model.CmmnDefaultVO\'', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}]', 'reply', '/ma/board/reply/replyAddList.do', 'null', '2021-04-14 10:35:43', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (88, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'rSeq\' in \'class com.open.cmmn.model.CmmnDefaultVO\'', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}]', 'reply', '/ma/board/reply/replyAddList.do', 'null', '2021-04-14 10:37:22', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (89, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'seq\' in \'class com.open.cmmn.model.CmmnDefaultVO\'', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}]', 'reply', '/ma/board/reply/replyAddList.do', 'null', '2021-04-14 10:40:33', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (90, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'seq\' in \'class com.open.cmmn.model.CmmnDefaultVO\'', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}]', 'reply', '/ma/board/reply/replyAddList.do', 'null', '2021-04-14 10:40:39', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (91, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLException: Field \'ANS_SEQ\' doesn\'t have a default value\r\n### The error may involve com.open.Answer.insertContents-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Answer.insertContents */        INSERT INTO T_ANSWER(                  SEQ      , TITLE      , CONT     , RGST_ID      , ATCH_FILE_ID     )    VALUES (      (SELECT IFNULL(MAX(TA.SEQ)+1,1) FROM T_ANSWER TA)     ,?     ,?     ,?     ,?    )\r\n### Cause: java.sql.SQLException: Field \'ANS_SEQ\' doesn\'t have a default value\n; SQL []; Field \'ANS_SEQ\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'ANS_SEQ\' doesn\'t have a default value', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=dateCondition, value=}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=title, value=11111}, {paramName=cont, value=<p>1111</p>}]', 'answer', '/ma/ans/answer/insertProc.do', 'null', '2021-04-14 11:20:45', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (92, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TA1.SEQ\' in \'field list\'\r\n### The error may involve com.open.Answer.insertContents-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Answer.insertContents */        INSERT INTO T_ANSWER(                  SEQ                , ANS_SEQ        , TITLE      , CONT     , RGST_ID      , ATCH_FILE_ID     )    VALUES (      (SELECT IFNULL(MAX(TA1.SEQ)+1,1) FROM T_ANSWER TA2)     ,(SELECT IFNULL(MAX(TA2.SEQ)+1,1) FROM T_ANSWER TA2)     ,?     ,?     ,?     ,?    )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TA1.SEQ\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TA1.SEQ\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=dateCondition, value=}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=title, value=11111}, {paramName=cont, value=<p>1111</p>}]', 'answer', '/ma/ans/answer/insertProc.do', 'null', '2021-04-14 11:21:54', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (93, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ANS_SEQ\' cannot be null\r\n### The error may involve com.open.Answer.ansInsert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Answer.ansInsert */        INSERT INTO T_ANSWER(                  SEQ                , ANS_SEQ        , CONT     , RGST_ID      , ATCH_FILE_ID     )    VALUES (      (SELECT IFNULL(MAX(TA1.SEQ)+1,1) FROM T_ANSWER TA1)     ,?     ,?     ,?     ,?    )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ANS_SEQ\' cannot be null\n; SQL []; Column \'ANS_SEQ\' cannot be null; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ANS_SEQ\' cannot be null', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=dateCondition, value=}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=title, value=ss}, {paramName=cont, value=<p>sss</p>}]', 'answer', '/ma/ans/answer/ansInsertProc.do', 'null', '2021-04-14 12:48:27', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (94, 'class java.lang.IllegalStateException', '행 [109]에서 [WEB-INF/jsp/ft/join/form.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n106: 			<div class=\"location\"><a href=\"/\"><i class=\"fa fa-home\"></i></a> <span> &gt;</span> <strong>�쉶�썝媛��엯</strong></div>\r\n107: 			<div class=\"content_box\">\r\n108: 				<form:form commandName=\"mmVO\" name=\"defaultFrm\" id=\"defaultFrm\" method=\"post\">\r\n109: 					<form:hidden path=\"seq\" id=\"seq\"/>\r\n110: 					<%-- tbl --%>\r\n111: 					<div class=\"tbl_wrap\">\r\n112: 						<table class=\"tbl_row_type01\">\r\n\r\n\r\nStacktrace:', '', NULL, 'NOMENUCD', '/ft/join/insertForm.do', 'null', '2021-04-14 16:36:48', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (95, 'class java.lang.IllegalStateException', '행 [109]에서 [WEB-INF/jsp/ft/join/form.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n106: 			<div class=\"location\"><a href=\"/\"><i class=\"fa fa-home\"></i></a> <span> &gt;</span> <strong>�쉶�썝媛��엯</strong></div>\r\n107: 			<div class=\"content_box\">\r\n108: 				<form:form commandName=\"mmVO\" name=\"defaultFrm\" id=\"defaultFrm\" method=\"post\">\r\n109: 					<form:hidden path=\"seq\" id=\"seq\"/>\r\n110: 					<%-- tbl --%>\r\n111: 					<div class=\"tbl_wrap\">\r\n112: 						<table class=\"tbl_row_type01\">\r\n\r\n\r\nStacktrace:', '', NULL, 'NOMENUCD', '/ft/join/insertForm.do', 'null', '2021-04-14 16:36:52', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (96, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.open.Mm.userInsert\r\n### Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.open.Mm.userInsert', '', '[{paramName=seq, value=}, {paramName=id, value=qqq}, {paramName=pwd, value=1111}, {paramName=pwdChk, value=1111}, {paramName=name, value=김재익}, {paramName=email, value=1}, {paramName=hp, value=1}, {paramName=dprt, value=1}]', 'NOMENUCD', '/ft/join/insertProc.do', 'null', '2021-04-14 16:38:58', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (97, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error updating database.  Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.open.Mm.userInsert\r\n### Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.open.Mm.userInsert', '', '[{paramName=seq, value=}, {paramName=id, value=qqq}, {paramName=pwd, value=1111}, {paramName=pwdChk, value=1111}, {paramName=name, value=김재익}, {paramName=email, value=1}, {paramName=hp, value=1}, {paramName=dprt, value=1}]', 'NOMENUCD', '/ft/join/insertProc.do', 'null', '2021-04-14 16:39:54', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (98, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect integer value: \'MGR00000000000000003\' for column `isp`.`t_ad_user`.`SEQ` at row 1\r\n### The error may involve com.open.Mm.userInsert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Mm.userInsert */   INSERT INTO T_AD_USER(    SEQ    , ID    , PWD    , NAME    , EMAIL    , HP    , DPRT   ) VALUES (     ?    , ?    , ?    , ?    , ?    , ?    , ?   )\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect integer value: \'MGR00000000000000003\' for column `isp`.`t_ad_user`.`SEQ` at row 1\n; SQL []; Data truncation: Incorrect integer value: \'MGR00000000000000003\' for column `isp`.`t_ad_user`.`SEQ` at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect integer value: \'MGR00000000000000003\' for column `isp`.`t_ad_user`.`SEQ` at row 1', '', '[{paramName=seq, value=}, {paramName=id, value=qqq}, {paramName=pwd, value=1111}, {paramName=pwdChk, value=1111}, {paramName=name, value=김재익}, {paramName=email, value=1}, {paramName=hp, value=}, {paramName=dprt, value=}]', 'NOMENUCD', '/ft/join/insertProc.do', 'null', '2021-04-14 16:45:08', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (99, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [48]에서 [WEB-INF/jsp/cmmn/layout/ft/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n45: 			<tiles:insertAttribute name=\"aside\"/>\r\n46: 	        <!--// header -->     \r\n47: 			<!-- contents -->			\r\n48: 			<tiles:insertAttribute name=\"body\"/>\r\n49: 		</div>\r\n50: 			<tiles:insertAttribute name=\"quickBar\"/>\r\n51: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=32}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'NOMENUCD', '/ft/board/reply/view.do', 'null', '2021-04-14 16:54:35', 'Y', '0:0:0:0:0:0:0:1', '6');
INSERT INTO `t_exception` VALUES (100, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=boardDivn, value=}, {paramName=boardCd, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=dateCondition, value=}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=seq, value=}]', 'NOMENUCD', '/ft/ans/answer/view.do', 'null', '2021-04-14 17:30:17', 'Y', '0:0:0:0:0:0:0:1', '6');
INSERT INTO `t_exception` VALUES (101, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [48]에서 [WEB-INF/jsp/cmmn/layout/ft/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n45: 			<tiles:insertAttribute name=\"aside\"/>\r\n46: 	        <!--// header -->     \r\n47: 			<!-- contents -->			\r\n48: 			<tiles:insertAttribute name=\"body\"/>\r\n49: 		</div>\r\n50: 			<tiles:insertAttribute name=\"quickBar\"/>\r\n51: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=boardDivn, value=}, {paramName=boardCd, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=dateCondition, value=}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=seq, value=}]', 'NOMENUCD', '/ft/ans/answer/view.do', 'null', '2021-04-14 17:33:12', 'Y', '0:0:0:0:0:0:0:1', '6');
INSERT INTO `t_exception` VALUES (102, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [48]에서 [WEB-INF/jsp/cmmn/layout/ft/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n45: 			<tiles:insertAttribute name=\"aside\"/>\r\n46: 	        <!--// header -->     \r\n47: 			<!-- contents -->			\r\n48: 			<tiles:insertAttribute name=\"body\"/>\r\n49: 		</div>\r\n50: 			<tiles:insertAttribute name=\"quickBar\"/>\r\n51: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=boardDivn, value=}, {paramName=boardCd, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=dateCondition, value=}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=seq, value=}]', 'answer', '/ft/ans/answer/view.do', 'null', '2021-04-14 17:42:21', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (103, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [48]에서 [WEB-INF/jsp/cmmn/layout/ft/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n45: 			<tiles:insertAttribute name=\"aside\"/>\r\n46: 	        <!--// header -->     \r\n47: 			<!-- contents -->			\r\n48: 			<tiles:insertAttribute name=\"body\"/>\r\n49: 		</div>\r\n50: 			<tiles:insertAttribute name=\"quickBar\"/>\r\n51: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=5}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schEtc01, value=}, {paramName=searchKeyword, value=}]', 'NOMENUCD', '/ft/ans/answer/view.do', 'null', '2021-04-14 17:50:59', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (104, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', NULL, 'NOMENUCD', '/ma/ans/answer/list.do', 'null', '2021-04-14 18:06:19', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (105, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [48]에서 [WEB-INF/jsp/cmmn/layout/ft/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n45: 			<tiles:insertAttribute name=\"aside\"/>\r\n46: 	        <!--// header -->     \r\n47: 			<!-- contents -->			\r\n48: 			<tiles:insertAttribute name=\"body\"/>\r\n49: 		</div>\r\n50: 			<tiles:insertAttribute name=\"quickBar\"/>\r\n51: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n\r\n\r\nStacktrace:', '', NULL, 'NOMENUCD', '/ft/in/intro/list.do', 'null', '2021-04-14 18:20:55', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (106, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', NULL, 'NOMENUCD', '/ma/us/mm/list.do', 'null', '2021-04-14 19:03:37', 'Y', '0:0:0:0:0:0:0:1', '7');
INSERT INTO `t_exception` VALUES (107, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schEtc01, value=}, {paramName=searchKeyword, value=}]', 'NOMENUCD', '/ma/ans/answer/addList.do', 'null', '2021-04-14 19:03:38', 'Y', '0:0:0:0:0:0:0:1', '7');
INSERT INTO `t_exception` VALUES (108, 'class org.apache.jasper.JasperException', 'org.apache.jasper.JasperException: javax.el.ELException: Failed to parse the expression [${util:unEscape(${popCont})}]', '', NULL, 'NOMENUCD', '/ft/main.do', 'null', '2021-04-19 13:11:40', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (109, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'HP\' in \'field list\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\Sample_SQL.xml]\r\n### The error may involve com.open.Sample.selectList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Sample.selectList */                 SELECT         SEQ seq     , TITLE title     , CONT cont     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt     , RGST_ID rgstId     , F_USER_NM(RGST_ID) name     , ATCH_FILE_ID atchFileId     , STA_DATE staDate     , END_DATE endDate     , HP hp     , MAIL mail        FROM T_SAMPLE TS     WHERE USE_YN=\'Y\'                                             ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'HP\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'HP\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'msitemanage', '/ma/sys/msitemanage/addList.do', 'null', '2021-04-19 15:53:34', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (110, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'msitemanage', '/ma/sys/msitemanage/insertForm.do', 'null', '2021-04-19 15:55:19', 'Y', '127.0.0.1', '5');
INSERT INTO `t_exception` VALUES (111, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'msitemanage', '/ma/sys/msitemanage/insertForm.do', 'null', '2021-04-19 15:55:29', 'Y', '127.0.0.1', '5');
INSERT INTO `t_exception` VALUES (112, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=title, value=test3}, {paramName=city, value=option1}, {paramName=scale, value=20}, {paramName=imageFile, value=web framework in 2020.jpg}, {paramName=color, value=#ff0000}, {paramName=day1, value=2021-04-19}, {paramName=time, value=16:17}, {paramName=datetime, value=2021-04-19T16:17}, {paramName=month, value=2021-04}, {paramName=week, value=2021-W16}, {paramName=email, value=dfdfd}, {paramName=url, value=dfdsfsdf}, {paramName=tel, value=sdfsdfds}, {paramName=keyword, value=dfsdfsf}, {paramName=cont, value=<p>test3</p>}]', 'msitemanage', '/ma/sys/msitemanage/insertProc.do', 'null', '2021-04-19 16:17:38', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (113, 'class javax.el.PropertyNotFoundException', 'javax.el.PropertyNotFoundException: 타입 [com.open.vo.PopupVO]에서 프로퍼티 [popLeft]을(를) 찾을 수 없습니다.', '', NULL, 'NOMENUCD', '/ft/main.do', 'null', '2021-04-19 17:49:35', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (114, 'class javax.el.PropertyNotFoundException', 'javax.el.PropertyNotFoundException: 타입 [com.open.vo.PopupVO]에서 프로퍼티 [popLeft]을(를) 찾을 수 없습니다.', '', NULL, 'NOMENUCD', '/ft/main.do', 'null', '2021-04-19 17:49:41', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (115, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mpopup', '/ma/sys/mpopup/insertForm.do', 'null', '2021-04-20 09:39:53', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (116, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'NOTI_YN\' in \'field list\'\r\n### The error may involve com.open.Popup.insertContents-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* popup.insertContents */        INSERT INTO T_POPUP(                  SEQ      , TITLE      , CONT     , RGST_ID      , ATCH_FILE_ID      , STA_DATE     , END_DATE      , NOTI_YN     , POPLEFT     , POPTOP     , POPWIDTH         )    VALUES (      (SELECT IFNULL(MAX(TB.SEQ)+1,1) FROM T_POPUP TB)     ,?     ,?     ,?     ,?     ,?     ,?     ,?     ,?     ,?     ,?    )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'NOTI_YN\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'NOTI_YN\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=FILE0000000000004128}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=title, value=popup test1}, {paramName=notiYn, value=Y}, {paramName=staDate, value=2021.04.19}, {paramName=endDate, value=2021.04.30}, {paramName=popLeft, value=0}, {paramName=popTop, value=0}, {paramName=popWidth, value=600}, {paramName=cont, value=<p>popup test1&nbsp;</p>}]', 'mpopup', '/ma/sys/mpopup/insertProc.do', 'null', '2021-04-20 09:42:22', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (117, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'\' for column `isp`.`t_popup`.`STA_DATE` at row 1\r\n### The error may involve com.open.Popup.insertContents-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* popup.insertContents */        INSERT INTO T_POPUP(                  SEQ      , TITLE      , CONT     , RGST_ID      , ATCH_FILE_ID      , STA_DATE     , END_DATE      , NOTI_YN     , POPLEFT     , POPTOP     , POPWIDTH         )    VALUES (      (SELECT IFNULL(MAX(TB.SEQ)+1,1) FROM T_POPUP TB)     ,?     ,?     ,?     ,?     ,?     ,?     ,?     ,?     ,?     ,?    )\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'\' for column `isp`.`t_popup`.`STA_DATE` at row 1\n; SQL []; Data truncation: Incorrect datetime value: \'\' for column `isp`.`t_popup`.`STA_DATE` at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect datetime value: \'\' for column `isp`.`t_popup`.`STA_DATE` at row 1', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=title, value=popupTest2}, {paramName=notiYn, value=N}, {paramName=staDate, value=}, {paramName=endDate, value=}, {paramName=popLeft, value=0}, {paramName=popTop, value=0}, {paramName=popWidth, value=600}, {paramName=cont, value=<p>popupTest2&nbsp;</p>}]', 'mpopup', '/ma/sys/mpopup/insertProc.do', 'null', '2021-04-20 09:55:19', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (118, 'class javax.el.PropertyNotFoundException', '행 [153]에서 [/WEB-INF/jsp/ft/main.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n150: 								<p>${util:unEscape(m_pop.cont)}</p>\r\n151: 								<span>\r\n152: 									<c:if test=\"${not empty m_pop.atchFileId}\">\r\n153: 										<img src=\"/atch/getImage.do?atchFileId=${m_pop.imageFileId}&fileSn=${m_pop.minFileSn}\" alt=\"배너\">\r\n154: 									</c:if>\r\n155: 								</span>\r\n156: 							</div>\r\n\r\n\r\nStacktrace:', '', NULL, 'NOMENUCD', '/ft/main.do', 'null', '2021-04-20 11:00:34', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (119, 'class javax.el.PropertyNotFoundException', '행 [153]에서 [/WEB-INF/jsp/ft/main.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n150: 								<p>${util:unEscape(m_pop.cont)}</p>\r\n151: 								<span>\r\n152: 									<c:if test=\"${not empty m_pop.atchFileId}\">\r\n153: 										<img src=\"/atch/getImage.do?atchFileId=${m_pop.imageFileId}&fileSn=${m_pop.minFileSn}\" alt=\"배너\">\r\n154: 									</c:if>\r\n155: 								</span>\r\n156: 							</div>\r\n\r\n\r\nStacktrace:', '', NULL, 'NOMENUCD', '/ft/main.do', 'null', '2021-04-20 11:00:39', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (120, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'msitemanage', '/ma/sys/msitemanage/insertForm.do', 'null', '2021-04-20 14:53:22', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (121, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'msitemanage', '/ma/sys/msitemanage/insertForm.do', 'null', '2021-04-20 16:07:59', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (122, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'msitemanage', '/ma/sys/msitemanage/insertForm.do', 'null', '2021-04-20 16:08:10', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (123, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'belongkind\' in \'class com.open.vo.FormInputCheckboxListVO\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=title, value=test1}, {paramName=city, value=option1}, {paramName=belongkind, value=belong1}, {paramName=radio1, value=option1}, {paramName=scale, value=50}, {paramName=color, value=#000000}, {paramName=date1, value=2021.04.01}, {paramName=mail, value=test1}, {paramName=url, value=test1}, {paramName=tel, value=test1}, {paramName=keyword, value=test1}, {paramName=cont, value=<p>test1&nbsp;</p>}]', 'msitemanage', '/ma/sys/msitemanage/insertProc.do', 'null', '2021-04-20 16:30:54', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (124, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect integer value: \'\' for column `isp`.`t_forminput_checkboxlist`.`FORMINPUT_SEQ` at row 1\r\n### The error may involve com.open.FormInput.insertCheckboxList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* checkboxList.insertContents */    INSERT INTO T_FORMINPUT_CHECKBOXLIST(                 FORMINPUT_SEQ      , CHECKBOX_CONTENT     )    VALUES           (     ?     ,?    )     ,      (     ?     ,?    )\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect integer value: \'\' for column `isp`.`t_forminput_checkboxlist`.`FORMINPUT_SEQ` at row 1\n; SQL []; Data truncation: Incorrect integer value: \'\' for column `isp`.`t_forminput_checkboxlist`.`FORMINPUT_SEQ` at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Incorrect integer value: \'\' for column `isp`.`t_forminput_checkboxlist`.`FORMINPUT_SEQ` at row 1', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=title, value=test1}, {paramName=city, value=option1}, {paramName=belongkind, value=belong1}, {paramName=radio1, value=option1}, {paramName=scale, value=50}, {paramName=color, value=#000000}, {paramName=date1, value=2021.04.13}, {paramName=mail, value=test1}, {paramName=url, value=test1}, {paramName=tel, value=test1}, {paramName=keyword, value=test1}, {paramName=cont, value=<p>test1&nbsp;</p>}]', 'msitemanage', '/ma/sys/msitemanage/insertProc.do', 'null', '2021-04-20 16:32:37', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (125, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\FormInput_SQL.xml]\r\n### The error may involve com.open.FormInput.selectList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* Sample.selectList */                 SELECT         SEQ seq     , TITLE title     , CONT cont     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt     , RGST_ID rgstId     , F_USER_NM(RGST_ID) name     , ATCH_FILE_ID atchFileId     , STA_DATE staDate     , END_DATE endDate        FROM T_FORMINPUT TS     WHERE USE_YN=\'Y\'                                             ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'STA_DATE\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'msitemanage', '/ma/sys/msitemanage/addList.do', 'null', '2021-04-20 16:34:07', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (126, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'msitemanage', '/ma/sys/msitemanage/view.do', 'null', '2021-04-20 16:34:47', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (127, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 2', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'msitemanage', '/ma/sys/msitemanage/view.do', 'null', '2021-04-20 16:34:52', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (128, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=title, value=test1}, {paramName=city, value=option1}, {paramName=belongkind, value=belong1}, {paramName=radio1, value=option1}, {paramName=scale, value=50}, {paramName=color, value=#000000}, {paramName=date1, value=2021.04.20}, {paramName=mail, value=test1}, {paramName=url, value=test1}, {paramName=tel, value=test1}, {paramName=keyword, value=test1}, {paramName=cont, value=<p>test1&nbsp;</p>}]', 'msitemanage', '/ma/sys/msitemanage/updateProc.do', 'null', '2021-04-20 16:40:53', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (129, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=title, value=test1}, {paramName=city, value=option1}, {paramName=scale, value=50}, {paramName=color, value=#16985f}, {paramName=date1, value=2021.04.20}, {paramName=mail, value=test1}, {paramName=url, value=test1}, {paramName=keyword, value=test1}, {paramName=cont, value=<p>test1&nbsp;</p>}]', 'msitemanage', '/ma/sys/msitemanage/updateProc.do', 'null', '2021-04-20 16:43:53', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (130, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'\' at line 6\r\n### The error may involve com.open.FormInput.insertCheckboxList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* checkboxList.insertContents */    INSERT INTO T_FORMINPUT_CHECKBOXLIST(                 FORMINPUT_SEQ      , CHECKBOX_CONTENT     )    VALUES\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'\' at line 6\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'\' at line 6', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=title, value=test1}, {paramName=city, value=option1}, {paramName=scale, value=50}, {paramName=color, value=#000000}, {paramName=date1, value=2021.04.20}, {paramName=mail, value=test1}, {paramName=url, value=test1}, {paramName=keyword, value=test1}, {paramName=cont, value=<p>test1&nbsp;</p>}]', 'msitemanage', '/ma/sys/msitemanage/updateProc.do', 'null', '2021-04-20 16:45:13', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (131, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}]', 'msitemanage', '/ma/sys/msitemanage/updateForm.do', 'null', '2021-04-20 16:59:34', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (132, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}]', 'msitemanage', '/ma/sys/msitemanage/updateForm.do', 'null', '2021-04-20 17:28:16', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (133, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}]', 'msitemanage', '/ma/sys/msitemanage/updateForm.do', 'null', '2021-04-20 17:33:25', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (134, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}]', 'msitemanage', '/ma/sys/msitemanage/updateForm.do', 'null', '2021-04-20 17:39:11', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (135, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=1}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}]', 'msitemanage', '/ma/sys/msitemanage/updateForm.do', 'null', '2021-04-20 17:39:34', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (136, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=menuSeq, value=}, {paramName=menuGroupSeq, value=}, {paramName=lvl, value=}, {paramName=atchFileId, value=}, {paramName=pageIndex, value=1}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}, {paramName=menuNm, value=}, {paramName=menuCl, value=}, {paramName=no, value=}, {paramName=url, value=}, {paramName=menuCd, value=}, {paramName=description, value=}]', 'mn', '/ma/sys/mn/view.do', 'null', '2021-04-21 09:28:53', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (137, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', NULL, 'mlogmanage', '/ma/sys/mlogmanage/list.do', 'null', '2021-04-21 10:47:50', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (138, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', NULL, 'mlogmanage', '/ma/sys/mlogmanage/list.do', 'null', '2021-04-21 10:47:55', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (139, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'URL\' in \'field list\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectList */                 SELECT         SEQ seq     , USERKIND userkind     , ID id     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt     , RGST_ID rgstId     , F_USER_NM(ID) name     , ATCH_FILE_ID atchFileId     , URL url     , IP ip        FROM T_LOGMANAGE TB     WHERE USE_YN=\'Y\'                                             ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'URL\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'URL\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 10:48:29', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (140, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'URL\' in \'field list\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectList */                 SELECT         SEQ seq     , USERKIND userkind     , ID id     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt     , RGST_ID rgstId     , F_USER_NM(ID) name     , ATCH_FILE_ID atchFileId     , URL url     , IP ip        FROM T_LOGMANAGE TB     WHERE USE_YN=\'Y\'                                             ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'URL\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'URL\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 10:48:32', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (141, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'URL\' in \'field list\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectList */                 SELECT         SEQ seq     , USERKIND userkind     , ID id     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt     , RGST_ID rgstId     , F_USER_NM(ID) name     , ATCH_FILE_ID atchFileId     , URL url     , IP ip        FROM T_LOGMANAGE TB     WHERE USE_YN=\'Y\'                                             ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'URL\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'URL\' in \'field list\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 10:48:43', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (142, 'class javax.el.ELException', '행 [32]에서 [/WEB-INF/jsp/ma/sys/mlogmanage/addList.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n29: 							<td onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">\r\n30: 								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}\r\n31: 							</td>\r\n32: 							<td class=\"subject\" onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">${util:cutText(result.title,30,\'...\') }</td>\r\n33: 							<td onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">${result.name }</td>\r\n34: 							<td onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">${result.rgstDt }</td>\r\n35: 						</tr>\r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 10:51:54', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (143, 'class javax.el.ELException', '행 [32]에서 [/WEB-INF/jsp/ma/sys/mlogmanage/addList.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n29: 							<td onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">\r\n30: 								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}\r\n31: 							</td>\r\n32: 							<td class=\"subject\" onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">${util:cutText(result.title,30,\'...\') }</td>\r\n33: 							<td onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">${result.name }</td>\r\n34: 							<td onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">${result.rgstDt }</td>\r\n35: 						</tr>\r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 10:52:00', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (144, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: Error instantiating class com.open.vo.LogManageVO with invalid types () or values (). Cause: java.lang.reflect.InvocationTargetException', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 13:22:57', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (145, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 6', '', '[{paramName=schEtc01, value=multipleConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 15:18:02', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (146, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.TooManyResultsException: Expected one result (or null) to be returned by selectOne(), but found: 7', '', '[{paramName=schEtc01, value=multipleConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 15:18:07', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (147, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')\n				LIMIT  0 , 10\' at line 21\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectMulipleConAttempList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.multipleConAttemp.selectList */                 SELECT         SEQ seq     , USERKIND userkind     , ID id     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\') rgstDt     , F_USER_NM(ID) name     , URL url     , IP ip     , count(*) multipleConCount        FROM T_LOGMANAGE TB     WHERE USE_YN=\'Y\'                                                  ORDER BY SEQ DESC        GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')\n				LIMIT  0 , 10\' at line 21\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')\n				LIMIT  0 , 10\' at line 21', '', '[{paramName=schEtc01, value=multipleConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 15:40:05', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (148, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=returnUrl, value=}, {paramName=id, value=111}, {paramName=pwd, value=111}]', 'NOMENUCD', '/loginProcess.do', 'null', '2021-04-21 15:56:01', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (149, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'ip\n			)\n			VALUES (\n				 (SELECT IFNULL(MAX(TB.SEQ)+1,1) FROM T_LOGMANAGE TB)...\' at line 9\r\n### The error may involve com.open.LogManage.insertLoginFailed-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.insertContents */        INSERT INTO T_LOGIN_FAIL(                  SEQ      , USERKIND      , ID     , RGST_ID      , ATCH_FILE_ID      , IP ip    )    VALUES (      (SELECT IFNULL(MAX(TB.SEQ)+1,1) FROM T_LOGMANAGE TB)     ,?     ,?     ,?     ,?     ,?    )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'ip\n			)\n			VALUES (\n				 (SELECT IFNULL(MAX(TB.SEQ)+1,1) FROM T_LOGMANAGE TB)...\' at line 9\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'ip\n			)\n			VALUES (\n				 (SELECT IFNULL(MAX(TB.SEQ)+1,1) FROM T_LOGMANAGE TB)...\' at line 9', '', '[{paramName=returnUrl, value=}, {paramName=id, value=admin}, {paramName=pwd, value=11111}]', 'NOMENUCD', '/loginProcess.do', 'null', '2021-04-21 16:02:59', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (150, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'ip\n			)\n			VALUES (\n				 (SELECT IFNULL(MAX(TB.SEQ)+1,1) FROM T_LOGIN_FAIL TB...\' at line 7\r\n### The error may involve com.open.LogManage.insertLoginFailed-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.insertContents */        INSERT INTO T_LOGIN_FAIL(                  SEQ      , USERKIND      , ID     , IP ip    )    VALUES (      (SELECT IFNULL(MAX(TB.SEQ)+1,1) FROM T_LOGIN_FAIL TB)     ,?     ,?     ,?    )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'ip\n			)\n			VALUES (\n				 (SELECT IFNULL(MAX(TB.SEQ)+1,1) FROM T_LOGIN_FAIL TB...\' at line 7\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'ip\n			)\n			VALUES (\n				 (SELECT IFNULL(MAX(TB.SEQ)+1,1) FROM T_LOGIN_FAIL TB...\' at line 7', '', '[{paramName=returnUrl, value=}, {paramName=id, value=admin}, {paramName=pwd, value=1111111}]', 'NOMENUCD', '/loginProcess.do', 'null', '2021-04-21 16:06:16', 'Y', '0:0:0:0:0:0:0:1', '');
INSERT INTO `t_exception` VALUES (151, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'USE_YN\' in where clause is ambiguous\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT     COUNT(TB.SEQ) cnt    FROM t_login_fail as TB    JOIN t_ad_user as TU ON TU.ID = TB.ID    WHERE USE_YN=\'Y\'                           GROUP BY TB.ID\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'USE_YN\' in where clause is ambiguous\n; SQL []; Column \'USE_YN\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'USE_YN\' in where clause is ambiguous', '', '[{paramName=schEtc01, value=loginFailed}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 16:35:59', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (152, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectBannedIpConAttempCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT      COUNT(SEQ) cnt     FROM T_BANNEDIP_LOGINATTEMP    WHERE USE_YN=\'Y\'\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist', '', '[{paramName=schEtc01, value=bannedIpConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 17:14:00', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (153, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectBannedIpConAttempCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT      COUNT(SEQ) cnt     FROM T_BANNEDIP_LOGINATTEMP    WHERE USE_YN=\'Y\'\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist', '', '[{paramName=schEtc01, value=bannedIpConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 17:14:19', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (154, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectBannedIpConAttempList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* t_bannedip_loginattemp.selectList */                 SELECT         SEQ seq     , USERKIND userkind     , ID id     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d %T\') rgstDt     , RGST_ID rgstId     , F_USER_NM(ID) name     , URL url     , IP ip        FROM T_BANNEDIP_LOGINATTEMP TB     WHERE USE_YN=\'Y\'                                                  ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist', '', '[{paramName=schEtc01, value=bannedIpConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 17:23:18', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (155, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectBannedIpConAttempList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* T_BANNEDIP_CONATTEMP.selectList */                 SELECT         SEQ seq     , USERKIND userkind     , ID id     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d %T\') rgstDt     , RGST_ID rgstId     , F_USER_NM(ID) name     , URL url     , IP ip        FROM T_BANNEDIP_LOGINATTEMP TB     WHERE USE_YN=\'Y\'                                                  ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist', '', '[{paramName=schEtc01, value=bannedIpConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 17:24:07', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (156, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectBannedIpConAttempList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* T_BANNEDIP_CONATTEMP.selectList */                 SELECT         SEQ seq     , USERKIND userkind     , ID id     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d %T\') rgstDt     , RGST_ID rgstId     , F_USER_NM(ID) name     , URL url     , IP ip        FROM T_BANNEDIP_LOGINATTEMP TB     WHERE USE_YN=\'Y\'                                                  ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Table \'isp.t_bannedip_loginattemp\' doesn\'t exist', '', '[{paramName=schEtc01, value=bannedIpConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 17:24:55', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (157, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'USERKIND\' in \'field list\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectBannedIpConAttempList-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* T_BANNEDIP_CONATTEMP.selectList */                 SELECT         SEQ seq     , USERKIND userkind     , ID id     , DATE_FORMAT(RGST_DT,\'%Y.%m.%d %T\') rgstDt     , RGST_ID rgstId     , F_USER_NM(ID) name     , URL url     , IP ip        FROM T_BANNEDIP_CONATTEMP TB     WHERE USE_YN=\'Y\'                                                  ORDER BY SEQ DESC     LIMIT  ? , ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'USERKIND\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'USERKIND\' in \'field list\'', '', '[{paramName=schEtc01, value=bannedIpConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 17:25:59', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (158, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'WHERE USE_YN=\'Y\'\n				AND multipleConCount > 10\n			  \n		 \n	 	 \n	 \n			) as T1\' at line 8\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectMulitpleConAttempCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT     SEQ    , count(*) multipleConCount    FROM T_LOGMANAGE    GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')    WHERE USE_YN=\'Y\'     AND multipleConCount > 10                      ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'WHERE USE_YN=\'Y\'\n				AND multipleConCount > 10\n			  \n		 \n	 	 \n	 \n			) as T1\' at line 8\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'WHERE USE_YN=\'Y\'\n				AND multipleConCount > 10\n			  \n		 \n	 	 \n	 \n			) as T1\' at line 8', '', '[{paramName=schEtc01, value=multipleConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 17:38:37', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (159, 'class java.util.NoSuchElementException', 'Request processing failed; nested exception is java.util.NoSuchElementException: \'100\' doesn\'t map to an existing object', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-21 17:58:07', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (160, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.builder.BuilderException: Error evaluating expression \'schCategoryCd !=null and schCategoryCd !=\"\" schCategoryCd == 1\'. Cause: org.apache.ibatis.ognl.ExpressionSyntaxException: Malformed OGNL expression: schCategoryCd !=null and schCategoryCd !=\"\" schCategoryCd == 1 [org.apache.ibatis.ognl.ParseException: Encountered \" <IDENT> \"schCategoryCd \"\" at line 1, column 45.\r\nWas expecting one of:\r\n    <EOF> \r\n    \",\" ...\r\n    \"=\" ...\r\n    \"?\" ...\r\n    \"||\" ...\r\n    \"or\" ...\r\n    \"&&\" ...\r\n    \"and\" ...\r\n    \"|\" ...\r\n    \"bor\" ...\r\n    \"^\" ...\r\n    \"xor\" ...\r\n    \"&\" ...\r\n    \"band\" ...\r\n    \"==\" ...\r\n    \"eq\" ...\r\n    \"!=\" ...\r\n    \"neq\" ...\r\n    \"<\" ...\r\n    \"lt\" ...\r\n    \">\" ...\r\n    \"gt\" ...\r\n    \"<=\" ...\r\n    \"lte\" ...\r\n    \">=\" ...\r\n    \"gte\" ...\r\n    \"in\" ...\r\n    \"not\" ...\r\n    \"<<\" ...\r\n    \"shl\" ...\r\n    \">>\" ...\r\n    \"shr\" ...\r\n    \">>>\" ...\r\n    \"ushr\" ...\r\n    \"+\" ...\r\n    \"-\" ...\r\n    \"*\" ...\r\n    \"/\" ...\r\n    \"%\" ...\r\n    \"instanceof\" ...\r\n    \".\" ...\r\n    \"(\" ...\r\n    \"[\" ...\r\n    <DYNAMIC_SUBSCRIPT> ...\r\n    ]', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 09:25:54', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (161, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'RGST_DT BETWEEN \'2021.04.22\' AND \'2021.04.22\'\' at line 15\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT      COUNT(SEQ) cnt     FROM T_LOGMANAGE    WHERE USE_YN=\'Y\'                                              RGST_DT BETWEEN ? AND ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'RGST_DT BETWEEN \'2021.04.22\' AND \'2021.04.22\'\' at line 15\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \'RGST_DT BETWEEN \'2021.04.22\' AND \'2021.04.22\'\' at line 15', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=2021.04.22}, {paramName=searchEndDate, value=2021.04.22}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 09:41:31', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (162, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectMulitpleConAttempCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT     SEQ    , count(*) multipleConCount    FROM T_LOGMANAGE    WHERE USE_YN=\'Y\'    GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')    HAVING multipleConCount > 10                                              AND TIME(RGST_DT) BETWEEN ? AND ?                  ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'', '', '[{paramName=schEtc01, value=multipleConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=10:05}, {paramName=schEtc03, value=14:05}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 10:06:37', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (163, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectMulitpleConAttempCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT     SEQ    , count(*) multipleConCount    FROM T_LOGMANAGE    WHERE USE_YN=\'Y\'    GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')    HAVING multipleConCount > 10                                              AND TIME(RGST_DT) BETWEEN ? AND ?                  ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'', '', '[{paramName=schEtc01, value=multipleConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=10:05}, {paramName=schEtc03, value=14:05}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 10:06:54', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (164, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT     COUNT(TB.SEQ) cnt    FROM t_login_fail as TB    JOIN t_ad_user as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                                                   AND TIME(RGST_DT) BETWEEN ? AND ?                  GROUP BY TB.ID\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous\n; SQL []; Column \'RGST_DT\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous', '', '[{paramName=schEtc01, value=loginFailed}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=10:05}, {paramName=schEtc03, value=14:05}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 10:06:59', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (165, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectMulitpleConAttempCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT     SEQ    , count(*) multipleConCount    FROM T_LOGMANAGE    WHERE USE_YN=\'Y\'    GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')    HAVING multipleConCount > 10                                              AND TIME(RGST_DT) BETWEEN ? AND ?                  ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'', '', '[{paramName=schEtc01, value=multipleConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=10:05}, {paramName=schEtc03, value=14:05}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 10:07:00', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (166, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectMulitpleConAttempCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT     SEQ    , count(*) multipleConCount    FROM T_LOGMANAGE    WHERE USE_YN=\'Y\'    GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')    HAVING multipleConCount > 10                                              AND TIME(RGST_DT) BETWEEN ? AND ?                  ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'', '', '[{paramName=schEtc01, value=multipleConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=10:05}, {paramName=schEtc03, value=14:05}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 10:07:03', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (167, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectMulitpleConAttempCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT     SEQ    , count(*) multipleConCount    FROM T_LOGMANAGE    WHERE USE_YN=\'Y\'    GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')    HAVING multipleConCount > 10                                              AND TIME(RGST_DT) BETWEEN ? AND ?                  ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'', '', '[{paramName=schEtc01, value=multipleConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=10:07}, {paramName=schEtc03, value=11:07}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 10:08:54', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (168, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectMulitpleConAttempCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT     SEQ    , count(*) multipleConCount    FROM T_LOGMANAGE    WHERE USE_YN=\'Y\'    GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')    HAVING multipleConCount > 10                                              AND TIME(RGST_DT) BETWEEN ? AND ?                  ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'', '', '[{paramName=schEtc01, value=multipleConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=10:07}, {paramName=schEtc03, value=11:07}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 10:09:23', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (169, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectMulitpleConAttempCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT     SEQ    , count(*) multipleConCount    FROM T_LOGMANAGE    WHERE USE_YN=\'Y\'    GROUP BY ID, URL, DATE_FORMAT(RGST_DT,\'%Y.%m.%d %H:%i\')    HAVING multipleConCount > 10                                              AND TIME(RGST_DT) BETWEEN ? AND ?                  ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_DT\' in \'having clause\'', '', '[{paramName=schEtc01, value=multipleConAttemp}, {paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=10:07}, {paramName=schEtc03, value=11:07}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 10:09:46', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (170, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT     COUNT(TB.SEQ) cnt    FROM t_login_fail as TB    JOIN t_ad_user as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                                                   AND TIME(RGST_DT) BETWEEN ? AND ?                  GROUP BY TB.ID\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous\n; SQL []; Column \'RGST_DT\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=11:22}, {paramName=schEtc03, value=18:22}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 10:23:27', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (171, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT     COUNT(TB.SEQ) cnt    FROM t_login_fail as TB    JOIN t_ad_user as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                                                   AND TIME(RGST_DT) BETWEEN ? AND ?                  GROUP BY TB.ID\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous\n; SQL []; Column \'RGST_DT\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=10:38}, {paramName=schEtc03, value=23:38}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 10:38:32', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (172, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.NumberFormatException: For input string: \"0,0\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"0,0\"', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 11:13:05', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (173, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.NumberFormatException: For input string: \"0,0\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"0,0\"', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=multipleConAttemp}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 11:13:11', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (174, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.NumberFormatException: For input string: \"0,0\"\r\n### Cause: java.lang.NumberFormatException: For input string: \"0,0\"', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 11:13:12', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (175, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT     COUNT(TB.SEQ) cnt    FROM t_login_fail as TB    JOIN t_ad_user as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                         AND ID LIKE CONCAT(\'%\',?,\'%\')                                                         GROUP BY TB.ID\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous\n; SQL []; Column \'ID\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=1}, {paramName=searchKeyword, value=ad}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 14:31:57', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (176, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT     COUNT(TB.SEQ) cnt    FROM t_login_fail as TB    JOIN t_ad_user as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                         AND ID LIKE CONCAT(\'%\',?,\'%\')                                                        AND DATE(RGST_DT) BETWEEN ? AND ?                       GROUP BY TB.ID\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous\n; SQL []; Column \'ID\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=1}, {paramName=searchKeyword, value=ad}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=2021.04.22}, {paramName=searchEndDate, value=2021.04.22}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 14:32:09', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (177, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT     COUNT(TB.SEQ) cnt    FROM T_LOGIN_FAIL as TB    JOIN T_AD_USER as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                                                                       AND DATE(RGST_DT) BETWEEN ? AND ?                       GROUP BY TB.ID\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous\n; SQL []; Column \'RGST_DT\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'RGST_DT\' in where clause is ambiguous', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=a}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=2021.04.22}, {paramName=searchEndDate, value=2021.04.22}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 14:34:28', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (178, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT     COUNT(TB.SEQ) cnt    FROM T_LOGIN_FAIL as TB    JOIN T_AD_USER as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                         AND ID LIKE CONCAT(\'%\',?,\'%\')                                                        AND DATE(TB.RGST_DT) BETWEEN ? AND ?                       GROUP BY TB.ID\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous\n; SQL []; Column \'ID\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=1}, {paramName=searchKeyword, value=a}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=2021.04.22}, {paramName=searchEndDate, value=2021.04.22}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 14:39:07', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (179, 'class org.springframework.dao.DataIntegrityViolationException', 'Request processing failed; nested exception is org.springframework.dao.DataIntegrityViolationException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT     COUNT(TB.SEQ) cnt    FROM T_LOGIN_FAIL as TB    JOIN T_AD_USER as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                         AND ID LIKE CONCAT(\'%\',?,\'%\')                                                        AND DATE(TB.RGST_DT) BETWEEN ? AND ?                       GROUP BY TB.ID\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous\n; SQL []; Column \'ID\' in where clause is ambiguous; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException: Column \'ID\' in where clause is ambiguous', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=1}, {paramName=searchKeyword, value=a}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=2021.04.22}, {paramName=searchEndDate, value=2021.04.22}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 14:39:16', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (180, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=a}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=2021.04.22}, {paramName=searchEndDate, value=2021.04.22}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 14:40:19', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (181, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=a}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=2021.04.22}, {paramName=searchEndDate, value=2021.04.23}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 14:41:06', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (182, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=1}, {paramName=searchKeyword, value=ab}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 14:45:27', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (183, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=3}, {paramName=searchKeyword, value=ab}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 14:48:36', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (184, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT     COUNT(TB.SEQ) cnt    FROM T_LOGIN_FAIL as TB    JOIN T_AD_USER as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                              AND TB.URL LIKE CONCAT(\'%\',?,\'%\')                                                    GROUP BY TB.ID\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=2}, {paramName=searchKeyword, value=ab}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 14:54:38', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (185, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=1}, {paramName=searchKeyword, value=ab}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 14:56:28', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (186, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'loginFailCount\' in \'having clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT     TB.SEQ    FROM T_LOGIN_FAIL as TB    JOIN T_AD_USER as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                                                GROUP BY TB.ID                    HAVING loginFailCount > ?                 ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'loginFailCount\' in \'having clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'loginFailCount\' in \'having clause\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}, {paramName=schEtc04, value=4}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 15:26:36', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (187, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'loginFailCount\' in \'having clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT     TB.SEQ    FROM T_LOGIN_FAIL as TB    JOIN T_AD_USER as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                                                GROUP BY TB.ID                    HAVING loginFailCount > ?                 ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'loginFailCount\' in \'having clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'loginFailCount\' in \'having clause\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}, {paramName=schEtc04, value=4}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 15:26:43', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (188, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.exceptions.PersistenceException: \r\n### Error querying database.  Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.open.BannedIP.selectCount\r\n### Cause: java.lang.IllegalArgumentException: Mapped Statements collection does not contain value for com.open.BannedIP.selectCount', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mipmanage', '/ma/sys/mipmanage/addList.do', 'null', '2021-04-22 16:24:16', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (189, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_ID\' in \'field list\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\BannedIP_SQL.xml]\r\n### The error may involve com.open.BannedIP.selectContents-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* bannedip.selectContents */         SELECT         IP ip       , F_USER_NM(RGST_ID) name       , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt       , CONT cont       , ATCH_FILE_ID atchFileId        FROM  T_BANNEDIP TB     WHERE  USE_YN=\'Y\'       AND IP = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_ID\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_ID\' in \'field list\'', '', NULL, 'mipmanage', '/ma/sys/mipmanage/list.do', 'null', '2021-04-22 16:34:14', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (190, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_ID\' in \'field list\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\BannedIP_SQL.xml]\r\n### The error may involve com.open.BannedIP.selectContents-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* bannedip.selectContents */         SELECT         IP ip       , F_USER_NM(RGST_ID) name       , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt       , CONT cont       , ATCH_FILE_ID atchFileId        FROM  T_BANNEDIP TB     WHERE  USE_YN=\'Y\'       AND IP = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_ID\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_ID\' in \'field list\'', '', NULL, 'mipmanage', '/ma/sys/mipmanage/list.do', 'null', '2021-04-22 16:34:31', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (191, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_ID\' in \'field list\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\BannedIP_SQL.xml]\r\n### The error may involve com.open.BannedIP.selectContents-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* bannedip.selectContents */         SELECT         IP ip       , F_USER_NM(RGST_ID) name       , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt       , CONT cont       , ATCH_FILE_ID atchFileId        FROM  T_BANNEDIP TB     WHERE  USE_YN=\'Y\'       AND IP = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_ID\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'RGST_ID\' in \'field list\'', '', NULL, 'mipmanage', '/ma/sys/mipmanage/list.do', 'null', '2021-04-22 16:34:36', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (192, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'ATCH_FILE_ID\' in \'field list\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\BannedIP_SQL.xml]\r\n### The error may involve com.open.BannedIP.selectContents-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* bannedip.selectContents */         SELECT         IP ip       , F_USER_NM(RGST_ID) name       , DATE_FORMAT(RGST_DT,\'%Y.%m.%d\') rgstDt       , CONT cont       , ATCH_FILE_ID atchFileId        FROM  T_BANNEDIP TB     WHERE  USE_YN=\'Y\'       AND IP = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'ATCH_FILE_ID\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'ATCH_FILE_ID\' in \'field list\'', '', NULL, 'mipmanage', '/ma/sys/mipmanage/list.do', 'null', '2021-04-22 16:35:24', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (193, 'class javax.el.ELException', '행 [32]에서 [/WEB-INF/jsp/ma/sys/mipmanage/addList.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n29: 							<td onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">\r\n30: 								${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}\r\n31: 							</td>\r\n32: 							<td class=\"subject\" onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">${util:cutText(result.title,30,\'...\') }</td>\r\n33: 							<td onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">${result.name }</td>\r\n34: 							<td onclick=\"fncPageBoard(\'view\',\'view.do\',\'${result.seq}\',\'seq\')\">${result.rgstDt }</td>\r\n35: 						</tr>\r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=}]', 'mipmanage', '/ma/sys/mipmanage/addList.do', 'null', '2021-04-22 16:36:04', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (194, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=4}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}]', 'mipmanage', '/ma/sys/mipmanage/updateForm.do', 'null', '2021-04-22 16:45:20', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (195, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=4}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}]', 'mipmanage', '/ma/sys/mipmanage/updateForm.do', 'null', '2021-04-22 16:46:49', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (196, 'class org.apache.tiles.request.render.CannotRenderException', 'Request processing failed; nested exception is org.apache.tiles.request.render.CannotRenderException: 행 [47]에서 [WEB-INF/jsp/cmmn/layout/ma/layout.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n44: 			<tiles:insertAttribute name=\"aside\"/>\r\n45: 	        <!--// header -->     \r\n46: 			<!-- contents -->			\r\n47: 			<tiles:insertAttribute name=\"body\"/>\r\n48: 		</div>\r\n49: 		<!-- <div class=\"loading_bg\" id=\"loading_bg\"> \r\n50: 			<div class=\"loading_box\"> \r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=4}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}]', 'mipmanage', '/ma/sys/mipmanage/updateForm.do', 'null', '2021-04-22 16:47:38', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (197, 'class java.lang.NullPointerException', 'Request processing failed; nested exception is java.lang.NullPointerException', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=atchFileId, value=}, {paramName=searchStartDate, value=}, {paramName=searchEndDate, value=}, {paramName=searchCondition, value=0}, {paramName=placeCondition, value=}, {paramName=searchKeyword, value=}, {paramName=selectRepliedBoard, value=0}, {paramName=selectNoticeDateCat, value=rgstdate}, {paramName=schEtc01, value=}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}, {paramName=schEtc04, value=}, {paramName=schEtc05, value=}, {paramName=schEtc06, value=}, {paramName=schEtc07, value=}, {paramName=schEtc08, value=}, {paramName=schEtc09, value=}, {paramName=schEtc10, value=}, {paramName=schEtc13, value=}, {paramName=schEtc14, value=}, {paramName=schEtc15, value=}]', 'mipmanage', '/ma/sys/mipmanage/updateForm.do', 'null', '2021-04-22 16:52:52', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (198, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TITLE\' in \'where clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\BannedIP_SQL.xml]\r\n### The error may involve com.open.BannedIP.selectCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* bannedip.selectCount */        SELECT      COUNT(SEQ) cnt     FROM T_BANNEDIP TB    WHERE USE_YN=\'Y\'                              AND TITLE LIKE CONCAT(\'%\',?,\'%\')\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TITLE\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TITLE\' in \'where clause\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=1}, {paramName=searchKeyword, value=}, {paramName=schCategoryCd, value=0}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mipmanage', '/ma/sys/mipmanage/addList.do', 'null', '2021-04-22 17:14:40', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (199, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TITLE\' in \'where clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\BannedIP_SQL.xml]\r\n### The error may involve com.open.BannedIP.selectCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* bannedip.selectCount */        SELECT      COUNT(SEQ) cnt     FROM T_BANNEDIP TB    WHERE USE_YN=\'Y\'                              AND TITLE LIKE CONCAT(\'%\',?,\'%\')\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TITLE\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TITLE\' in \'where clause\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=1}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=1}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mipmanage', '/ma/sys/mipmanage/addList.do', 'null', '2021-04-22 17:16:44', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (200, 'class org.mybatis.spring.MyBatisSystemException', 'Request processing failed; nested exception is org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.reflection.ReflectionException: There is no getter for property named \'chCategoryCd\' in \'class com.open.cmmn.model.CmmnDefaultVO\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=searchCondition, value=1}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mipmanage', '/ma/sys/mipmanage/addList.do', 'null', '2021-04-22 17:19:57', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (201, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.ID\' in \'where clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectBannedIpConAttempCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */        SELECT      COUNT(SEQ) cnt     FROM T_BANNEDIP_CONATTEMP TB    WHERE USE_YN=\'Y\'                         AND (TB.ID LIKE CONCAT(\'%\',?,\'%\') OR TB.URL like CONCAT(\'%\',?,\'%\') OR TB.IP like CONCAT(\'%\',?,\'%\') )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.ID\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.ID\' in \'where clause\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=bannedIpConAttemp}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=ddd}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 17:34:22', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (202, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT      COUNT(*) loginFailCount    FROM T_LOGIN_FAIL as TB    JOIN T_AD_USER as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                     AND (TB.ID LIKE CONCAT(\'%\',?,\'%\') OR TB.URL like CONCAT(\'%\',?,\'%\') OR TB.IP like CONCAT(\'%\',?,\'%\') )                                GROUP BY TB.ID                                ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=ddd}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 17:39:34', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (203, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT      COUNT(*) loginFailCount    FROM T_LOGIN_FAIL as TB    JOIN T_AD_USER as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                     AND (TB.ID LIKE CONCAT(\'%\',?,\'%\') OR TB.URL like CONCAT(\'%\',?,\'%\') OR TB.IP like CONCAT(\'%\',?,\'%\') )                                GROUP BY TB.ID                                ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=ddd}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 17:39:46', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (204, 'class org.springframework.jdbc.BadSqlGrammarException', 'Request processing failed; nested exception is org.springframework.jdbc.BadSqlGrammarException: \r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'\r\n### The error may exist in file [C:\\workspace2\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\kimbuild\\WEB-INF\\classes\\sqlmap\\query\\LOGMANAGE_SQL.xml]\r\n### The error may involve com.open.LogManage.selectLoginFailedCount-Inline\r\n### The error occurred while setting parameters\r\n### SQL: /* logmanage.selectCount */   SELECT COUNT(*) cnt FROM (    SELECT      COUNT(*) loginFailCount    FROM T_LOGIN_FAIL as TB    JOIN T_AD_USER as TU ON TU.ID = TB.ID    WHERE TB.USE_YN=\'Y\'                     AND (TB.ID LIKE CONCAT(\'%\',?,\'%\') OR TB.URL like CONCAT(\'%\',?,\'%\') OR TB.IP like CONCAT(\'%\',?,\'%\') )                                                             GROUP BY TB.ID                                ) as T1\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'TB.URL\' in \'where clause\'', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=loginFailed}, {paramName=searchCondition, value=0}, {paramName=searchKeyword, value=ddd}, {paramName=schEtc04, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-22 17:43:50', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (205, 'class java.lang.IllegalStateException', '행 [15]에서 [/WEB-INF/jsp/ma/sys/mlogmanage/addList.jsp]을(를) 처리하는 중 예외 발생\r\n\r\n12: 		<i class=\"i_all\"></i><span>전체 : <strong>${paginationInfo.totalRecordCount}</strong> 건(${searchVO.pageIndex}/${paginationInfo.totalPageCount} Page) </span>\r\n13: 	</div>\r\n14: 	<div class=\"tbl_right\">\r\n15: 		<form:select path=\"pageUnit\" id=\"pageUnit\" title=\"표시할 데이터 갯수\" cssClass=\"w100\">  \r\n16: 			<form:option value=\"10\" label=\"10\"/>\r\n17: 			<form:option value=\"20\" label=\"20\"/>\r\n18: 			<form:option value=\"30\" label=\"30\"/>\r\n\r\n\r\nStacktrace:', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=schEtc01, value=}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-23 14:35:57', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (206, 'class java.lang.NumberFormatException', 'Request processing failed; nested exception is java.lang.NumberFormatException: For input string: \"\"', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=customPageUnit, value=}, {paramName=schEtc01, value=}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-23 15:16:53', 'Y', '0:0:0:0:0:0:0:1', '5');
INSERT INTO `t_exception` VALUES (207, 'class java.lang.NumberFormatException', 'Request processing failed; nested exception is java.lang.NumberFormatException: For input string: \"\"', '', '[{paramName=seq, value=}, {paramName=pageIndex, value=1}, {paramName=customPageUnit, value=}, {paramName=schEtc01, value=}, {paramName=searchCondition, value=0}, {paramName=schCategoryCd, value=0}, {paramName=searchKeyword, value=}, {paramName=searchStartDate, value=----}, {paramName=searchEndDate, value=----}, {paramName=schEtc02, value=}, {paramName=schEtc03, value=}]', 'mlogmanage', '/ma/sys/mlogmanage/addList.do', 'null', '2021-04-23 15:19:03', 'Y', '0:0:0:0:0:0:0:1', '5');

-- ----------------------------
-- Table structure for t_forminput
-- ----------------------------
DROP TABLE IF EXISTS `t_forminput`;
CREATE TABLE `t_forminput`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `ATCH_FILE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일 아이디',
  `MAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `CITY` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `BELONGKIND` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RADIO1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SCALE` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COLOR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DATE1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `HP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `KEYWORD` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `DATALIST` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `SOCIAL_SEC_NUM` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '주민등록번호',
  `BUSINESS_LIC_NUM` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '사업자등록번호',
  `ADDR` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ZONECODE` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '우편번호',
  `ADDR_DETAIL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_forminput
-- ----------------------------
INSERT INTO `t_forminput` VALUES (1, 'test1', '&lt;p&gt;test1&amp;nbsp;&lt;/p&gt;', '2021-04-20 16:57:24', '5', '2021-04-20 17:43:57', NULL, 'Y', '', 'test1', 'option1,ㅅㄷㄴㅅ1', NULL, 'option1', '50', '#000000', '2021.04.01', 'test1', NULL, 'test1', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_forminput` VALUES (2, 'test2', '&lt;p&gt;test2&amp;nbsp;&lt;/p&gt;', '2021-04-20 17:46:17', '5', NULL, NULL, 'Y', '', 'test2', 'option1,test2', NULL, NULL, '50', '#931010', '', 'test2', NULL, 'test2', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_forminput` VALUES (3, 'test3', '&lt;p&gt;test3&amp;nbsp;&lt;/p&gt;', '2021-04-20 17:47:42', '5', NULL, NULL, 'Y', '', 'test3', 'option1,test3', NULL, NULL, '50', '#000000', '', 'test3', NULL, 'test3', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_forminput` VALUES (4, 'test4', '&lt;p&gt;test4&amp;nbsp;&lt;/p&gt;', '2021-04-20 17:48:23', '5', '2021-04-20 18:21:56', NULL, 'Y', '', 'test4', 'option1', NULL, 'option2', '50', '#000000', '', 'test4', NULL, 'test4', 'test4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_forminput` VALUES (5, '2222', '&lt;p&gt;sdsds&lt;/p&gt;', '2021-04-23 11:11:02', '5', NULL, NULL, 'Y', '', '', 'option1', NULL, NULL, '50', '#000000', '', '', NULL, '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_forminput` VALUES (6, 't1', '&lt;p&gt;t1&lt;/p&gt;', '2021-04-23 13:24:04', '5', '2021-04-23 14:19:56', NULL, 'Y', '', '', 'option1', NULL, NULL, '50', '#000000', '', '', NULL, '', '', '', '', '서울 강북구 한천로 833', '01226', 'ㅇㄹㅇ');

-- ----------------------------
-- Table structure for t_forminput_checkboxlist
-- ----------------------------
DROP TABLE IF EXISTS `t_forminput_checkboxlist`;
CREATE TABLE `t_forminput_checkboxlist`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `FORMINPUT_SEQ` int(11) NULL DEFAULT NULL,
  `CHECKBOX_CONTENT` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_forminput_checkboxlist
-- ----------------------------
INSERT INTO `t_forminput_checkboxlist` VALUES (16, 1, 'belong1');
INSERT INTO `t_forminput_checkboxlist` VALUES (17, 1, 'belong2');
INSERT INTO `t_forminput_checkboxlist` VALUES (18, 4, 'belong1');
INSERT INTO `t_forminput_checkboxlist` VALUES (19, 4, 'belong3');

-- ----------------------------
-- Table structure for t_free
-- ----------------------------
DROP TABLE IF EXISTS `t_free`;
CREATE TABLE `t_free`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `ATCH_FILE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일 아이디',
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_free
-- ----------------------------
INSERT INTO `t_free` VALUES (1, '1.', '&lt;p&gt;1.&lt;/p&gt;', '2021-04-07 11:11:29', '5', '2021-04-07 11:11:51', NULL, 'Y', 'FILE0000000000004076');
INSERT INTO `t_free` VALUES (2, '2', '&lt;p&gt;2&lt;/p&gt;', '2021-04-07 11:11:37', '5', NULL, NULL, 'Y', '');
INSERT INTO `t_free` VALUES (3, '3', '&lt;p style=&quot;margin-left: 200px;&quot;&gt;3&lt;/p&gt;&lt;p&gt;3&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/atch/getImage.do?atchFileId=FILE0000000000004114&quot; alt=&quot;&quot; title=&quot;3.png&quot; width=&quot;&quot; height=&quot;&quot;&gt;&amp;nbsp;&lt;/p&gt;', '2021-04-07 13:58:40', '5', '2021-04-08 14:15:40', NULL, 'Y', 'FILE0000000000004077');
INSERT INTO `t_free` VALUES (4, '4.', '4\r\n4.', '2021-04-07 14:14:20', '7', '2021-04-07 14:14:26', NULL, 'Y', 'FILE0000000000004078');
INSERT INTO `t_free` VALUES (5, '5.1', '                       1\r\n5fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b3545fdgg4tgtrhtr45y546ru64yhtrjhnry6ui578u57y4556b354', '2021-04-07 17:31:03', '6', '2021-04-08 14:14:01', NULL, 'Y', 'FILE0000000000004102');
INSERT INTO `t_free` VALUES (6, 'test', 'testaaa', '2021-04-07 19:38:08', '9', '2021-04-07 19:38:14', NULL, 'Y', '');
INSERT INTO `t_free` VALUES (7, '21', '21', '2021-04-08 10:53:37', '6', '2021-04-08 10:53:42', NULL, 'N', '');
INSERT INTO `t_free` VALUES (8, 'sdfdfd', '222\r\nfgdfd\r\n\r\n\r\n\r\nfddff', '2021-04-08 15:00:24', '6', '2021-04-08 15:00:39', NULL, 'Y', '');
INSERT INTO `t_free` VALUES (9, '에디터 테스트1', '&lt;p&gt;잘됨??&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;진짜잘도미ㅣㅁ리이????????????????????&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;사진투척&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/atch/getImage.do?atchFileId=FILE0000000000004116&quot; alt=&quot;&quot; title=&quot;3.png&quot; width=&quot;&quot; height=&quot;&quot;  style=&quot;border-color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;또 사진투척&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/atch/getImage.do?atchFileId=FILE0000000000004117&quot; alt=&quot;&quot; title=&quot;4.png&quot; width=&quot;&quot; height=&quot;&quot; sqeid=&quot;QE_161793146014650049&quot; style=&quot;border-color: rgb(0, 0, 0);&quot;&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!장문공격!!!!!!!!!!!!!!!!!!!!&lt;/p&gt;', '2021-04-09 10:24:40', '6', NULL, NULL, 'Y', 'FILE0000000000004118');

-- ----------------------------
-- Table structure for t_free_cmt
-- ----------------------------
DROP TABLE IF EXISTS `t_free_cmt`;
CREATE TABLE `t_free_cmt`  (
  `BCMT_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `SUB_SEQ` int(11) NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  PRIMARY KEY (`BCMT_SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_free_cmt
-- ----------------------------
INSERT INTO `t_free_cmt` VALUES (1, 1, '1\r\n1.', '2021-04-07 11:12:00', '5', '2021-04-07 11:12:25', NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (2, 1, '2', '2021-04-07 11:12:04', '5', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (3, 1, '3', '2021-04-07 11:12:06', '5', NULL, NULL, 'N');
INSERT INTO `t_free_cmt` VALUES (4, 1, '4', '2021-04-07 11:12:30', '5', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (5, 1, '1\r\n1.1.', '2021-04-07 14:11:45', '6', '2021-04-08 10:42:01', NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (6, 1, '2\r\n2', '2021-04-07 14:12:59', '6', '2021-04-07 14:13:03', NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (7, 1, '3', '2021-04-07 14:13:07', '6', NULL, NULL, 'N');
INSERT INTO `t_free_cmt` VALUES (8, 1, '5.', '2021-04-07 14:13:43', '7', '2021-04-07 14:13:47', NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (9, 5, '1\r\n1.1', '2021-04-07 17:31:12', '6', '2021-04-08 14:11:49', NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (10, 5, '2', '2021-04-07 17:31:17', '6', NULL, NULL, 'N');
INSERT INTO `t_free_cmt` VALUES (11, 5, 'yrdyaaa', '2021-04-07 19:18:26', '9', '2021-04-07 19:18:40', NULL, 'N');
INSERT INTO `t_free_cmt` VALUES (12, 5, '123123', '2021-04-07 19:24:38', '9', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (13, 5, '123\r\n\r\n123\r\n\r\n\r\n123', '2021-04-08 13:02:04', '5', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (14, 5, '123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414123123123121414', '2021-04-08 13:06:23', '5', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (15, 6, 'sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43sssssssssssssssssssssss435r34324234rt4t34ty434t4tfbvvfbe43', '2021-04-08 13:19:02', '5', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (16, 6, '1\r\n\r\n\r\n1', '2021-04-08 13:47:55', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (17, 6, '1\r\n\r\n1', '2021-04-08 13:48:37', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (18, 3, 'test1\r\n\r\ntest1', '2021-04-08 14:16:20', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (19, 3, 'edgf34\r\n\r\n3434343er\r\n\r\n\r\nsfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35sfw4t345r3435t54w3t453y467456745y4ety6356325634gb5rhg35', '2021-04-08 14:16:32', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (21, 9, '&lt;p&gt;ㅇㄹㅇㄹㅇ&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;ㅇㄹㅇ&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;ㅇㄹㅇㄹㅇ&lt;/p&gt;', '2021-04-09 10:41:00', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (22, 9, '&lt;p&gt;ㄴㅇㄹㅇㄹㅇ&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;ㅇㄹㅇ&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;ㅇㅇㅇㅇ&lt;img src=&quot;/atch/getImage.do?atchFileId=FILE0000000000004122&quot; alt=&quot;&quot; title=&quot;2.png&quot; width=&quot;&quot; height=&quot;&quot;  style=&quot;border-color: rgb(0, 0, 0);&quot;&gt;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;ㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇ&amp;nbsp;&lt;/p&gt;', '2021-04-09 10:43:32', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (23, 9, '&lt;p&gt;ㄴㅇㄹㅇㄹㅇ&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;ㅇㄹㅇ&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;ㅇㅇㅇㅇ&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;ㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇㄴㅇㄹㅇㄹㅇ&lt;/p&gt;', '2021-04-09 10:44:04', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (24, 9, '&lt;p&gt;ㅇㄹㅇ&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;ㅇㅇㅇ&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222111111111111111111111111111111111111111111111111111111122222222222222222222222222222222222222222222&amp;nbsp;&lt;/p&gt;', '2021-04-09 10:58:55', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (25, 8, '&lt;p&gt;&amp;lt;script&amp;gt;alert(&quot;hi&quot;)&amp;lt;/script&amp;gt;&lt;/p&gt;', '2021-04-09 12:13:00', '6', NULL, NULL, 'N');
INSERT INTO `t_free_cmt` VALUES (26, 8, '&lt;p&gt;&amp;lt;script&amp;gt;alert(&quot;hi&quot;)&amp;lt;/script&amp;gt;&lt;/p&gt;', '2021-04-09 12:13:26', '6', NULL, NULL, 'N');
INSERT INTO `t_free_cmt` VALUES (27, 8, '&lt;p&gt;&amp;lt;script&amp;gt;alert(&quot;fgfdgfdgdf&quot;)&amp;lt;/script&amp;gt;&lt;/p&gt;', '2021-04-09 12:14:16', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (28, 8, '&lt;p&gt;dfdfd&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;dfsds&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;dsdsssss&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;span style=&quot;color: rgb(72, 72, 72); font-family: &amp;quot;Nanum Gothic&amp;quot;, &amp;quot;malgun gothic&amp;quot;, dotum; font-size: 13px; white-space: pre-line; word-spacing: -1px; background-color: rgb(255, 255, 255);&quot;&gt;&amp;lt;script&amp;gt;alert(&quot;fgfdgfdgdf&quot;)&amp;lt;/script&amp;gt;&lt;/span&gt;&amp;nbsp;&lt;/p&gt;', '2021-04-09 12:27:30', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (29, 8, '&lt;p&gt;ㄴㅇㄴ&lt;/p&gt;&lt;p&gt;ㄴㄴ&lt;/p&gt;', '2021-04-09 12:37:09', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (30, 8, '&lt;p&gt;&lt;img src=&quot;/atch/getImage.do?atchFileId=FILE0000000000004123&quot; alt=&quot;&quot; title=&quot;1.png&quot; width=&quot;&quot; height=&quot;&quot;&gt;&lt;img src=&quot;/atch/getImage.do?atchFileId=FILE0000000000004124&quot; alt=&quot;&quot; title=&quot;2.png&quot; width=&quot;&quot; height=&quot;&quot;&gt;&amp;nbsp;&lt;/p&gt;', '2021-04-09 12:45:22', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (31, 8, '&lt;p&gt;&lt;img src=&quot;/atch/getImage.do?atchFileId=FILE0000000000004125&quot; alt=&quot;&quot; title=&quot;3.png&quot; width=&quot;&quot; height=&quot;&quot;&gt;&amp;nbsp;&lt;/p&gt;', '2021-04-09 12:45:52', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (32, 8, '&lt;p&gt;&lt;img src=&quot;/atch/getImage.do?atchFileId=FILE0000000000004126&quot; alt=&quot;&quot; title=&quot;4.png&quot; width=&quot;&quot; height=&quot;&quot;&gt;&amp;nbsp;&lt;/p&gt;', '2021-04-09 12:46:24', '6', NULL, NULL, 'Y');
INSERT INTO `t_free_cmt` VALUES (33, 9, 'aaa\r\na\r\n							\r\n							\r\n							\r\n							\r\n							\r\n							\r\n							\r\n							\r\n							\r\n							\r\n							\r\n							', '2021-04-10 15:04:48', '6', '2021-04-10 15:29:08', NULL, 'Y');

-- ----------------------------
-- Table structure for t_ft_user
-- ----------------------------
DROP TABLE IF EXISTS `t_ft_user`;
CREATE TABLE `t_ft_user`  (
  `SEQ` int(11) NOT NULL COMMENT '일련번호',
  `ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '아이디',
  `PWD` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '비밀번호',
  `NAME` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '이름',
  `USE_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용유무',
  `REG_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '작성자',
  `REG_DATE` timestamp(0) NOT NULL DEFAULT current_timestamp,
  `MOD_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `MOD_DATE` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '수정일',
  `SITE_CLCD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '사이트구분코드',
  `EMAIL` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '메일',
  `TEL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '전화번호',
  `HP` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '핸드폰',
  `ATCH_FILE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일',
  `LAST_DATE` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '최종접속일',
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '통합회원관리' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_ft_user
-- ----------------------------
INSERT INTO `t_ft_user` VALUES (1, '1232', 'CF0F29A894FC6868B15C3B5A751C47ED66A0C4F7D423EDD9B24BDF8CF1DF12BD', '12', 'N', NULL, '2020-02-06 17:11:24', '1', '2020-03-10 18:12:18', '', 'test@naver.com', '02-1234-12', '011-1234-1234', 'FILE0000000000000031', '0000-00-00 00:00:00');
INSERT INTO `t_ft_user` VALUES (2, 'qwer1234', '0EE9796A41CCBE88EB774461DAC94A83D34959FEFA3BB4603C88B53FCAD0B1FE', '김길현', 'Y', NULL, '2020-03-18 18:29:20', '1', '2020-03-18 18:30:45', '', 'dbsqhtjs@naver.com', '0621234567', '010-7984-1184', '', '0000-00-00 00:00:00');
INSERT INTO `t_ft_user` VALUES (3, 'qazwsx123', '0EE9796A41CCBE88EB774461DAC94A83D34959FEFA3BB4603C88B53FCAD0B1FE', '홍길동', 'Y', NULL, '2020-03-18 18:30:11', '1', '2020-03-18 18:30:28', '', 'gildong@naver.com', '024587915', '010-1548-1987', '', '0000-00-00 00:00:00');
INSERT INTO `t_ft_user` VALUES (4, 'dbwjd1004', '0EE9796A41CCBE88EB774461DAC94A83D34959FEFA3BB4603C88B53FCAD0B1FE', '최유정', 'Y', NULL, '2020-03-18 18:32:09', NULL, '0000-00-00 00:00:00', '', 'dbwjd1004@gmail.com', '024517789', '010-4781-3571', NULL, '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for t_ids
-- ----------------------------
DROP TABLE IF EXISTS `t_ids`;
CREATE TABLE `t_ids`  (
  `TABLE_NAME` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '테이블명',
  `NEXT_ID` int(11) NOT NULL DEFAULT 0 COMMENT '순번',
  PRIMARY KEY (`TABLE_NAME`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'idgen' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_ids
-- ----------------------------
INSERT INTO `t_ids` VALUES ('CNTNT', 130);
INSERT INTO `t_ids` VALUES ('FILE', 4133);
INSERT INTO `t_ids` VALUES ('TYPE', 381);

-- ----------------------------
-- Table structure for t_inteexample
-- ----------------------------
DROP TABLE IF EXISTS `t_inteexample`;
CREATE TABLE `t_inteexample`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `ATCH_FILE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일 아이디',
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_inteexample
-- ----------------------------
INSERT INTO `t_inteexample` VALUES (1, '인테1', '&lt;p&gt;인테1&amp;nbsp;&lt;/p&gt;', '2021-04-07 16:01:27', '5', NULL, NULL, 'Y', 'FILE0000000000004094');
INSERT INTO `t_inteexample` VALUES (2, '인테2.', '&lt;p&gt;인테2 .&lt;/p&gt;&lt;p&gt;.&lt;/p&gt;', '2021-04-07 16:01:37', '5', '2021-04-07 16:01:43', NULL, 'Y', 'FILE0000000000004095');
INSERT INTO `t_inteexample` VALUES (3, '3', '&lt;p&gt;3&lt;/p&gt;', '2021-04-07 16:01:52', '5', NULL, NULL, 'N', 'FILE0000000000004096');
INSERT INTO `t_inteexample` VALUES (4, '3홓', '3ㅀ', '2021-04-07 16:07:28', '6', '2021-04-07 16:07:48', NULL, 'Y', 'FILE0000000000004100');
INSERT INTO `t_inteexample` VALUES (5, '4', '4', '2021-04-07 16:07:57', '6', NULL, NULL, 'N', 'FILE0000000000004101');
INSERT INTO `t_inteexample` VALUES (6, '4.', '4.', '2021-04-07 17:33:10', '6', '2021-04-07 17:33:21', NULL, 'N', 'FILE0000000000004105');
INSERT INTO `t_inteexample` VALUES (7, '1.', '1.', '2021-04-08 10:53:08', '6', '2021-04-08 10:53:16', NULL, 'N', 'FILE0000000000004113');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log`  (
  `LOG_SEQ` int(11) NOT NULL COMMENT '일련번호',
  `CLIENT_IP` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '아이피',
  `RGST_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `LOG_DIVN` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '로그구분',
  `IP_ERR_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT 'ip오류 여부',
  PRIMARY KEY (`LOG_SEQ`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '로그관리' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES (1, '0:0:0:0:0:0:0:1', '1', '2020-08-03 15:20:59', 'ma', 'N');
INSERT INTO `t_log` VALUES (2, '0:0:0:0:0:0:0:1', '1', '2020-08-03 15:22:55', 'ma', 'N');
INSERT INTO `t_log` VALUES (3, '0:0:0:0:0:0:0:1', '1', '2020-08-03 15:24:17', 'ma', 'N');
INSERT INTO `t_log` VALUES (4, '0:0:0:0:0:0:0:1', '1', '2020-08-03 15:30:47', 'ma', 'N');
INSERT INTO `t_log` VALUES (5, '0:0:0:0:0:0:0:1', '1', '2020-08-03 15:38:10', 'ma', 'N');

-- ----------------------------
-- Table structure for t_login_fail
-- ----------------------------
DROP TABLE IF EXISTS `t_login_fail`;
CREATE TABLE `t_login_fail`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `USERKIND` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `IP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_login_fail
-- ----------------------------
INSERT INTO `t_login_fail` VALUES (1, 'admin', 'admin', '2021-04-21 16:06:56', NULL, NULL, 'Y', 't:0:0:0:0:0:0:1');
INSERT INTO `t_login_fail` VALUES (2, 'admin', 'admin', '2021-04-21 16:07:51', NULL, NULL, 'Y', 't:0:0:0:0:0:0:1');
INSERT INTO `t_login_fail` VALUES (3, 'admin', 'admin', '2021-04-21 16:07:53', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1');
INSERT INTO `t_login_fail` VALUES (4, 'admin', 'admintt', '2021-04-21 16:07:58', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1');
INSERT INTO `t_login_fail` VALUES (5, 'admin', 'admintt', '2021-04-21 16:08:00', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1');
INSERT INTO `t_login_fail` VALUES (6, 'admin', 'admintt', '2021-04-21 16:08:03', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for t_logmanage
-- ----------------------------
DROP TABLE IF EXISTS `t_logmanage`;
CREATE TABLE `t_logmanage`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `USERKIND` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `ID` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `IP` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `URL` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2492 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_logmanage
-- ----------------------------
INSERT INTO `t_logmanage` VALUES (1, 'admin', 'admin', '2021-04-21 13:35:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2, 'admin', 'admin', '2021-04-21 13:35:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (3, 'admin', 'admin', '2021-04-21 13:35:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (4, 'admin', 'admin', '2021-04-21 13:35:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (5, 'admin', 'admin', '2021-04-21 13:35:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (6, 'admin', 'admin', '2021-04-21 13:35:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (7, 'admin', 'admin', '2021-04-21 13:35:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (8, 'admin', 'admin', '2021-04-21 13:35:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (9, 'admin', 'admin', '2021-04-21 13:35:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (10, 'admin', 'admin', '2021-04-21 13:35:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (11, 'admin', 'admin', '2021-04-21 18:00:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (12, 'admin', 'admin', '2021-04-21 18:00:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (13, 'admin', 'admin', '2021-04-21 18:00:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (14, 'admin', 'admin', '2021-04-21 18:00:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (15, 'admin', 'admin', '2021-04-21 18:03:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (16, 'admin', 'admin', '2021-04-21 18:03:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (17, 'admin', 'admin', '2021-04-21 18:05:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (18, 'admin', 'admin', '2021-04-21 18:05:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (19, 'admin', 'admin', '2021-04-21 18:05:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (20, 'admin', 'admin', '2021-04-21 18:05:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (21, 'admin', 'admin', '2021-04-21 18:05:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (22, 'admin', 'admin', '2021-04-21 18:05:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (23, 'admin', 'admin', '2021-04-21 18:05:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (24, 'admin', 'admin', '2021-04-21 18:05:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (25, 'admin', 'admin', '2021-04-21 18:10:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (26, 'admin', 'admin', '2021-04-21 18:10:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (27, 'admin', 'admin', '2021-04-21 18:10:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (28, 'admin', 'admin', '2021-04-21 18:10:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (29, 'admin', 'admin', '2021-04-21 18:10:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (30, 'admin', 'admin', '2021-04-21 18:10:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (31, 'admin', 'admin', '2021-04-21 18:10:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (32, 'admin', 'admin', '2021-04-21 18:10:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (33, 'admin', 'admin', '2021-04-21 18:10:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (34, 'admin', 'admin', '2021-04-21 18:10:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (35, 'admin', 'admin', '2021-04-21 18:10:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (36, 'admin', 'admin', '2021-04-21 18:10:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (37, 'admin', 'admin', '2021-04-21 18:10:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (38, 'admin', 'admin', '2021-04-21 18:10:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (39, 'admin', 'admin', '2021-04-21 18:10:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (40, 'admin', 'admin', '2021-04-21 18:10:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (41, 'admin', 'admin', '2021-04-21 18:10:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (42, 'admin', 'admin', '2021-04-21 18:10:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (43, 'admin', 'admin', '2021-04-21 18:10:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (44, 'admin', 'admin', '2021-04-21 18:10:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (45, 'admin', 'admin', '2021-04-21 18:10:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (46, 'admin', 'admin', '2021-04-21 18:10:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (47, 'admin', 'admin', '2021-04-21 18:10:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (48, 'admin', 'admin', '2021-04-21 18:10:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (49, 'admin', 'admin', '2021-04-21 18:10:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (50, 'admin', 'admin', '2021-04-21 18:11:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (51, 'admin', 'admin', '2021-04-21 18:11:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (52, 'admin', 'admin', '2021-04-21 18:11:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (53, 'admin', 'admin', '2021-04-21 18:11:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (54, 'admin', 'admin', '2021-04-21 18:11:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (55, 'admin', 'admin', '2021-04-21 18:11:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (56, 'admin', 'admin', '2021-04-21 18:11:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (57, 'admin', 'admin', '2021-04-21 18:11:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (58, 'admin', 'admin', '2021-04-21 18:11:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (59, 'admin', 'admin', '2021-04-21 18:11:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (60, 'admin', 'admin', '2021-04-22 08:52:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (61, 'admin', 'admin', '2021-04-22 08:52:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (62, 'admin', 'admin', '2021-04-22 08:52:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (63, 'admin', 'admin', '2021-04-22 08:52:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (64, 'admin', 'admin', '2021-04-22 08:54:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (65, 'admin', 'admin', '2021-04-22 08:54:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (66, 'admin', 'admin', '2021-04-22 08:56:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (67, 'admin', 'admin', '2021-04-22 08:56:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (68, 'admin', 'admin', '2021-04-22 08:57:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (69, 'admin', 'admin', '2021-04-22 08:57:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (70, 'admin', 'admin', '2021-04-22 08:57:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (71, 'admin', 'admin', '2021-04-22 08:57:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (72, 'admin', 'admin', '2021-04-22 08:57:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (73, 'admin', 'admin', '2021-04-22 08:57:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (74, 'admin', 'admin', '2021-04-22 08:57:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (75, 'admin', 'admin', '2021-04-22 08:57:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (76, 'admin', 'admin', '2021-04-22 08:57:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (77, 'admin', 'admin', '2021-04-22 08:57:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (78, 'admin', 'admin', '2021-04-22 08:57:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (79, 'admin', 'admin', '2021-04-22 08:57:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (80, 'admin', 'admin', '2021-04-22 08:57:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (81, 'admin', 'admin', '2021-04-22 08:57:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (82, 'admin', 'admin', '2021-04-22 08:57:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (83, 'admin', 'admin', '2021-04-22 09:04:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (84, 'admin', 'admin', '2021-04-22 09:05:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (85, 'admin', 'admin', '2021-04-22 09:05:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (86, 'admin', 'admin', '2021-04-22 09:05:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (87, 'admin', 'admin', '2021-04-22 09:05:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (88, 'admin', 'admin', '2021-04-22 09:05:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (89, 'admin', 'admin', '2021-04-22 09:08:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (90, 'admin', 'admin', '2021-04-22 09:08:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (91, 'admin', 'admin', '2021-04-22 09:25:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (92, 'admin', 'admin', '2021-04-22 09:25:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (93, 'admin', 'admin', '2021-04-22 09:27:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (94, 'user', 'admin', '2021-04-22 09:27:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (95, 'user', 'admin', '2021-04-22 09:27:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (96, 'user', 'admin', '2021-04-22 09:27:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (97, 'admin', 'admin', '2021-04-22 09:28:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (98, 'admin', 'admin', '2021-04-22 09:28:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (99, 'admin', 'admin', '2021-04-22 09:28:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (100, 'admin', 'admin', '2021-04-22 09:28:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (101, 'admin', 'admin', '2021-04-22 09:28:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (102, 'admin', 'admin', '2021-04-22 09:29:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (103, 'admin', 'admin', '2021-04-22 09:33:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (104, 'admin', 'admin', '2021-04-22 09:33:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (105, 'admin', 'admin', '2021-04-22 09:33:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (106, 'admin', 'admin', '2021-04-22 09:33:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (107, 'admin', 'admin', '2021-04-22 09:33:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (108, 'admin', 'admin', '2021-04-22 09:33:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (109, 'admin', 'admin', '2021-04-22 09:33:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (110, 'admin', 'admin', '2021-04-22 09:33:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (111, 'admin', 'admin', '2021-04-22 09:33:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (112, 'admin', 'admin', '2021-04-22 09:34:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (113, 'admin', 'admin', '2021-04-22 09:34:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (114, 'admin', 'admin', '2021-04-22 09:34:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (115, 'admin', 'admin', '2021-04-22 09:34:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (116, 'admin', 'admin', '2021-04-22 09:41:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (117, 'admin', 'admin', '2021-04-22 09:41:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (118, 'admin', 'admin', '2021-04-22 09:41:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (119, 'admin', 'admin', '2021-04-22 09:42:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (120, 'admin', 'admin', '2021-04-22 09:42:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (121, 'admin', 'admin', '2021-04-22 09:42:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (122, 'admin', 'admin', '2021-04-22 09:42:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (123, 'admin', 'admin', '2021-04-22 09:42:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (124, 'admin', 'admin', '2021-04-22 09:42:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (125, 'admin', 'admin', '2021-04-22 09:43:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (126, 'admin', 'admin', '2021-04-22 09:43:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (127, 'admin', 'admin', '2021-04-22 09:43:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (128, 'admin', 'admin', '2021-04-22 09:43:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (129, 'admin', 'admin', '2021-04-22 09:44:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (130, 'admin', 'admin', '2021-04-22 09:47:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (131, 'admin', 'admin', '2021-04-22 09:47:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (132, 'admin', 'admin', '2021-04-22 09:48:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (133, 'admin', 'admin', '2021-04-22 09:48:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (134, 'admin', 'admin', '2021-04-22 09:50:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (135, 'admin', 'admin', '2021-04-22 09:50:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (136, 'admin', 'admin', '2021-04-22 09:50:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (137, 'admin', 'admin', '2021-04-22 09:50:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (138, 'admin', 'admin', '2021-04-22 09:51:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (139, 'admin', 'admin', '2021-04-22 09:51:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (140, 'admin', 'admin', '2021-04-22 09:51:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (141, 'admin', 'admin', '2021-04-22 09:51:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (142, 'admin', 'admin', '2021-04-22 09:51:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (143, 'admin', 'admin', '2021-04-22 09:51:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (144, 'admin', 'admin', '2021-04-22 09:51:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (145, 'admin', 'admin', '2021-04-22 09:51:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (146, 'admin', 'admin', '2021-04-22 09:51:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (147, 'admin', 'admin', '2021-04-22 09:51:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (148, 'admin', 'admin', '2021-04-22 09:53:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (149, 'admin', 'admin', '2021-04-22 09:53:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (150, 'admin', 'admin', '2021-04-22 09:54:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (151, 'admin', 'admin', '2021-04-22 09:54:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (152, 'admin', 'admin', '2021-04-22 10:04:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (153, 'admin', 'admin', '2021-04-22 10:04:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (154, 'admin', 'admin', '2021-04-22 10:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (155, 'admin', 'admin', '2021-04-22 10:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (156, 'admin', 'admin', '2021-04-22 10:04:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (157, 'admin', 'admin', '2021-04-22 10:04:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (158, 'admin', 'admin', '2021-04-22 10:05:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (159, 'admin', 'admin', '2021-04-22 10:05:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (160, 'admin', 'admin', '2021-04-22 10:05:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (161, 'admin', 'admin', '2021-04-22 10:05:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (162, 'admin', 'admin', '2021-04-22 10:05:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (163, 'admin', 'admin', '2021-04-22 10:05:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (164, 'admin', 'admin', '2021-04-22 10:05:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (165, 'admin', 'admin', '2021-04-22 10:06:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (166, 'admin', 'admin', '2021-04-22 10:06:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (167, 'admin', 'admin', '2021-04-22 10:06:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (168, 'admin', 'admin', '2021-04-22 10:06:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (169, 'admin', 'admin', '2021-04-22 10:06:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (170, 'admin', 'admin', '2021-04-22 10:06:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (171, 'admin', 'admin', '2021-04-22 10:06:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (172, 'admin', 'admin', '2021-04-22 10:06:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (173, 'admin', 'admin', '2021-04-22 10:06:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (174, 'admin', 'admin', '2021-04-22 10:06:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (175, 'admin', 'admin', '2021-04-22 10:06:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (176, 'admin', 'admin', '2021-04-22 10:06:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (177, 'admin', 'admin', '2021-04-22 10:06:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (178, 'admin', 'admin', '2021-04-22 10:06:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (179, 'admin', 'admin', '2021-04-22 10:07:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (180, 'admin', 'admin', '2021-04-22 10:07:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (181, 'admin', 'admin', '2021-04-22 10:07:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (182, 'admin', 'admin', '2021-04-22 10:07:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (183, 'admin', 'admin', '2021-04-22 10:07:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (184, 'admin', 'admin', '2021-04-22 10:07:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (185, 'admin', 'admin', '2021-04-22 10:07:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (186, 'admin', 'admin', '2021-04-22 10:08:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (187, 'admin', 'admin', '2021-04-22 10:08:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (188, 'admin', 'admin', '2021-04-22 10:08:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (189, 'admin', 'admin', '2021-04-22 10:09:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (190, 'admin', 'admin', '2021-04-22 10:09:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (191, 'admin', 'admin', '2021-04-22 10:09:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (192, 'admin', 'admin', '2021-04-22 10:09:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (193, 'admin', 'admin', '2021-04-22 10:09:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (194, 'admin', 'admin', '2021-04-22 10:09:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (195, 'admin', 'admin', '2021-04-22 10:11:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (196, 'admin', 'admin', '2021-04-22 10:11:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (197, 'admin', 'admin', '2021-04-22 10:11:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (198, 'admin', 'admin', '2021-04-22 10:11:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (199, 'admin', 'admin', '2021-04-22 10:19:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (200, 'admin', 'admin', '2021-04-22 10:19:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (201, 'admin', 'admin', '2021-04-22 10:20:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (202, 'admin', 'admin', '2021-04-22 10:20:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (203, 'admin', 'admin', '2021-04-22 10:20:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (204, 'admin', 'admin', '2021-04-22 10:20:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (205, 'admin', 'admin', '2021-04-22 10:20:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (206, 'admin', 'admin', '2021-04-22 10:22:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (207, 'admin', 'admin', '2021-04-22 10:22:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (208, 'admin', 'admin', '2021-04-22 10:22:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (209, 'admin', 'admin', '2021-04-22 10:22:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (210, 'admin', 'admin', '2021-04-22 10:22:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (211, 'admin', 'admin', '2021-04-22 10:22:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (212, 'admin', 'admin', '2021-04-22 10:22:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (213, 'admin', 'admin', '2021-04-22 10:22:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (214, 'admin', 'admin', '2021-04-22 10:22:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (215, 'admin', 'admin', '2021-04-22 10:22:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (216, 'admin', 'admin', '2021-04-22 10:22:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (217, 'admin', 'admin', '2021-04-22 10:22:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (218, 'admin', 'admin', '2021-04-22 10:22:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (219, 'admin', 'admin', '2021-04-22 10:22:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (220, 'admin', 'admin', '2021-04-22 10:22:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (221, 'admin', 'admin', '2021-04-22 10:23:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (222, 'admin', 'admin', '2021-04-22 10:23:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (223, 'admin', 'admin', '2021-04-22 10:23:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (224, 'admin', 'admin', '2021-04-22 10:23:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (225, 'admin', 'admin', '2021-04-22 10:23:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (226, 'admin', 'admin', '2021-04-22 10:23:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (227, 'admin', 'admin', '2021-04-22 10:23:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (228, 'admin', 'admin', '2021-04-22 10:23:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (229, 'admin', 'admin', '2021-04-22 10:23:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (230, 'admin', 'admin', '2021-04-22 10:23:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (231, 'admin', 'admin', '2021-04-22 10:23:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (232, 'admin', 'admin', '2021-04-22 10:23:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (233, 'admin', 'admin', '2021-04-22 10:23:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (234, 'admin', 'admin', '2021-04-22 10:23:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (235, 'admin', 'admin', '2021-04-22 10:23:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (236, 'admin', 'admin', '2021-04-22 10:23:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (237, 'admin', 'admin', '2021-04-22 10:23:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (238, 'admin', 'admin', '2021-04-22 10:23:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (239, 'admin', 'admin', '2021-04-22 10:23:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (240, 'admin', 'admin', '2021-04-22 10:23:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (241, 'admin', 'admin', '2021-04-22 10:23:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (242, 'admin', 'admin', '2021-04-22 10:24:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (243, 'admin', 'admin', '2021-04-22 10:24:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (244, 'admin', 'admin', '2021-04-22 10:24:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (245, 'admin', 'admin', '2021-04-22 10:24:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (246, 'admin', 'admin', '2021-04-22 10:24:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (247, 'admin', 'admin', '2021-04-22 10:24:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (248, 'admin', 'admin', '2021-04-22 10:24:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (249, 'admin', 'admin', '2021-04-22 10:24:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (250, 'admin', 'admin', '2021-04-22 10:24:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (251, 'admin', 'admin', '2021-04-22 10:24:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (252, 'admin', 'admin', '2021-04-22 10:24:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (253, 'admin', 'admin', '2021-04-22 10:24:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (254, 'admin', 'admin', '2021-04-22 10:24:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (255, 'admin', 'admin', '2021-04-22 10:24:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (256, 'admin', 'admin', '2021-04-22 10:24:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (257, 'admin', 'admin', '2021-04-22 10:24:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (258, 'admin', 'admin', '2021-04-22 10:24:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (259, 'admin', 'admin', '2021-04-22 10:24:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (260, 'admin', 'admin', '2021-04-22 10:25:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (261, 'admin', 'admin', '2021-04-22 10:25:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (262, 'admin', 'admin', '2021-04-22 10:26:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (263, 'admin', 'admin', '2021-04-22 10:26:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (264, 'admin', 'admin', '2021-04-22 10:26:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (265, 'admin', 'admin', '2021-04-22 10:26:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (266, 'admin', 'admin', '2021-04-22 10:26:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (267, 'admin', 'admin', '2021-04-22 10:26:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (268, 'admin', 'admin', '2021-04-22 10:26:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (269, 'admin', 'admin', '2021-04-22 10:26:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (270, 'admin', 'admin', '2021-04-22 10:27:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (271, 'admin', 'admin', '2021-04-22 10:27:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (272, 'admin', 'admin', '2021-04-22 10:27:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (273, 'admin', 'admin', '2021-04-22 10:27:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (274, 'admin', 'admin', '2021-04-22 10:27:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (275, 'admin', 'admin', '2021-04-22 10:27:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (276, 'admin', 'admin', '2021-04-22 10:27:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (277, 'admin', 'admin', '2021-04-22 10:27:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (278, 'admin', 'admin', '2021-04-22 10:27:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (279, 'admin', 'admin', '2021-04-22 10:28:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (280, 'admin', 'admin', '2021-04-22 10:28:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (281, 'admin', 'admin', '2021-04-22 10:28:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (282, 'admin', 'admin', '2021-04-22 10:28:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (283, 'admin', 'admin', '2021-04-22 10:28:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (284, 'admin', 'admin', '2021-04-22 10:28:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (285, 'admin', 'admin', '2021-04-22 10:28:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (286, 'admin', 'admin', '2021-04-22 10:28:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (287, 'admin', 'admin', '2021-04-22 10:28:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (288, 'admin', 'admin', '2021-04-22 10:34:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (289, 'admin', 'admin', '2021-04-22 10:34:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (290, 'admin', 'admin', '2021-04-22 10:34:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (291, 'admin', 'admin', '2021-04-22 10:34:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (292, 'admin', 'admin', '2021-04-22 10:34:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (293, 'admin', 'admin', '2021-04-22 10:35:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (294, 'admin', 'admin', '2021-04-22 10:35:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (295, 'admin', 'admin', '2021-04-22 10:35:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (296, 'admin', 'admin', '2021-04-22 10:35:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (297, 'admin', 'admin', '2021-04-22 10:36:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (298, 'admin', 'admin', '2021-04-22 10:36:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (299, 'admin', 'admin', '2021-04-22 10:36:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (300, 'admin', 'admin', '2021-04-22 10:36:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (301, 'admin', 'admin', '2021-04-22 10:37:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (302, 'admin', 'admin', '2021-04-22 10:37:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (303, 'admin', 'admin', '2021-04-22 10:37:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (304, 'admin', 'admin', '2021-04-22 10:37:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (305, 'admin', 'admin', '2021-04-22 10:38:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (306, 'admin', 'admin', '2021-04-22 10:38:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (307, 'admin', 'admin', '2021-04-22 10:38:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (308, 'admin', 'admin', '2021-04-22 10:38:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (309, 'admin', 'admin', '2021-04-22 10:38:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (310, 'admin', 'admin', '2021-04-22 10:38:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (311, 'admin', 'admin', '2021-04-22 10:38:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (312, 'admin', 'admin', '2021-04-22 10:39:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (313, 'admin', 'admin', '2021-04-22 10:39:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (314, 'admin', 'admin', '2021-04-22 10:39:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (315, 'admin', 'admin', '2021-04-22 10:39:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (316, 'admin', 'admin', '2021-04-22 10:39:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (317, 'admin', 'admin', '2021-04-22 11:13:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (318, 'admin', 'admin', '2021-04-22 11:13:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (319, 'admin', 'admin', '2021-04-22 11:13:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (320, 'admin', 'admin', '2021-04-22 11:13:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (321, 'admin', 'admin', '2021-04-22 11:13:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (322, 'admin', 'admin', '2021-04-22 11:13:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (323, 'admin', 'admin', '2021-04-22 11:13:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (324, 'admin', 'admin', '2021-04-22 11:18:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (325, 'admin', 'admin', '2021-04-22 11:18:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (326, 'admin', 'admin', '2021-04-22 11:18:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (327, 'admin', 'admin', '2021-04-22 11:19:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (328, 'admin', 'admin', '2021-04-22 11:19:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (329, 'admin', 'admin', '2021-04-22 11:19:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (330, 'admin', 'admin', '2021-04-22 11:19:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (331, 'admin', 'admin', '2021-04-22 11:19:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (332, 'admin', 'admin', '2021-04-22 11:20:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (333, 'admin', 'admin', '2021-04-22 11:20:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (334, 'admin', 'admin', '2021-04-22 11:20:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (335, 'admin', 'admin', '2021-04-22 12:58:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (336, 'admin', 'admin', '2021-04-22 12:58:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (337, 'admin', 'admin', '2021-04-22 12:58:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/undefinedSearchBox.do');
INSERT INTO `t_logmanage` VALUES (338, 'admin', 'admin', '2021-04-22 12:58:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (339, 'admin', 'admin', '2021-04-22 12:58:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (340, 'admin', 'admin', '2021-04-22 12:58:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/undefinedSearchBox.do');
INSERT INTO `t_logmanage` VALUES (341, 'admin', 'admin', '2021-04-22 12:59:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (342, 'admin', 'admin', '2021-04-22 12:59:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (343, 'admin', 'admin', '2021-04-22 12:59:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/undefinedSearchBox.do');
INSERT INTO `t_logmanage` VALUES (344, 'admin', 'admin', '2021-04-22 13:00:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/1SearchBox.do');
INSERT INTO `t_logmanage` VALUES (345, 'admin', 'admin', '2021-04-22 13:00:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (346, 'admin', 'admin', '2021-04-22 13:00:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/0SearchBox.do');
INSERT INTO `t_logmanage` VALUES (347, 'admin', 'admin', '2021-04-22 13:00:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (348, 'admin', 'admin', '2021-04-22 13:01:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (349, 'admin', 'admin', '2021-04-22 13:01:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/undefinedSearchBox.do');
INSERT INTO `t_logmanage` VALUES (350, 'admin', 'admin', '2021-04-22 13:01:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (351, 'admin', 'admin', '2021-04-22 13:02:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (352, 'admin', 'admin', '2021-04-22 13:02:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (353, 'admin', 'admin', '2021-04-22 13:02:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (354, 'admin', 'admin', '2021-04-22 13:02:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (355, 'admin', 'admin', '2021-04-22 13:02:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (356, 'admin', 'admin', '2021-04-22 13:02:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (357, 'admin', 'admin', '2021-04-22 13:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (358, 'admin', 'admin', '2021-04-22 13:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (359, 'admin', 'admin', '2021-04-22 13:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (360, 'admin', 'admin', '2021-04-22 13:06:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (361, 'admin', 'admin', '2021-04-22 13:06:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (362, 'admin', 'admin', '2021-04-22 13:06:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (363, 'admin', 'admin', '2021-04-22 13:06:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/1SearchBox.do');
INSERT INTO `t_logmanage` VALUES (364, 'admin', 'admin', '2021-04-22 13:06:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (365, 'admin', 'admin', '2021-04-22 13:06:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/2SearchBox.do');
INSERT INTO `t_logmanage` VALUES (366, 'admin', 'admin', '2021-04-22 13:06:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (367, 'admin', 'admin', '2021-04-22 13:06:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/3SearchBox.do');
INSERT INTO `t_logmanage` VALUES (368, 'admin', 'admin', '2021-04-22 13:06:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (369, 'admin', 'admin', '2021-04-22 13:06:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/4SearchBox.do');
INSERT INTO `t_logmanage` VALUES (370, 'admin', 'admin', '2021-04-22 13:06:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (371, 'admin', 'admin', '2021-04-22 13:06:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (372, 'admin', 'admin', '2021-04-22 13:06:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (373, 'admin', 'admin', '2021-04-22 13:07:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (374, 'admin', 'admin', '2021-04-22 13:07:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (375, 'admin', 'admin', '2021-04-22 13:07:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (376, 'admin', 'admin', '2021-04-22 13:08:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (377, 'admin', 'admin', '2021-04-22 13:08:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (378, 'admin', 'admin', '2021-04-22 13:08:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (379, 'admin', 'admin', '2021-04-22 13:08:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (380, 'admin', 'admin', '2021-04-22 13:08:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (381, 'admin', 'admin', '2021-04-22 13:08:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (382, 'admin', 'admin', '2021-04-22 13:09:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/1SearchBox.do');
INSERT INTO `t_logmanage` VALUES (383, 'admin', 'admin', '2021-04-22 13:09:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (384, 'admin', 'admin', '2021-04-22 13:09:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/2SearchBox.do');
INSERT INTO `t_logmanage` VALUES (385, 'admin', 'admin', '2021-04-22 13:09:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (386, 'admin', 'admin', '2021-04-22 13:09:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/3SearchBox.do');
INSERT INTO `t_logmanage` VALUES (387, 'admin', 'admin', '2021-04-22 13:09:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (388, 'admin', 'admin', '2021-04-22 13:09:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/4SearchBox.do');
INSERT INTO `t_logmanage` VALUES (389, 'admin', 'admin', '2021-04-22 13:09:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (390, 'admin', 'admin', '2021-04-22 13:09:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (391, 'admin', 'admin', '2021-04-22 13:09:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (392, 'admin', 'admin', '2021-04-22 13:09:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/1SearchBox.do');
INSERT INTO `t_logmanage` VALUES (393, 'admin', 'admin', '2021-04-22 13:09:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (394, 'admin', 'admin', '2021-04-22 13:09:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (395, 'admin', 'admin', '2021-04-22 13:09:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (396, 'admin', 'admin', '2021-04-22 13:10:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (397, 'admin', 'admin', '2021-04-22 13:10:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (398, 'admin', 'admin', '2021-04-22 13:10:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (399, 'admin', 'admin', '2021-04-22 13:11:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/1SearchBox.do');
INSERT INTO `t_logmanage` VALUES (400, 'admin', 'admin', '2021-04-22 13:11:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (401, 'admin', 'admin', '2021-04-22 13:11:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (402, 'admin', 'admin', '2021-04-22 13:11:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (403, 'admin', 'admin', '2021-04-22 13:11:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/1SearchBox.do');
INSERT INTO `t_logmanage` VALUES (404, 'admin', 'admin', '2021-04-22 13:11:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (405, 'admin', 'admin', '2021-04-22 13:11:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (406, 'admin', 'admin', '2021-04-22 13:11:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (407, 'admin', 'admin', '2021-04-22 13:12:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (408, 'admin', 'admin', '2021-04-22 13:12:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (409, 'admin', 'admin', '2021-04-22 13:12:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/SearchBox.do');
INSERT INTO `t_logmanage` VALUES (410, 'admin', 'admin', '2021-04-22 13:15:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (411, 'admin', 'admin', '2021-04-22 13:15:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (412, 'admin', 'admin', '2021-04-22 13:15:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (413, 'admin', 'admin', '2021-04-22 13:15:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (414, 'admin', 'admin', '2021-04-22 13:15:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (415, 'admin', 'admin', '2021-04-22 13:15:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (416, 'admin', 'admin', '2021-04-22 13:15:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (417, 'admin', 'admin', '2021-04-22 13:15:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (418, 'admin', 'admin', '2021-04-22 13:16:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (419, 'admin', 'admin', '2021-04-22 13:16:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (420, 'admin', 'admin', '2021-04-22 13:16:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (421, 'admin', 'admin', '2021-04-22 13:16:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (422, 'admin', 'admin', '2021-04-22 13:16:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (423, 'admin', 'admin', '2021-04-22 13:16:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (424, 'admin', 'admin', '2021-04-22 13:16:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (425, 'admin', 'admin', '2021-04-22 13:16:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (426, 'admin', 'admin', '2021-04-22 13:16:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (427, 'admin', 'admin', '2021-04-22 13:16:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (428, 'admin', 'admin', '2021-04-22 13:17:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (429, 'admin', 'admin', '2021-04-22 13:17:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (430, 'admin', 'admin', '2021-04-22 13:17:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (431, 'admin', 'admin', '2021-04-22 13:17:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (432, 'admin', 'admin', '2021-04-22 13:17:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (433, 'admin', 'admin', '2021-04-22 13:18:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (434, 'admin', 'admin', '2021-04-22 13:18:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (435, 'admin', 'admin', '2021-04-22 13:18:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (436, 'admin', 'admin', '2021-04-22 13:18:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (437, 'admin', 'admin', '2021-04-22 13:18:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (438, 'admin', 'admin', '2021-04-22 13:18:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (439, 'admin', 'admin', '2021-04-22 13:18:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (440, 'admin', 'admin', '2021-04-22 13:18:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (441, 'admin', 'admin', '2021-04-22 13:18:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (442, 'admin', 'admin', '2021-04-22 13:18:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (443, 'admin', 'admin', '2021-04-22 13:18:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (444, 'admin', 'admin', '2021-04-22 13:24:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (445, 'admin', 'admin', '2021-04-22 13:24:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (446, 'admin', 'admin', '2021-04-22 13:24:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (447, 'admin', 'admin', '2021-04-22 13:25:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (448, 'admin', 'admin', '2021-04-22 13:25:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (449, 'admin', 'admin', '2021-04-22 13:25:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (450, 'admin', 'admin', '2021-04-22 13:25:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (451, 'admin', 'admin', '2021-04-22 13:25:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (452, 'admin', 'admin', '2021-04-22 13:25:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (453, 'admin', 'admin', '2021-04-22 13:26:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (454, 'admin', 'admin', '2021-04-22 13:26:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (455, 'admin', 'admin', '2021-04-22 13:26:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (456, 'admin', 'admin', '2021-04-22 13:26:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (457, 'admin', 'admin', '2021-04-22 13:27:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (458, 'admin', 'admin', '2021-04-22 13:27:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (459, 'admin', 'admin', '2021-04-22 13:27:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (460, 'admin', 'admin', '2021-04-22 13:27:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (461, 'admin', 'admin', '2021-04-22 13:27:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (462, 'admin', 'admin', '2021-04-22 13:31:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (463, 'admin', 'admin', '2021-04-22 13:31:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (464, 'admin', 'admin', '2021-04-22 13:32:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (465, 'admin', 'admin', '2021-04-22 13:32:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (466, 'admin', 'admin', '2021-04-22 13:32:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (467, 'admin', 'admin', '2021-04-22 13:32:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (468, 'admin', 'admin', '2021-04-22 13:32:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (469, 'admin', 'admin', '2021-04-22 13:32:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (470, 'admin', 'admin', '2021-04-22 13:32:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (471, 'admin', 'admin', '2021-04-22 13:32:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (472, 'admin', 'admin', '2021-04-22 13:32:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (473, 'admin', 'admin', '2021-04-22 13:32:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (474, 'admin', 'admin', '2021-04-22 13:32:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (475, 'admin', 'admin', '2021-04-22 13:32:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (476, 'admin', 'admin', '2021-04-22 13:32:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (477, 'admin', 'admin', '2021-04-22 13:32:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (478, 'admin', 'admin', '2021-04-22 13:32:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (479, 'admin', 'admin', '2021-04-22 13:32:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (480, 'admin', 'admin', '2021-04-22 13:32:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (481, 'admin', 'admin', '2021-04-22 13:32:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (482, 'admin', 'admin', '2021-04-22 13:32:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (483, 'admin', 'admin', '2021-04-22 13:32:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (484, 'admin', 'admin', '2021-04-22 13:32:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (485, 'admin', 'admin', '2021-04-22 13:32:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (486, 'admin', 'admin', '2021-04-22 13:32:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (487, 'admin', 'admin', '2021-04-22 13:32:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (488, 'admin', 'admin', '2021-04-22 13:32:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (489, 'admin', 'admin', '2021-04-22 13:32:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (490, 'admin', 'admin', '2021-04-22 13:32:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (491, 'admin', 'admin', '2021-04-22 13:35:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (492, 'admin', 'admin', '2021-04-22 13:35:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (493, 'admin', 'admin', '2021-04-22 13:35:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (494, 'admin', 'admin', '2021-04-22 13:35:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (495, 'admin', 'admin', '2021-04-22 13:35:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (496, 'admin', 'admin', '2021-04-22 13:35:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (497, 'admin', 'admin', '2021-04-22 13:35:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (498, 'admin', 'admin', '2021-04-22 13:35:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (499, 'admin', 'admin', '2021-04-22 13:35:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (500, 'admin', 'admin', '2021-04-22 13:35:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (501, 'admin', 'admin', '2021-04-22 13:35:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (502, 'admin', 'admin', '2021-04-22 13:35:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (503, 'admin', 'admin', '2021-04-22 13:35:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (504, 'admin', 'admin', '2021-04-22 13:35:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (505, 'admin', 'admin', '2021-04-22 13:37:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (506, 'admin', 'admin', '2021-04-22 13:37:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (507, 'admin', 'admin', '2021-04-22 13:37:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (508, 'admin', 'admin', '2021-04-22 13:37:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (509, 'admin', 'admin', '2021-04-22 13:38:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (510, 'admin', 'admin', '2021-04-22 13:38:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (511, 'admin', 'admin', '2021-04-22 13:38:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (512, 'admin', 'admin', '2021-04-22 13:38:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (513, 'admin', 'admin', '2021-04-22 13:38:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (514, 'admin', 'admin', '2021-04-22 13:38:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (515, 'admin', 'admin', '2021-04-22 13:39:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (516, 'admin', 'admin', '2021-04-22 13:39:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (517, 'admin', 'admin', '2021-04-22 13:39:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (518, 'admin', 'admin', '2021-04-22 13:39:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (519, 'admin', 'admin', '2021-04-22 13:39:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (520, 'admin', 'admin', '2021-04-22 13:39:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (521, 'admin', 'admin', '2021-04-22 13:39:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (522, 'admin', 'admin', '2021-04-22 13:44:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (523, 'admin', 'admin', '2021-04-22 13:44:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (524, 'admin', 'admin', '2021-04-22 13:44:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (525, 'admin', 'admin', '2021-04-22 13:44:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (526, 'admin', 'admin', '2021-04-22 13:44:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (527, 'admin', 'admin', '2021-04-22 13:44:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (528, 'admin', 'admin', '2021-04-22 13:44:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (529, 'admin', 'admin', '2021-04-22 13:44:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (530, 'admin', 'admin', '2021-04-22 13:44:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (531, 'admin', 'admin', '2021-04-22 13:44:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (532, 'admin', 'admin', '2021-04-22 13:44:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (533, 'admin', 'admin', '2021-04-22 13:44:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (534, 'admin', 'admin', '2021-04-22 13:44:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (535, 'admin', 'admin', '2021-04-22 13:44:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (536, 'admin', 'admin', '2021-04-22 13:44:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (537, 'admin', 'admin', '2021-04-22 13:44:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (538, 'admin', 'admin', '2021-04-22 13:45:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (539, 'admin', 'admin', '2021-04-22 13:45:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (540, 'admin', 'admin', '2021-04-22 13:45:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (541, 'admin', 'admin', '2021-04-22 13:45:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (542, 'admin', 'admin', '2021-04-22 13:45:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (543, 'admin', 'admin', '2021-04-22 13:45:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (544, 'admin', 'admin', '2021-04-22 13:45:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (545, 'admin', 'admin', '2021-04-22 13:45:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (546, 'admin', 'admin', '2021-04-22 13:45:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (547, 'admin', 'admin', '2021-04-22 13:45:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (548, 'admin', 'admin', '2021-04-22 13:45:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (549, 'admin', 'admin', '2021-04-22 13:45:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (550, 'admin', 'admin', '2021-04-22 13:45:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (551, 'admin', 'admin', '2021-04-22 13:45:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (552, 'admin', 'admin', '2021-04-22 13:47:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (553, 'admin', 'admin', '2021-04-22 13:47:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (554, 'admin', 'admin', '2021-04-22 13:47:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (555, 'admin', 'admin', '2021-04-22 13:50:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (556, 'admin', 'admin', '2021-04-22 13:50:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (557, 'admin', 'admin', '2021-04-22 13:50:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (558, 'admin', 'admin', '2021-04-22 13:50:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (559, 'admin', 'admin', '2021-04-22 13:50:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (560, 'admin', 'admin', '2021-04-22 13:50:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (561, 'admin', 'admin', '2021-04-22 13:50:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (562, 'admin', 'admin', '2021-04-22 13:50:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (563, 'admin', 'admin', '2021-04-22 13:50:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (564, 'admin', 'admin', '2021-04-22 13:50:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (565, 'admin', 'admin', '2021-04-22 13:50:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (566, 'admin', 'admin', '2021-04-22 13:50:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (567, 'admin', 'admin', '2021-04-22 13:50:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (568, 'admin', 'admin', '2021-04-22 13:51:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (569, 'admin', 'admin', '2021-04-22 13:51:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (570, 'admin', 'admin', '2021-04-22 13:51:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (571, 'admin', 'admin', '2021-04-22 13:52:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (572, 'admin', 'admin', '2021-04-22 13:52:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (573, 'admin', 'admin', '2021-04-22 13:52:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (574, 'admin', 'admin', '2021-04-22 13:52:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (575, 'admin', 'admin', '2021-04-22 13:52:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (576, 'admin', 'admin', '2021-04-22 13:52:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (577, 'admin', 'admin', '2021-04-22 13:52:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (578, 'admin', 'admin', '2021-04-22 13:52:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (579, 'admin', 'admin', '2021-04-22 13:52:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (580, 'admin', 'admin', '2021-04-22 13:52:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (581, 'admin', 'admin', '2021-04-22 13:52:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (582, 'admin', 'admin', '2021-04-22 13:53:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (583, 'admin', 'admin', '2021-04-22 13:53:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (584, 'admin', 'admin', '2021-04-22 13:53:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (585, 'admin', 'admin', '2021-04-22 13:53:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (586, 'admin', 'admin', '2021-04-22 13:53:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (587, 'admin', 'admin', '2021-04-22 13:54:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (588, 'admin', 'admin', '2021-04-22 13:54:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (589, 'admin', 'admin', '2021-04-22 13:54:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (590, 'admin', 'admin', '2021-04-22 13:54:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (591, 'admin', 'admin', '2021-04-22 13:54:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (592, 'admin', 'admin', '2021-04-22 13:54:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (593, 'admin', 'admin', '2021-04-22 13:54:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (594, 'admin', 'admin', '2021-04-22 13:54:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (595, 'admin', 'admin', '2021-04-22 13:54:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (596, 'admin', 'admin', '2021-04-22 13:54:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (597, 'admin', 'admin', '2021-04-22 13:55:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (598, 'admin', 'admin', '2021-04-22 13:55:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (599, 'admin', 'admin', '2021-04-22 13:55:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (600, 'admin', 'admin', '2021-04-22 13:56:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (601, 'admin', 'admin', '2021-04-22 13:56:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (602, 'admin', 'admin', '2021-04-22 13:57:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (603, 'admin', 'admin', '2021-04-22 13:57:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (604, 'admin', 'admin', '2021-04-22 13:57:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (605, 'admin', 'admin', '2021-04-22 13:58:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (606, 'admin', 'admin', '2021-04-22 13:58:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (607, 'admin', 'admin', '2021-04-22 13:58:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (608, 'admin', 'admin', '2021-04-22 13:59:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (609, 'admin', 'admin', '2021-04-22 13:59:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (610, 'admin', 'admin', '2021-04-22 13:59:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (611, 'admin', 'admin', '2021-04-22 13:59:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (612, 'admin', 'admin', '2021-04-22 13:59:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (613, 'admin', 'admin', '2021-04-22 13:59:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (614, 'admin', 'admin', '2021-04-22 14:00:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (615, 'admin', 'admin', '2021-04-22 14:00:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (616, 'admin', 'admin', '2021-04-22 14:02:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (617, 'admin', 'admin', '2021-04-22 14:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (618, 'admin', 'admin', '2021-04-22 14:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (619, 'admin', 'admin', '2021-04-22 14:05:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (620, 'admin', 'admin', '2021-04-22 14:05:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (621, 'admin', 'admin', '2021-04-22 14:05:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (622, 'admin', 'admin', '2021-04-22 14:06:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttempalist.do');
INSERT INTO `t_logmanage` VALUES (623, 'admin', 'admin', '2021-04-22 14:06:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (624, 'admin', 'admin', '2021-04-22 14:06:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (625, 'admin', 'admin', '2021-04-22 14:06:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (626, 'admin', 'admin', '2021-04-22 14:06:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (627, 'admin', 'admin', '2021-04-22 14:06:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (628, 'admin', 'admin', '2021-04-22 14:06:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (629, 'admin', 'admin', '2021-04-22 14:06:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (630, 'admin', 'admin', '2021-04-22 14:06:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttempalist.do');
INSERT INTO `t_logmanage` VALUES (631, 'admin', 'admin', '2021-04-22 14:06:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (632, 'admin', 'admin', '2021-04-22 14:06:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (633, 'admin', 'admin', '2021-04-22 14:06:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (634, 'admin', 'admin', '2021-04-22 14:06:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (635, 'admin', 'admin', '2021-04-22 14:06:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (636, 'admin', 'admin', '2021-04-22 14:06:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (637, 'admin', 'admin', '2021-04-22 14:07:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (638, 'admin', 'admin', '2021-04-22 14:07:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (639, 'admin', 'admin', '2021-04-22 14:07:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (640, 'admin', 'admin', '2021-04-22 14:07:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (641, 'admin', 'admin', '2021-04-22 14:07:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (642, 'admin', 'admin', '2021-04-22 14:07:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (643, 'admin', 'admin', '2021-04-22 14:07:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (644, 'admin', 'admin', '2021-04-22 14:07:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (645, 'admin', 'admin', '2021-04-22 14:08:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (646, 'admin', 'admin', '2021-04-22 14:08:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (647, 'admin', 'admin', '2021-04-22 14:08:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (648, 'admin', 'admin', '2021-04-22 14:08:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (649, 'admin', 'admin', '2021-04-22 14:10:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (650, 'admin', 'admin', '2021-04-22 14:10:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (651, 'admin', 'admin', '2021-04-22 14:11:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (652, 'admin', 'admin', '2021-04-22 14:11:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (653, 'admin', 'admin', '2021-04-22 14:11:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (654, 'admin', 'admin', '2021-04-22 14:11:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (655, 'admin', 'admin', '2021-04-22 14:11:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (656, 'admin', 'admin', '2021-04-22 14:11:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (657, 'admin', 'admin', '2021-04-22 14:12:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttempalist.do');
INSERT INTO `t_logmanage` VALUES (658, 'admin', 'admin', '2021-04-22 14:12:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (659, 'admin', 'admin', '2021-04-22 14:14:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttempalist.do');
INSERT INTO `t_logmanage` VALUES (660, 'admin', 'admin', '2021-04-22 14:14:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (661, 'admin', 'admin', '2021-04-22 14:15:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttempalist.do');
INSERT INTO `t_logmanage` VALUES (662, 'admin', 'admin', '2021-04-22 14:15:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (663, 'admin', 'admin', '2021-04-22 14:15:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (664, 'admin', 'admin', '2021-04-22 14:15:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (665, 'admin', 'admin', '2021-04-22 14:16:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (666, 'admin', 'admin', '2021-04-22 14:16:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (667, 'admin', 'admin', '2021-04-22 14:16:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (668, 'admin', 'admin', '2021-04-22 14:16:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (669, 'admin', 'admin', '2021-04-22 14:16:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (670, 'admin', 'admin', '2021-04-22 14:16:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (671, 'admin', 'admin', '2021-04-22 14:16:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (672, 'admin', 'admin', '2021-04-22 14:16:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (673, 'admin', 'admin', '2021-04-22 14:17:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (674, 'admin', 'admin', '2021-04-22 14:21:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (675, 'admin', 'admin', '2021-04-22 14:21:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (676, 'admin', 'admin', '2021-04-22 14:21:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (677, 'admin', 'admin', '2021-04-22 14:21:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (678, 'admin', 'admin', '2021-04-22 14:21:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (679, 'admin', 'admin', '2021-04-22 14:22:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (680, 'admin', 'admin', '2021-04-22 14:22:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (681, 'admin', 'admin', '2021-04-22 14:22:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (682, 'admin', 'admin', '2021-04-22 14:22:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (683, 'admin', 'admin', '2021-04-22 14:27:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (684, 'admin', 'admin', '2021-04-22 14:27:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (685, 'admin', 'admin', '2021-04-22 14:27:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (686, 'admin', 'admin', '2021-04-22 14:28:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (687, 'admin', 'admin', '2021-04-22 14:31:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (688, 'admin', 'admin', '2021-04-22 14:31:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (689, 'admin', 'admin', '2021-04-22 14:31:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (690, 'admin', 'admin', '2021-04-22 14:31:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (691, 'admin', 'admin', '2021-04-22 14:31:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (692, 'admin', 'admin', '2021-04-22 14:31:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (693, 'admin', 'admin', '2021-04-22 14:31:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (694, 'admin', 'admin', '2021-04-22 14:31:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (695, 'admin', 'admin', '2021-04-22 14:31:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (696, 'admin', 'admin', '2021-04-22 14:32:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (697, 'admin', 'admin', '2021-04-22 14:34:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (698, 'admin', 'admin', '2021-04-22 14:34:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (699, 'admin', 'admin', '2021-04-22 14:34:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (700, 'admin', 'admin', '2021-04-22 14:37:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (701, 'admin', 'admin', '2021-04-22 14:37:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (702, 'admin', 'admin', '2021-04-22 14:37:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (703, 'admin', 'admin', '2021-04-22 14:37:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (704, 'admin', 'admin', '2021-04-22 14:37:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (705, 'admin', 'admin', '2021-04-22 14:37:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (706, 'admin', 'admin', '2021-04-22 14:37:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (707, 'admin', 'admin', '2021-04-22 14:37:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (708, 'admin', 'admin', '2021-04-22 14:38:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (709, 'admin', 'admin', '2021-04-22 14:38:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (710, 'admin', 'admin', '2021-04-22 14:38:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (711, 'admin', 'admin', '2021-04-22 14:39:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (712, 'admin', 'admin', '2021-04-22 14:39:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (713, 'admin', 'admin', '2021-04-22 14:40:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (714, 'admin', 'admin', '2021-04-22 14:40:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (715, 'admin', 'admin', '2021-04-22 14:40:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (716, 'admin', 'admin', '2021-04-22 14:40:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (717, 'admin', 'admin', '2021-04-22 14:40:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (718, 'admin', 'admin', '2021-04-22 14:41:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (719, 'admin', 'admin', '2021-04-22 14:42:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (720, 'admin', 'admin', '2021-04-22 14:42:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (721, 'admin', 'admin', '2021-04-22 14:42:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (722, 'admin', 'admin', '2021-04-22 14:42:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (723, 'admin', 'admin', '2021-04-22 14:42:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (724, 'admin', 'admin', '2021-04-22 14:45:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (725, 'admin', 'admin', '2021-04-22 14:45:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (726, 'admin', 'admin', '2021-04-22 14:45:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (727, 'admin', 'admin', '2021-04-22 14:45:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (728, 'admin', 'admin', '2021-04-22 14:45:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (729, 'admin', 'admin', '2021-04-22 14:48:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (730, 'admin', 'admin', '2021-04-22 14:48:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (731, 'admin', 'admin', '2021-04-22 14:52:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (732, 'admin', 'admin', '2021-04-22 14:52:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (733, 'admin', 'admin', '2021-04-22 14:52:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (734, 'admin', 'admin', '2021-04-22 14:52:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (735, 'admin', 'admin', '2021-04-22 14:53:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (736, 'admin', 'admin', '2021-04-22 14:53:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (737, 'admin', 'admin', '2021-04-22 14:53:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (738, 'admin', 'admin', '2021-04-22 14:53:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (739, 'admin', 'admin', '2021-04-22 14:53:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (740, 'admin', 'admin', '2021-04-22 14:53:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (741, 'admin', 'admin', '2021-04-22 14:53:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (742, 'admin', 'admin', '2021-04-22 14:54:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (743, 'admin', 'admin', '2021-04-22 14:54:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (744, 'admin', 'admin', '2021-04-22 14:56:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (745, 'admin', 'admin', '2021-04-22 14:56:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (746, 'admin', 'admin', '2021-04-22 14:56:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (747, 'admin', 'admin', '2021-04-22 14:58:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (748, 'admin', 'admin', '2021-04-22 14:58:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (749, 'admin', 'admin', '2021-04-22 14:58:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (750, 'admin', 'admin', '2021-04-22 14:59:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (751, 'admin', 'admin', '2021-04-22 14:59:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (752, 'admin', 'admin', '2021-04-22 14:59:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (753, 'admin', 'admin', '2021-04-22 14:59:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (754, 'admin', 'admin', '2021-04-22 14:59:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (755, 'admin', 'admin', '2021-04-22 14:59:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (756, 'admin', 'admin', '2021-04-22 15:02:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (757, 'admin', 'admin', '2021-04-22 15:02:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (758, 'admin', 'admin', '2021-04-22 15:02:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (759, 'admin', 'admin', '2021-04-22 15:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (760, 'admin', 'admin', '2021-04-22 15:07:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (761, 'admin', 'admin', '2021-04-22 15:07:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (762, 'admin', 'admin', '2021-04-22 15:08:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (763, 'admin', 'admin', '2021-04-22 15:08:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (764, 'admin', 'admin', '2021-04-22 15:09:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (765, 'admin', 'admin', '2021-04-22 15:09:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (766, 'admin', 'admin', '2021-04-22 15:10:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (767, 'admin', 'admin', '2021-04-22 15:10:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (768, 'admin', 'admin', '2021-04-22 15:10:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (769, 'admin', 'admin', '2021-04-22 15:10:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (770, 'admin', 'admin', '2021-04-22 15:17:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (771, 'admin', 'admin', '2021-04-22 15:17:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (772, 'admin', 'admin', '2021-04-22 15:17:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (773, 'admin', 'admin', '2021-04-22 15:17:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (774, 'admin', 'admin', '2021-04-22 15:18:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/list.do');
INSERT INTO `t_logmanage` VALUES (775, 'admin', 'admin', '2021-04-22 15:18:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/addList.do');
INSERT INTO `t_logmanage` VALUES (776, 'admin', 'admin', '2021-04-22 15:18:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (777, 'admin', 'admin', '2021-04-22 15:18:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (778, 'admin', 'admin', '2021-04-22 15:18:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (779, 'admin', 'admin', '2021-04-22 15:18:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (780, 'admin', 'admin', '2021-04-22 15:18:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (781, 'admin', 'admin', '2021-04-22 15:18:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (782, 'admin', 'admin', '2021-04-22 15:18:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (783, 'admin', 'admin', '2021-04-22 15:18:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (784, 'admin', 'admin', '2021-04-22 15:18:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (785, 'admin', 'admin', '2021-04-22 15:18:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (786, 'admin', 'admin', '2021-04-22 15:18:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (787, 'admin', 'admin', '2021-04-22 15:19:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (788, 'admin', 'admin', '2021-04-22 15:20:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (789, 'admin', 'admin', '2021-04-22 15:20:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/view.do');
INSERT INTO `t_logmanage` VALUES (790, 'admin', 'admin', '2021-04-22 15:20:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (791, 'admin', 'admin', '2021-04-22 15:20:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (792, 'admin', 'admin', '2021-04-22 15:20:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (793, 'admin', 'admin', '2021-04-22 15:23:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (794, 'admin', 'admin', '2021-04-22 15:23:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (795, 'admin', 'admin', '2021-04-22 15:23:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (796, 'admin', 'admin', '2021-04-22 15:23:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (797, 'admin', 'admin', '2021-04-22 15:23:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (798, 'admin', 'admin', '2021-04-22 15:26:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (799, 'admin', 'admin', '2021-04-22 15:26:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (800, 'admin', 'admin', '2021-04-22 15:26:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (801, 'admin', 'admin', '2021-04-22 15:26:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (802, 'admin', 'admin', '2021-04-22 15:26:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (803, 'admin', 'admin', '2021-04-22 15:26:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (804, 'admin', 'admin', '2021-04-22 15:26:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (805, 'admin', 'admin', '2021-04-22 15:26:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (806, 'admin', 'admin', '2021-04-22 15:26:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (807, 'admin', 'admin', '2021-04-22 15:26:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (808, 'admin', 'admin', '2021-04-22 15:26:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (809, 'admin', 'admin', '2021-04-22 15:26:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (810, 'admin', 'admin', '2021-04-22 15:27:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (811, 'admin', 'admin', '2021-04-22 15:27:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (812, 'admin', 'admin', '2021-04-22 15:27:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (813, 'admin', 'admin', '2021-04-22 15:27:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (814, 'admin', 'admin', '2021-04-22 15:27:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (815, 'admin', 'admin', '2021-04-22 15:27:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (816, 'admin', 'admin', '2021-04-22 15:28:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (817, 'admin', 'admin', '2021-04-22 15:28:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (818, 'admin', 'admin', '2021-04-22 15:28:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (819, 'admin', 'admin', '2021-04-22 15:28:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (820, 'admin', 'admin', '2021-04-22 15:28:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (821, 'admin', 'admin', '2021-04-22 15:28:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (822, 'admin', 'admin', '2021-04-22 15:28:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (823, 'admin', 'admin', '2021-04-22 15:28:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (824, 'admin', 'admin', '2021-04-22 15:28:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (825, 'admin', 'admin', '2021-04-22 15:28:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (826, 'admin', 'admin', '2021-04-22 15:29:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (827, 'admin', 'admin', '2021-04-22 15:29:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (828, 'admin', 'admin', '2021-04-22 15:29:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (829, 'admin', 'admin', '2021-04-22 15:29:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (830, 'admin', 'admin', '2021-04-22 15:29:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (831, 'admin', 'admin', '2021-04-22 15:33:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (832, 'admin', 'admin', '2021-04-22 15:33:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (833, 'admin', 'admin', '2021-04-22 15:33:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (834, 'admin', 'admin', '2021-04-22 15:35:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (835, 'admin', 'admin', '2021-04-22 15:35:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (836, 'admin', 'admin', '2021-04-22 15:36:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (837, 'admin', 'admin', '2021-04-22 15:36:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (838, 'admin', 'admin', '2021-04-22 15:36:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/list.do');
INSERT INTO `t_logmanage` VALUES (839, 'admin', 'admin', '2021-04-22 15:36:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/addList.do');
INSERT INTO `t_logmanage` VALUES (840, 'admin', 'admin', '2021-04-22 15:36:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/insertForm.do');
INSERT INTO `t_logmanage` VALUES (841, 'admin', 'admin', '2021-04-22 15:38:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/list.do');
INSERT INTO `t_logmanage` VALUES (842, 'admin', 'admin', '2021-04-22 15:38:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/addList.do');
INSERT INTO `t_logmanage` VALUES (843, 'admin', 'admin', '2021-04-22 15:38:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (844, 'admin', 'admin', '2021-04-22 15:38:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (845, 'admin', 'admin', '2021-04-22 15:39:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/menuCodeOverlap.do');
INSERT INTO `t_logmanage` VALUES (846, 'admin', 'admin', '2021-04-22 15:40:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/menuCodeOverlap.do');
INSERT INTO `t_logmanage` VALUES (847, 'admin', 'admin', '2021-04-22 15:40:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/insertProc.do');
INSERT INTO `t_logmanage` VALUES (848, 'admin', 'admin', '2021-04-22 15:40:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/list.do');
INSERT INTO `t_logmanage` VALUES (849, 'admin', 'admin', '2021-04-22 15:40:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/addList.do');
INSERT INTO `t_logmanage` VALUES (850, 'admin', 'admin', '2021-04-22 15:40:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/us/mm/list.do');
INSERT INTO `t_logmanage` VALUES (851, 'admin', 'admin', '2021-04-22 15:40:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/us/mm/addList.do');
INSERT INTO `t_logmanage` VALUES (852, 'admin', 'admin', '2021-04-22 15:40:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/us/au/list.do');
INSERT INTO `t_logmanage` VALUES (853, 'admin', 'admin', '2021-04-22 15:40:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/us/au/updateForm.do');
INSERT INTO `t_logmanage` VALUES (854, 'admin', 'admin', '2021-04-22 15:41:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/us/au/updateProc.do');
INSERT INTO `t_logmanage` VALUES (855, 'admin', 'admin', '2021-04-22 15:41:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/us/au/updateForm.do');
INSERT INTO `t_logmanage` VALUES (856, 'admin', 'admin', '2021-04-22 15:41:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/list.do');
INSERT INTO `t_logmanage` VALUES (857, 'admin', 'admin', '2021-04-22 15:41:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/addList.do');
INSERT INTO `t_logmanage` VALUES (858, 'admin', 'admin', '2021-04-22 15:41:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (859, 'admin', 'admin', '2021-04-22 15:41:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (860, 'admin', 'admin', '2021-04-22 15:41:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/list.do');
INSERT INTO `t_logmanage` VALUES (861, 'admin', 'admin', '2021-04-22 15:41:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/addList.do');
INSERT INTO `t_logmanage` VALUES (862, 'admin', 'admin', '2021-04-22 15:42:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/list.do');
INSERT INTO `t_logmanage` VALUES (863, 'admin', 'admin', '2021-04-22 15:42:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/addList.do');
INSERT INTO `t_logmanage` VALUES (864, 'admin', 'admin', '2021-04-22 16:11:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/list.do');
INSERT INTO `t_logmanage` VALUES (865, 'admin', 'admin', '2021-04-22 16:11:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mn/addList.do');
INSERT INTO `t_logmanage` VALUES (866, 'user', NULL, '2021-04-22 16:11:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ft/main.do');
INSERT INTO `t_logmanage` VALUES (867, 'user', NULL, '2021-04-22 16:11:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ft/ftportfo/ftbexamp/list.do');
INSERT INTO `t_logmanage` VALUES (868, 'user', NULL, '2021-04-22 16:11:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ft/ftportfo/ftbexamp/addList.do');
INSERT INTO `t_logmanage` VALUES (869, 'user', NULL, '2021-04-22 16:13:07', '', NULL, NULL, 'Y', '192.168.0.34', '/ft/main.do');
INSERT INTO `t_logmanage` VALUES (870, 'user', NULL, '2021-04-22 16:13:21', '', NULL, NULL, 'Y', '192.168.0.34', '/ft/ftbguide/ftpros/list.do');
INSERT INTO `t_logmanage` VALUES (871, 'admin', 'admin', '2021-04-22 16:24:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (872, 'admin', 'admin', '2021-04-22 16:24:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (873, 'admin', 'admin', '2021-04-22 16:35:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (874, 'admin', 'admin', '2021-04-22 16:36:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (875, 'admin', 'admin', '2021-04-22 16:38:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (876, 'admin', 'admin', '2021-04-22 16:38:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (877, 'admin', 'admin', '2021-04-22 16:39:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (878, 'admin', 'admin', '2021-04-22 16:43:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (879, 'admin', 'admin', '2021-04-22 16:43:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (880, 'admin', 'admin', '2021-04-22 16:43:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (881, 'admin', 'admin', '2021-04-22 16:45:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (882, 'admin', 'admin', '2021-04-22 16:45:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (883, 'admin', 'admin', '2021-04-22 16:46:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (884, 'admin', 'admin', '2021-04-22 16:47:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (885, 'admin', 'admin', '2021-04-22 16:47:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (886, 'admin', 'admin', '2021-04-22 16:48:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (887, 'admin', 'admin', '2021-04-22 16:49:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateProc.do');
INSERT INTO `t_logmanage` VALUES (888, 'admin', 'admin', '2021-04-22 16:49:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (889, 'admin', 'admin', '2021-04-22 16:49:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (890, 'admin', 'admin', '2021-04-22 16:49:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (891, 'admin', 'admin', '2021-04-22 16:50:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (892, 'admin', 'admin', '2021-04-22 16:50:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (893, 'admin', 'admin', '2021-04-22 16:51:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateProc.do');
INSERT INTO `t_logmanage` VALUES (894, 'admin', 'admin', '2021-04-22 16:52:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (895, 'admin', 'admin', '2021-04-22 16:52:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (896, 'admin', 'admin', '2021-04-22 16:53:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (897, 'admin', 'admin', '2021-04-22 16:53:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (898, 'admin', 'admin', '2021-04-22 16:53:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (899, 'admin', 'admin', '2021-04-22 16:53:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (900, 'admin', 'admin', '2021-04-22 16:55:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (901, 'admin', 'admin', '2021-04-22 16:55:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (902, 'admin', 'admin', '2021-04-22 16:55:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (903, 'admin', 'admin', '2021-04-22 16:55:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (904, 'admin', 'admin', '2021-04-22 16:55:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (905, 'admin', 'admin', '2021-04-22 16:55:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateProc.do');
INSERT INTO `t_logmanage` VALUES (906, 'admin', 'admin', '2021-04-22 16:55:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (907, 'admin', 'admin', '2021-04-22 16:57:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (908, 'admin', 'admin', '2021-04-22 16:57:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateProc.do');
INSERT INTO `t_logmanage` VALUES (909, 'admin', 'admin', '2021-04-22 16:57:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (910, 'admin', 'admin', '2021-04-22 16:57:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (911, 'admin', 'admin', '2021-04-22 16:57:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (912, 'admin', 'admin', '2021-04-22 16:57:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (913, 'admin', 'admin', '2021-04-22 16:57:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (914, 'admin', 'admin', '2021-04-22 16:57:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (915, 'admin', 'admin', '2021-04-22 16:57:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertProc.do');
INSERT INTO `t_logmanage` VALUES (916, 'admin', 'admin', '2021-04-22 16:57:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (917, 'admin', 'admin', '2021-04-22 16:57:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (918, 'admin', 'admin', '2021-04-22 16:57:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (919, 'admin', 'admin', '2021-04-22 16:59:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (920, 'admin', 'admin', '2021-04-22 16:59:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (921, 'admin', 'admin', '2021-04-22 16:59:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (922, 'admin', 'admin', '2021-04-22 16:59:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (923, 'admin', 'admin', '2021-04-22 16:59:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateProc.do');
INSERT INTO `t_logmanage` VALUES (924, 'admin', 'admin', '2021-04-22 16:59:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (925, 'admin', 'admin', '2021-04-22 17:00:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (926, 'admin', 'admin', '2021-04-22 17:00:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (927, 'admin', 'admin', '2021-04-22 17:00:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (928, 'admin', 'admin', '2021-04-22 17:00:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (929, 'admin', 'admin', '2021-04-22 17:00:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (930, 'admin', 'admin', '2021-04-22 17:00:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (931, 'admin', 'admin', '2021-04-22 17:00:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateProc.do');
INSERT INTO `t_logmanage` VALUES (932, 'admin', 'admin', '2021-04-22 17:00:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (933, 'admin', 'admin', '2021-04-22 17:02:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (934, 'admin', 'admin', '2021-04-22 17:02:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (935, 'admin', 'admin', '2021-04-22 17:02:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateProc.do');
INSERT INTO `t_logmanage` VALUES (936, 'admin', 'admin', '2021-04-22 17:03:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (937, 'admin', 'admin', '2021-04-22 17:03:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (938, 'admin', 'admin', '2021-04-22 17:04:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (939, 'admin', 'admin', '2021-04-22 17:04:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (940, 'admin', 'admin', '2021-04-22 17:04:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (941, 'admin', 'admin', '2021-04-22 17:04:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (942, 'admin', 'admin', '2021-04-22 17:04:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (943, 'admin', 'admin', '2021-04-22 17:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertProc.do');
INSERT INTO `t_logmanage` VALUES (944, 'admin', 'admin', '2021-04-22 17:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (945, 'admin', 'admin', '2021-04-22 17:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (946, 'admin', 'admin', '2021-04-22 17:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/view.do');
INSERT INTO `t_logmanage` VALUES (947, 'admin', 'admin', '2021-04-22 17:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (948, 'admin', 'admin', '2021-04-22 17:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (949, 'admin', 'admin', '2021-04-22 17:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (950, 'admin', 'admin', '2021-04-22 17:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertProc.do');
INSERT INTO `t_logmanage` VALUES (951, 'admin', 'admin', '2021-04-22 17:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (952, 'admin', 'admin', '2021-04-22 17:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (953, 'admin', 'admin', '2021-04-22 17:06:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (954, 'admin', 'admin', '2021-04-22 17:06:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (955, 'admin', 'admin', '2021-04-22 17:06:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (956, 'admin', 'admin', '2021-04-22 17:06:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertProc.do');
INSERT INTO `t_logmanage` VALUES (957, 'admin', 'admin', '2021-04-22 17:06:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (958, 'admin', 'admin', '2021-04-22 17:06:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (959, 'admin', 'admin', '2021-04-22 17:06:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (960, 'admin', 'admin', '2021-04-22 17:06:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertProc.do');
INSERT INTO `t_logmanage` VALUES (961, 'admin', 'admin', '2021-04-22 17:06:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (962, 'admin', 'admin', '2021-04-22 17:06:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (963, 'admin', 'admin', '2021-04-22 17:06:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (964, 'admin', 'admin', '2021-04-22 17:07:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertProc.do');
INSERT INTO `t_logmanage` VALUES (965, 'admin', 'admin', '2021-04-22 17:07:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (966, 'admin', 'admin', '2021-04-22 17:07:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (967, 'admin', 'admin', '2021-04-22 17:08:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (968, 'admin', 'admin', '2021-04-22 17:08:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (969, 'admin', 'admin', '2021-04-22 17:14:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (970, 'admin', 'admin', '2021-04-22 17:14:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (971, 'admin', 'admin', '2021-04-22 17:15:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (972, 'admin', 'admin', '2021-04-22 17:15:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (973, 'admin', 'admin', '2021-04-22 17:16:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (974, 'admin', 'admin', '2021-04-22 17:16:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (975, 'admin', 'admin', '2021-04-22 17:19:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (976, 'admin', 'admin', '2021-04-22 17:19:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (977, 'admin', 'admin', '2021-04-22 17:20:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (978, 'admin', 'admin', '2021-04-22 17:20:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (979, 'admin', 'admin', '2021-04-22 17:20:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (980, 'admin', 'admin', '2021-04-22 17:20:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (981, 'admin', 'admin', '2021-04-22 17:20:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (982, 'admin', 'admin', '2021-04-22 17:21:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (983, 'admin', 'admin', '2021-04-22 17:21:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (984, 'admin', 'admin', '2021-04-22 17:21:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (985, 'admin', 'admin', '2021-04-22 17:26:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (986, 'admin', 'admin', '2021-04-22 17:26:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (987, 'admin', 'admin', '2021-04-22 17:26:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (988, 'admin', 'admin', '2021-04-22 17:26:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (989, 'admin', 'admin', '2021-04-22 17:29:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (990, 'admin', 'admin', '2021-04-22 17:29:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (991, 'admin', 'admin', '2021-04-22 17:29:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (992, 'admin', 'admin', '2021-04-22 17:30:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (993, 'admin', 'admin', '2021-04-22 17:30:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (994, 'admin', 'admin', '2021-04-22 17:30:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (995, 'admin', 'admin', '2021-04-22 17:33:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (996, 'admin', 'admin', '2021-04-22 17:33:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (997, 'admin', 'admin', '2021-04-22 17:33:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (998, 'admin', 'admin', '2021-04-22 17:33:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (999, 'admin', 'admin', '2021-04-22 17:33:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1000, 'admin', 'admin', '2021-04-22 17:33:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1001, 'admin', 'admin', '2021-04-22 17:34:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (1002, 'admin', 'admin', '2021-04-22 17:34:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1003, 'admin', 'admin', '2021-04-22 17:34:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (1004, 'admin', 'admin', '2021-04-22 17:34:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1005, 'admin', 'admin', '2021-04-22 17:34:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1006, 'admin', 'admin', '2021-04-22 17:39:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (1007, 'admin', 'admin', '2021-04-22 17:39:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1008, 'admin', 'admin', '2021-04-22 17:39:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (1009, 'admin', 'admin', '2021-04-22 17:39:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1010, 'admin', 'admin', '2021-04-22 17:43:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (1011, 'admin', 'admin', '2021-04-22 17:43:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1012, 'admin', 'admin', '2021-04-22 17:44:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1013, 'admin', 'admin', '2021-04-22 17:44:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1014, 'admin', 'admin', '2021-04-22 17:44:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1015, 'admin', 'admin', '2021-04-22 17:44:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1016, 'admin', 'admin', '2021-04-22 17:44:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1017, 'admin', 'admin', '2021-04-22 17:44:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (1018, 'admin', 'admin', '2021-04-22 17:44:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1019, 'admin', 'admin', '2021-04-22 17:44:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1020, 'admin', 'admin', '2021-04-22 17:44:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1021, 'admin', 'admin', '2021-04-22 17:44:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (1022, 'admin', 'admin', '2021-04-22 17:44:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1023, 'admin', 'admin', '2021-04-22 17:46:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (1024, 'admin', 'admin', '2021-04-22 17:46:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1025, 'admin', 'admin', '2021-04-22 17:46:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (1026, 'admin', 'admin', '2021-04-22 17:46:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1027, 'admin', 'admin', '2021-04-22 17:46:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (1028, 'admin', 'admin', '2021-04-22 17:46:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1029, 'admin', 'admin', '2021-04-22 17:48:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1030, 'admin', 'admin', '2021-04-22 17:48:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1031, 'admin', 'admin', '2021-04-22 17:48:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1032, 'admin', 'admin', '2021-04-22 17:49:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1033, 'admin', 'admin', '2021-04-22 17:49:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1034, 'admin', 'admin', '2021-04-22 17:49:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1035, 'admin', 'admin', '2021-04-22 17:49:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1036, 'admin', 'admin', '2021-04-22 17:49:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1037, 'admin', 'admin', '2021-04-22 17:49:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1038, 'admin', 'admin', '2021-04-22 17:49:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1039, 'admin', 'admin', '2021-04-22 17:49:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1040, 'admin', 'admin', '2021-04-22 17:50:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1041, 'admin', 'admin', '2021-04-22 17:50:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1042, 'admin', 'admin', '2021-04-22 17:50:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1043, 'admin', 'admin', '2021-04-22 17:50:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1044, 'admin', 'admin', '2021-04-22 17:50:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1045, 'admin', 'admin', '2021-04-22 17:50:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1046, 'admin', 'admin', '2021-04-22 17:50:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1047, 'admin', 'admin', '2021-04-22 17:50:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1048, 'admin', 'admin', '2021-04-22 17:50:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1049, 'admin', 'admin', '2021-04-22 17:50:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1050, 'admin', 'admin', '2021-04-22 17:51:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1051, 'admin', 'admin', '2021-04-22 17:51:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1052, 'admin', 'admin', '2021-04-22 17:51:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1053, 'admin', 'admin', '2021-04-22 17:51:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1054, 'admin', 'admin', '2021-04-22 17:51:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1055, 'admin', 'admin', '2021-04-22 17:51:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1056, 'admin', 'admin', '2021-04-22 17:51:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1057, 'admin', 'admin', '2021-04-22 17:51:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1058, 'admin', 'admin', '2021-04-22 17:51:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (1059, 'admin', 'admin', '2021-04-22 17:51:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1060, 'admin', 'admin', '2021-04-22 17:52:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (1061, 'admin', 'admin', '2021-04-22 17:52:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1062, 'admin', 'admin', '2021-04-22 17:52:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1063, 'admin', 'admin', '2021-04-22 17:52:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1064, 'admin', 'admin', '2021-04-22 17:52:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1065, 'admin', 'admin', '2021-04-22 17:52:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1066, 'admin', 'admin', '2021-04-22 17:52:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (1067, 'admin', 'admin', '2021-04-22 17:52:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1068, 'admin', 'admin', '2021-04-22 17:52:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (1069, 'admin', 'admin', '2021-04-22 17:52:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1070, 'admin', 'admin', '2021-04-22 17:52:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (1071, 'admin', 'admin', '2021-04-22 17:52:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1072, 'admin', 'admin', '2021-04-22 17:53:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1073, 'admin', 'admin', '2021-04-22 17:53:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1074, 'admin', 'admin', '2021-04-22 17:53:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1075, 'admin', 'admin', '2021-04-22 17:53:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1076, 'admin', 'admin', '2021-04-22 17:53:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1077, 'admin', 'admin', '2021-04-22 17:53:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (1078, 'admin', 'admin', '2021-04-22 17:53:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1079, 'admin', 'admin', '2021-04-22 17:53:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1080, 'admin', 'admin', '2021-04-22 17:53:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1081, 'admin', 'admin', '2021-04-22 17:53:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1082, 'admin', 'admin', '2021-04-22 17:53:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1083, 'admin', 'admin', '2021-04-22 17:53:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (1084, 'admin', 'admin', '2021-04-22 17:53:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1085, 'admin', 'admin', '2021-04-22 17:54:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1086, 'admin', 'admin', '2021-04-22 17:54:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1087, 'admin', 'admin', '2021-04-22 17:54:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1088, 'admin', 'admin', '2021-04-22 17:54:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1089, 'admin', 'admin', '2021-04-22 17:54:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1090, 'admin', 'admin', '2021-04-22 17:54:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1091, 'admin', 'admin', '2021-04-22 18:00:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1092, 'admin', 'admin', '2021-04-22 18:00:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1093, 'admin', 'admin', '2021-04-22 18:01:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1094, 'admin', 'admin', '2021-04-22 18:01:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1095, 'admin', 'admin', '2021-04-22 18:01:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1096, 'admin', 'admin', '2021-04-22 18:01:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1097, 'admin', 'admin', '2021-04-22 18:01:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1098, 'admin', 'admin', '2021-04-22 18:01:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1099, 'admin', 'admin', '2021-04-22 18:01:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1100, 'admin', 'admin', '2021-04-22 18:01:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1101, 'admin', 'admin', '2021-04-22 18:02:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1102, 'admin', 'admin', '2021-04-22 18:02:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1103, 'admin', 'admin', '2021-04-22 18:02:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1104, 'admin', 'admin', '2021-04-22 18:02:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1105, 'admin', 'admin', '2021-04-22 18:04:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1106, 'admin', 'admin', '2021-04-22 18:04:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1107, 'admin', 'admin', '2021-04-22 18:04:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1108, 'admin', 'admin', '2021-04-22 18:04:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1109, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1110, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1111, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1112, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1113, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1114, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1115, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1116, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1117, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1118, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1119, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1120, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1121, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1122, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1123, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1124, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1125, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1126, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1127, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1128, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1129, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1130, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1131, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1132, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1133, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1134, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1135, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1136, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1137, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1138, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1139, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1140, 'admin', 'admin', '2021-04-22 18:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1141, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1142, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1143, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1144, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1145, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1146, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1147, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1148, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1149, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1150, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1151, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1152, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1153, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1154, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1155, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1156, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1157, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1158, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1159, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1160, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1161, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1162, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1163, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1164, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1165, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1166, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1167, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1168, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1169, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1170, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1171, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1172, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1173, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1174, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1175, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1176, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1177, 'admin', 'admin', '2021-04-22 18:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1178, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1179, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1180, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1181, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1182, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1183, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1184, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1185, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1186, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1187, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1188, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1189, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1190, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1191, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1192, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1193, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1194, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1195, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1196, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1197, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1198, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1199, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1200, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1201, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1202, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1203, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1204, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1205, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1206, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1207, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1208, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1209, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1210, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1211, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1212, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1213, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1214, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1215, 'admin', 'admin', '2021-04-22 18:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1216, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1217, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1218, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1219, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1220, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1221, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1222, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1223, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1224, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1225, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1226, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1227, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1228, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1229, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1230, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1231, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1232, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1233, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1234, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1235, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1236, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1237, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1238, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1239, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1240, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1241, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1242, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1243, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1244, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1245, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1246, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1247, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1248, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1249, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1250, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1251, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1252, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1253, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1254, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1255, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1256, 'admin', 'admin', '2021-04-22 18:04:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1257, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1258, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1259, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1260, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1261, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1262, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1263, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1264, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1265, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1266, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1267, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1268, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1269, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1270, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1271, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1272, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1273, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1274, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1275, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1276, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1277, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1278, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1279, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1280, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1281, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1282, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1283, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1284, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1285, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1286, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1287, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1288, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1289, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1290, 'admin', 'admin', '2021-04-22 18:04:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1291, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1292, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1293, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1294, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1295, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1296, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1297, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1298, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1299, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1300, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1301, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1302, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1303, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1304, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1305, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1306, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1307, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1308, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1309, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1310, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1311, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1312, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1313, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1314, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1315, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1316, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1317, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1318, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1319, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1320, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1321, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1322, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1323, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1324, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1325, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1326, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1327, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1328, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1329, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1330, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1331, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1332, 'admin', 'admin', '2021-04-22 18:04:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1333, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1334, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1335, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1336, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1337, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1338, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1339, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1340, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1341, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1342, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1343, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1344, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1345, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1346, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1347, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1348, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1349, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1350, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1351, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1352, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1353, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1354, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1355, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1356, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1357, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1358, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1359, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1360, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1361, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1362, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1363, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1364, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1365, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1366, 'admin', 'admin', '2021-04-22 18:04:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1367, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1368, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1369, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1370, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1371, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1372, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1373, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1374, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1375, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1376, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1377, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1378, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1379, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1380, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1381, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1382, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1383, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1384, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1385, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1386, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1387, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1388, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1389, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1390, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1391, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1392, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1393, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1394, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1395, 'admin', 'admin', '2021-04-22 18:04:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1396, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1397, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1398, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1399, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1400, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1401, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1402, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1403, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1404, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1405, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1406, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1407, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1408, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1409, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1410, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1411, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1412, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1413, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1414, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1415, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1416, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1417, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1418, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1419, 'admin', 'admin', '2021-04-22 18:04:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1420, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1421, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1422, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1423, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1424, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1425, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1426, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1427, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1428, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1429, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1430, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1431, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1432, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1433, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1434, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1435, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1436, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1437, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1438, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1439, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1440, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1441, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1442, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1443, 'admin', 'admin', '2021-04-22 18:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1444, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1445, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1446, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1447, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1448, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1449, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1450, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1451, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1452, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1453, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1454, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1455, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1456, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1457, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1458, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1459, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1460, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1461, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1462, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1463, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1464, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1465, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1466, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1467, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1468, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1469, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1470, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1471, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1472, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1473, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1474, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1475, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1476, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1477, 'admin', 'admin', '2021-04-22 18:04:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1478, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1479, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1480, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1481, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1482, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1483, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1484, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1485, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1486, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1487, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1488, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1489, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1490, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1491, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1492, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1493, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1494, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1495, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1496, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1497, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1498, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1499, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1500, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1501, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1502, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1503, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1504, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1505, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1506, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1507, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1508, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1509, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1510, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1511, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1512, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1513, 'admin', 'admin', '2021-04-22 18:04:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1514, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1515, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1516, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1517, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1518, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1519, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1520, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1521, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1522, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1523, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1524, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1525, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1526, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1527, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1528, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1529, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1530, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1531, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1532, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1533, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1534, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1535, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1536, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1537, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1538, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1539, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1540, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1541, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1542, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1543, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1544, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1545, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1546, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1547, 'admin', 'admin', '2021-04-22 18:04:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1548, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1549, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1550, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1551, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1552, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1553, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1554, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1555, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1556, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1557, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1558, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1559, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1560, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1561, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1562, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1563, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1564, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1565, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1566, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1567, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1568, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1569, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1570, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1571, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1572, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1573, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1574, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1575, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1576, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1577, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1578, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1579, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1580, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1581, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1582, 'admin', 'admin', '2021-04-22 18:04:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1583, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1584, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1585, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1586, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1587, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1588, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1589, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1590, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1591, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1592, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1593, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1594, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1595, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1596, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1597, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1598, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1599, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1600, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1601, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1602, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1603, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1604, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1605, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1606, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1607, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1608, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1609, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1610, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1611, 'admin', 'admin', '2021-04-22 18:04:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1612, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1613, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1614, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1615, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1616, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1617, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1618, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1619, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1620, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1621, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1622, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1623, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1624, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1625, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1626, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1627, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1628, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1629, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1630, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1631, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1632, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1633, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1634, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1635, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1636, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1637, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1638, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1639, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1640, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1641, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1642, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1643, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1644, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1645, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1646, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1647, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1648, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1649, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1650, 'admin', 'admin', '2021-04-22 18:04:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1651, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1652, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1653, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1654, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1655, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1656, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1657, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1658, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1659, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1660, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1661, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1662, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1663, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1664, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1665, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1666, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1667, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1668, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1669, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1670, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1671, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1672, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1673, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1674, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1675, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1676, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1677, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1678, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1679, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1680, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1681, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1682, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1683, 'admin', 'admin', '2021-04-22 18:04:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1684, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1685, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1686, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1687, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1688, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1689, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1690, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1691, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1692, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1693, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1694, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1695, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1696, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1697, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1698, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1699, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1700, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1701, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1702, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1703, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1704, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1705, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1706, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1707, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1708, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1709, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1710, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1711, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1712, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1713, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1714, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1715, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1716, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1717, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1718, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1719, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1720, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1721, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1722, 'admin', 'admin', '2021-04-22 18:04:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1723, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1724, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1725, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1726, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1727, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1728, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1729, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1730, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1731, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1732, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1733, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1734, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1735, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1736, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1737, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1738, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1739, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1740, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1741, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1742, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1743, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1744, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1745, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1746, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1747, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1748, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1749, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1750, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1751, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1752, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1753, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1754, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1755, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1756, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1757, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1758, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1759, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1760, 'admin', 'admin', '2021-04-22 18:04:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1761, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1762, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1763, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1764, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1765, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1766, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1767, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1768, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1769, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1770, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1771, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1772, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1773, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1774, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1775, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1776, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1777, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1778, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1779, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1780, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1781, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1782, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1783, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1784, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1785, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1786, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1787, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1788, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1789, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1790, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1791, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1792, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1793, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1794, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1795, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1796, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1797, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1798, 'admin', 'admin', '2021-04-22 18:04:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1799, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1800, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1801, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1802, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1803, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1804, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1805, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1806, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1807, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1808, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1809, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1810, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1811, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1812, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1813, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1814, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1815, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1816, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1817, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1818, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1819, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1820, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1821, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1822, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1823, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1824, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1825, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1826, 'admin', 'admin', '2021-04-22 18:04:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1827, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1828, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1829, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1830, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1831, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1832, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1833, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1834, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1835, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1836, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1837, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1838, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1839, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1840, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1841, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1842, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1843, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1844, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1845, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1846, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1847, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1848, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1849, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1850, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1851, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1852, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1853, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1854, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1855, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1856, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1857, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1858, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1859, 'admin', 'admin', '2021-04-22 18:04:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1860, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1861, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1862, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1863, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1864, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1865, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1866, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1867, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1868, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1869, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1870, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1871, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1872, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1873, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1874, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1875, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1876, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1877, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1878, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1879, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1880, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1881, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1882, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1883, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1884, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1885, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1886, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1887, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1888, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1889, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1890, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1891, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1892, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1893, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1894, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1895, 'admin', 'admin', '2021-04-22 18:04:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1896, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1897, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1898, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1899, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1900, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1901, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1902, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1903, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1904, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1905, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1906, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1907, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1908, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1909, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1910, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1911, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1912, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1913, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1914, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1915, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1916, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1917, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1918, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1919, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1920, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1921, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1922, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1923, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1924, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1925, 'admin', 'admin', '2021-04-22 18:04:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1926, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1927, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1928, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1929, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1930, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1931, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1932, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1933, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1934, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1935, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1936, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1937, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1938, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1939, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1940, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1941, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1942, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1943, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1944, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1945, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1946, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1947, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1948, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1949, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1950, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1951, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1952, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1953, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1954, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1955, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1956, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1957, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1958, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1959, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1960, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1961, 'admin', 'admin', '2021-04-22 18:04:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1962, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1963, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1964, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1965, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1966, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1967, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1968, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1969, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1970, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1971, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1972, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1973, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1974, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1975, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1976, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1977, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1978, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1979, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1980, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1981, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1982, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1983, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1984, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1985, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1986, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1987, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1988, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1989, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1990, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1991, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1992, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1993, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1994, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1995, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1996, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (1997, 'admin', 'admin', '2021-04-22 18:04:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1998, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (1999, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2000, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2001, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2002, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2003, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2004, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2005, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2006, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2007, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2008, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2009, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2010, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2011, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2012, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2013, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2014, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2015, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2016, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2017, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2018, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2019, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2020, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2021, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2022, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2023, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2024, 'admin', 'admin', '2021-04-22 18:04:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2025, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2026, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2027, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2028, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2029, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2030, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2031, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2032, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2033, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2034, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2035, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2036, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2037, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2038, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2039, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2040, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2041, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2042, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2043, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2044, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2045, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2046, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2047, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2048, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2049, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2050, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2051, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2052, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2053, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2054, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2055, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2056, 'admin', 'admin', '2021-04-22 18:04:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2057, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2058, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2059, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2060, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2061, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2062, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2063, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2064, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2065, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2066, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2067, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2068, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2069, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2070, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2071, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2072, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2073, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2074, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2075, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2076, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2077, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2078, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2079, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2080, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2081, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2082, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2083, 'admin', 'admin', '2021-04-22 18:04:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2084, 'admin', 'admin', '2021-04-22 18:04:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2085, 'admin', 'admin', '2021-04-22 18:04:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2086, 'admin', 'admin', '2021-04-22 18:04:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2087, 'admin', 'admin', '2021-04-22 18:04:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2088, 'admin', 'admin', '2021-04-22 18:04:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2089, 'admin', 'admin', '2021-04-22 18:04:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2090, 'admin', 'admin', '2021-04-22 18:04:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2091, 'admin', 'admin', '2021-04-22 18:04:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2092, 'admin', 'admin', '2021-04-22 18:04:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2093, 'admin', 'admin', '2021-04-22 18:04:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2094, 'admin', 'admin', '2021-04-22 18:04:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2095, 'admin', 'admin', '2021-04-22 18:05:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2096, 'admin', 'admin', '2021-04-22 18:05:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2097, 'admin', 'admin', '2021-04-22 18:05:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2098, 'admin', 'admin', '2021-04-22 18:05:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2099, 'admin', 'admin', '2021-04-22 18:05:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2100, 'admin', 'admin', '2021-04-22 18:05:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2101, 'admin', 'admin', '2021-04-22 18:06:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2102, 'admin', 'admin', '2021-04-22 18:06:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2103, 'admin', 'admin', '2021-04-22 18:06:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2104, 'admin', 'admin', '2021-04-22 18:06:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2105, 'admin', 'admin', '2021-04-22 18:06:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (2106, 'admin', 'admin', '2021-04-22 18:06:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2107, 'admin', 'admin', '2021-04-22 18:06:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2108, 'admin', 'admin', '2021-04-22 18:06:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2109, 'admin', 'admin', '2021-04-22 18:06:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2110, 'admin', 'admin', '2021-04-22 18:06:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2111, 'admin', 'admin', '2021-04-22 18:06:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2112, 'admin', 'admin', '2021-04-22 18:06:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2113, 'admin', 'admin', '2021-04-22 18:06:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2114, 'admin', 'admin', '2021-04-22 18:06:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2115, 'admin', 'admin', '2021-04-22 18:09:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2116, 'admin', 'admin', '2021-04-22 18:09:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2117, 'admin', NULL, '2021-04-23 08:44:42', '', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2118, 'admin', 'admin', '2021-04-23 08:44:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2119, 'admin', 'admin', '2021-04-23 08:44:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2120, 'admin', 'admin', '2021-04-23 08:48:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2121, 'admin', 'admin', '2021-04-23 08:48:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2122, 'admin', 'admin', '2021-04-23 08:50:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2123, 'admin', 'admin', '2021-04-23 08:50:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2124, 'admin', 'admin', '2021-04-23 08:52:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2125, 'admin', 'admin', '2021-04-23 08:52:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2126, 'admin', 'admin', '2021-04-23 09:00:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2127, 'admin', 'admin', '2021-04-23 09:00:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2128, 'admin', 'admin', '2021-04-23 09:01:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2129, 'admin', 'admin', '2021-04-23 09:01:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2130, 'admin', 'admin', '2021-04-23 09:01:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2131, 'admin', 'admin', '2021-04-23 09:01:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2132, 'admin', 'admin', '2021-04-23 09:02:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2133, 'admin', 'admin', '2021-04-23 09:02:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2134, 'admin', 'admin', '2021-04-23 09:03:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2135, 'admin', 'admin', '2021-04-23 09:03:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2136, 'admin', 'admin', '2021-04-23 09:03:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2137, 'admin', 'admin', '2021-04-23 09:03:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2138, 'admin', 'admin', '2021-04-23 09:04:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2139, 'admin', 'admin', '2021-04-23 09:04:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2140, 'admin', 'admin', '2021-04-23 09:05:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2141, 'admin', 'admin', '2021-04-23 09:05:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2142, 'admin', 'admin', '2021-04-23 09:07:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2143, 'admin', 'admin', '2021-04-23 09:07:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2144, 'admin', 'admin', '2021-04-23 09:08:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2145, 'admin', 'admin', '2021-04-23 09:08:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2146, 'admin', 'admin', '2021-04-23 09:59:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2147, 'admin', 'admin', '2021-04-23 09:59:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2148, 'admin', 'admin', '2021-04-23 09:59:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2149, 'admin', 'admin', '2021-04-23 09:59:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2150, 'admin', 'admin', '2021-04-23 10:00:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2151, 'admin', 'admin', '2021-04-23 10:00:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2152, 'admin', 'admin', '2021-04-23 10:00:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2153, 'admin', 'admin', '2021-04-23 10:00:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2154, 'admin', 'admin', '2021-04-23 10:02:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2155, 'admin', 'admin', '2021-04-23 10:02:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2156, 'admin', 'admin', '2021-04-23 10:02:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2157, 'admin', 'admin', '2021-04-23 10:02:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2158, 'admin', 'admin', '2021-04-23 10:04:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2159, 'admin', 'admin', '2021-04-23 10:04:10', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2160, 'admin', 'admin', '2021-04-23 10:04:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2161, 'admin', 'admin', '2021-04-23 10:04:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2162, 'admin', 'admin', '2021-04-23 10:04:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2163, 'admin', 'admin', '2021-04-23 10:04:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2164, 'admin', 'admin', '2021-04-23 10:04:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2165, 'admin', 'admin', '2021-04-23 10:04:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2166, 'admin', 'admin', '2021-04-23 10:05:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2167, 'admin', 'admin', '2021-04-23 10:05:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2168, 'admin', 'admin', '2021-04-23 10:05:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2169, 'admin', 'admin', '2021-04-23 10:05:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2170, 'admin', 'admin', '2021-04-23 10:05:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2171, 'admin', 'admin', '2021-04-23 10:05:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2172, 'admin', 'admin', '2021-04-23 10:05:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2173, 'admin', 'admin', '2021-04-23 10:05:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2174, 'admin', 'admin', '2021-04-23 10:05:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2175, 'admin', 'admin', '2021-04-23 10:05:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2176, 'admin', 'admin', '2021-04-23 10:05:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2177, 'admin', 'admin', '2021-04-23 10:05:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2178, 'admin', 'admin', '2021-04-23 10:05:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2179, 'admin', 'admin', '2021-04-23 10:05:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2180, 'admin', 'admin', '2021-04-23 10:05:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2181, 'admin', 'admin', '2021-04-23 10:05:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2182, 'admin', 'admin', '2021-04-23 10:14:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2183, 'admin', 'admin', '2021-04-23 10:14:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2184, 'admin', 'admin', '2021-04-23 10:15:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2185, 'admin', 'admin', '2021-04-23 10:15:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2186, 'admin', 'admin', '2021-04-23 10:15:11', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2187, 'admin', 'admin', '2021-04-23 10:15:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2188, 'admin', 'admin', '2021-04-23 10:15:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2189, 'admin', 'admin', '2021-04-23 10:15:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2190, 'admin', 'admin', '2021-04-23 10:15:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2191, 'admin', 'admin', '2021-04-23 10:15:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2192, 'admin', 'admin', '2021-04-23 10:19:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2193, 'admin', 'admin', '2021-04-23 10:19:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2194, 'admin', 'admin', '2021-04-23 10:19:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2195, 'admin', 'admin', '2021-04-23 10:19:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2196, 'admin', 'admin', '2021-04-23 10:19:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2197, 'admin', 'admin', '2021-04-23 10:30:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2198, 'admin', 'admin', '2021-04-23 10:30:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2199, 'admin', 'admin', '2021-04-23 10:31:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2200, 'admin', 'admin', '2021-04-23 10:31:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2201, 'admin', 'admin', '2021-04-23 10:31:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2202, 'admin', 'admin', '2021-04-23 10:31:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2203, 'admin', 'admin', '2021-04-23 10:31:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2204, 'admin', 'admin', '2021-04-23 10:31:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2205, 'admin', 'admin', '2021-04-23 10:31:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2206, 'admin', 'admin', '2021-04-23 10:31:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2207, 'admin', 'admin', '2021-04-23 10:32:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2208, 'admin', 'admin', '2021-04-23 10:32:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2209, 'admin', 'admin', '2021-04-23 10:32:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2210, 'admin', 'admin', '2021-04-23 10:32:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2211, 'admin', 'admin', '2021-04-23 10:32:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2212, 'admin', 'admin', '2021-04-23 10:32:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2213, 'admin', 'admin', '2021-04-23 10:33:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2214, 'admin', 'admin', '2021-04-23 10:34:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2215, 'admin', 'admin', '2021-04-23 10:34:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2216, 'admin', 'admin', '2021-04-23 10:34:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2217, 'admin', 'admin', '2021-04-23 10:34:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2218, 'admin', 'admin', '2021-04-23 10:34:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2219, 'admin', 'admin', '2021-04-23 10:34:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2220, 'admin', 'admin', '2021-04-23 10:38:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2221, 'admin', 'admin', '2021-04-23 10:38:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2222, 'admin', 'admin', '2021-04-23 10:38:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2223, 'admin', 'admin', '2021-04-23 10:38:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2224, 'admin', 'admin', '2021-04-23 10:38:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2225, 'admin', 'admin', '2021-04-23 10:38:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2226, 'admin', 'admin', '2021-04-23 10:38:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2227, 'admin', 'admin', '2021-04-23 10:38:46', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2228, 'admin', 'admin', '2021-04-23 10:38:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2229, 'admin', 'admin', '2021-04-23 10:39:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2230, 'admin', 'admin', '2021-04-23 10:39:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2231, 'admin', 'admin', '2021-04-23 10:39:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2232, 'admin', 'admin', '2021-04-23 10:39:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (2233, 'admin', 'admin', '2021-04-23 10:39:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2234, 'admin', 'admin', '2021-04-23 10:39:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2235, 'admin', 'admin', '2021-04-23 10:39:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2236, 'admin', 'admin', '2021-04-23 10:39:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2237, 'admin', 'admin', '2021-04-23 10:39:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2238, 'admin', 'admin', '2021-04-23 10:39:43', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2239, 'admin', 'admin', '2021-04-23 10:39:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2240, 'admin', 'admin', '2021-04-23 10:39:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2241, 'admin', 'admin', '2021-04-23 10:39:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2242, 'admin', 'admin', '2021-04-23 10:39:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2243, 'admin', 'admin', '2021-04-23 10:39:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2244, 'admin', 'admin', '2021-04-23 10:45:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2245, 'admin', 'admin', '2021-04-23 10:45:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2246, 'admin', 'admin', '2021-04-23 10:45:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2247, 'admin', 'admin', '2021-04-23 10:45:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2248, 'admin', 'admin', '2021-04-23 10:45:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2249, 'admin', 'admin', '2021-04-23 10:45:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2250, 'admin', 'admin', '2021-04-23 10:45:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/nonWorktimeConnectlist.do');
INSERT INTO `t_logmanage` VALUES (2251, 'admin', 'admin', '2021-04-23 10:45:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2252, 'admin', 'admin', '2021-04-23 10:45:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2253, 'admin', 'admin', '2021-04-23 10:45:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2254, 'admin', 'admin', '2021-04-23 10:45:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2255, 'admin', 'admin', '2021-04-23 10:45:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2256, 'admin', 'admin', '2021-04-23 10:45:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2257, 'admin', 'admin', '2021-04-23 10:45:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2258, 'admin', 'admin', '2021-04-23 10:45:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2259, 'admin', 'admin', '2021-04-23 10:45:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/nonWorktimeConnectlist.do');
INSERT INTO `t_logmanage` VALUES (2260, 'admin', 'admin', '2021-04-23 10:45:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2261, 'admin', 'admin', '2021-04-23 10:46:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (2262, 'admin', 'admin', '2021-04-23 10:46:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2263, 'admin', 'admin', '2021-04-23 10:46:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/nonWorktimeConnectlist.do');
INSERT INTO `t_logmanage` VALUES (2264, 'admin', 'admin', '2021-04-23 10:46:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2265, 'admin', 'admin', '2021-04-23 10:46:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2266, 'admin', 'admin', '2021-04-23 10:46:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2267, 'admin', 'admin', '2021-04-23 10:46:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/nonWorktimeConnectlist.do');
INSERT INTO `t_logmanage` VALUES (2268, 'admin', 'admin', '2021-04-23 10:46:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2269, 'admin', 'admin', '2021-04-23 10:46:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (2270, 'admin', 'admin', '2021-04-23 10:46:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2271, 'admin', 'admin', '2021-04-23 10:46:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (2272, 'admin', 'admin', '2021-04-23 10:46:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2273, 'admin', 'admin', '2021-04-23 10:46:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (2274, 'admin', 'admin', '2021-04-23 10:46:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2275, 'admin', 'admin', '2021-04-23 10:46:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (2276, 'admin', 'admin', '2021-04-23 10:46:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2277, 'admin', 'admin', '2021-04-23 10:46:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2278, 'admin', 'admin', '2021-04-23 10:46:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2279, 'admin', 'admin', '2021-04-23 10:48:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2280, 'admin', 'admin', '2021-04-23 10:48:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2281, 'admin', 'admin', '2021-04-23 10:59:50', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/list.do');
INSERT INTO `t_logmanage` VALUES (2282, 'admin', 'admin', '2021-04-23 10:59:51', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2283, 'admin', 'admin', '2021-04-23 10:59:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2284, 'admin', 'admin', '2021-04-23 10:59:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2285, 'admin', 'admin', '2021-04-23 11:00:14', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2286, 'admin', 'admin', '2021-04-23 11:00:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2287, 'admin', 'admin', '2021-04-23 11:00:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2288, 'admin', 'admin', '2021-04-23 11:05:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2289, 'admin', 'admin', '2021-04-23 11:05:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2290, 'admin', 'admin', '2021-04-23 11:05:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/list.do');
INSERT INTO `t_logmanage` VALUES (2291, 'admin', 'admin', '2021-04-23 11:05:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2292, 'admin', 'admin', '2021-04-23 11:05:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2293, 'admin', 'admin', '2021-04-23 11:11:02', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertProc.do');
INSERT INTO `t_logmanage` VALUES (2294, 'admin', 'admin', '2021-04-23 11:11:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/list.do');
INSERT INTO `t_logmanage` VALUES (2295, 'admin', 'admin', '2021-04-23 11:11:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2296, 'admin', 'admin', '2021-04-23 11:11:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2297, 'admin', 'admin', '2021-04-23 11:11:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2298, 'admin', 'admin', '2021-04-23 11:11:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2299, 'admin', 'admin', '2021-04-23 11:12:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2300, 'admin', 'admin', '2021-04-23 12:52:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2301, 'admin', 'admin', '2021-04-23 12:52:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2302, 'admin', 'admin', '2021-04-23 12:52:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2303, 'admin', 'admin', '2021-04-23 12:52:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mipmanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2304, 'admin', 'admin', '2021-04-23 12:52:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2305, 'admin', 'admin', '2021-04-23 12:52:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2306, 'admin', 'admin', '2021-04-23 12:52:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mpopup/list.do');
INSERT INTO `t_logmanage` VALUES (2307, 'admin', 'admin', '2021-04-23 12:52:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mpopup/addList.do');
INSERT INTO `t_logmanage` VALUES (2308, 'admin', 'admin', '2021-04-23 12:53:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mpopup/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2309, 'admin', 'admin', '2021-04-23 12:53:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/list.do');
INSERT INTO `t_logmanage` VALUES (2310, 'admin', 'admin', '2021-04-23 12:53:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2311, 'admin', 'admin', '2021-04-23 12:53:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2312, 'admin', 'admin', '2021-04-23 12:56:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2313, 'admin', 'admin', '2021-04-23 13:16:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2314, 'admin', 'admin', '2021-04-23 13:18:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2315, 'admin', 'admin', '2021-04-23 13:19:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2316, 'admin', 'admin', '2021-04-23 13:19:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2317, 'admin', 'admin', '2021-04-23 13:20:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2318, 'admin', 'admin', '2021-04-23 13:21:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2319, 'admin', 'admin', '2021-04-23 13:21:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2320, 'admin', 'admin', '2021-04-23 13:21:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2321, 'admin', 'admin', '2021-04-23 13:23:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertForm.do');
INSERT INTO `t_logmanage` VALUES (2322, 'admin', 'admin', '2021-04-23 13:24:04', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/insertProc.do');
INSERT INTO `t_logmanage` VALUES (2323, 'admin', 'admin', '2021-04-23 13:24:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/list.do');
INSERT INTO `t_logmanage` VALUES (2324, 'admin', 'admin', '2021-04-23 13:24:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2325, 'admin', 'admin', '2021-04-23 13:24:07', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2326, 'admin', 'admin', '2021-04-23 13:24:09', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2327, 'admin', 'admin', '2021-04-23 13:40:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateProc.do');
INSERT INTO `t_logmanage` VALUES (2328, 'admin', 'admin', '2021-04-23 13:40:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2329, 'admin', 'admin', '2021-04-23 13:40:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2330, 'admin', 'admin', '2021-04-23 13:40:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2331, 'admin', 'admin', '2021-04-23 13:43:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2332, 'admin', 'admin', '2021-04-23 13:43:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2333, 'admin', 'admin', '2021-04-23 13:44:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2334, 'admin', 'admin', '2021-04-23 13:47:08', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2335, 'admin', 'admin', '2021-04-23 13:47:18', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2336, 'admin', 'admin', '2021-04-23 13:56:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2337, 'admin', 'admin', '2021-04-23 13:57:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2338, 'admin', 'admin', '2021-04-23 13:57:17', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateProc.do');
INSERT INTO `t_logmanage` VALUES (2339, 'admin', 'admin', '2021-04-23 13:57:20', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2340, 'admin', 'admin', '2021-04-23 13:57:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2341, 'admin', 'admin', '2021-04-23 13:58:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2342, 'admin', 'admin', '2021-04-23 14:01:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2343, 'admin', 'admin', '2021-04-23 14:01:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateProc.do');
INSERT INTO `t_logmanage` VALUES (2344, 'admin', 'admin', '2021-04-23 14:01:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2345, 'admin', 'admin', '2021-04-23 14:02:05', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2346, 'admin', 'admin', '2021-04-23 14:03:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2347, 'admin', 'admin', '2021-04-23 14:09:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2348, 'admin', 'admin', '2021-04-23 14:10:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2349, 'admin', 'admin', '2021-04-23 14:12:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2350, 'admin', 'admin', '2021-04-23 14:18:16', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2351, 'admin', 'admin', '2021-04-23 14:18:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2352, 'admin', 'admin', '2021-04-23 14:19:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateForm.do');
INSERT INTO `t_logmanage` VALUES (2353, 'admin', 'admin', '2021-04-23 14:19:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/updateProc.do');
INSERT INTO `t_logmanage` VALUES (2354, 'admin', 'admin', '2021-04-23 14:19:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/msitemanage/view.do');
INSERT INTO `t_logmanage` VALUES (2355, 'admin', 'admin', '2021-04-23 14:30:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2356, 'admin', 'admin', '2021-04-23 14:30:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2357, 'admin', 'admin', '2021-04-23 14:30:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2358, 'admin', 'admin', '2021-04-23 14:30:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2359, 'admin', 'admin', '2021-04-23 14:35:56', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2360, 'admin', 'admin', '2021-04-23 14:35:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2361, 'admin', 'admin', '2021-04-23 14:45:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2362, 'admin', 'admin', '2021-04-23 14:45:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2363, 'admin', 'admin', '2021-04-23 14:53:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2364, 'admin', 'admin', '2021-04-23 14:53:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2365, 'admin', 'admin', '2021-04-23 14:55:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2366, 'admin', 'admin', '2021-04-23 14:55:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2367, 'admin', 'admin', '2021-04-23 14:56:00', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2368, 'admin', 'admin', '2021-04-23 14:56:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2369, 'admin', 'admin', '2021-04-23 14:56:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2370, 'admin', 'admin', '2021-04-23 14:56:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2371, 'admin', 'admin', '2021-04-23 14:56:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2372, 'admin', 'admin', '2021-04-23 14:56:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2373, 'admin', 'admin', '2021-04-23 14:57:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2374, 'admin', 'admin', '2021-04-23 14:57:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2375, 'admin', 'admin', '2021-04-23 14:57:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2376, 'admin', 'admin', '2021-04-23 14:57:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2377, 'admin', 'admin', '2021-04-23 14:57:44', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2378, 'admin', 'admin', '2021-04-23 14:57:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2379, 'admin', 'admin', '2021-04-23 14:57:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2380, 'admin', 'admin', '2021-04-23 14:59:54', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2381, 'admin', 'admin', '2021-04-23 14:59:55', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2382, 'admin', 'admin', '2021-04-23 14:59:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2383, 'admin', 'admin', '2021-04-23 15:01:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2384, 'admin', 'admin', '2021-04-23 15:02:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2385, 'admin', 'admin', '2021-04-23 15:03:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2386, 'admin', 'admin', '2021-04-23 15:03:19', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2387, 'admin', 'admin', '2021-04-23 15:03:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2388, 'admin', 'admin', '2021-04-23 15:03:39', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2389, 'admin', 'admin', '2021-04-23 15:04:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2390, 'admin', 'admin', '2021-04-23 15:04:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2391, 'admin', 'admin', '2021-04-23 15:04:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2392, 'admin', 'admin', '2021-04-23 15:05:34', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2393, 'admin', 'admin', '2021-04-23 15:05:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2394, 'admin', 'admin', '2021-04-23 15:05:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2395, 'admin', 'admin', '2021-04-23 15:11:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2396, 'admin', 'admin', '2021-04-23 15:11:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2397, 'admin', 'admin', '2021-04-23 15:11:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2398, 'admin', 'admin', '2021-04-23 15:13:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2399, 'admin', 'admin', '2021-04-23 15:14:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2400, 'admin', 'admin', '2021-04-23 15:14:36', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2401, 'admin', 'admin', '2021-04-23 15:14:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2402, 'admin', 'admin', '2021-04-23 15:14:49', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2403, 'admin', 'admin', '2021-04-23 15:16:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2404, 'admin', 'admin', '2021-04-23 15:16:53', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2405, 'admin', 'admin', '2021-04-23 15:19:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2406, 'admin', 'admin', '2021-04-23 15:19:03', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2407, 'admin', 'admin', '2021-04-23 15:20:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2408, 'admin', 'admin', '2021-04-23 15:20:12', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2409, 'admin', 'admin', '2021-04-23 15:21:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2410, 'admin', 'admin', '2021-04-23 15:21:38', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2411, 'admin', 'admin', '2021-04-23 15:21:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2412, 'admin', 'admin', '2021-04-23 15:27:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2413, 'admin', 'admin', '2021-04-23 15:27:45', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2414, 'admin', 'admin', '2021-04-23 15:28:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2415, 'admin', 'admin', '2021-04-23 15:28:35', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2416, 'admin', 'admin', '2021-04-23 15:29:47', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2417, 'admin', 'admin', '2021-04-23 15:29:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2418, 'admin', 'admin', '2021-04-23 15:30:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2419, 'admin', 'admin', '2021-04-23 15:30:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2420, 'admin', 'admin', '2021-04-23 15:32:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2421, 'admin', 'admin', '2021-04-23 15:32:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2422, 'admin', 'admin', '2021-04-23 15:33:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2423, 'admin', 'admin', '2021-04-23 15:33:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2424, 'admin', 'admin', '2021-04-23 15:33:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2425, 'admin', 'admin', '2021-04-23 15:33:13', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2426, 'admin', 'admin', '2021-04-23 15:33:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2427, 'admin', 'admin', '2021-04-23 15:33:21', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2428, 'admin', 'admin', '2021-04-23 15:33:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/nonWorktimeConnectlist.do');
INSERT INTO `t_logmanage` VALUES (2429, 'admin', 'admin', '2021-04-23 15:33:23', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2430, 'admin', 'admin', '2021-04-23 15:33:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2431, 'admin', 'admin', '2021-04-23 15:33:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2432, 'admin', 'admin', '2021-04-23 15:33:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/nonWorktimeConnectlist.do');
INSERT INTO `t_logmanage` VALUES (2433, 'admin', 'admin', '2021-04-23 15:33:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2434, 'admin', 'admin', '2021-04-23 15:33:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/nonWorktimeConnectlist.do');
INSERT INTO `t_logmanage` VALUES (2435, 'admin', 'admin', '2021-04-23 15:33:40', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2436, 'admin', 'admin', '2021-04-23 15:33:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2437, 'admin', 'admin', '2021-04-23 15:33:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2438, 'admin', 'admin', '2021-04-23 15:34:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2439, 'admin', 'admin', '2021-04-23 15:34:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2440, 'admin', 'admin', '2021-04-23 15:34:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2441, 'admin', 'admin', '2021-04-23 15:34:37', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2442, 'admin', 'admin', '2021-04-23 15:35:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2443, 'admin', 'admin', '2021-04-23 15:35:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2444, 'admin', 'admin', '2021-04-23 15:35:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2445, 'admin', 'admin', '2021-04-23 15:35:52', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2446, 'admin', 'admin', '2021-04-23 15:35:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2447, 'admin', 'admin', '2021-04-23 15:35:59', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2448, 'admin', 'admin', '2021-04-23 15:36:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2449, 'admin', 'admin', '2021-04-23 15:36:33', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2450, 'admin', 'admin', '2021-04-23 15:37:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2451, 'admin', 'admin', '2021-04-23 15:37:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2452, 'admin', 'admin', '2021-04-23 15:37:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2453, 'admin', 'admin', '2021-04-23 15:37:42', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2454, 'admin', 'admin', '2021-04-23 15:39:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2455, 'admin', 'admin', '2021-04-23 15:39:01', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2456, 'admin', 'admin', '2021-04-23 15:39:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2457, 'admin', 'admin', '2021-04-23 15:39:41', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2458, 'admin', 'admin', '2021-04-23 15:40:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2459, 'admin', 'admin', '2021-04-23 15:40:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2460, 'admin', 'admin', '2021-04-23 15:40:57', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2461, 'admin', 'admin', '2021-04-23 15:40:58', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2462, 'admin', 'admin', '2021-04-23 15:41:27', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2463, 'admin', 'admin', '2021-04-23 15:41:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2464, 'admin', 'admin', '2021-04-23 15:41:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2465, 'admin', 'admin', '2021-04-23 15:41:48', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2466, 'admin', 'admin', '2021-04-23 15:42:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2467, 'admin', 'admin', '2021-04-23 15:42:06', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2468, 'admin', 'admin', '2021-04-23 15:42:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2469, 'admin', 'admin', '2021-04-23 15:42:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2470, 'admin', 'admin', '2021-04-23 15:43:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2471, 'admin', 'admin', '2021-04-23 15:43:15', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2472, 'admin', 'admin', '2021-04-23 15:43:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/nonWorktimeConnectlist.do');
INSERT INTO `t_logmanage` VALUES (2473, 'admin', 'admin', '2021-04-23 15:43:22', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2474, 'admin', 'admin', '2021-04-23 15:43:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2475, 'admin', 'admin', '2021-04-23 15:43:24', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2476, 'admin', 'admin', '2021-04-23 15:43:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/nonWorktimeConnectlist.do');
INSERT INTO `t_logmanage` VALUES (2477, 'admin', 'admin', '2021-04-23 15:43:25', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2478, 'admin', 'admin', '2021-04-23 15:43:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (2479, 'admin', 'admin', '2021-04-23 15:43:26', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2480, 'admin', 'admin', '2021-04-23 15:43:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (2481, 'admin', 'admin', '2021-04-23 15:43:28', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2482, 'admin', 'admin', '2021-04-23 15:43:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (2483, 'admin', 'admin', '2021-04-23 15:43:29', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2484, 'admin', 'admin', '2021-04-23 15:43:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/multipleConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (2485, 'admin', 'admin', '2021-04-23 15:43:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2486, 'admin', 'admin', '2021-04-23 15:43:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/bannedIpConAttemplist.do');
INSERT INTO `t_logmanage` VALUES (2487, 'admin', 'admin', '2021-04-23 15:43:30', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2488, 'admin', 'admin', '2021-04-23 15:43:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/loginFailedlist.do');
INSERT INTO `t_logmanage` VALUES (2489, 'admin', 'admin', '2021-04-23 15:43:31', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');
INSERT INTO `t_logmanage` VALUES (2490, 'admin', 'admin', '2021-04-23 15:43:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/list.do');
INSERT INTO `t_logmanage` VALUES (2491, 'admin', 'admin', '2021-04-23 15:43:32', '5', NULL, NULL, 'Y', '0:0:0:0:0:0:0:1', '/ma/sys/mlogmanage/addList.do');

-- ----------------------------
-- Table structure for t_menu_info
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_info`;
CREATE TABLE `t_menu_info`  (
  `MENU_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `MENU_GROUP_SEQ` int(11) NOT NULL COMMENT '그룹일련번호',
  `LVL` int(11) NULL DEFAULT NULL COMMENT '레벨',
  `NO` int(11) NULL DEFAULT NULL COMMENT '순번',
  `MENU_NM` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '메뉴명',
  `MENU_CD` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '메뉴코드',
  `URL` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URL',
  `MENU_CL` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '메뉴구분',
  `DESCRIPTION` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '설명',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `BOARD_CL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '게시판구분',
  `ICON_CL` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '아이콘분류',
  `HIDE` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N',
  PRIMARY KEY (`MENU_SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 365 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '메뉴관리' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu_info
-- ----------------------------
INSERT INTO `t_menu_info` VALUES (34, 240, 2, 6, '로그분석', 'log', '/ma/sys/log/list.do', 'ma', '', NULL, '', '2020-01-30 11:06:56', '1', 'N', NULL, '', 'N');
INSERT INTO `t_menu_info` VALUES (35, 240, 2, 1, '메뉴관리', 'mn', '/ma/sys/mn/list.do', 'ma', '', NULL, '', NULL, 'admin', 'Y', '', '', 'N');
INSERT INTO `t_menu_info` VALUES (240, 240, 1, 0, '시스템 ', 'sys', '/ma/sys/mn/list.do', 'ma', '', NULL, 'admin', '2020-03-09 17:35:12', '1', 'Y', NULL, '', 'N');
INSERT INTO `t_menu_info` VALUES (262, 262, 1, 1, '사용자', 'us', '/ma/us/mm/list.do', 'ma', '', '2020-01-29 17:15:11', '1', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (267, 262, 2, 1, '관리자', 'mm', '/ma/us/mm/list.do', 'ma', '', '2020-01-29 17:17:30', '1', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (268, 262, 2, 2, '권한관리', 'au', '/ma/us/au/list.do', 'ma', '', '2020-01-29 17:17:48', '1', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (314, 240, 2, 5, '접속통계', 'cs', '/ma/sys/cs/list.do', 'ma', '', '2020-01-30 11:11:44', '1', NULL, NULL, 'N', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (315, 240, 2, 7, '접근 IP', 'ip', '/ma/sys/ip/list.do', 'ma', '', '2020-01-30 11:12:16', '1', NULL, NULL, 'N', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (318, 34, 3, 1, '접속로그', 'log01', '/ma/sys/log/log01/list.do', 'ma', '', '2020-01-30 11:19:17', '1', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (319, 34, 3, 2, '에러로그', 'log02', '/ma/sys/log/log02/list.do', 'ma', '', '2020-01-30 11:19:38', '1', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (320, 320, 1, 3, '샘플게시판', 'sam', '/ma/sam/sample/list.do', 'ma', '', '2020-08-03 17:01:29', '1', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (321, 320, 2, 1, '샘플게시판', 'sample', '/ma/sam/sample/list.do', 'ma', '', '2020-08-03 17:06:46', '1', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (322, 322, 1, 6, '관리자 고객센터', 'mcustomer', '/ma/mcustomer/mnotice/list.do', 'ma', '', '2021-04-07 09:34:05', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (323, 322, 2, 1, '관리자 공지사항', 'mnotice', '/ma/mcustomer/mnotice/list.do', 'ma', '', '2021-04-07 09:34:28', '5', NULL, NULL, 'Y', '1', NULL, 'N');
INSERT INTO `t_menu_info` VALUES (324, 322, 2, 2, '관리자 자유게시판', 'mfree', '/ma/mcustomer/mfree/list.do', 'ma', '', '2021-04-07 09:34:52', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (325, 325, 1, 6, '고객센터', 'ftcustomer', '/ft/ftcustomer/ftnotice/list.do', 'ft', '', '2021-04-07 13:02:53', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (326, 325, 2, 1, '공지사항', 'ftnotice', '/ft/ftcustomer/ftnotice/list.do', 'ft', '', '2021-04-07 13:03:38', '5', NULL, NULL, 'Y', '1', NULL, 'N');
INSERT INTO `t_menu_info` VALUES (327, 325, 2, 2, '자유게시판', 'ftfree', '/ft/ftcustomer/ftfree/list.do', 'ft', '', '2021-04-07 13:04:11', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (328, 325, 2, 3, '협력업체 신청', 'ftally', '/ft/ftcustomer/ftally/list.do', 'ft', '', '2021-04-07 13:05:23', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (329, 329, 1, 5, '관리자 고객상담', 'mconsult', '/ma/mconsult/mas/list.do', 'ma', '', '2021-04-07 14:17:37', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (330, 329, 2, 1, '관리자 A/S', 'mas', '/ma/mconsult/mas/list.do', 'ma', '', '2021-04-07 14:19:20', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (331, 331, 1, 5, '고객상담', 'ftconsult', '/ft/ftconsult/ftas/list.do', 'ft', '', '2021-04-07 14:44:40', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (332, 331, 2, 1, '견적문의', 'ftaskprice', '/ft/ftconsult/ftaskprice/list.do', 'ft', '', '2021-04-07 14:45:41', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (333, 331, 2, 2, 'A/S 신청', 'ftas', '/ft/ftconsult/ftas/list.do', 'ft', '', '2021-04-07 14:46:23', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (334, 334, 1, 2, '관리자 포트폴리오', 'mportfo', '/ma/mportfo/mbexamp/list.do', 'ma', '', '2021-04-07 15:06:50', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (335, 334, 2, 1, '관리자 시공사례', 'mbexamp', '/ma/mportfo/mbexamp/list.do', 'ma', '', '2021-04-07 15:07:26', '5', NULL, NULL, 'Y', '4', NULL, 'N');
INSERT INTO `t_menu_info` VALUES (336, 334, 2, 2, '관리자 추천설계', 'mbreco', '/ma/mportfo/mbreco/list.do', 'ma', '', '2021-04-07 15:08:00', '5', NULL, NULL, 'Y', '4', NULL, 'N');
INSERT INTO `t_menu_info` VALUES (337, 334, 2, 3, '관리자 시공현장', 'mbfield', '/ma/mportfo/mbfield/list.do', 'ma', '', '2021-04-07 15:08:36', '5', NULL, NULL, 'Y', '4', NULL, 'N');
INSERT INTO `t_menu_info` VALUES (338, 334, 2, 4, '관리자 인테리어 사례', 'minteexam', '/ma/mportfo/minteexam/list.do', 'ma', '', '2021-04-07 15:09:09', '5', NULL, NULL, 'Y', '4', NULL, 'N');
INSERT INTO `t_menu_info` VALUES (339, 339, 1, 2, '포트폴리오', 'ftportfo', '/ft/ftportfo/ftbexamp/list.do', 'ft', '', '2021-04-07 15:30:21', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (340, 339, 2, 1, '시공사례', 'ftbexamp', '/ft/ftportfo/ftbexamp/list.do', 'ft', '', '2021-04-07 15:30:52', '5', NULL, NULL, 'Y', '4', NULL, 'N');
INSERT INTO `t_menu_info` VALUES (341, 339, 2, 2, '추천설계', 'ftbreco', '/ft/ftportfo/ftbreco/list.do', 'ft', '', '2021-04-07 15:31:38', '5', NULL, NULL, 'Y', '4', NULL, 'N');
INSERT INTO `t_menu_info` VALUES (342, 339, 2, 3, '시공현장', 'ftbfield', '/ft/ftportfo/ftbfield/list.do', 'ft', '', '2021-04-07 15:32:00', '5', NULL, NULL, 'Y', '4', NULL, 'N');
INSERT INTO `t_menu_info` VALUES (343, 339, 2, 4, '인테리어 사례', 'ftinteexam', '/ft/ftportfo/ftinteexam/list.do', 'ft', '', '2021-04-07 15:32:32', '5', NULL, NULL, 'Y', '4', NULL, 'N');
INSERT INTO `t_menu_info` VALUES (344, 344, 1, 1, '회사소개', 'ftcomp', '/ft/ftcomp/ftintro/list.do', 'ft', '', '2021-04-07 16:35:48', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (345, 344, 2, 1, '인사말', 'ftintro', '/ft/ftcomp/ftintro/list.do', 'ft', '', '2021-04-07 16:36:16', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (346, 344, 2, 2, '사업영역', 'ftbzarea', '/ft/ftcomp/ftbzarea/list.do', 'ft', '', '2021-04-07 16:36:52', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (347, 344, 2, 3, '오시는길', 'ftway', '/ft/ftcomp/ftway/list.do', 'ft', '', '2021-04-07 16:37:21', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (348, 348, 1, 3, '집짓기가이드', 'ftbguide', '/ft/ftbguide/ftpros/list.do', 'ft', '', '2021-04-07 16:46:57', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (349, 348, 2, 1, '목조주택의 장점', 'ftpros', '/ft/ftbguide/ftpros/list.do', 'ft', '', '2021-04-07 16:47:38', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (350, 348, 2, 2, '목조주택의 단점', 'ftcons', '/ft/ftbguide/ftcons/list.do', 'ft', '', '2021-04-07 16:48:19', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (351, 348, 2, 3, '알고 시공합니다', 'ftknow', '/ft/ftbguide/ftknow/list.do', 'ft', '', '2021-04-07 16:48:49', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (352, 348, 2, 4, '전원주택준비사항', 'ftrdy', '/ft/ftbguide/ftrdy/list.do', 'ft', '', '2021-04-07 16:49:17', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (353, 353, 1, 4, '집짓기정보', 'ftbinfo', '/ft/ftbinfo/ftbintei/list.do', 'ft', '', '2021-04-07 17:02:23', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (354, 353, 2, 1, '건축.인테리어 정보', 'ftbintei', '/ft/ftbinfo/ftbintei/list.do', 'ft', '', '2021-04-07 17:02:54', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (355, 353, 2, 2, '건축자재 정보', 'ftbmati', '/ft/ftbinfo/ftbmati/list.do', 'ft', '', '2021-04-07 17:03:36', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (356, 353, 2, 3, '관련법규 정보', 'ftrlaw', '/ft/ftbinfo/ftrlaw/list.do', 'ft', '', '2021-04-07 17:04:04', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (357, 357, 1, 99, '정보보호', 'ftpinfo', '/ft/ftpinfo/fthpinfo/list.do', 'ft', '', '2021-04-07 17:11:26', '5', NULL, NULL, 'Y', NULL, NULL, 'Y');
INSERT INTO `t_menu_info` VALUES (358, 357, 2, 1, '개인정보취급방침', 'fthpinfo', '/ft/ftpinfo/fthpinfo/list.do', 'ft', '', '2021-04-07 17:11:49', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (359, 357, 2, 2, '이메일무단수집금지', 'ftpemailc', '/ft/ftpinfo/ftpemailc/list.do', 'ft', '', '2021-04-07 17:12:16', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (360, 357, 2, 3, '이용약관', 'ftusec', '/ft/ftpinfo/ftusec/list.do', 'ft', '', '2021-04-07 17:12:49', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (361, 240, 2, 2, '입력폼 종류 샘플', 'msitemanage', '/ma/sys/msitemanage/list.do', 'ma', '', '2021-04-19 14:57:37', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (362, 240, 2, 3, '사용자 페이지 팝업관리', 'mpopup', '/ma/sys/mpopup/list.do', 'ma', '', '2021-04-19 16:34:19', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (363, 240, 2, 4, '접속로그 관리', 'mlogmanage', '/ma/sys/mlogmanage/list.do', 'ma', '', '2021-04-21 09:29:41', '5', NULL, NULL, 'Y', NULL, NULL, 'N');
INSERT INTO `t_menu_info` VALUES (364, 240, 2, 5, '접근 IP 관리', 'mipmanage', '/ma/sys/mipmanage/list.do', 'ma', '', '2021-04-22 15:40:29', '5', NULL, NULL, 'Y', NULL, NULL, 'N');

-- ----------------------------
-- Table structure for t_menu_log
-- ----------------------------
DROP TABLE IF EXISTS `t_menu_log`;
CREATE TABLE `t_menu_log`  (
  `LOG_SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '로그일련번호',
  `CLIENT_IP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '아이피',
  `MENU_URI` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'URI',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `MENU_CL` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '메뉴구분',
  PRIMARY KEY (`LOG_SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '메뉴로그' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `ATCH_FILE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일 아이디',
  `STA_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '시작일',
  `END_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '종료일',
  `NOTI_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '노출여부',
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_notice
-- ----------------------------
INSERT INTO `t_notice` VALUES (1, '1', '&lt;p&gt;1&lt;/p&gt;', '2021-04-07 10:16:13', '5', NULL, NULL, 'Y', '', '2021-04-01 00:00:00', '2021-04-28 00:00:00', 'Y');
INSERT INTO `t_notice` VALUES (2, '2', '&lt;p&gt;2&lt;/p&gt;', '2021-04-07 10:48:25', '5', NULL, NULL, 'Y', 'FILE0000000000004074', NULL, NULL, 'N');
INSERT INTO `t_notice` VALUES (3, '3', '&lt;p&gt;3&lt;/p&gt;', '2021-04-06 11:02:06', '5', NULL, NULL, 'Y', 'FILE0000000000004075', '2021-04-01 00:00:00', '2021-04-06 00:00:00', 'Y');
INSERT INTO `t_notice` VALUES (4, '4', '&lt;p&gt;4&lt;/p&gt;', '2021-03-01 17:51:22', '5', NULL, NULL, 'Y', '', NULL, NULL, 'N');
INSERT INTO `t_notice` VALUES (5, 'dfdrgw', '&lt;p&gt;gfgdgwre&lt;/p&gt;', '2021-04-08 10:24:02', '5', NULL, NULL, 'Y', 'FILE0000000000004109', '2021-04-08 00:00:00', '2021-04-20 00:00:00', 'Y');
INSERT INTO `t_notice` VALUES (6, '333', '&lt;p&gt;dgf33&lt;/p&gt;', '2021-04-08 10:24:13', '5', NULL, NULL, 'Y', '', '2021-04-01 00:00:00', '2021-04-12 00:00:00', 'Y');
INSERT INTO `t_notice` VALUES (7, 'dfd2254', '&lt;p&gt;sfd&lt;/p&gt;', '2021-04-08 10:24:34', '5', NULL, NULL, 'Y', '', '2021-04-08 00:00:00', '2021-04-09 00:00:00', 'Y');

-- ----------------------------
-- Table structure for t_popup
-- ----------------------------
DROP TABLE IF EXISTS `t_popup`;
CREATE TABLE `t_popup`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `ATCH_FILE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일 아이디',
  `STA_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '시작일',
  `END_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '종료일',
  `POPLEFT` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `POPTOP` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `POPWIDTH` varchar(6) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `NOTI_YN` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_popup
-- ----------------------------
INSERT INTO `t_popup` VALUES (2, 'test2', '&lt;p&gt;test2&amp;nbsp;&lt;/p&gt;', '2021-04-19 16:10:53', '5', NULL, NULL, 'Y', '', NULL, NULL, '200', '50', '500', NULL);
INSERT INTO `t_popup` VALUES (3, 'test3', '&lt;p&gt;test3&amp;nbsp;&lt;/p&gt;', '2021-04-19 16:19:08', '5', NULL, NULL, 'Y', '', NULL, NULL, '200', '100', '500', NULL);
INSERT INTO `t_popup` VALUES (4, 'test4', 'test4', '2021-04-19 18:15:58', '5', NULL, NULL, 'Y', NULL, NULL, NULL, '200', '150', '500', NULL);
INSERT INTO `t_popup` VALUES (5, 'test5', 'test5', '2021-04-20 08:51:44', '5', NULL, NULL, 'Y', NULL, NULL, NULL, '200', '150', '500', NULL);
INSERT INTO `t_popup` VALUES (6, 'test6', 'test6', '2021-04-20 08:52:01', '5', NULL, NULL, 'Y', NULL, NULL, NULL, '200', '200', '500', NULL);
INSERT INTO `t_popup` VALUES (7, 'popup test1', '&lt;p&gt;popup test1&amp;nbsp;&lt;/p&gt;', '2021-04-20 09:43:43', '5', NULL, NULL, 'Y', 'FILE0000000000004129', '2021-04-19 00:00:00', '2021-04-30 00:00:00', '0', '0', '500', 'Y');
INSERT INTO `t_popup` VALUES (8, 'popupTest2', '&lt;p&gt;popupTest2&amp;nbsp;&lt;/p&gt;', '2021-04-20 09:57:32', '5', NULL, NULL, 'Y', '', NULL, NULL, '0', '0', '500', 'N');
INSERT INTO `t_popup` VALUES (9, 'popupTest3', '&lt;p&gt;popupTest3&amp;nbsp;&lt;/p&gt;', '2021-04-20 10:04:13', '5', NULL, NULL, 'Y', 'FILE0000000000004130', '2021-04-19 00:00:00', '2021-04-30 00:00:00', '0', '0', '500', 'Y');
INSERT INTO `t_popup` VALUES (10, 'popupTest4', '&lt;p&gt;popupTest4&amp;nbsp;&lt;/p&gt;', '2021-04-20 10:05:36', '5', NULL, NULL, 'Y', 'FILE0000000000004131', '2021-04-18 00:00:00', '2021-04-30 00:00:00', '0', '0', '500', 'Y');
INSERT INTO `t_popup` VALUES (11, 'popupTest5', '&lt;p&gt;popupTest5&amp;nbsp;&lt;/p&gt;', '2021-04-20 10:06:01', '5', NULL, NULL, 'Y', 'FILE0000000000004132', '2021-04-18 00:00:00', '2021-04-30 00:00:00', '0', '0', '500', 'Y');

-- ----------------------------
-- Table structure for t_sample
-- ----------------------------
DROP TABLE IF EXISTS `t_sample`;
CREATE TABLE `t_sample`  (
  `SEQ` int(11) NOT NULL AUTO_INCREMENT COMMENT '일련번호',
  `TITLE` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '제목',
  `CONT` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '내용',
  `RGST_DT` timestamp(0) NULL DEFAULT current_timestamp COMMENT '등록일',
  `RGST_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '등록자',
  `RVSE_DT` timestamp(0) NULL DEFAULT NULL COMMENT '수정일',
  `RVSE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '수정자',
  `USE_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'Y' COMMENT '사용여부',
  `ATCH_FILE_ID` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '첨부파일 아이디',
  `STA_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '시작일',
  `END_DATE` timestamp(0) NULL DEFAULT NULL COMMENT '종료일',
  `NOTI_YN` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '노출여부',
  PRIMARY KEY (`SEQ`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '샘플게시판' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sample
-- ----------------------------
INSERT INTO `t_sample` VALUES (1, 'test1', '&lt;p&gt;test1&lt;/p&gt;', '2021-04-19 16:09:01', '5', NULL, NULL, 'Y', '', NULL, NULL, NULL);
INSERT INTO `t_sample` VALUES (2, 'test2', '&lt;p&gt;test2&amp;nbsp;&lt;/p&gt;', '2021-04-19 16:10:53', '5', NULL, NULL, 'Y', '', NULL, NULL, NULL);
INSERT INTO `t_sample` VALUES (3, 'test3', '&lt;p&gt;test3&amp;nbsp;&lt;/p&gt;', '2021-04-19 16:19:08', '5', NULL, NULL, 'Y', '', NULL, NULL, NULL);

-- ----------------------------
-- Function structure for F_ANS_SCHDL
-- ----------------------------
DROP FUNCTION IF EXISTS `F_ANS_SCHDL`;
delimiter ;;
CREATE FUNCTION `F_ANS_SCHDL`(PARAM1 TIMESTAMP,PARAM2 INT)
 RETURNS timestamp
BEGIN
	DECLARE R_VAL TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
	DECLARE NUM INT DEFAULT 0;
	DECLARE CNT INT DEFAULT 1;
	loop_ans_schdl:LOOP
	IF NUM = PARAM2 THEN LEAVE loop_ans_schdl;
	ELSEIF (SELECT F_HOLIDAY(TIMESTAMPADD(DAY,CNT,PARAM1))) = 1 THEN SET NUM = NUM + 0, CNT = CNT +1;
	ELSE SET NUM = NUM + 1, CNT = CNT +1;
	END IF;
	END LOOP;
	SET R_VAL = (SELECT TIMESTAMPADD(DAY,(CNT-1),PARAM1));
	RETURN R_VAL;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for F_FILE_ID
-- ----------------------------
DROP FUNCTION IF EXISTS `F_FILE_ID`;
delimiter ;;
CREATE FUNCTION `F_FILE_ID`(`PARAM1` VARCHAR(50))
 RETURNS varchar(50) CHARSET utf8
  COMMENT '파일아이디'
BEGIN
	DECLARE R_VAR VARCHAR(50);
	SELECT ATCH_FILE_ID INTO R_VAR FROM T_ATCH_FILE WHERE USE_YN = 'Y' AND ATCH_FILE_ID = PARAM1;
	RETURN R_VAR;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for F_GAP_DT
-- ----------------------------
DROP FUNCTION IF EXISTS `F_GAP_DT`;
delimiter ;;
CREATE FUNCTION `F_GAP_DT`(date1 datetime, date2 datetime)
 RETURNS int(11)
BEGIN
	DECLARE R_VAL INT;
	DECLARE COMP INT;
	DECLARE CNT INT DEFAULT 1;
	SET R_VAL = ABS(DATEDIFF(date1, date2));
	SET COMP = R_VAL;
	loop_gap:LOOP
	IF CNT = COMP + 1 OR date2 is null OR date2 = '' THEN LEAVE loop_gap;
	ELSEIF F_HOLIDAY(DATE_ADD(date1,INTERVAL CNT DAY)) = 1 THEN SET R_VAL = R_VAL - 1 ,CNT = CNT + 1;
	ELSE SET CNT = CNT + 1;
	END IF;
	END LOOP;
	RETURN R_VAL;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for F_HOLIDAY
-- ----------------------------
DROP FUNCTION IF EXISTS `F_HOLIDAY`;
delimiter ;;
CREATE FUNCTION `F_HOLIDAY`(`PARAM1` DATETIME)
 RETURNS varchar(1) CHARSET utf8
BEGIN
	DECLARE R_VAL VARCHAR(1);
	IF (SELECT DAYOFWEEK(PARAM1)) = 1 OR (SELECT DAYOFWEEK(PARAM1)) = 7 OR (SELECT HOL_YN FROM T_CALENDAR TC WHERE DATE_FORMAT(TC.DATA_DATE,'%Y-%m-%d') = DATE_FORMAT(PARAM1,'%Y-%m-%d') AND USE_YN='Y') = 'Y' THEN SET R_VAL = '1';
	ELSE SET R_VAL = '0';
	END IF;
	RETURN R_VAL;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for F_SITE_NM
-- ----------------------------
DROP FUNCTION IF EXISTS `F_SITE_NM`;
delimiter ;;
CREATE FUNCTION `F_SITE_NM`(`PARAM1` VARCHAR(50))
 RETURNS varchar(50) CHARSET utf8
  COMMENT '사이트명'
BEGIN
	DECLARE R_VAR VARCHAR(50);
	
	SELECT SITE_NM INTO R_VAR FROM T_SITE WHERE SITE_CLCD = PARAM1;
	
	RETURN R_VAR;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for F_USER_ID
-- ----------------------------
DROP FUNCTION IF EXISTS `F_USER_ID`;
delimiter ;;
CREATE FUNCTION `F_USER_ID`(`PARAM1` VARCHAR(50))
 RETURNS varchar(50) CHARSET utf8
  COMMENT '유저아이디'
BEGIN
	DECLARE R_VAR VARCHAR(50);
	SELECT (SELECT ID FROM T_AD_USER WHERE SEQ = PARAM1 LIMIT 1) INTO R_VAR;
	
	RETURN R_VAR;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for F_USER_NM
-- ----------------------------
DROP FUNCTION IF EXISTS `F_USER_NM`;
delimiter ;;
CREATE FUNCTION `F_USER_NM`(`PARAM1` VARCHAR(50))
 RETURNS varchar(50) CHARSET utf8
  COMMENT '유저명'
BEGIN
	DECLARE R_VAR VARCHAR(50);
	SELECT (SELECT NAME FROM T_AD_USER WHERE SEQ = PARAM1 LIMIT 1) INTO R_VAR;
	
	RETURN R_VAR;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for loopInsertBidding
-- ----------------------------
DROP PROCEDURE IF EXISTS `loopInsertBidding`;
delimiter ;;
CREATE PROCEDURE `loopInsertBidding`(token varchar(20))
BEGIN
        DECLARE i INT DEFAULT 0;
        DECLARE file_sn INT DEFAULT 0;
        DECLARE che INT DEFAULT 0;
        DECLARE total INT DEFAULT 0;
        DECLARE done INT DEFAULT FALSE;
        DECLARE seq int DEFAULT 0;
        DECLARE realname VARCHAR(100);
        DECLARE savename VARCHAR(100);
        DECLARE file_id INT DEFAULT -1;
        DECLARE countt INT DEFAULT 0;
        
        DECLARE cursor1 CURSOR FOR
            SELECT bt.bd_no, BF.bf_realName, BF.bf_saveName
            FROM (SELECT bd_no FROM rapa2013.frame_board_bidding) bt, rapa2013.FRAME_BOARD_FILE BF
            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no ORDER BY BF.bd_no;
         
         DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
    
         
         OPEN cursor1;
         
         my_loop : LOOP
            
            FETCH cursor1 INTO seq,realname,savename;
            
            SET total = (SELECT 
                            COUNT(*)
                            FROM (SELECT bd_no FROM rapa2013.frame_board_bidding) bt, rapa2013.FRAME_BOARD_FILE BF 
                            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no);
            
            IF done THEN LEAVE my_loop;
            END IF;
            
            IF(seq != che) then
                SET file_id = file_id + 1;
                INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,0
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1)); 
                    SET countt = 0;
                ELSEIF(seq = che) then
                    SET countt = countt + 1;
                    INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,countt
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1));
                        
            END IF;
            SET che = seq;
              
        END LOOP;
        CLOSE cursor1;
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for loopInsertDate
-- ----------------------------
DROP PROCEDURE IF EXISTS `loopInsertDate`;
delimiter ;;
CREATE PROCEDURE `loopInsertDate`(token varchar(20))
BEGIN
        DECLARE i INT DEFAULT 0;
        DECLARE file_sn INT DEFAULT 0;
        DECLARE che INT DEFAULT 0;
        DECLARE total INT DEFAULT 0;
        DECLARE done INT DEFAULT FALSE;
        DECLARE seq int DEFAULT 0;
        DECLARE realname VARCHAR(100);
        DECLARE savename VARCHAR(100);
        DECLARE file_id INT DEFAULT -1;
        DECLARE countt INT DEFAULT 0;
        
        DECLARE cursor1 CURSOR FOR
            SELECT bt.bd_no, BF.bf_realName, BF.bf_saveName
            FROM (SELECT bd_no FROM rapa2013.frame_board_data) bt, rapa2013.FRAME_BOARD_FILE BF
            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no ORDER BY BF.bd_no;
         
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
    
         OPEN cursor1;
         
         my_loop : LOOP
            
            FETCH cursor1 INTO seq,realname,savename;
            
            SET total = (SELECT 
                            COUNT(*)
                            FROM (SELECT bd_no FROM rapa2013.frame_board_data) bt, rapa2013.FRAME_BOARD_FILE BF 
                            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no);
            
            IF done THEN LEAVE my_loop;
            END IF;
            
            IF(seq != che) then
                SET file_id = file_id + 1;
                INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,0
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1)); 
                    SET countt = 0;
                ELSEIF(seq = che) then
                    SET countt = countt + 1;
                    INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,countt
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1));
                        
            END IF;
            SET che = seq;
              
        END LOOP;
        CLOSE cursor1;
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for loopInsertInfoTrend
-- ----------------------------
DROP PROCEDURE IF EXISTS `loopInsertInfoTrend`;
delimiter ;;
CREATE PROCEDURE `loopInsertInfoTrend`(token varchar(20))
BEGIN
        DECLARE i INT DEFAULT 0;
        DECLARE file_sn INT DEFAULT 0;
        DECLARE che INT DEFAULT 0;
        DECLARE total INT DEFAULT 0;
        DECLARE done INT DEFAULT FALSE;
        DECLARE seq int DEFAULT 0;
        DECLARE realname VARCHAR(100);
        DECLARE savename VARCHAR(100);
        DECLARE file_id INT DEFAULT -1;
        DECLARE countt INT DEFAULT 0;
        
        DECLARE cursor1 CURSOR FOR
            SELECT bt.bd_no, BF.bf_realName, BF.bf_saveName
            FROM (SELECT bd_no FROM rapa2013.frame_board_info_trends) bt, rapa2013.FRAME_BOARD_FILE BF
            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no ORDER BY BF.bd_no;
         
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
    
         
         OPEN cursor1;
         
         my_loop : LOOP
            
            FETCH cursor1 INTO seq,realname,savename;
            
            SET total = (SELECT 
                            COUNT(*)
                            FROM (SELECT bd_no FROM rapa2013.frame_board_info_trends) bt, rapa2013.FRAME_BOARD_FILE BF 
                            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no);
            
            IF done THEN LEAVE my_loop;
            END IF;
            
            IF(seq != che) then
                SET file_id = file_id + 1;
                INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,0
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1)); 
                    SET countt = 0;
                ELSEIF(seq = che) then
                    SET countt = countt + 1;
                    INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,countt
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1));
                        
            END IF;
            SET che = seq;
              
        END LOOP;
        CLOSE cursor1;
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for loopInsertMembershipRecruit
-- ----------------------------
DROP PROCEDURE IF EXISTS `loopInsertMembershipRecruit`;
delimiter ;;
CREATE PROCEDURE `loopInsertMembershipRecruit`(token varchar(20))
BEGIN
        DECLARE i INT DEFAULT 0;
        DECLARE file_sn INT DEFAULT 0;
        DECLARE che INT DEFAULT 0;
        DECLARE total INT DEFAULT 0;
        DECLARE done INT DEFAULT FALSE;
        DECLARE seq int DEFAULT 0;
        DECLARE realname VARCHAR(100);
        DECLARE savename VARCHAR(100);
        DECLARE file_id INT DEFAULT -1;
        DECLARE countt INT DEFAULT 0;
        
        DECLARE cursor1 CURSOR FOR
            SELECT bt.bd_no, BF.bf_realName, BF.bf_saveName
            FROM (SELECT bd_no FROM rapa2013.frame_board_membership_recruit) bt, rapa2013.FRAME_BOARD_FILE BF
            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no ORDER BY BF.bd_no;
         
         DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
    
         
         OPEN cursor1;
         
         my_loop : LOOP
            
            FETCH cursor1 INTO seq,realname,savename;
            
            SET total = (SELECT 
                            COUNT(*)
                            FROM (SELECT bd_no FROM rapa2013.frame_board_membership_recruit) bt, rapa2013.FRAME_BOARD_FILE BF 
                            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no);
            
            IF done THEN LEAVE my_loop;
            END IF;
            
            IF(seq != che) then
                SET file_id = file_id + 1;
                INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,0
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1)); 
                    SET countt = 0;
                ELSEIF(seq = che) then
                    SET countt = countt + 1;
                    INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,countt
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1));
                        
            END IF;
            SET che = seq;
              
        END LOOP;
        CLOSE cursor1;
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for loopInsertMembershipTrend
-- ----------------------------
DROP PROCEDURE IF EXISTS `loopInsertMembershipTrend`;
delimiter ;;
CREATE PROCEDURE `loopInsertMembershipTrend`(token varchar(20))
BEGIN
        DECLARE i INT DEFAULT 0;
        DECLARE file_sn INT DEFAULT 0;
        DECLARE che INT DEFAULT 0;
        DECLARE total INT DEFAULT 0;
        DECLARE done INT DEFAULT FALSE;
        DECLARE seq int DEFAULT 0;
        DECLARE realname VARCHAR(100);
        DECLARE savename VARCHAR(100);
        DECLARE file_id INT DEFAULT -1;
        DECLARE countt INT DEFAULT 0;
        
        DECLARE cursor1 CURSOR FOR
            SELECT bt.bd_no, BF.bf_realName, BF.bf_saveName
            FROM (SELECT bd_no FROM rapa2013.frame_board_membership_trend) bt, rapa2013.FRAME_BOARD_FILE BF
            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no ORDER BY BF.bd_no;
         
         DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
    
         
         OPEN cursor1;
         
         my_loop : LOOP
            
            FETCH cursor1 INTO seq,realname,savename;
            
            SET total = (SELECT 
                            COUNT(*)
                            FROM (SELECT bd_no FROM rapa2013.frame_board_membership_trend) bt, rapa2013.FRAME_BOARD_FILE BF 
                            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no);
            
            IF done THEN LEAVE my_loop;
            END IF;
            
            IF(seq != che) then
                SET file_id = file_id + 1;
                INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,0
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1)); 
                    SET countt = 0;
                ELSEIF(seq = che) then
                    SET countt = countt + 1;
                    INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,countt
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1));
                        
            END IF;
            SET che = seq;
              
        END LOOP;
        CLOSE cursor1;
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for loopInsertNotice
-- ----------------------------
DROP PROCEDURE IF EXISTS `loopInsertNotice`;
delimiter ;;
CREATE PROCEDURE `loopInsertNotice`(token varchar(20))
BEGIN
        DECLARE i INT DEFAULT 0;
        DECLARE file_sn INT DEFAULT 0;
        DECLARE che INT DEFAULT 0;
        DECLARE total INT DEFAULT 0;
        DECLARE done INT DEFAULT FALSE;
        DECLARE seq int DEFAULT 0;
        DECLARE realname VARCHAR(100);
        DECLARE savename VARCHAR(100);
        DECLARE file_id INT DEFAULT -1;
        DECLARE countt INT DEFAULT 0;
        
        DECLARE cursor1 CURSOR FOR
            SELECT bt.bd_no, BF.bf_realName, BF.bf_saveName
            FROM (SELECT bd_no FROM rapa2013.frame_board_notice) bt, rapa2013.FRAME_BOARD_FILE BF
            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no ORDER BY BF.bd_no;
         
        DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
    
         OPEN cursor1;
         
         my_loop : LOOP
            
            FETCH cursor1 INTO seq,realname,savename;
            
            SET total = (SELECT 
                            COUNT(*)
                            FROM (SELECT bd_no FROM rapa2013.frame_board_notice) bt, rapa2013.FRAME_BOARD_FILE BF 
                            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no);
            
            IF done THEN LEAVE my_loop;
            END IF;
            
            IF(seq != che) then
                SET file_id = file_id + 1;
                INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,0
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1)); 
                    SET countt = 0;
                ELSEIF(seq = che) then
                    SET countt = countt + 1;
                    INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,countt
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1));
                        
            END IF;
            SET che = seq;
              
        END LOOP;
        CLOSE cursor1;
    END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for loopInsertTrend
-- ----------------------------
DROP PROCEDURE IF EXISTS `loopInsertTrend`;
delimiter ;;
CREATE PROCEDURE `loopInsertTrend`(token varchar(20))
BEGIN
        DECLARE i INT DEFAULT 0;
        DECLARE file_sn INT DEFAULT 0;
        DECLARE che INT DEFAULT 0;
        DECLARE total INT DEFAULT 0;
        DECLARE done INT DEFAULT FALSE;
        DECLARE seq int DEFAULT 0;
        DECLARE realname VARCHAR(100);
        DECLARE savename VARCHAR(100);
        DECLARE file_id INT DEFAULT -1;
        DECLARE countt INT DEFAULT 0;
        
        DECLARE cursor1 CURSOR FOR
            SELECT bt.bd_no, BF.bf_realName, BF.bf_saveName
            FROM (SELECT bd_no FROM rapa2013.frame_board_trend) bt, rapa2013.FRAME_BOARD_FILE BF
            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no ORDER BY BF.bd_no;
         
         DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = true;
    
         
         OPEN cursor1;
         
         my_loop : LOOP
            
            FETCH cursor1 INTO seq,realname,savename;
            
            SET total = (SELECT 
                            COUNT(*)
                            FROM (SELECT bd_no FROM rapa2013.frame_board_trend) bt, rapa2013.FRAME_BOARD_FILE BF 
                            WHERE BF.bc_no = token AND BF.bd_no = bt.bd_no);
            
            IF done THEN LEAVE my_loop;
            END IF;
            
            IF(seq != che) then
                SET file_id = file_id + 1;
                INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,0
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1)); 
                    SET countt = 0;
                ELSEIF(seq = che) then
                    SET countt = countt + 1;
                    INSERT INTO T_ATCH_FILE_DETAIL (ATCH_FILE_ID,FILE_SN,FILE_STRE_COURS,STRE_FILE_NM,ORIGN_FILE_NM,FILE_EXTSN)
                    VALUES( 
                    (SELECT CONCAT(TABLE_NAME,LPAD(NEXT_ID + file_id,16,'0')) FROM T_IDS WHERE TABLE_NAME = "FILE")
                    ,countt
                    ,'C:\\ips_attch\\attach\\rapa'
                    ,savename
                    ,realname
                    ,SUBSTRING_INDEX(savename,'.',-1));
                        
            END IF;
            SET che = seq;
              
        END LOOP;
        CLOSE cursor1;
    END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
