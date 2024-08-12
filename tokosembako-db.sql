/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.27-MariaDB : Database - tokosembako
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `analisa` */

DROP TABLE IF EXISTS `analisa`;

CREATE TABLE `analisa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kombinasi1` varchar(255) DEFAULT NULL,
  `kombinasi2` varchar(255) DEFAULT NULL,
  `keterangan` text DEFAULT NULL,
  `from_itemset` int(11) DEFAULT NULL,
  `id_process` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `analisa` */

insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (1,'susu','sampo','Jika konsumen membeli susu, maka konsumen membeli sampo',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (2,'sampo','susu','Jika konsumen membeli sampo, maka konsumen membeli susu',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (3,'susu','tepung','Jika konsumen membeli susu, maka konsumen membeli tepung',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (4,'tepung','susu','Jika konsumen membeli tepung, maka konsumen membeli susu',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (5,'susu','beras','Jika konsumen membeli susu, maka konsumen membeli beras',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (6,'beras','susu','Jika konsumen membeli beras, maka konsumen membeli susu',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (7,'susu','roti','Jika konsumen membeli susu, maka konsumen membeli roti',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (8,'roti','susu','Jika konsumen membeli roti, maka konsumen membeli susu',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (9,'susu','mentega','Jika konsumen membeli susu, maka konsumen membeli mentega',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (10,'mentega','susu','Jika konsumen membeli mentega, maka konsumen membeli susu',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (11,'sampo','tepung','Jika konsumen membeli sampo, maka konsumen membeli tepung',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (12,'tepung','sampo','Jika konsumen membeli tepung, maka konsumen membeli sampo',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (13,'sampo','beras','Jika konsumen membeli sampo, maka konsumen membeli beras',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (14,'beras','sampo','Jika konsumen membeli beras, maka konsumen membeli sampo',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (15,'sampo','roti','Jika konsumen membeli sampo, maka konsumen membeli roti',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (16,'roti','sampo','Jika konsumen membeli roti, maka konsumen membeli sampo',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (17,'sampo','mentega','Jika konsumen membeli sampo, maka konsumen membeli mentega',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (18,'mentega','sampo','Jika konsumen membeli mentega, maka konsumen membeli sampo',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (19,'tepung','beras','Jika konsumen membeli tepung, maka konsumen membeli beras',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (20,'beras','tepung','Jika konsumen membeli beras, maka konsumen membeli tepung',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (21,'tepung','roti','Jika konsumen membeli tepung, maka konsumen membeli roti',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (22,'roti','tepung','Jika konsumen membeli roti, maka konsumen membeli tepung',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (23,'beras','roti','Jika konsumen membeli beras, maka konsumen membeli roti',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (24,'roti','beras','Jika konsumen membeli roti, maka konsumen membeli beras',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (25,'deterjen','plastik','Jika konsumen membeli deterjen, maka konsumen membeli plastik',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (26,'plastik','deterjen','Jika konsumen membeli plastik, maka konsumen membeli deterjen',2,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (27,'beras, roti','tepung','Jika konsumen membeli beras, roti, tepung, maka konsumen membeli tepung',3,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (28,'beras','roti, tepung','Jika konsumen membeli beras, roti, tepung, maka konsumen membeli roti, tepung',3,2);
insert  into `analisa`(`id`,`kombinasi1`,`kombinasi2`,`keterangan`,`from_itemset`,`id_process`) values (29,'roti, tepung','beras','Jika konsumen membeli roti, tepung, beras, maka konsumen membeli beras',3,2);

/*Table structure for table `confidence` */

DROP TABLE IF EXISTS `confidence`;

CREATE TABLE `confidence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kombinasi1` varchar(255) DEFAULT NULL,
  `kombinasi2` varchar(255) DEFAULT NULL,
  `support_xUy` double DEFAULT NULL,
  `support_x` double DEFAULT NULL,
  `confidence` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL,
  `nilai_uji_lift` double DEFAULT NULL,
  `korelasi_rule` varchar(100) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0,
  `jumlah_a` int(11) DEFAULT NULL,
  `jumlah_b` int(11) DEFAULT NULL,
  `jumlah_ab` int(11) DEFAULT NULL,
  `px` double DEFAULT NULL,
  `py` double DEFAULT NULL,
  `pxuy` double DEFAULT NULL,
  `from_itemset` int(11) DEFAULT NULL COMMENT 'dari itemset 2/3',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `confidence` */

insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (1,'susu','sampo',0.6666666666666666,0.6666666666666666,1,1,0.3,0.5,1.5,'A => B',2,2,2,2,0.6666666666666666,0.6666666666666666,0.6666666666666666,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (2,'sampo','susu',0.6666666666666666,0.6666666666666666,1,1,0.3,0.5,1.5,'B => A',2,2,2,2,0.6666666666666666,0.6666666666666666,0.6666666666666666,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (3,'susu','tepung',0.3333333333333333,0.6666666666666666,0.5,1,0.3,0.5,1.5,'A => B',2,2,1,1,0.6666666666666666,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (4,'tepung','susu',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,1.5,'B => A',2,1,2,1,0.3333333333333333,0.6666666666666666,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (5,'susu','beras',0.3333333333333333,0.6666666666666666,0.5,1,0.3,0.5,1.5,'A => B',2,2,1,1,0.6666666666666666,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (6,'beras','susu',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,1.5,'B => A',2,1,2,1,0.3333333333333333,0.6666666666666666,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (7,'susu','roti',0.3333333333333333,0.6666666666666666,0.5,1,0.3,0.5,1.5,'A => B',2,2,1,1,0.6666666666666666,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (8,'roti','susu',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,1.5,'B => A',2,1,2,1,0.3333333333333333,0.6666666666666666,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (9,'susu','mentega',0.3333333333333333,0.6666666666666666,0.5,1,0.3,0.5,1.5,'A => B',2,2,1,1,0.6666666666666666,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (10,'mentega','susu',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,1.5,'B => A',2,1,2,1,0.3333333333333333,0.6666666666666666,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (11,'sampo','tepung',0.3333333333333333,0.6666666666666666,0.5,1,0.3,0.5,1.5,'A => B',2,2,1,1,0.6666666666666666,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (12,'tepung','sampo',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,1.5,'B => A',2,1,2,1,0.3333333333333333,0.6666666666666666,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (13,'sampo','beras',0.3333333333333333,0.6666666666666666,0.5,1,0.3,0.5,1.5,'A => B',2,2,1,1,0.6666666666666666,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (14,'beras','sampo',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,1.5,'B => A',2,1,2,1,0.3333333333333333,0.6666666666666666,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (15,'sampo','roti',0.3333333333333333,0.6666666666666666,0.5,1,0.3,0.5,1.5,'A => B',2,2,1,1,0.6666666666666666,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (16,'roti','sampo',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,1.5,'B => A',2,1,2,1,0.3333333333333333,0.6666666666666666,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (17,'sampo','mentega',0.3333333333333333,0.6666666666666666,0.5,1,0.3,0.5,1.5,'A => B',2,2,1,1,0.6666666666666666,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (18,'mentega','sampo',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,1.5,'B => A',2,1,2,1,0.3333333333333333,0.6666666666666666,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (19,'tepung','beras',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,3,'A => B',2,1,1,1,0.3333333333333333,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (20,'beras','tepung',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,3,'B => A',2,1,1,1,0.3333333333333333,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (21,'tepung','roti',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,3,'A => B',2,1,1,1,0.3333333333333333,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (22,'roti','tepung',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,3,'B => A',2,1,1,1,0.3333333333333333,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (23,'beras','roti',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,3,'A => B',2,1,1,1,0.3333333333333333,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (24,'roti','beras',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,3,'B => A',2,1,1,1,0.3333333333333333,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (25,'deterjen','plastik',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,3,'A => B',2,1,1,1,0.3333333333333333,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (26,'plastik','deterjen',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,3,'B => A',2,1,1,1,0.3333333333333333,0.3333333333333333,0.3333333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (27,'beras, roti','tepung',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,3,'AB => C',2,1,1,1,0.3333333333333333,0.3333333333333333,0.3333333333333333,3);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (28,'beras','roti, tepung',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,9,'A => BC',2,1,1,1,0.3333333333333333,0.3333333333333333,0.3333333333333333,3);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (29,'roti, tepung','beras',0.3333333333333333,0.3333333333333333,1,1,0.3,0.5,3,'BC => A',2,1,1,1,0.3333333333333333,0.3333333333333333,0.3333333333333333,3);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (30,'beras','tepung',0.33333333333333,0.33333333333333,1,1,0.3,0.5,3,NULL,0,1,1,1,0.33333333333333,0.33333333333333,0.33333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (31,'beras','tepung',0.66666666666667,0.66666666666667,1,1,0.3,0.5,1.5,NULL,0,2,2,2,0.66666666666667,0.66666666666667,0.66666666666667,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (32,'beras','tepung',0.33333333333333,0.66666666666667,0.5,1,0.3,0.5,1.5,NULL,0,2,1,1,0.66666666666667,0.33333333333333,0.33333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (33,'beras','tepung',0.33333333333333,0.66666666666667,0.5,1,0.3,0.5,1.5,NULL,0,2,1,1,0.66666666666667,0.33333333333333,0.33333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (34,'beras','tepung',0.33333333333333,0.66666666666667,0.5,1,0.3,0.5,1.5,NULL,0,2,1,1,0.66666666666667,0.33333333333333,0.33333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (35,'beras','tepung',0.33333333333333,0.66666666666667,0.5,1,0.3,0.5,1.5,NULL,0,2,1,1,0.66666666666667,0.33333333333333,0.33333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (36,'beras','tepung',0.33333333333333,0.66666666666667,0.5,1,0.3,0.5,1.5,NULL,0,2,1,1,0.66666666666667,0.33333333333333,0.33333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (37,'beras','tepung',0.33333333333333,0.66666666666667,0.5,1,0.3,0.5,1.5,NULL,0,2,1,1,0.66666666666667,0.33333333333333,0.33333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (38,'beras','tepung',0.33333333333333,0.66666666666667,0.5,1,0.3,0.5,1.5,NULL,0,2,1,1,0.66666666666667,0.33333333333333,0.33333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (39,'beras','tepung',0.33333333333333,0.66666666666667,0.5,1,0.3,0.5,1.5,NULL,0,2,1,1,0.66666666666667,0.33333333333333,0.33333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (40,'beras','tepung',0.33333333333333,0.33333333333333,1,1,0.3,0.5,3,NULL,0,1,1,1,0.33333333333333,0.33333333333333,0.33333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (41,'beras','tepung',0.33333333333333,0.33333333333333,1,1,0.3,0.5,3,NULL,0,1,1,1,0.33333333333333,0.33333333333333,0.33333333333333,2);
insert  into `confidence`(`id`,`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`nilai_uji_lift`,`korelasi_rule`,`id_process`,`jumlah_a`,`jumlah_b`,`jumlah_ab`,`px`,`py`,`pxuy`,`from_itemset`) values (42,'beras','tepung',0.33333333333333,0.33333333333333,1,1,0.3,0.5,3,NULL,0,1,1,1,0.33333333333333,0.33333333333333,0.33333333333333,2);

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `items` */

insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (1,'Susu',NULL,4000,1,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (2,'Sampo',NULL,4000,2,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (3,'Deterjen',NULL,4000,4,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (4,'Sabun',NULL,4000,4,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (5,'Beras',NULL,4000,55,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (6,'Minyak',NULL,4000,5,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (7,'Gas ELpiji',NULL,4000,9,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (8,'Mentega',NULL,10000,10,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (9,'Tepung',NULL,4000,8,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (10,'Gula Pasir',NULL,4000,7,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (12,'Roti',NULL,4000,9,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (13,'Trigu',NULL,4000,44,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (14,'Mayones',NULL,4000,88,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (15,'Gula Merah',NULL,4000,90,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (16,'Micin',NULL,4000,888,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (17,'Terasa',NULL,4000,3,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (18,'Jahe',NULL,4000,5,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (21,'Plastik','uploads/Cuplikan_layar_2024-04-22_160143.png',4000,6,'2024-05-02 10:03:51','2024-05-02 10:03:51');
insert  into `items`(`id`,`name`,`image`,`price`,`qty`,`created_at`,`updated_at`) values (22,'Luax White Coffe','uploads/Cuplikan_layar_2024-04-27_091551.png',4000,50,'2024-05-02 10:03:51','2024-05-02 10:03:51');

/*Table structure for table `itemset1` */

DROP TABLE IF EXISTS `itemset1`;

CREATE TABLE `itemset1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atribut` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `itemset1` */

insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (1,'susu',2,0.6666666666666666,1,2);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (2,'sampo',2,0.6666666666666666,1,2);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (3,'tepung',1,0.3333333333333333,1,2);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (4,'beras',1,0.3333333333333333,1,2);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (5,'roti',1,0.3333333333333333,1,2);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (6,'deterjen',1,0.3333333333333333,1,2);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (7,'mentega',1,0.3333333333333333,1,2);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (8,'plastik',1,0.3333333333333333,1,2);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (9,'plastik',1,0.33333333333333,1,0);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (10,'deterjen',1,0.33333333333333,1,0);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (11,'susu',2,0.66666666666667,1,0);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (12,'sampo',2,0.66666666666667,1,0);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (13,'mentega',1,0.33333333333333,1,0);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (14,'roti',1,0.33333333333333,1,0);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (15,'beras',1,0.33333333333333,1,0);
insert  into `itemset1`(`id`,`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values (16,'tepung',1,0.33333333333333,1,0);

/*Table structure for table `itemset2` */

DROP TABLE IF EXISTS `itemset2`;

CREATE TABLE `itemset2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `itemset2` */

insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (1,'susu','sampo',2,0.6666666666666666,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (2,'susu','tepung',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (3,'susu','beras',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (4,'susu','roti',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (5,'susu','deterjen',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (6,'susu','mentega',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (7,'susu','plastik',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (8,'sampo','tepung',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (9,'sampo','beras',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (10,'sampo','roti',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (11,'sampo','deterjen',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (12,'sampo','mentega',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (13,'sampo','plastik',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (14,'tepung','beras',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (15,'tepung','roti',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (16,'tepung','deterjen',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (17,'tepung','mentega',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (18,'tepung','plastik',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (19,'beras','roti',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (20,'beras','deterjen',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (21,'beras','mentega',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (22,'beras','plastik',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (23,'roti','deterjen',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (24,'roti','mentega',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (25,'roti','plastik',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (26,'deterjen','mentega',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (27,'deterjen','plastik',1,0.3333333333333333,1,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (28,'mentega','plastik',0,0,0,2);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (29,'plastik','deterjen',1,0.33333333333333,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (30,'plastik','susu',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (31,'plastik','sampo',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (32,'plastik','mentega',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (33,'plastik','roti',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (34,'plastik','beras',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (35,'plastik','tepung',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (36,'deterjen','susu',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (37,'deterjen','sampo',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (38,'deterjen','mentega',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (39,'deterjen','roti',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (40,'deterjen','beras',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (41,'deterjen','tepung',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (42,'susu','sampo',2,0.66666666666667,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (43,'susu','mentega',1,0.33333333333333,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (44,'susu','roti',1,0.33333333333333,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (45,'susu','beras',1,0.33333333333333,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (46,'susu','tepung',1,0.33333333333333,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (47,'sampo','mentega',1,0.33333333333333,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (48,'sampo','roti',1,0.33333333333333,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (49,'sampo','beras',1,0.33333333333333,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (50,'sampo','tepung',1,0.33333333333333,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (51,'mentega','roti',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (52,'mentega','beras',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (53,'mentega','tepung',0,0,0,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (54,'roti','beras',1,0.33333333333333,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (55,'roti','tepung',1,0.33333333333333,1,0);
insert  into `itemset2`(`id`,`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values (56,'beras','tepung',1,0.33333333333333,1,0);

/*Table structure for table `itemset3` */

DROP TABLE IF EXISTS `itemset3`;

CREATE TABLE `itemset3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `atribut3` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `itemset3` */

insert  into `itemset3`(`id`,`atribut1`,`atribut2`,`atribut3`,`jumlah`,`support`,`lolos`,`id_process`) values (1,'beras','roti','tepung',1,0.3333333333333333,1,2);
insert  into `itemset3`(`id`,`atribut1`,`atribut2`,`atribut3`,`jumlah`,`support`,`lolos`,`id_process`) values (2,'beras','roti','tepung',1,0.33333333333333,1,0);

/*Table structure for table `process_log` */

DROP TABLE IF EXISTS `process_log`;

CREATE TABLE `process_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL,
  `min_left` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

/*Data for the table `process_log` */

insert  into `process_log`(`id`,`start_date`,`end_date`,`min_support`,`min_confidence`,`min_left`) values (2,'2024-05-01','2024-05-24',0.3,0.5,1.2);

/*Table structure for table `sales` */

DROP TABLE IF EXISTS `sales`;

CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `sales` */

insert  into `sales`(`id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (9,NULL,NULL,'2024-05-03 06:13:14','2024-05-04 06:13:22');
insert  into `sales`(`id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (14,NULL,NULL,'2024-05-04 07:19:14','2024-05-04 07:19:14');
insert  into `sales`(`id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (15,NULL,NULL,'2024-05-04 11:47:59','2024-05-04 11:47:59');

/*Table structure for table `sales_item` */

DROP TABLE IF EXISTS `sales_item`;

CREATE TABLE `sales_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `sales_item` */

insert  into `sales_item`(`id`,`sale_id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (8,9,1,1,'2024-05-04 06:14:18','2024-05-04 06:14:24');
insert  into `sales_item`(`id`,`sale_id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (9,9,12,5,'2024-05-04 06:40:16','2024-05-04 06:40:19');
insert  into `sales_item`(`id`,`sale_id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (10,14,1,4,'2024-05-04 07:37:51','2024-05-04 08:08:51');
insert  into `sales_item`(`id`,`sale_id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (11,14,2,1,'2024-05-04 08:41:12','2024-05-04 08:41:12');
insert  into `sales_item`(`id`,`sale_id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (12,14,8,1,'2024-05-04 08:43:17','2024-05-04 08:43:17');
insert  into `sales_item`(`id`,`sale_id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (13,9,5,1,'2024-05-04 10:09:12','2024-05-04 10:09:12');
insert  into `sales_item`(`id`,`sale_id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (14,9,9,1,'2024-05-04 10:09:58','2024-05-04 10:09:58');
insert  into `sales_item`(`id`,`sale_id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (15,9,2,10,'2024-05-04 10:10:05','2024-05-04 10:37:02');
insert  into `sales_item`(`id`,`sale_id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (16,15,21,1,'2024-05-04 11:48:25','2024-05-04 11:48:25');
insert  into `sales_item`(`id`,`sale_id`,`item_id`,`quantity`,`created_at`,`updated_at`) values (17,15,3,5,'2024-05-04 11:48:42','2024-05-04 11:48:42');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  `level` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`level`) values (1,'admin','admin','admin');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
