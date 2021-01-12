/*
SQLyog Ultimate - MySQL GUI v8.2 
MySQL - 5.5.5-10.3.7-MariaDB : Database - mysql-db
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mysql-db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mysql-db`;

/*Table structure for table `student` */

DROP TABLE IF EXISTS `student`;

CREATE TABLE `student` (
  `id` varchar(4) NOT NULL,
  `NAME` varchar(20) DEFAULT NULL,
  `sex` char(2) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `salary` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `student` */

insert  into `student`(`id`,`NAME`,`sex`,`birthday`,`salary`) values ('1','张慎政','男','2020-01-01','10000.00'),('2','刘沛霞','女','2020-01-02','10000.00'),('3','刘昱江','男','2020-01-03','10000.00'),('4','齐雷','男','2020-01-04','20000.00'),('5','王海涛','男','2020-01-05','20000.00'),('6','董长春','男','2020-01-06','10000.00'),('7','张久军','男','2020-01-07','20000.00'),('8','陈子枢','男','2020-10-11','3000.00');

/*Table structure for table `tb_dept` */

DROP TABLE IF EXISTS `tb_dept`;

CREATE TABLE `tb_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `note` varchar(100) DEFAULT NULL,
  `created` timestamp NOT NULL,
  `updated` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_dept` */

insert  into `tb_dept`(`id`,`name`,`parent_id`,`sort`,`note`,`created`,`updated`) values (1,'集团',0,1,'集团总部','2018-10-02 09:15:14','2018-09-27 16:35:54'),(2,'财务部',1,2,'财务管理','2018-09-27 16:35:52','2018-09-27 16:34:15'),(3,'软件部',1,3,'开发软件、运维','2018-09-27 16:35:54','2018-09-27 16:34:51');

/*Table structure for table `tb_user` */

DROP TABLE IF EXISTS `tb_user`;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `valid` tinyint(4) DEFAULT NULL,
  `created` timestamp NOT NULL,
  `updated` timestamp NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `tb_user` */

insert  into `tb_user`(`id`,`dept_id`,`username`,`password`,`salt`,`email`,`mobile`,`valid`,`created`,`updated`) values (1,1,'陈集团','123456',NULL,'tony@sina.com','13572801415',1,'2018-09-30 09:32:18','2018-09-30 09:32:18'),(2,3,'牛软件','567890',NULL,'niu@sina.com','13208737172',0,'2018-10-02 09:23:19','2018-09-20 09:32:18');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
