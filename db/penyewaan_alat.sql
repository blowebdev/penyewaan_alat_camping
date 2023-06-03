-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: penyewaan_alat
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `master_detail_transaksi`
--

DROP TABLE IF EXISTS `master_detail_transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_detail_transaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_transaksi` text NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `durasi` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `create_at` datetime NOT NULL,
  `status` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_detail_transaksi`
--

LOCK TABLES `master_detail_transaksi` WRITE;
/*!40000 ALTER TABLE `master_detail_transaksi` DISABLE KEYS */;
INSERT INTO `master_detail_transaksi` VALUES (5,'TRX16987228',5,2,40000,1,'2023-05-24 12:00:00','2023-05-27 11:00:00',3,40000,120000,'2023-05-24 06:20:55',''),(6,'TRX16987228',3,2,100000,1,'2023-05-24 12:00:00','2023-05-27 11:00:00',3,100000,300000,'2023-05-24 06:20:55',''),(7,'TRX16987228',2,2,75000,1,'2023-05-24 12:00:00','2023-05-27 11:00:00',3,75000,225000,'2023-05-24 06:20:55',''),(8,'TRX15F40C06',5,4,40000,1,'2023-05-24 14:00:00','2023-05-25 13:00:00',1,40000,40000,'2023-05-24 08:40:46',''),(9,'TRX15F40C06',2,4,75000,1,'2023-05-24 14:00:00','2023-05-25 13:00:00',1,75000,75000,'2023-05-24 08:40:46',''),(10,'TRX15F40C06',1,4,50000,1,'2023-05-24 14:00:00','2023-05-25 13:00:00',1,50000,50000,'2023-05-24 08:40:46',''),(11,'TRX8D1B99B8',5,4,40000,1,'2023-05-24 15:00:00','2023-05-27 14:00:00',3,40000,120000,'2023-05-24 09:58:35',''),(17,'TRX47F83E30',3,2,100000,1,'2023-05-26 14:00:00','2023-05-27 13:00:00',1,100000,100000,'2023-05-26 08:01:42',''),(18,'TRX47F83E30',2,2,75000,1,'2023-05-26 14:00:00','2023-05-27 13:00:00',1,75000,75000,'2023-05-26 08:01:43',''),(19,'TRX47F83E30',1,2,50000,1,'2023-05-26 14:00:00','2023-05-27 13:00:00',1,50000,50000,'2023-05-26 08:01:43',''),(20,'TRXDFD08452',1,5,50000,3,'2023-05-28 17:00:00','2023-05-29 16:00:00',1,150000,150000,'2023-05-28 11:26:37',''),(21,'TRXDFD08452',2,5,75000,1,'2023-05-28 17:00:00','2023-05-29 16:00:00',1,75000,75000,'2023-05-28 11:26:37','');
/*!40000 ALTER TABLE `master_detail_transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_isian_review`
--

DROP TABLE IF EXISTS `master_isian_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_isian_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode_transaksi` text NOT NULL,
  `id_produk` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_pertanyaan` int(11) NOT NULL,
  `jawaban` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_isian_review`
--

LOCK TABLES `master_isian_review` WRITE;
/*!40000 ALTER TABLE `master_isian_review` DISABLE KEYS */;
INSERT INTO `master_isian_review` VALUES (17,'TRX16987228',5,2,1,3),(18,'TRX16987228',5,2,2,4),(19,'TRX16987228',5,2,3,2),(20,'TRX16987228',5,2,4,3),(21,'TRX16987228',3,2,1,4),(22,'TRX16987228',3,2,2,2),(23,'TRX16987228',3,2,3,2),(24,'TRX16987228',3,2,4,2),(25,'TRX16987228',2,2,1,2),(26,'TRX16987228',2,2,2,4),(27,'TRX16987228',2,2,3,3),(28,'TRX16987228',2,2,4,3),(29,'TRX8D1B99B8',5,4,1,3),(30,'TRX8D1B99B8',5,4,2,3),(31,'TRX8D1B99B8',5,4,3,4),(32,'TRX8D1B99B8',5,4,4,2),(33,'TRXDFD08452',1,5,1,3),(34,'TRXDFD08452',1,5,2,3),(35,'TRXDFD08452',1,5,3,4),(36,'TRXDFD08452',1,5,4,1),(37,'TRXDFD08452',2,5,1,3),(38,'TRXDFD08452',2,5,2,2),(39,'TRXDFD08452',2,5,3,3),(40,'TRXDFD08452',2,5,4,3);
/*!40000 ALTER TABLE `master_isian_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_keranjang_belanja`
--

DROP TABLE IF EXISTS `master_keranjang_belanja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_keranjang_belanja` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `harga` int(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `tgl_pinjam` datetime NOT NULL,
  `tgl_selesai` datetime NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_keranjang_belanja`
