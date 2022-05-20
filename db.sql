-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- jung 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `jung` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `jung`;

-- 테이블 jung.answer 구조 내보내기
CREATE TABLE IF NOT EXISTS `answer` (
  `a` varchar(50) NOT NULL,
  `q_num` int(11) NOT NULL,
  `a_num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`a_num`),
  KEY `q_num` (`q_num`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`q_num`) REFERENCES `question` (`q_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.answer:~11 rows (대략적) 내보내기
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` (`a`, `q_num`, `a_num`) VALUES
	('ㄱ1', 89, 126),
	('ㄱ2', 89, 127),
	('ㄱ3', 89, 128),
	('ㅊ1', 90, 129),
	('ㅊ2', 90, 130),
	('ㅊ3', 90, 131),
	('ㄷ1', 91, 132),
	('ㄷ2', 91, 133),
	('ㄷ3', 91, 134),
	('ㄷ4', 91, 135),
	('ㄷ5', 91, 136);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;

-- 테이블 jung.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `b_idx` int(10) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) NOT NULL,
  `b_content` varchar(255) NOT NULL,
  `b_date` varchar(255) NOT NULL,
  `b_writer` varchar(255) NOT NULL,
  `u_idx` int(10) DEFAULT NULL,
  PRIMARY KEY (`b_idx`),
  KEY `u_idx` (`u_idx`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`u_idx`) REFERENCES `user` (`u_idx`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.board:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` (`b_idx`, `b_title`, `b_content`, `b_date`, `b_writer`, `u_idx`) VALUES
	(1, '제목', '내용입니다.', '2021-11-09', '작성자', 1);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;

-- 테이블 jung.boardlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `boardlist` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) DEFAULT NULL,
  `b_content` varchar(255) DEFAULT NULL,
  `b_writer` varchar(50) NOT NULL,
  `b_datetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `b_hit` int(11) NOT NULL DEFAULT 0,
  `groups` int(11) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `fileName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`b_id`) USING BTREE,
  KEY `b_writer` (`b_writer`) USING BTREE,
  CONSTRAINT `boardlist_ibfk_1` FOREIGN KEY (`b_writer`) REFERENCES `lc_user1` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 jung.boardlist:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `boardlist` DISABLE KEYS */;
INSERT INTO `boardlist` (`b_id`, `b_title`, `b_content`, `b_writer`, `b_datetime`, `b_hit`, `groups`, `orders`, `depth`, `fileName`) VALUES
	(66, 'y', 'tu', 'c', '2021-12-14 09:54:37', 1, 66, 1, 0, NULL),
	(67, 'ghgfj', 'yfju', 'c', '2021-12-14 12:05:11', 2, 67, 1, 0, NULL),
	(68, 'pl', 'p', 'c', '2021-12-14 11:38:54', 2, 68, 1, 0, NULL),
	(69, 'xx', 'i9o-', 'c', '2021-12-17 09:26:18', 7, 69, 1, 0, NULL),
	(97, 'test', 'test', 'c', '2021-12-15 11:21:55', 8, 97, 1, 0, NULL),
	(98, '안녕', 'ㄹㄹㄹ', 'c', '2021-12-16 09:12:09', 18, 98, 1, 0, NULL),
	(102, 'ㅇㅇㅇ', 'ㅇㅇㅇ', 'c', '2021-12-27 11:23:39', 7, 102, 1, 0, 'tte.txt'),
	(103, 'ddd', 'ddd', 'zaza', '2021-12-27 11:23:29', 3, 103, 1, 0, NULL),
	(104, 'aa', 'aa', 'zaza', '2021-12-17 09:28:14', 1, 104, 1, 0, NULL);
/*!40000 ALTER TABLE `boardlist` ENABLE KEYS */;

-- 테이블 jung.lc_auth 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_auth` (
  `u_id` varchar(50) NOT NULL,
  `u_auth` varchar(50) NOT NULL,
  PRIMARY KEY (`u_id`,`u_auth`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.lc_auth:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_auth` DISABLE KEYS */;
INSERT INTO `lc_auth` (`u_id`, `u_auth`) VALUES
	('abc', 'ROLE_USER'),
	('c', 'ROLE_ADMIN'),
	('c', 'ROLE_USER'),
	('test', 'ROLE_USER'),
	('tt', 'ROLE_USER'),
	('zaza', 'ROLE_ADMIN'),
	('zaza', 'ROLE_USER');
/*!40000 ALTER TABLE `lc_auth` ENABLE KEYS */;

