-- MySQL dump 10.13  Distrib 8.0.25, for Linux (x86_64)
--
-- Host: localhost    Database: basecamp-golang-api
-- ------------------------------------------------------
-- Server version	8.0.29-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `brands`
--

DROP TABLE IF EXISTS `brands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brands` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nama` char(50) DEFAULT NULL,
  `password` longtext NOT NULL,
  `website` char(100) DEFAULT NULL,
  `marketing` char(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nohp` bigint DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_brands_email` (`email`),
  UNIQUE KEY `idx_brands_nama` (`nama`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brands`
--

LOCK TABLES `brands` WRITE;
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` VALUES (2,'Indotravelin','$2a$04$rHzxsUb68mdnpO.7/7K0zOwI/bCeeBCw7CUTJt9GuzWPBECbT.6eO','indotravelin.com','Yogi','indonesiatravelin@gmail.com',6287844781533,'indotravelin.jpg'),(3,'Nonemtrans','$2a$04$GRmC.0Uo7380MswxrCE3IOQ1OP5WKCk7Wl4XZY9uYB0CXcCJE2ia6','nonemtrans.com','Erwin','nonemtrans@gmail.com',6287750333343,'nonemtrans.jpg'),(4,'Lokatrans','$2a$04$90uJG5MsMfsmKmULxm5P..kDiMBc18GQrle5xgp4sWdRt0zjQZOYa','wisatadilombok.com','Pak Loka','wisatadilombok@gmail.com',6285338881800,'lokatrans.jpg'),(5,'Adventourid','$2a$04$J.rxTlDyNyhScJdAST6bnO3WDSoL4lWcnYxvbXrYKwMZmc3yvNFkW','adventourid.com','Pak Iwan','adventourlombok@gmail.com',6281917474700,'adventourid.jpg'),(6,'Baletrans','$2a$04$xx.kmuZeLY.TCNbE6AlAzO/avvIvz9M2Rvsku59ss0qZ9KlIKvObK','baletrans.com','Gilbi','baletranslombok@gmail.com',6285971837872,'baletrans.jpg'),(9,'Lepaskuncilombok','$2a$04$T.FRkFBcdKuHsMDIOiqEXebdgOUl3dRaHrPYio6ceLY7yXGvtmqeO','lepaskuncilombok.com','Dino','lepaskuncilombok@gmail.com',6285971837872,'lepaskuncilombok.jpg');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitras`
--

