CREATE DATABASE  IF NOT EXISTS `springweather` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `springweather`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: springweather
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `city` (
  `city_id` bigint NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  `state_id` bigint NOT NULL,
  PRIMARY KEY (`city_id`),
  KEY `FK6p2u50v8fg2y0js6djc6xanit` (`state_id`),
  CONSTRAINT `FK6p2u50v8fg2y0js6djc6xanit` FOREIGN KEY (`state_id`) REFERENCES `state` (`state_id`)
) ENGINE=InnoDB AUTO_INCREMENT=374 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Belsh',1),(2,'Fierzë',1),(3,'Grekan',1),(4,'Kajan',1),(5,'Rrasë',1),(6,'Berat',2),(7,'Otllak',2),(8,'Roshnik',2),(9,'Sinjë',2),(10,'Velabisht',2),(11,'Bulqizë',3),(12,'Fushë-Bulqizë',3),(13,'Gjoricë',3),(14,'Martanesh',3),(15,'Ostren',3),(16,'Shupenzë',3),(17,'Trebisht',3),(18,'Zerqan',3),(19,'Cërrik',4),(20,'Gostimë',4),(21,'Klos',4),(22,'Mollas',4),(23,'Shalës',4),(24,'Delvinë',5),(25,'Vergo',5),(26,'Bilisht',6),(27,'Hoçisht',6),(28,'Miras',6),(29,'Progër',6),(30,'Qendër Bilisht',6),(31,'Arras',7),(32,'Fushë-Çidhën',7),(33,'Kala e Dodës',7),(34,'Kastriot',7),(35,'Lurë',7),(36,'Luzni',7),(37,'Maqellarë',7),(38,'Melan',7),(39,'Muhurr',7),(40,'Peshkopi',7),(41,'Selishtë',7),(42,'Sllovë',7),(43,'Tomin',7),(44,'Zall-Dardhë',7),(45,'Zall-Reç',7),(46,'Cukalat',8),(47,'Dimal',8),(48,'Kutalli',8),(49,'Poshnjë,',8),(50,'Divjakë',9),(51,'Grabian',9),(52,'Gradishtë',9),(53,'Remas',9),(54,'Tërbuf',9),(55,'Dropull i Poshtëm',10),(56,'Dropull i Sipërm',10),(57,'Pogon',10),(58,'Durrës',11),(59,'Ishëm',11),(60,'Katund i Ri',11),(61,'Manëz',11),(62,'Rrashbull',11),(63,'Sukth',11),(64,'Bradashesh',12),(65,'Elbasan',12),(66,'Funarë',12),(67,'Gjergjan',12),(68,'Gjinar',12),(69,'Gracen',12),(70,'Labinot-Fushë',12),(71,'Labinot-Mal',12),(72,'Papër',12),(73,'Shirgjan',12),(74,'Shushicë',12),(75,'Tregan',12),(76,'Zavalinë',12),(77,'Cakran',13),(78,'Dërmenas',13),(79,'Fier',13),(80,'Frakull',13),(81,'Levan',13),(82,'Libofshë',13),(83,'Mbrostar Ura',13),(84,'Portëz',13),(85,'Qendër',13),(86,'Topojë',13),(87,'Aliko',14),(88,'Dhivër',14),(89,'Finiq',14),(90,'Livadhja',14),(91,'Mesopotam',14),(92,'Blerim',15),(93,'Fierzë',15),(94,'Fushë-Arrëz',15),(95,'Iballë',15),(96,'Qafë-Mali',15),(97,'Antigonë',16),(98,'Cepo',16),(99,'Gjirokastër',16),(100,'Lazarat',16),(101,'Lunxhëri',16),(102,'Odrie',16),(103,'Picar',16),(104,'Gramsh',17),(105,'Kodovjat',17),(106,'Kukur',17),(107,'Kushovë',17),(108,'Lenie',17),(109,'Pishaj',17),(110,'Poroçan',17),(111,'Skënderbegas',17),(112,'Sult',17),(113,'Tunjë',17),(114,'Fajzë',18),(115,'Gjinaj',18),(116,'Golaj',18),(117,'Krumë',18),(118,'Himarë',19),(119,'Horë-Vranisht',19),(120,'Lukovë',19),(121,'Kamëz',20),(122,'Paskuqan',20),(123,'Golem',21),(124,'Helmas',21),(125,'Kavajë',21),(126,'Luz i Vogël',21),(127,'Synej',21),(128,'Ballaban',22),(129,'Dishnicë',22),(130,'Këlcyrë',22),(131,'Sukë',22),(132,'Gurrë',23),(133,'Klos',23),(134,'Suç',23),(135,'Xibër',23),(136,'Barmash',24),(137,'Çlirim',24),(138,'Ersekë',24),(139,'Leskovik',24),(140,'Mollas',24),(141,'Novoselë',24),(142,'Qendër Ersekë',24),(143,'Qendër Leskovik',24),(144,'Konispol',25),(145,'Markat',25),(146,'Xarrë',25),(147,'Drenovë',26),(148,'Korçë',26),(149,'Lekas',26),(150,'Mollaj',26),(151,'Qendër Bulgarec',26),(152,'Vithkuq',26),(153,'Voskop',26),(154,'Voskopojë',26),(155,'Bubq',27),(156,'Cudhi',27),(157,'Fushë-Krujë',27),(158,'Krujë',27),(159,'Nikël',27),(160,'Kodër-Thumanë',27),(161,'Kozare',28),(162,'Kuçovë',28),(163,'Lumas',28),(164,'Perondi',28),(165,'Arrën',29),(166,'Bicaj',29),(167,'Bushtricë',29),(168,'Grykë-Çajë',29),(169,'Kalis',29),(170,'Kolsh',29),(171,'Kukës',29),(172,'Malzi',29),(173,'Shishtavec',29),(174,'Shtiqën',29),(175,'Surroj',29),(176,'Tërthore',29),(177,'Topojan',29),(178,'Ujmisht',29),(179,'Zapod',29),(180,'Fushë Kuqe',30),(181,'Laç',30),(182,'Mamurras',30),(183,'Milot',30),(184,'Balldren',31),(185,'Blinisht',31),(186,'Dajç',31),(187,'Kallmet',31),(188,'Kolsh',31),(189,'Lezhë',31),(190,'Shëngjin',31),(191,'Shënkoll',31),(192,'Ungrej',31),(193,'Zejmen',31),(194,'Libohovë',32),(195,'Qendër Libohovë',32),(196,'Zagori',32),(197,'Hotolisht',33),(198,'Librazhd',33),(199,'Lunik',33),(200,'Orenjë',33),(201,'Polis',33),(202,'Qendër Librazhd',33),(203,'Stëblevë',33),(204,'Allkaj',34),(205,'Ballagat',34),(206,'Bubullimë',34),(207,'Dushk',34),(208,'Fier-Shegan',34),(209,'Golem',34),(210,'Hysgjokaj',34),(211,'Karbunarë',34),(212,'Kolonjë',34),(213,'Krutje',34),(214,'Lushnjë',34),(215,'Gruemirë',35),(216,'Kastrat',35),(217,'Kelmend',35),(218,'Koplik',35),(219,'Qendër',35),(220,'Shkrel',35),(221,'Gorë',36),(222,'Libonik',36),(223,'Maliq',36),(224,'Moglicë',36),(225,'Pirg',36),(226,'Pojan',36),(227,'Vreshtas',36),(228,'Aranitas',37),(229,'Ballsh',37),(230,'Fratar',37),(231,'Greshicë',37),(232,'Hekal',37),(233,'Kutë',37),(234,'Ngraçan',37),(235,'Qendër Dukas',37),(236,'Selitë',37),(237,'Baz',38),(238,'Burrel',38),(239,'Derjan',38),(240,'Komsi',38),(241,'Lis',38),(242,'Macukull',38),(243,'Rukaj',38),(244,'Ulëz',38),(245,'Buz',39),(246,'Krahës',39),(247,'Luftinjë',39),(248,'Memaliaj',39),(249,'Memaliaj Fshat',39),(250,'Qesarat',39),(251,'Fan',40),(252,'Kaçinar',40),(253,'Kthellë',40),(254,'Orosh',40),(255,'Rrëshen',40),(256,'Rubik',40),(257,'Selitë',40),(258,'Patos',41),(259,'Ruzhdie',41),(260,'Zharrëz',41),(261,'Gjoçaj',42),(262,'Karinë',42),(263,'Pajovë',42),(264,'Peqin',42),(265,'Përparim',42),(266,'Shezë',42),(267,'Çarçovë',43),(268,'Frashër',43),(269,'Përmet',43),(270,'Petran',43),(271,'Qendër Piskovë',43),(272,'Buçimas',44),(273,'Çërravë',44),(274,'Dardhas',44),(275,'Pogradec',44),(276,'Proptisht',44),(277,'Trebinjë',44),(278,'Udenisht',44),(279,'Velçan',44),(280,'Poliçan',45),(281,'Tërpan',45),(282,'Vërtop',45),(283,'Prrenjas',46),(284,'Qukës',46),(285,'Rrajcë',46),(286,'Stravaj',46),(287,'Gjegjan',47),(288,'Pukë',47),(289,'Qelëz',47),(290,'Qerret',47),(291,'Rrapë',47),(292,'Pustec',48),(293,'Kuman',49),(294,'Kurjan',49),(295,'Roskovec',49),(296,'Strum',49),(297,'Gosë',50),(298,'Kryevidh',50),(299,'Lekaj',50),(300,'Rrogozhinë',50),(301,'Sinaballaj',50),(302,'Ksamil',51),(303,'Sarandë',51),(304,'Armen',52),(305,'Brataj',52),(306,'Kotë',52),(307,'Selenicë',52),(308,'Sevaster',52),(309,'Vllahinë',52),(310,'Gjepalaj',53),(311,'Maminas',53),(312,'Shijak',53),(313,'Xhafzotaj',53),(314,'Ana e Malit',54),(315,'Bërdicë',54),(316,'Dajç',54),(317,'Guri i Zi',54),(318,'Postribë',54),(319,'Pult',54),(320,'Rrethinat',54),(321,'Shalë',54),(322,'Shkodër',54),(323,'Shosh',54),(324,'Velipojë',54),(325,'Bogovë',55),(326,'Çepan',55),(327,'Çorovodë',55),(328,'Gjerbës',55),(329,'Leshnjë',55),(330,'Potom',55),(331,'Qendër Skrapar',55),(332,'Vendreshë',55),(333,'Zhepë',55),(334,'Kurvelesh',56),(335,'Lopës',56),(336,'Qendër Tepelenë',56),(337,'Tepelenë',56),(338,'Baldushk',57),(339,'Bërzhitë',57),(340,'Dajt',57),(341,'Farkë',57),(342,'Kashar',57),(343,'Krrabë',57),(344,'Ndroq',57),(345,'Petrelë',57),(346,'Pezë',57),(347,'Shëngjergj',57),(348,'Tiranë',57),(349,'Vaqarr',57),(350,'Zall-Bastar',57),(351,'Zall-Herr',57),(352,'Bajram Curri',58),(353,'Bujan',58),(354,'Bytyç',58),(355,'Fierzë',58),(356,'Lekbibaj',58),(357,'Llugaj',58),(358,'Margegaj',58),(359,'Tropojë',58),(360,'Bushat',59),(361,'Hajmel',59),(362,'Shllak',59),(363,'Temal',59),(364,'Vau i Dejës',59),(365,'Vig-Mnelë',59),(366,'Novoselë',60),(367,'Orikum',60),(368,'Qendër Vlorë',60),(369,'Shushicë',60),(370,'Vlorë',60),(371,'Bërxullë',61),(372,'Prezë',61),(373,'Vorë',61);
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` bigint NOT NULL AUTO_INCREMENT,
  `country_code` varchar(3) NOT NULL,
  `country_name` varchar(100) NOT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `UK_oqixmig4k8qxc8oba3fl4gqkr` (`country_code`),
  UNIQUE KEY `UK_qrkn270121aljmucrdbnmd35p` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'ALB','Albania');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `state_id` bigint NOT NULL AUTO_INCREMENT,
  `state_name` varchar(100) NOT NULL,
  `country_id` bigint NOT NULL,
  PRIMARY KEY (`state_id`),
  KEY `FKghic7mqjt6qb9vq7up7awu0er` (`country_id`),
  CONSTRAINT `FKghic7mqjt6qb9vq7up7awu0er` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Belsh',1),(2,'Berat',1),(3,'Bulqizë',1),(4,'Cërrik',1),(5,'Delvinë',1),(6,'Devoll',1),(7,'Dibër',1),(8,'Dimal',1),(9,'Divjakë',1),(10,'Dropull',1),(11,'Durrës',1),(12,'Elbasan',1),(13,'Fier',1),(14,'Finiq',1),(15,'Fushë-Arrëz',1),(16,'Gjirokastër',1),(17,'Gramsh',1),(18,'Has',1),(19,'Himarë',1),(20,'Kamëz',1),(21,'Kavajë',1),(22,'Këlcyrë',1),(23,'Klos',1),(24,'Kolonjë',1),(25,'Konispol',1),(26,'Korçë',1),(27,'Krujë',1),(28,'Kuçovë',1),(29,'Kukës',1),(30,'Kurbin',1),(31,'Lezhë',1),(32,'Libohovë',1),(33,'Librazhd',1),(34,'Lushnjë',1),(35,'Malësi e Madhe',1),(36,'Maliq',1),(37,'Mallakastër',1),(38,'Mat',1),(39,'Memaliaj',1),(40,'Mirditë',1),(41,'Patos',1),(42,'Peqin',1),(43,'Përmet',1),(44,'Pogradec',1),(45,'Poliçan',1),(46,'Prrenjas',1),(47,'Pukë',1),(48,'Pustec',1),(49,'Roskovec',1),(50,'Rrogozhinë',1),(51,'Sarandë',1),(52,'Selenicë',1),(53,'Shijak',1),(54,'Shkodër',1),(55,'Skrapar',1),(56,'Tepelenë',1),(57,'Tiranë',1),(58,'Tropojë',1),(59,'Vau i Dejës',1),(60,'Vlorë',1),(61,'Vorë',1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'springweather'
--

--
-- Dumping routines for database 'springweather'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-31 14:11:26