-- 테이블 jung.lc_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_board` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) DEFAULT NULL,
  `b_content` varchar(255) DEFAULT NULL,
  `b_writer` varchar(50) NOT NULL,
  `b_datetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `b_hit` int(11) NOT NULL DEFAULT 0,
  `groups` int(11) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `fileName` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `b_writer` (`b_writer`),
  CONSTRAINT `lc_board_ibfk_1` FOREIGN KEY (`b_writer`) REFERENCES `lc_user1` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.lc_board:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_board` DISABLE KEYS */;
INSERT INTO `lc_board` (`b_id`, `b_title`, `b_content`, `b_writer`, `b_datetime`, `b_hit`, `groups`, `orders`, `depth`, `fileName`) VALUES
	(66, 'y', 'tu', 'c', '2021-12-14 09:54:37', 1, 66, 1, 0, NULL),
	(67, 'ghgfj', 'yfju', 'c', '2021-12-14 12:05:11', 2, 67, 1, 0, NULL),
	(68, 'pl', 'p', 'c', '2021-12-14 11:38:54', 2, 68, 1, 0, NULL),
	(69, 'xx', 'i9o-', 'c', '2021-12-17 09:26:18', 7, 69, 1, 0, NULL),
	(97, 'test', 'test', 'c', '2021-12-15 11:21:55', 8, 97, 1, 0, NULL),
	(98, '안녕', 'ㄹㄹㄹ', 'c', '2021-12-16 09:12:09', 18, 98, 1, 0, NULL),
	(102, 'ㅇㅇㅇ', 'ㅇㅇㅇ', 'c', '2021-12-27 11:23:39', 7, 102, 1, 0, 'tte.txt'),
	(103, 'ddd', 'ddd', 'zaza', '2021-12-27 11:23:29', 3, 103, 1, 0, NULL),
	(104, 'aa', 'aa', 'zaza', '2021-12-17 09:28:14', 1, 104, 1, 0, NULL);
/*!40000 ALTER TABLE `lc_board` ENABLE KEYS */;

-- 테이블 jung.lc_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_reply` (
  `bId` int(11) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `groups` int(11) NOT NULL DEFAULT 0,
  `orders` int(11) NOT NULL DEFAULT 0,
  `depth` int(11) NOT NULL DEFAULT 0,
  `r_num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`r_num`),
  KEY `writer` (`writer`),
  KEY `bId` (`bId`),
  CONSTRAINT `lc_reply_ibfk_1` FOREIGN KEY (`bId`) REFERENCES `lc_board` (`b_id`),
  CONSTRAINT `lc_reply_ibfk_2` FOREIGN KEY (`writer`) REFERENCES `lc_user1` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.lc_reply:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_reply` DISABLE KEYS */;
INSERT INTO `lc_reply` (`bId`, `content`, `writer`, `datetime`, `groups`, `orders`, `depth`, `r_num`) VALUES
	(97, '1', 'c', '2021-12-14 22:53:06', 1, 1, 0, 1),
	(97, '1', 'c', '2021-12-14 23:08:18', 2, 1, 0, 2),
	(97, '1', 'c', '2021-12-14 23:08:43', 3, 1, 0, 3),
	(98, 'ㅁㄴㄷㄱㄹ', 'c', '2021-12-15 10:27:37', 4, 1, 0, 4),
	(98, 'ㄴㄷㅇㄹ', 'c', '2021-12-15 10:33:24', 5, 1, 0, 5),
	(98, 'rr', 'c', '2021-12-15 12:07:10', 7, 1, 0, 7);
/*!40000 ALTER TABLE `lc_reply` ENABLE KEYS */;

-- 테이블 jung.lc_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_user` (
  `u_id` varchar(50) DEFAULT NULL,
  `u_password` varchar(50) DEFAULT NULL,
  `u_name` varchar(50) DEFAULT NULL,
  `u_age` int(11) DEFAULT NULL,
  `u_datetime` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.lc_user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_user` DISABLE KEYS */;
INSERT INTO `lc_user` (`u_id`, `u_password`, `u_name`, `u_age`, `u_datetime`) VALUES
	('aaa', 'aaa', 'aa', 10, '2021-12-01 00:00:00'),
	('test1', '1234', 'kim', 20, '2021-12-02 09:55:56'),
	('test1', '1234', 'kim', 20, '2021-12-03 16:36:58');
/*!40000 ALTER TABLE `lc_user` ENABLE KEYS */;

-- 테이블 jung.lc_user1 구조 내보내기
CREATE TABLE IF NOT EXISTS `lc_user1` (
  `u_id` varchar(50) NOT NULL,
  `u_password` varchar(200) DEFAULT NULL,
  `u_name` varchar(200) DEFAULT NULL,
  `u_datetime` datetime DEFAULT current_timestamp(),
  `u_isAccountNonExpired` tinyint(10) DEFAULT NULL,
  `u_isAccountNonLocked` tinyint(10) DEFAULT NULL,
  `u_isCredentialNonExpired` tinyint(10) DEFAULT NULL,
  `u_isEnabled` tinyint(10) DEFAULT NULL,
  `u_auth` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.lc_user1:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lc_user1` DISABLE KEYS */;
INSERT INTO `lc_user1` (`u_id`, `u_password`, `u_name`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`, `u_auth`) VALUES
	('abc', '$2a$10$08XR0uPaiUX.YWh9pxGu8.suYdnnp/m2XsxPj0dxi7mbCRi8ej1Vq', 'abc', '2021-12-06 09:28:58', 1, 1, 1, 1, 0),
	('c', '$2a$10$OHE7XzHKtO25Vo5Hk4QTKOEW1ecLCrisEwdlh7HNIgUfxcu5fxNiK', 'c', '2021-12-06 09:32:58', 1, 1, 1, 1, 1),
	('qqq', '$2a$10$m84mPoZUFe0TNsuMs76Zh.qsYVRgwggh5FxyHS6xv6NKIcCH.G1Jy', 'qqq', '2021-12-10 11:29:09', 1, 1, 1, 1, 0),
	('test', '$2a$10$hUKBj0KXyq.LedcVeqv4YONVdE2yzwF7Uk.G2rYmcCsNBOQe3RXoG', 'test', '2021-12-04 14:25:02', 1, 1, 1, 1, 0),
	('tt', '$2a$10$QLbzS8zTg1.2WJ2LSdrMLOoU6FRzDXJGj8TyBoePrVK/3//ZTEswe', 'tt', '2021-12-04 14:25:23', 1, 1, 1, 1, 0),
	('zaza', '$2a$10$aKo6SCUkDM8OFvkAfB2dKegmqPgIE329b.FihTSsrmA5SLUbvVHwK', 'zaza', '2021-12-10 11:32:44', 1, 1, 1, 1, 0);
/*!40000 ALTER TABLE `lc_user1` ENABLE KEYS */;

-- 테이블 jung.question 구조 내보내기
CREATE TABLE IF NOT EXISTS `question` (
  `s_num` int(11) DEFAULT NULL,
  `q_num` int(11) NOT NULL AUTO_INCREMENT,
  `t` varchar(50) DEFAULT NULL,
  `q` varchar(50) DEFAULT NULL,
  `filename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`q_num`) USING BTREE,
  KEY `s_num` (`s_num`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`s_num`) REFERENCES `survey` (`s_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.question:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` (`s_num`, `q_num`, `t`, `q`, `filename`) VALUES
	(70, 87, 'ShortQ', '1번 단답', NULL),
	(70, 88, 'LongQ', '2번 장문', NULL),
	(70, 89, 'RadioQ', '3번 객관식', NULL),
	(70, 90, 'CheckQ', '4번 체크', NULL),
	(70, 91, 'DropQ', '드롭다운마지막', NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

-- 테이블 jung.sanswer 구조 내보내기
CREATE TABLE IF NOT EXISTS `sanswer` (
  `ans_num` int(11) NOT NULL AUTO_INCREMENT,
  `sub_num` int(11) DEFAULT NULL,
  `q_num` int(11) DEFAULT NULL,
  `a` varchar(50) DEFAULT NULL,
  `t` varchar(50) DEFAULT NULL,
  `s_num` int(11) NOT NULL,
  PRIMARY KEY (`ans_num`),
  KEY `sub_num` (`sub_num`),
  KEY `q_num` (`q_num`),
  KEY `s_num` (`s_num`),
  CONSTRAINT `sanswer_ibfk_1` FOREIGN KEY (`sub_num`) REFERENCES `submission` (`sub_num`),
  CONSTRAINT `sanswer_ibfk_2` FOREIGN KEY (`q_num`) REFERENCES `question` (`q_num`),
  CONSTRAINT `sanswer_ibfk_3` FOREIGN KEY (`s_num`) REFERENCES `survey` (`s_num`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.sanswer:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `sanswer` DISABLE KEYS */;
/*!40000 ALTER TABLE `sanswer` ENABLE KEYS */;

-- 테이블 jung.spring_session 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint(20) NOT NULL,
  `LAST_ACCESS_TIME` bigint(20) NOT NULL,
  `MAX_INACTIVE_INTERVAL` int(11) NOT NULL,
  `EXPIRY_TIME` bigint(20) NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.spring_session:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;

-- 테이블 jung.spring_session_attributes 구조 내보내기
CREATE TABLE IF NOT EXISTS `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.spring_session_attributes:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;

-- 테이블 jung.submission 구조 내보내기
CREATE TABLE IF NOT EXISTS `submission` (
  `s_num` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `disc` varchar(50) NOT NULL,
  `writer` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `sub_num` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`sub_num`),
  KEY `s_num` (`s_num`),
  CONSTRAINT `submission_ibfk_1` FOREIGN KEY (`s_num`) REFERENCES `survey` (`s_num`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.submission:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `submission` DISABLE KEYS */;
/*!40000 ALTER TABLE `submission` ENABLE KEYS */;

-- 테이블 jung.survey 구조 내보내기
CREATE TABLE IF NOT EXISTS `survey` (
  `s_num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `disc` varchar(200) DEFAULT NULL,
  `writer` varchar(50) NOT NULL,
  `datetime` datetime NOT NULL DEFAULT current_timestamp(),
  `hit` int(100) NOT NULL DEFAULT 0,
  PRIMARY KEY (`s_num`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.survey:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `survey` DISABLE KEYS */;
INSERT INTO `survey` (`s_num`, `title`, `disc`, `writer`, `datetime`, `hit`) VALUES
	(70, '제목입니당', '설명입니다', 'aa', '2022-01-22 17:13:54', 0);
/*!40000 ALTER TABLE `survey` ENABLE KEYS */;

-- 테이블 jung.test 구조 내보내기
CREATE TABLE IF NOT EXISTS `test` (
  `b_idx` int(10) NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) NOT NULL,
  `b_content` varchar(255) NOT NULL,
  `b_date` datetime NOT NULL,
  `u_idx` int(10) NOT NULL,
  `b_hit` int(10) NOT NULL DEFAULT 0,
  `groups` int(11) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `depth` int(11) NOT NULL DEFAULT 0,
  `b_file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`b_idx`),
  KEY `u_idx` (`u_idx`),
  CONSTRAINT `test_ibfk_1` FOREIGN KEY (`u_idx`) REFERENCES `user` (`u_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.test:~26 rows (대략적) 내보내기
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
INSERT INTO `test` (`b_idx`, `b_title`, `b_content`, `b_date`, `u_idx`, `b_hit`, `groups`, `orders`, `depth`, `b_file`) VALUES
	(99, '1', 'l', '2021-11-19 09:59:04', 11, 3, 99, 1, 0, NULL),
	(100, '3', 'ㅇㅇㅇ', '2021-11-19 05:22:50', 11, 44, 100, 1, 0, NULL),
	(101, '1-1', ';', '2021-11-19 09:59:15', 11, 3, 99, 5, 1, NULL),
	(102, '1-2', 'p0', '2021-11-19 09:59:22', 11, 2, 99, 3, 1, NULL),
	(103, '1-1 /1', 'jnj', '2021-11-19 10:06:22', 11, 0, 99, 9, 2, NULL),
	(104, '1-1 / 2', '[[', '2021-11-19 10:06:32', 11, 3, 99, 6, 2, NULL),
	(105, '112 -1', '[[', '2021-11-19 10:06:55', 11, 0, 99, 8, 3, NULL),
	(106, '112 -2', '[[', '2021-11-19 10:07:09', 11, 0, 99, 7, 3, NULL),
	(107, '2-1', '[', '2021-11-19 10:07:23', 11, 1, 100, 2, 1, NULL),
	(108, '1-3', '[[', '2021-11-19 10:07:34', 11, 2, 99, 2, 1, NULL),
	(109, '1-2 /1', '[[', '2021-11-19 10:07:57', 11, 0, 99, 4, 2, NULL),
	(113, '글', 'ㄹㄹㄹ', '2021-11-19 05:21:23', 11, 1, 113, 1, 0, NULL),
	(114, '글2', 'ㅇㅇㅇ', '2021-11-19 05:21:32', 11, 23, 114, 1, 0, NULL),
	(115, '답글', 'ㄴㄴㄴ', '2021-11-19 05:21:44', 11, 1, 113, 2, 1, NULL),
	(116, '수정', 'ㅇㅇ', '2021-11-19 05:22:16', 11, 3, 113, 3, 2, NULL),
	(117, 'tt', 'tt', '2021-11-19 07:45:40', 11, 3, 117, 1, 0, NULL),
	(121, 'zz', 'zz', '2021-11-25 04:16:13', 11, 0, 121, 1, 0, NULL),
	(122, 'zz', 'zz', '2021-11-25 04:58:11', 11, 4, 122, 1, 0, NULL),
	(123, 'f', 'f', '2021-11-25 04:59:30', 11, 7, 123, 1, 0, NULL),
	(135, 'TRYH', 'EY', '2021-11-26 10:07:19', 11, 1, 135, 1, 0, '추상.txt'),
	(136, 'ZZZ', 'ZZZZ', '2021-11-26 10:07:48', 11, 8, 136, 1, 0, '추상.txt,인터.txt'),
	(156, 'ㅇㄴㅇ', '9946A4505F5817A60D.png', '2021-11-26 11:22:13', 11, 4, 156, 1, 0, '9946A4505F5817A60D.png'),
	(157, 'ad', 'asd', '2021-12-13 10:42:37', 11, 0, 157, 1, 0, 'web - 복사본.xml'),
	(158, 'g', 'g', '2021-12-14 10:23:42', 11, 0, 158, 1, 0, 'ssawe.jpg'),
	(159, 'r', 'r', '2021-12-14 10:24:57', 11, 0, 159, 1, 0, 'ssawe.jpg'),
	(160, 'r', 'e', '2021-12-14 10:26:24', 11, 0, 160, 1, 0, 'ssawe.jpg');
/*!40000 ALTER TABLE `test` ENABLE KEYS */;

-- 테이블 jung.test_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `test_reply` (
  `c_num` int(10) NOT NULL AUTO_INCREMENT,
  `b_idx` int(11) NOT NULL DEFAULT 0,
  `u_idx` int(11) NOT NULL DEFAULT 0,
  `c_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `c_content` varchar(255) NOT NULL,
  `groups` int(11) NOT NULL DEFAULT 0,
  `orders` int(11) NOT NULL DEFAULT 0,
  `depth` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`c_num`),
  KEY `u_idx` (`u_idx`),
  KEY `b_idx` (`b_idx`),
  CONSTRAINT `test_reply_ibfk_1` FOREIGN KEY (`u_idx`) REFERENCES `user` (`u_idx`),
  CONSTRAINT `test_reply_ibfk_2` FOREIGN KEY (`b_idx`) REFERENCES `test` (`b_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.test_reply:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `test_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_reply` ENABLE KEYS */;

-- 테이블 jung.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `u_idx` int(10) NOT NULL AUTO_INCREMENT,
  `u_id` varchar(255) NOT NULL,
  `u_pw` varchar(255) NOT NULL,
  `u_name` varchar(255) NOT NULL,
  `u_tel` varchar(255) NOT NULL,
  `u_age` varchar(255) NOT NULL,
  `manager` int(11) NOT NULL DEFAULT 0,
  `u_datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`u_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.user:~19 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`u_idx`, `u_id`, `u_pw`, `u_name`, `u_tel`, `u_age`, `manager`, `u_datetime`) VALUES
	(1, 'abc', '1234', 'NAME1', '010-0000-0000', '50', 1, '0000-00-00 00:00:00'),
	(3, 'rlaEodEOd', '111', '김땡땡', '010-1111-1111', '20', 0, '0000-00-00 00:00:00'),
	(4, 'b', '222', '이모씨', '010-2222-2222', '37', 0, '0000-00-00 00:00:00'),
	(5, 'ccc', '34343', '강하다', '010-2121-3232', '58', 0, '0000-00-00 00:00:00'),
	(6, 'dfdf', '545', '홍길동', '010-2898-4767', '44', 0, '0000-00-00 00:00:00'),
	(7, 'zyzy', '252d', '대한민국', '010-4747-3634', '88', 0, '0000-00-00 00:00:00'),
	(8, 'a1234', 'bbbb', '만세', '010-8487-7978', '69', 0, '0000-00-00 00:00:00'),
	(9, 'baba', 'cfdfd', '바비', '010-8787-1111', '56', 0, '0000-00-00 00:00:00'),
	(10, 'wew', 'qqqq', '박찬호', '010-7777-3232', '50', 0, '0000-00-00 00:00:00'),
	(11, 'a1', '5555', '강호동', '090-4343-4444', '32', 1, '0000-00-00 00:00:00'),
	(12, 'b1', '1111', '박길동', '090-3333-7777', '49', 0, '0000-00-00 00:00:00'),
	(13, 'bb1', '2222', '고길돌', '090-4444-6666', '61', 0, '0000-00-00 00:00:00'),
	(16, 'gbhuj', '1234', 'ok', '1-1-1', '11', 0, '0000-00-00 00:00:00'),
	(18, 'abcd', 'efg', 'abcd', '010-1234-1234', '30', 0, '0000-00-00 00:00:00'),
	(20, 'ttt', 'zxczxc', 'ttt', '010-7894-1412', '30', 0, '0000-00-00 00:00:00'),
	(21, 'zzxx', 'zzxx', 'zzxx', '010-1111-2222', '11', 0, '0000-00-00 00:00:00'),
	(22, 'gg', 'aa', 'aa', 'a-a-a', 'aa', 0, '0000-00-00 00:00:00'),
	(23, 'zxc', 'zxc', 'zxc', 'zxc-zxc-zxc', 'zxc', 0, '0000-00-00 00:00:00'),
	(24, 'ㅇㅇㅇ', '123123', 'ddd', '1231-1231-1231', '12', 0, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- 테이블 jung.userauth 구조 내보내기
CREATE TABLE IF NOT EXISTS `userauth` (
  `u_id` varchar(50) NOT NULL,
  `u_auth` varchar(50) NOT NULL,
  PRIMARY KEY (`u_id`,`u_auth`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 jung.userauth:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `userauth` DISABLE KEYS */;
INSERT INTO `userauth` (`u_id`, `u_auth`) VALUES
	('aa', 'ROLE_ADMIN'),
	('aa', 'ROLE_USER'),
	('asd', 'ROLE_USER'),
	('dd', 'ROLE_USER'),
	('mm', 'ROLE_USER'),
	('zz', 'ROLE_USER');
/*!40000 ALTER TABLE `userauth` ENABLE KEYS */;

-- 테이블 jung.userlist 구조 내보내기
CREATE TABLE IF NOT EXISTS `userlist` (
  `u_id` varchar(50) NOT NULL,
  `u_password` varchar(200) DEFAULT NULL,
  `u_name` varchar(200) DEFAULT NULL,
  `u_phone` int(50) DEFAULT NULL,
  `u_datetime` datetime DEFAULT current_timestamp(),
  `u_isAccountNonExpired` tinyint(10) DEFAULT NULL,
  `u_isAccountNonLocked` tinyint(10) DEFAULT NULL,
  `u_isCredentialNonExpired` tinyint(10) DEFAULT NULL,
  `u_isEnabled` tinyint(10) DEFAULT NULL,
  `u_auth` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`u_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 jung.userlist:~6 rows (대략적) 내보내기
/*!40000 ALTER TABLE `userlist` DISABLE KEYS */;
INSERT INTO `userlist` (`u_id`, `u_password`, `u_name`, `u_phone`, `u_datetime`, `u_isAccountNonExpired`, `u_isAccountNonLocked`, `u_isCredentialNonExpired`, `u_isEnabled`, `u_auth`) VALUES
	('aa', '$2a$10$EDtcH3Ptp1BqdPxSU5TKpe7W3v/rf9NieuJtWr6g.MnCk3nrSLr.G', 'aa', 123123, '2022-01-10 18:23:31', 1, 1, 1, 1, 0),
	('asd', '$2a$10$WegzPvLl9oC2infDhUVwSuVcYFvwNoi3kHQXQ4AXJgQZKhg8l33XS', 'asd', 666666, '2022-01-11 00:35:46', 1, 1, 1, 1, 0),
	('dd', '$2a$10$RK2KuyFh.117wW4dxpRTd.mbgyO8E.7oej8WzHsWNW4XJsDrwBJEq', 'dd', 44333222, '2022-01-11 00:35:34', 1, 1, 1, 1, 0),
	('mm', '$2a$10$fUOchc8UaZGkXNPPytuBp.P550ijxGLKZzzOBi7VUSm2P2RpIGLve', 'mm', 1232354325, '2022-01-17 19:08:36', 1, 1, 1, 1, 0),
	('ss', '$2a$10$3m/vLqO/2y.fMU/UmpSzlOO3wVNGZHPI0jaj6PnLZF3ZSgitWfm/S', 'ss', 123123, '2022-01-17 18:58:51', 1, 1, 1, 1, 0),
	('zz', '$2a$10$53ziV3dMpSjlXdVjtYKA..8z/MVTaQVAsyT95xfNFYVz1v8XxKvpO', 'zz', 222333, '2022-01-11 00:35:26', 1, 1, 1, 1, 0);
/*!40000 ALTER TABLE `userlist` ENABLE KEYS */;

-- 테이블 jung.vue_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `vue_board` (
  `b_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `datetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hit` int(11) DEFAULT 0,
  `groups` int(11) DEFAULT 0,
  `orders` int(11) DEFAULT 0,
  `depth` int(11) DEFAULT 0,
  `filename` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`b_id`),
  KEY `writer` (`writer`),
  CONSTRAINT `vue_board_ibfk_1` FOREIGN KEY (`writer`) REFERENCES `userlist` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.vue_board:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `vue_board` DISABLE KEYS */;
INSERT INTO `vue_board` (`b_id`, `title`, `content`, `writer`, `datetime`, `hit`, `groups`, `orders`, `depth`, `filename`) VALUES
	(45, 'test??', 'testhhh', 'aa', '2022-01-14 23:54:10', 0, 45, 1, 0, '풍경.jpg,풍경사진.jpg,web - 복사본.xml'),
	(46, 'ff', 'fff', 'aa', '2022-01-15 01:01:19', 0, 46, 1, 0, '풍경.jpg'),
	(47, 'jj', 'jj', 'aa', '2022-01-15 01:03:09', 0, 47, 1, 0, '풍경.jpg'),
	(48, '제목', '내용', 'aa', '2022-01-15 01:22:37', 1, 48, 1, 0, NULL),
	(49, '풍경파일', 'ㅇㅇ', 'aa', '2022-01-15 01:22:49', 0, 49, 1, 0, '풍경.jpg');
/*!40000 ALTER TABLE `vue_board` ENABLE KEYS */;

-- 테이블 jung.vue_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `vue_comment` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `bid` int(11) DEFAULT NULL,
  `content` varchar(50) DEFAULT NULL,
  `writer` varchar(50) DEFAULT NULL,
  `datetime` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `groups` int(11) DEFAULT 0,
  `orders` int(11) DEFAULT 0,
  `depth` int(11) DEFAULT 0,
  PRIMARY KEY (`c_id`),
  KEY `bid` (`bid`),
  KEY `writer` (`writer`),
  CONSTRAINT `vue_comment_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `vue_board` (`b_id`),
  CONSTRAINT `vue_comment_ibfk_2` FOREIGN KEY (`writer`) REFERENCES `userlist` (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.vue_comment:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `vue_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `vue_comment` ENABLE KEYS */;

-- 테이블 jung.vue_reanswers 구조 내보내기
CREATE TABLE IF NOT EXISTS `vue_reanswers` (
  `rea_num` int(11) NOT NULL AUTO_INCREMENT,
  `r_num` int(11) DEFAULT NULL,
  `a` varchar(50) DEFAULT NULL,
  `s_num` int(11) DEFAULT NULL,
  `q_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`rea_num`),
  KEY `r_num` (`r_num`),
  KEY `s_num` (`s_num`),
  CONSTRAINT `vue_reanswers_ibfk_1` FOREIGN KEY (`r_num`) REFERENCES `vue_response` (`r_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `vue_reanswers_ibfk_2` FOREIGN KEY (`s_num`) REFERENCES `survey` (`s_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.vue_reanswers:~32 rows (대략적) 내보내기
/*!40000 ALTER TABLE `vue_reanswers` DISABLE KEYS */;
INSERT INTO `vue_reanswers` (`rea_num`, `r_num`, `a`, `s_num`, `q_num`) VALUES
	(34, 30, '1', 70, 87),
	(35, 31, '2', 70, 88),
	(36, 32, 'ㄱ3', 70, 89),
	(37, 33, 'ㅊ2', 70, 90),
	(38, 33, 'ㅊ3', 70, 90),
	(39, 33, 'ㅊ1', 70, 90),
	(40, 34, 'ㄷ5', 70, 91),
	(41, 35, '111', 70, 87),
	(42, 36, '222', 70, 88),
	(43, 37, 'ㄱ2', 70, 89),
	(44, 38, 'ㅊ2', 70, 90),
	(45, 38, 'ㅊ3', 70, 90),
	(46, 39, 'ㄷ4', 70, 91),
	(47, 40, '1111', 70, 87),
	(48, 41, '2222', 70, 88),
	(49, 42, 'ㄱ2', 70, 89),
	(50, 43, 'ㅊ2', 70, 90),
	(51, 43, 'ㅊ3', 70, 90),
	(52, 44, 'ㄷ5', 70, 91),
	(60, 50, 'test', 70, 87),
	(61, 51, 'testets', 70, 88),
	(62, 52, 'ㄱ2', 70, 89),
	(63, 53, 'ㅊ1', 70, 90),
	(64, 53, 'ㅊ2', 70, 90),
	(65, 54, 'ㄷ1', 70, 91),
	(66, 55, 'aaa', 70, 87),
	(67, 56, 'bbbbbbb', 70, 88),
	(68, 57, 'ㄱ1', 70, 89),
	(69, 58, 'ㅊ1', 70, 90),
	(70, 58, 'ㅊ2', 70, 90),
	(71, 58, 'ㅊ3', 70, 90),
	(72, 59, 'ㄷ3', 70, 91);
/*!40000 ALTER TABLE `vue_reanswers` ENABLE KEYS */;

-- 테이블 jung.vue_response 구조 내보내기
CREATE TABLE IF NOT EXISTS `vue_response` (
  `r_num` int(11) NOT NULL AUTO_INCREMENT,
  `sub_num` int(11) DEFAULT NULL,
  `q_num` int(11) DEFAULT NULL,
  `t` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`r_num`),
  KEY `sub_num` (`sub_num`),
  CONSTRAINT `vue_response_ibfk_1` FOREIGN KEY (`sub_num`) REFERENCES `vue_submission` (`sub_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.vue_response:~37 rows (대략적) 내보내기
/*!40000 ALTER TABLE `vue_response` DISABLE KEYS */;
INSERT INTO `vue_response` (`r_num`, `sub_num`, `q_num`, `t`) VALUES
	(30, 11, 87, 'ShortQ'),
	(31, 11, 88, 'LongQ'),
	(32, 11, 89, 'RadioQ'),
	(33, 11, 90, 'CheckQ'),
	(34, 11, 91, 'DropQ'),
	(35, 12, 87, 'ShortQ'),
	(36, 12, 88, 'LongQ'),
	(37, 12, 89, 'RadioQ'),
	(38, 12, 90, 'CheckQ'),
	(39, 12, 91, 'DropQ'),
	(40, 13, 87, 'ShortQ'),
	(41, 13, 88, 'LongQ'),
	(42, 13, 89, 'RadioQ'),
	(43, 13, 90, 'CheckQ'),
	(44, 13, 91, 'DropQ'),
	(50, 15, 87, 'ShortQ'),
	(51, 15, 88, 'LongQ'),
	(52, 15, 89, 'RadioQ'),
	(53, 15, 90, 'CheckQ'),
	(54, 15, 91, 'DropQ'),
	(55, 16, 87, 'ShortQ'),
	(56, 16, 88, 'LongQ'),
	(57, 16, 89, 'RadioQ'),
	(58, 16, 90, 'CheckQ'),
	(59, 16, 91, 'DropQ'),
	(60, 17, 97, 'ShortQ'),
	(61, 17, 98, 'RadioQ'),
	(62, 17, 99, 'DropQ'),
	(63, 18, 97, 'ShortQ'),
	(64, 18, 98, 'RadioQ'),
	(65, 18, 99, 'DropQ'),
	(66, 19, 97, 'ShortQ'),
	(67, 19, 98, 'RadioQ'),
	(68, 19, 99, 'DropQ'),
	(69, 20, 97, 'ShortQ'),
	(70, 20, 98, 'RadioQ'),
	(71, 20, 99, 'DropQ');
/*!40000 ALTER TABLE `vue_response` ENABLE KEYS */;

-- 테이블 jung.vue_submission 구조 내보내기
CREATE TABLE IF NOT EXISTS `vue_submission` (
  `sub_num` int(11) NOT NULL AUTO_INCREMENT,
  `s_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`sub_num`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- 테이블 데이터 jung.vue_submission:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `vue_submission` DISABLE KEYS */;
INSERT INTO `vue_submission` (`sub_num`, `s_num`) VALUES
	(11, 70),
	(12, 70),
	(13, 70),
	(15, 70),
	(16, 70),
	(17, 72),
	(18, 72),
	(19, 72),
	(20, 72);
/*!40000 ALTER TABLE `vue_submission` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