DROP TABLE IF EXISTS `mitras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mitras` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nama` char(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mitras_nama` (`nama`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitras`
--

LOCK TABLES `mitras` WRITE;
/*!40000 ALTER TABLE `mitras` DISABLE KEYS */;
INSERT INTO `mitras` VALUES (1,'camp'),(2,'mitra 1'),(3,'mitra 2'),(4,'mitra 3');
/*!40000 ALTER TABLE `mitras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobils`
--

DROP TABLE IF EXISTS `mobils`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mobils` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `unit` char(50) DEFAULT NULL,
  `nopol` char(20) DEFAULT NULL,
  `gambar` char(50) DEFAULT NULL,
  `isready` tinyint(1) DEFAULT '1',
  `own` char(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mobils_mitra` (`own`),
  CONSTRAINT `fk_mobils_mitra` FOREIGN KEY (`own`) REFERENCES `mitras` (`nama`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mobils`
--

LOCK TABLES `mobils` WRITE;
/*!40000 ALTER TABLE `mobils` DISABLE KEYS */;
INSERT INTO `mobils` VALUES (1,'Agya','DR 1112 SS','agya.jpg',0,'mitra 3'),(2,'Ayla','DR 1213 SS','ayla.jpg',1,'camp'),(3,'Brio','DR 1415 SS','brio.jpg',1,'camp'),(4,'Xpander','DR 1617 SS','xpander.jpg',1,'camp'),(5,'Avanza','DR 1819 SS','avanza.jpg',1,'mitra 3'),(6,'Terios','DR 1920 SS','terios.jpg',1,'mitra 3'),(7,'Reborn','DR 2021 SS','reborn.jpg',1,'mitra 3'),(8,'Agya','DR 45678 SS','agya.jpg',1,'mitra 2'),(9,'Ayla','DR 91011 SS','ayla.jpg',1,'mitra 2'),(10,'Avanza','DR 12131 SS','avanza.jpg',1,'mitra 2'),(11,'Reborn','DR 3233 SS','reborn.jpg',0,'camp'),(12,'Reborn','DR 2223 SS','reborn.jpg',1,'mitra 2'),(13,'Reborn','DR 2425 SS','reborn.jpg',1,'mitra 1'),(14,'Brio','DR 2526 SS','brio.jpg',1,'camp'),(15,'Agya','DR 2728 SS','agya.jpg',1,'camp'),(16,'Reborn','DR 3435 SH','reborn.jpg',1,'camp'),(17,'Brio','DR 3637 SH','brio.jpg',1,'camp'),(18,'Raize','DR 3839 SH','raize.jpg',1,'mitra 3'),(19,'Alphard','DR 9019 SH','alphard.jpg',0,'mitra 1'),(20,'Agya','DR 2829 SS','agya.jpg',1,'camp'),(21,'Alphard','DR 3031 SS','alphard.jpg',1,'camp'),(22,'New Avanza','DR 3233 SS','NewAvanza.jpg',1,'mitra 1'),(23,'Wuling Almaz','DR 3435 SS','almaz.jpg',1,'mitra 1'),(24,'Xenia','DR 1234 SS','xenia.jpg',1,'mitra 3');
/*!40000 ALTER TABLE `mobils` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksis`
--

DROP TABLE IF EXISTS `transaksis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaksis` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `brand` char(50) DEFAULT NULL,
  `mitra` char(50) DEFAULT NULL,
  `unit` char(20) DEFAULT NULL,
  `nopol` char(50) DEFAULT NULL,
  `user` char(50) DEFAULT NULL,
  `checker` char(50) DEFAULT NULL,
  `status` char(20) DEFAULT NULL,
  `driver` char(20) DEFAULT NULL,
  `out` char(10) DEFAULT NULL,
  `in` char(10) DEFAULT NULL,
  `day` bigint DEFAULT NULL,
  `perhari` bigint DEFAULT NULL,
  `op` bigint DEFAULT NULL,
  `total` bigint unsigned NOT NULL,
  `total_op` bigint unsigned NOT NULL,
  `sisa_profit` bigint unsigned NOT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mitras_penjualan` (`mitra`),
  KEY `fk_brands_penjualan` (`brand`),
  CONSTRAINT `fk_brands_penjualan` FOREIGN KEY (`brand`) REFERENCES `brands` (`nama`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_mitras_penjualan` FOREIGN KEY (`mitra`) REFERENCES `mitras` (`nama`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksis`
--

LOCK TABLES `transaksis` WRITE;
/*!40000 ALTER TABLE `transaksis` DISABLE KEYS */;
INSERT INTO `transaksis` VALUES (5,'Indotravelin','mitra 3','Agya','DR 1112 SS','costumer 4','frenki','lepas kunci','','05.00 PM','05.00 PM',1,325000,225000,325000,225000,100000,'2022-06-25 22:13:49.721','2022-06-25 22:13:49.721'),(6,'Indotravelin','camp','Ayla','DR 1213 SS','costumer 5','frenki','lepas kunci','','05.00 PM','05.00 PM',3,325000,225000,975000,675000,300000,'2022-06-25 22:14:35.292','2022-06-25 22:14:35.292'),(7,'Indotravelin','camp','Brio','DR 1415 SS','costumer 6','frenki','lepas kunci','','05.00 PM','05.00 PM',1,350000,225000,350000,225000,125000,'2022-06-25 22:15:12.486','2022-06-25 22:15:12.486'),(8,'Nonemtrans','camp','Xpander','DR 1617 SS','costumer 7','frenki','include driver','fredus','08.00 AM','08.00 AM',5,500000,300000,2500000,1500000,1000000,'2022-06-25 22:17:47.437','2022-06-25 22:17:47.437'),(9,'Nonemtrans','mitra 3','Avanza','DR 1819 SS','costumer 8','fredus','lepas kunci','','10.00 AM','10.00 AM',3,350000,250000,1050000,750000,300000,'2022-06-25 22:19:14.880','2022-06-25 22:19:14.880'),(10,'Nonemtrans','mitra 3','Terios','DR 1920 SS','costumer 9','Nino','lepas kunci','','10.00 AM','10.00 AM',2,750000,450000,1500000,900000,600000,'2022-06-25 22:22:40.241','2022-06-25 22:22:40.241'),(11,'Nonemtrans','mitra 3','Reborn','DR 2021 SS','costumer 10','Nino','lepas kunci','','11.00 AM','11.00 AM',2,425000,300000,850000,600000,250000,'2022-06-25 22:23:50.687','2022-06-25 22:23:50.687'),(12,'Adventourid','mitra 2','Reborn','DR 2223 SS','costumer 11','Nino','lepas kunci','','11.00 AM','11.00 AM',4,425000,300000,1700000,1200000,500000,'2022-06-25 22:29:21.955','2022-06-25 22:29:21.955'),(13,'Adventourid','mitra 1','Reborn','DR 2425 SS','costumer 12','frenky','lepas kunci','','11.00 AM','11.00 AM',7,425000,300000,2975000,2100000,875000,'2022-06-25 22:29:58.503','2022-06-25 22:29:58.503'),(14,'Adventourid','camp','Brio','DR 2526 SS','costumer 13','frenky','lepas kunci','','11.00 AM','11.00 AM',2,425000,225000,850000,450000,400000,'2022-06-25 22:30:43.470','2022-06-25 22:30:43.470'),(15,'Adventourid','camp','Agya','DR 2728 SS','costumer 14','frenky','lepas kunci','','11.00 AM','11.00 AM',4,350000,230000,1400000,920000,480000,'2022-06-25 22:32:55.592','2022-06-25 22:32:55.592'),(16,'Lepaskuncilombok','camp','Agya','DR 2829 SS','costumer 15','frenky','lepas kunci','','11.00 AM','11.00 AM',2,345000,240000,690000,480000,210000,'2022-06-25 22:35:08.869','2022-06-25 22:35:08.869'),(17,'Lepaskuncilombok','camp','Alphard','DR 3031 SS','costumer 16','frenky','lepas kunci','','11.00 AM','11.00 AM',3,4500000,3000000,13500000,9000000,4500000,'2022-06-25 22:36:08.957','2022-06-25 22:36:08.957'),(18,'Lepaskuncilombok','mitra 1','New Avanza','DR 3233 SS','costumer 17','frenky','lepas kunci','','11.00 AM','11.00 AM',7,425000,300000,2975000,2100000,875000,'2022-06-25 22:36:55.682','2022-06-25 22:36:55.682'),(19,'Lepaskuncilombok','mitra 1','Wuling Almaz','DR 3435 SS','costumer 18','Dino','lepas kunci','','11.00 AM','11.00 AM',2,550000,425000,1100000,850000,250000,'2022-06-25 22:37:43.354','2022-06-25 22:37:43.354'),(20,'Lepaskuncilombok','mitra 3','Xenia','DR 1234 SS','costumer 19','Mil','lepas kunci','','11.00 AM','11.00 AM',3,350000,220000,1050000,660000,390000,'2022-06-25 22:38:41.448','2022-06-25 22:38:41.448'),(21,'Lokatrans','mitra 2','Agya','DR 45678 SS','costumer 20','Frenky','lepas kunci','','11.00 AM','11.00 AM',1,350000,220000,350000,220000,130000,'2022-06-25 22:52:55.974','2022-06-25 22:52:55.974'),(22,'Lokatrans','mitra 2','Ayla','DR 91011 SS','costumer 21','Frenky','lepas kunci','','11.00 AM','11.00 AM',3,350000,220000,1050000,660000,390000,'2022-06-25 22:53:22.830','2022-06-25 22:53:22.830'),(23,'Lokatrans','mitra 2','Avanza','DR 12131 SS','costumer 21','Frenky','lepas kunci','','11.00 AM','11.00 AM',6,370000,250000,2220000,1500000,720000,'2022-06-25 22:53:50.393','2022-06-25 22:53:50.393'),(24,'Lokatrans','camp','Reborn','DR 3233 SS','costumer 22','Frenky','lepas kunci','','11.00 AM','11.00 AM',2,475000,350000,950000,700000,250000,'2022-06-25 22:55:46.818','2022-06-25 22:55:46.818'),(25,'Baletrans','camp','Reborn','DR 3435 SH','costumer 23','Frenky','lepas kunci','','11.00 AM','11.00 AM',5,475000,350000,2375000,1750000,625000,'2022-06-25 22:56:34.337','2022-06-25 22:56:34.337'),(26,'Baletrans','camp','Brio','DR 3637 SH','costumer 24','Frenky','lepas kunci','','11.00 AM','11.00 AM',2,475000,250000,950000,500000,450000,'2022-06-25 22:57:04.929','2022-06-25 22:57:04.929'),(27,'Baletrans','mitra 3','Raize','DR 3839 SH','costumer 25','Frenky','lepas kunci','','11.00 AM','11.00 AM',1,450000,350000,450000,350000,100000,'2022-06-25 22:57:46.503','2022-06-25 22:57:46.503'),(28,'Baletrans','mitra 1','Alphard','DR 9019 SH','costumer 26','Frenky','lepas kunci','','11.00 AM','11.00 AM',2,4500000,3500000,9000000,7000000,2000000,'2022-06-25 22:58:26.324','2022-06-25 22:58:26.324');
/*!40000 ALTER TABLE `transaksis` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-02  2:55:45
