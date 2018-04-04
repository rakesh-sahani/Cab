/*
SQLyog Community Edition- MySQL GUI v5.22a
Host - 5.0.19-nt : Database - cabmanagement
*********************************************************************
Server version : 5.0.19-nt
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

create database if not exists `cabmanagement`;

USE `cabmanagement`;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

/*Table structure for table `auto_gen_id` */

DROP TABLE IF EXISTS `auto_gen_id`;

CREATE TABLE `auto_gen_id` (
  `form_name` varchar(100) NOT NULL default '',
  `prefix_id` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auto_gen_id` */

insert  into `auto_gen_id`(`form_name`,`prefix_id`) values ('signup','STU-00004'),('user','User-00004'),('b','B-00002'),('d','D-00005');

/*Table structure for table `bookcab` */

DROP TABLE IF EXISTS `bookcab`;

CREATE TABLE `bookcab` (
  `a1` varchar(100) default NULL,
  `a2` varchar(100) default NULL,
  `a3` varchar(100) default NULL,
  `a4` varchar(100) default NULL,
  `a5` varchar(100) default NULL,
  `a6` varchar(100) default NULL,
  `a7` varchar(100) default NULL,
  `a8` varchar(100) default NULL,
  `a9` varchar(100) default NULL,
  `a10` varchar(100) default NULL,
  `date` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookcab` */

insert  into `bookcab`(`a1`,`a2`,`a3`,`a4`,`a5`,`a6`,`a7`,`a8`,`a9`,`a10`,`date`) values ('B-00002','df','hg','rt','4','6','345343434','pramod@gmail.com','dfdf','Delhi','2015-03-05 11:47:21');

/*Table structure for table `bookcabreply` */

DROP TABLE IF EXISTS `bookcabreply`;

CREATE TABLE `bookcabreply` (
  `a1` varchar(100) default NULL,
  `a2` varchar(100) default NULL,
  `a3` varchar(100) default NULL,
  `a4` varchar(100) default NULL,
  `a5` varchar(100) default NULL,
  `a6` varchar(100) default NULL,
  `a7` varchar(100) default NULL,
  `a8` varchar(100) default NULL,
  `a9` varchar(100) default NULL,
  `a10` varchar(100) default NULL,
  `date` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bookcabreply` */

insert  into `bookcabreply`(`a1`,`a2`,`a3`,`a4`,`a5`,`a6`,`a7`,`a8`,`a9`,`a10`,`date`) values ('B-00002','a','hg','rt','4','6','D-00004','a','dl-0001245','345343434','2015-03-12 20:12:23');

/*Table structure for table `driverdetails` */

DROP TABLE IF EXISTS `driverdetails`;

CREATE TABLE `driverdetails` (
  `UserID` varchar(100) default NULL,
  `uname` varchar(100) default NULL,
  `pass` varchar(100) default NULL,
  `cabdetails` varchar(100) default NULL,
  `routeallo` varchar(100) default NULL,
  `Image` mediumtext,
  `driverid` mediumtext,
  `voterid` mediumtext,
  `adharid` mediumtext,
  `FirstName` varchar(100) default NULL,
  `LastName` varchar(100) default NULL,
  `Gender` varchar(100) default NULL,
  `DOB` varchar(100) default NULL,
  `ContactNo` varchar(100) default NULL,
  `EmailID` varchar(100) default NULL,
  `Address` varchar(100) default NULL,
  `City` varchar(100) default NULL,
  `PinCode` varchar(100) default NULL,
  `State` varchar(100) default NULL,
  `Country` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `driverdetails` */

insert  into `driverdetails`(`UserID`,`uname`,`pass`,`cabdetails`,`routeallo`,`Image`,`driverid`,`voterid`,`adharid`,`FirstName`,`LastName`,`Gender`,`DOB`,`ContactNo`,`EmailID`,`Address`,`City`,`PinCode`,`State`,`Country`) values ('D-00003','as','as','dl-0001245','East Delhi','UserImage_1425539233659.doc',NULL,NULL,NULL,'df','df','Male','','345343434','pramod@gmail.com','dfdf','Gurgoan','33434','dfd','America'),('D-00004','a','a','dl-0001245','East Delhi','UserImage_1425539349630.jpg','UserImage_1425539349630.jpg','UserImage_1425539349630.doc','UserImage_1425539349630.doc','d','df','Female','','345343434','pramod@gmail.com','dfdf','Delhi','33434','','Australia'),('D-00005','q','q','dl-0001245','East Delhi','UserImage_1426149125913.jpg','UserImage_1426149125913.jpg','UserImage_1426149125913.jpg','UserImage_1426149125913.jpg','a','df','Male','','345343434','pramod@gmail.com','dfdf','Delhi','33434','dfd','America');

/*Table structure for table `location` */

DROP TABLE IF EXISTS `location`;

CREATE TABLE `location` (
  `fname` varchar(100) default NULL,
  `enq_date` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `location` */

insert  into `location`(`fname`,`enq_date`) values ('East Delhi','2015-03-13 19:16:10');

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `uname` varchar(50) default NULL,
  `pass` varchar(50) default NULL,
  `image` varchar(50) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `login` */

insert  into `login`(`uname`,`pass`,`image`) values ('a','a',NULL);

/*Table structure for table `payment` */

DROP TABLE IF EXISTS `payment`;

CREATE TABLE `payment` (
  `a1` varchar(100) default NULL,
  `a2` varchar(100) default NULL,
  `a3` varchar(100) default NULL,
  `a4` varchar(100) default NULL,
  `a5` varchar(100) default NULL,
  `a6` varchar(100) default NULL,
  `a7` varchar(100) default NULL,
  `a8` varchar(100) default NULL,
  `a9` varchar(100) default NULL,
  `a10` varchar(100) default NULL,
  `a11` varchar(100) default NULL,
  `a12` varchar(100) default NULL,
  `a13` varchar(100) default NULL,
  `a14` varchar(100) default NULL,
  `a15` varchar(100) default NULL,
  `a16` varchar(100) default NULL,
  `a17` varchar(100) default NULL,
  `date` varchar(100) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `payment` */

insert  into `payment`(`a1`,`a2`,`a3`,`a4`,`a5`,`a6`,`a7`,`a8`,`a9`,`a10`,`a11`,`a12`,`a13`,`a14`,`a15`,`a16`,`a17`,`date`) values ('B-00002','a','hg','rt','4','6','D-00004','a','dl-0001245','44','4','440','Debit Card','Debit Card','440','440','1245','2015-03-13 18:58:16');

/*Table structure for table `signup` */

DROP TABLE IF EXISTS `signup`;

CREATE TABLE `signup` (
  `UserID` varchar(50) NOT NULL default '',
  `uname` varchar(50) NOT NULL default '',
  `pass` varchar(50) default NULL,
  `FirstName` varchar(100) default NULL,
  `LastName` varchar(100) default NULL,
  `Gender` varchar(25) default NULL,
  `DOB` varchar(25) default NULL,
  `ContactNo` varchar(15) default NULL,
  `EmailID` varchar(100) default NULL,
  `Address` varchar(200) default NULL,
  `City` varchar(100) default NULL,
  `PinCode` varchar(10) default NULL,
  `State` varchar(100) default NULL,
  `Country` varchar(100) default NULL,
  `image` varchar(500) default NULL,
  `status` varchar(100) default 'false'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `signup` */

insert  into `signup`(`UserID`,`uname`,`pass`,`FirstName`,`LastName`,`Gender`,`DOB`,`ContactNo`,`EmailID`,`Address`,`City`,`PinCode`,`State`,`Country`,`image`,`status`) values ('User-00004','a','a','df','df','Male','','345343434','pramod@gmail.com','df','Delhi','33434','dfd','America','UserImage_1425469313813.jpg','false');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