--

LOCK TABLES `master_keranjang_belanja` WRITE;
/*!40000 ALTER TABLE `master_keranjang_belanja` DISABLE KEYS */;
INSERT INTO `master_keranjang_belanja` VALUES (57,5,4,40000,1,40000,'2023-05-28 17:00:00','2023-05-29 16:00:00','2023-05-28 11:53:42');
/*!40000 ALTER TABLE `master_keranjang_belanja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_nilai_rekomendasi_review`
--

DROP TABLE IF EXISTS `master_nilai_rekomendasi_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_nilai_rekomendasi_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_produk` int(11) NOT NULL,
  `nama` text NOT NULL,
  `nilai` int(11) NOT NULL,
  `rangking` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_nilai_rekomendasi_review`
--

LOCK TABLES `master_nilai_rekomendasi_review` WRITE;
/*!40000 ALTER TABLE `master_nilai_rekomendasi_review` DISABLE KEYS */;
INSERT INTO `master_nilai_rekomendasi_review` VALUES (34,5,'Paket camping ke bromo',93,1),(35,1,'Tenda Camping Murah ',89,2),(36,2,'Kompor Camping',78,3),(37,2,'Kompor Camping',76,4),(38,5,'Paket camping ke bromo',63,5),(39,3,'Sleeping bag camping',57,6);
/*!40000 ALTER TABLE `master_nilai_rekomendasi_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_pelanggan`
--

DROP TABLE IF EXISTS `master_pelanggan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_pelanggan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(225) NOT NULL,
  `hp` text NOT NULL,
  `email` text NOT NULL,
  `alamat` text NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_pelanggan`
--

LOCK TABLES `master_pelanggan` WRITE;
/*!40000 ALTER TABLE `master_pelanggan` DISABLE KEYS */;
INSERT INTO `master_pelanggan` VALUES (2,'Ahmad','6285748496135','hudamiftakh8@gmail.com','Jombang jawa timur','huda','202cb962ac59075b964b07152d234b70',''),(3,'Umam','6285712551156','ulin@gmail.com','Alamat 2','ulin','81dc9bdb52d04dc20036dbd8313ed055',''),(4,'Zeaid','62847758857676','email1@gmail.com','Alamat Jombang','user1','202cb962ac59075b964b07152d234b70',''),(5,'Yaqin','6287866163545','email@gmail.com','Jombang','user2','202cb962ac59075b964b07152d234b70','');
/*!40000 ALTER TABLE `master_pelanggan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_pertanyaan_review`
--

DROP TABLE IF EXISTS `master_pertanyaan_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_pertanyaan_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pertanyaan` text NOT NULL,
  `bobot` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_pertanyaan_review`
--

LOCK TABLES `master_pertanyaan_review` WRITE;
/*!40000 ALTER TABLE `master_pertanyaan_review` DISABLE KEYS */;
INSERT INTO `master_pertanyaan_review` VALUES (1,'Bagaimana kualitas produk ini ?',10),(2,'Bagaimana kualitas produk ini ?',10),(3,'Bagaimana kecepatan pelayanan toko ?',70),(4,'Kondisi barang dan harga sewa apakah sesuai ?',10);
/*!40000 ALTER TABLE `master_pertanyaan_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_produk`
--

DROP TABLE IF EXISTS `master_produk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_produk` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `nama` varchar(225) NOT NULL,
  `harga` int(10) NOT NULL,
  `gambar` text NOT NULL,
  `deskripsi` text NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_produk`
--

LOCK TABLES `master_produk` WRITE;
/*!40000 ALTER TABLE `master_produk` DISABLE KEYS */;
INSERT INTO `master_produk` VALUES (1,'Tenda Camping Murah ',50000,'2023-05-22-tenda.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',10),(2,'Kompor Camping',75000,'2023-05-22-kompur.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	',10),(3,'Sleeping bag camping',100000,'2023-05-22-e7ffe2326151ed5a522934d4618c9640.jpg','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	  ',50),(5,'Paket camping ke bromo',40000,'2023-05-23-tenda.jpg','I have everything working quite well but I cant seem to get the picker to use the default values that I set in the . There are two inputs, a start date and end date. I have a value=\"\" with a date in both which should be the default date for the datepicker. Then the user has the ability to change those dates.',10),(6,'Paket camping ke jombang',30000,'2023-05-28-banner_depan2.png','Deskripsi',100);
/*!40000 ALTER TABLE `master_produk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_transaksi`
--

DROP TABLE IF EXISTS `master_transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_transaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_pelanggan` int(11) NOT NULL,
  `kode_transaksi` text NOT NULL,
  `total_barang` int(11) NOT NULL,
  `total_transaksi` int(11) NOT NULL,
  `nama` text NOT NULL,
  `hp` text NOT NULL,
  `alamat` text NOT NULL,
  `pengiriman` text NOT NULL,
  `catatan` text NOT NULL,
  `biaya_kirim` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `pembayaran` text NOT NULL,
  `created_at` datetime NOT NULL,
  `status` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_transaksi`
--

LOCK TABLES `master_transaksi` WRITE;
/*!40000 ALTER TABLE `master_transaksi` DISABLE KEYS */;
INSERT INTO `master_transaksi` VALUES (3,2,'TRX16987228',3,645000,'Ahamad','6285748496135','Jombang jawa timur','dikirim','Mohon dikirim',50000,695000,'cash','2023-05-24 06:20:55','LUNAS'),(4,4,'TRX15F40C06',3,165000,'Aha','62847758857676','Alamat Jombang','dikirim','Ok',50000,215000,'transfer','2023-05-24 08:40:45','PROSES'),(8,4,'TRX8D1B99B8',1,120000,'Zein saedi','62847758857676','Alamat Jombang','ambil_sendiri','OK',0,120000,'transfer','2023-05-24 09:58:35','LUNAS'),(9,2,'TRX47F83E30',3,225000,'Miftahul Huda','6285748496135','Jombang jawa timur','dikirim','Ok',50000,275000,'transfer','2023-05-26 08:01:42','PROSES'),(10,5,'TRXDFD08452',2,125000,'Yaqin','6287866163545','Jombang','dikirim','Mohon verifikasi',50000,175000,'cash','2023-05-28 11:26:37','LUNAS');
/*!40000 ALTER TABLE `master_transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `master_user`
--

DROP TABLE IF EXISTS `master_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `master_user` (
  `user_id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` enum('1','2') NOT NULL DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `master_user`
--

LOCK TABLES `master_user` WRITE;
/*!40000 ALTER TABLE `master_user` DISABLE KEYS */;
INSERT INTO `master_user` VALUES (4,'Toko Penyewaan','admin','21232f297a57a5a743894a0e4a801fc3','1');
/*!40000 ALTER TABLE `master_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-03 20:19:24
