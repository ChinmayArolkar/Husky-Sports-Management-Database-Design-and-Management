CREATE DATABASE  IF NOT EXISTS `mydb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `mydb`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `coach`
--

DROP TABLE IF EXISTS `coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `coach` (
  `CoachID` int(11) NOT NULL,
  `CoachName` varchar(45) DEFAULT NULL,
  `Experience` varchar(45) DEFAULT NULL,
  `TeamName` varchar(45) DEFAULT NULL,
  `SportsName` varchar(45) DEFAULT NULL,
  `CoachRanking` int(11) DEFAULT NULL,
  PRIMARY KEY (`CoachID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coach`
--

LOCK TABLES `coach` WRITE;
/*!40000 ALTER TABLE `coach` DISABLE KEYS */;
INSERT INTO `coach` VALUES (1001,'Khaled Bugrara','21','NEU','Table Tennis',5),(1002,'Yusuf Ozbek','20','Huskies','Baseball',5);
/*!40000 ALTER TABLE `coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `City` varchar(45) DEFAULT NULL,
  `Zip` int(11) DEFAULT NULL,
  `ContactNo` varchar(45) DEFAULT NULL,
  `EmailID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Mihir Swant','M','Boston',2115,'5665522222','mihirsawant@gmail.com'),(2,'Shubha Arolkar','F','Boston',2115,'5665522223','shubha@gmail.com'),(3,'Arun Arolkar','M','Boston',2115,'5665522224','arun@gmail.com');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `matches` (
  `MatchesID` int(11) NOT NULL,
  `Date` varchar(45) DEFAULT NULL,
  `HomeTeam` varchar(45) DEFAULT NULL,
  `Away Team` varchar(45) DEFAULT NULL,
  `Results` varchar(45) DEFAULT NULL COMMENT 'To keep track of Matches \n',
  `Budget` int(11) DEFAULT NULL,
  `AudienceNumber` int(11) DEFAULT NULL,
  `Stadium_StadiumID` int(11) NOT NULL,
  `Time_TimeSlotNo` int(11) NOT NULL,
  `Home_TeamID` int(11) NOT NULL,
  `Away_TeamID1` int(11) NOT NULL,
  `Sports_SportsID` int(11) NOT NULL,
  `Sponsor_SponsorID` int(11) NOT NULL,
  `TotalMatchDuration` time DEFAULT NULL,
  `Home_Team_Sports_SportsID` int(11) DEFAULT NULL,
  `Away_Team_Sports_SportsID1` int(11) DEFAULT NULL,
  PRIMARY KEY (`MatchesID`,`Stadium_StadiumID`,`Time_TimeSlotNo`,`Home_TeamID`,`Away_TeamID1`,`Sports_SportsID`,`Sponsor_SponsorID`),
  KEY `fk_Matches_Stadium1_idx` (`Stadium_StadiumID`),
  KEY `fk_Matches_Time1_idx` (`Time_TimeSlotNo`),
  KEY `fk_Matches_Team1_idx` (`Home_TeamID`),
  KEY `fk_Matches_Team2_idx` (`Away_TeamID1`),
  KEY `fk_Matches_Sports1_idx` (`Sports_SportsID`),
  KEY `fk_Matches_Sponsor1_idx` (`Sponsor_SponsorID`),
  KEY `Away_Team_Sports_SportsID1_idx` (`Away_Team_Sports_SportsID1`),
  KEY `Home_Team_Sports_SportsID_idx` (`Home_Team_Sports_SportsID`),
  CONSTRAINT `Away_Team_Sports_SportsID1` FOREIGN KEY (`Away_Team_Sports_SportsID1`) REFERENCES `team` (`sports_sportsid`),
  CONSTRAINT `Home_Team_Sports_SportsID` FOREIGN KEY (`Home_Team_Sports_SportsID`) REFERENCES `team` (`sports_sportsid`),
  CONSTRAINT `fk_Matches_Sponsor1` FOREIGN KEY (`Sponsor_SponsorID`) REFERENCES `sponsor` (`sponsorid`),
  CONSTRAINT `fk_Matches_Sports1` FOREIGN KEY (`Sports_SportsID`) REFERENCES `sports` (`sportsid`),
  CONSTRAINT `fk_Matches_Stadium1` FOREIGN KEY (`Stadium_StadiumID`) REFERENCES `stadium` (`stadiumid`),
  CONSTRAINT `fk_Matches_Team1` FOREIGN KEY (`Home_TeamID`) REFERENCES `team` (`teamid`),
  CONSTRAINT `fk_Matches_Team2` FOREIGN KEY (`Away_TeamID1`) REFERENCES `team` (`teamid`),
  CONSTRAINT `fk_Matches_Time1` FOREIGN KEY (`Time_TimeSlotNo`) REFERENCES `time` (`timeslotno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,'2018/12/20','Huskies','Red Sox','pending',10000,100,1,1,10,11,2000,20,'00:50:00',2000,2000);
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `new_view`
--

DROP TABLE IF EXISTS `new_view`;
/*!50001 DROP VIEW IF EXISTS `new_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `new_view` AS SELECT 
 1 AS `TeamID`,
 1 AS `TeamName`,
 1 AS `NoOfPlayers`,
 1 AS `Sports_SportsID`,
 1 AS `CoachName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `players` (
  `PlayersID` int(11) NOT NULL,
  `PlayerName` varchar(45) DEFAULT NULL,
  `SportsName` varchar(45) DEFAULT NULL,
  `TeamName` varchar(45) DEFAULT NULL,
  `Position` varchar(45) DEFAULT NULL,
  `Rating` int(11) DEFAULT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Sex` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PlayersID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (100,'Chinmay Arolkar','Baseball','Huskies','Batter',5,72,'M'),(101,'Abhishek Kamble','Baseball','Huskies','Catcher',4,55,'M'),(102,'Swapnil Deshpande','Baseball','Huskies','First Base Coach',5,45,'M'),(103,'Yash Shinde','Baseball','Huskies','First Baseman',3,56,'M'),(104,'Sumit Anglekar','Baseball','Huskies','Short Stop',5,67,'M'),(105,'Apoorva Dudhe','Baseball','Huskies','Left Fielder',4,78,'M'),(200,'Ankita Roy','Baseball','Red Sox','Batter',5,45,'F'),(201,'Sharvari  Narendra','Baseball','Red Sox','Catcher',3,56,'F'),(202,'Arpita Gaonkar','Baseball','Red Sox','First Base Coach',4,55,'F'),(203,'Vidushi Garg','Baseball','Red Sox','First Baseman',4,44,'F'),(204,'Mrinal Roy','Baseball','Red Sox','Short Stop',4,47,'F'),(205,'Shivani Sherasiya','Baseball','Red Sox','Left Fielder',5,49,'F');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seats` (
  `SeatsID` int(11) NOT NULL,
  `Availability` int(11) DEFAULT NULL,
  `SeatType` varchar(45) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Stadium_StadiumID1` int(11) DEFAULT NULL,
  `BookedBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`SeatsID`),
  KEY `Stadium_StadiumID_idx` (`Stadium_StadiumID1`),
  KEY `CustomerID_idx` (`BookedBy`),
  CONSTRAINT `BookedBy` FOREIGN KEY (`BookedBy`) REFERENCES `customer` (`customerid`),
  CONSTRAINT `Stadium_StadiumID` FOREIGN KEY (`Stadium_StadiumID1`) REFERENCES `stadium` (`stadiumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,0,'Regular',10,1,NULL),(2,1,'Regular',10,1,NULL),(3,1,'Regular',10,1,NULL),(4,1,'Premium',8,1,NULL),(5,1,'Premium',8,1,NULL);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sponsor`
--

DROP TABLE IF EXISTS `sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sponsor` (
  `SponsorID` int(11) NOT NULL,
  `SponsorName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SponsorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sponsor`
--

LOCK TABLES `sponsor` WRITE;
/*!40000 ALTER TABLE `sponsor` DISABLE KEYS */;
INSERT INTO `sponsor` VALUES (20,'CocaCola'),(21,'Dunkin Donuts');
/*!40000 ALTER TABLE `sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sports` (
  `SportsID` int(11) NOT NULL,
  `SportsName` varchar(45) DEFAULT NULL,
  `SportsRanking` int(11) DEFAULT NULL,
  PRIMARY KEY (`SportsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports`
--

LOCK TABLES `sports` WRITE;
/*!40000 ALTER TABLE `sports` DISABLE KEYS */;
INSERT INTO `sports` VALUES (2000,'Baseball',1),(2001,'Table Tennis',2);
/*!40000 ALTER TABLE `sports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stadium` (
  `StadiumID` int(11) NOT NULL,
  `StadiumCapacity` int(11) DEFAULT NULL,
  `Location` varchar(45) DEFAULT NULL,
  `NoOfStages` int(11) DEFAULT NULL,
  PRIMARY KEY (`StadiumID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES (1,1000,'Fenway Park',3),(2,100,'Brookline Avenue',1);
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team` (
  `TeamID` int(11) NOT NULL,
  `TeamName` varchar(45) DEFAULT NULL,
  `NoOfPlayers` varchar(45) DEFAULT NULL,
  `Sports_SportsID` int(11) NOT NULL,
  PRIMARY KEY (`TeamID`,`Sports_SportsID`),
  KEY `fk_Team_Sports1_idx` (`Sports_SportsID`),
  CONSTRAINT `fk_Team_Sports1` FOREIGN KEY (`Sports_SportsID`) REFERENCES `sports` (`sportsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (10,'Huskies','6',2000),(11,'Red Sox','6',2000);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_has_coach`
--

DROP TABLE IF EXISTS `team_has_coach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team_has_coach` (
  `Team_TeamID` int(11) NOT NULL,
  `Team_Sports_SportsID` int(11) NOT NULL,
  `Coach_CoachID` int(11) NOT NULL,
  PRIMARY KEY (`Team_TeamID`,`Team_Sports_SportsID`,`Coach_CoachID`),
  KEY `fk_Team_has_Coach_Coach1_idx` (`Coach_CoachID`),
  KEY `fk_Team_has_Coach_Team1_idx` (`Team_TeamID`,`Team_Sports_SportsID`),
  CONSTRAINT `fk_Team_has_Coach_Coach1` FOREIGN KEY (`Coach_CoachID`) REFERENCES `coach` (`coachid`),
  CONSTRAINT `fk_Team_has_Coach_Team1` FOREIGN KEY (`Team_TeamID`, `Team_Sports_SportsID`) REFERENCES `team` (`teamid`, `sports_sportsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_has_coach`
--

LOCK TABLES `team_has_coach` WRITE;
/*!40000 ALTER TABLE `team_has_coach` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_has_coach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_has_players`
--

DROP TABLE IF EXISTS `team_has_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team_has_players` (
  `Team_TeamID` int(11) NOT NULL,
  `Team_Sports_SportsID` int(11) NOT NULL,
  `Players_PlayersID` int(11) NOT NULL,
  PRIMARY KEY (`Team_TeamID`,`Team_Sports_SportsID`,`Players_PlayersID`),
  KEY `fk_Team_has_Players_Players1_idx` (`Players_PlayersID`),
  KEY `fk_Team_has_Players_Team1_idx` (`Team_TeamID`,`Team_Sports_SportsID`),
  CONSTRAINT `fk_Team_has_Players_Players1` FOREIGN KEY (`Players_PlayersID`) REFERENCES `players` (`playersid`),
  CONSTRAINT `fk_Team_has_Players_Team1` FOREIGN KEY (`Team_TeamID`, `Team_Sports_SportsID`) REFERENCES `team` (`teamid`, `sports_sportsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_has_players`
--

LOCK TABLES `team_has_players` WRITE;
/*!40000 ALTER TABLE `team_has_players` DISABLE KEYS */;
/*!40000 ALTER TABLE `team_has_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticketbooking`
--

DROP TABLE IF EXISTS `ticketbooking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ticketbooking` (
  `TicketBookingID` int(11) NOT NULL,
  `CheckInDate` datetime DEFAULT NULL,
  `CheckOutDate` datetime DEFAULT NULL,
  `Customer_CustomerID` int(11) NOT NULL,
  `Seats_SeatsID` int(11) NOT NULL,
  PRIMARY KEY (`TicketBookingID`),
  KEY `fk_Ticket Booking_Customer1_idx` (`Customer_CustomerID`),
  KEY `fk_Ticket Booking_Seats1_idx` (`Seats_SeatsID`),
  CONSTRAINT `fk_Ticket Booking_Customer1` FOREIGN KEY (`Customer_CustomerID`) REFERENCES `customer` (`customerid`),
  CONSTRAINT `fk_Ticket Booking_Seats1` FOREIGN KEY (`Seats_SeatsID`) REFERENCES `seats` (`seatsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticketbooking`
--

LOCK TABLES `ticketbooking` WRITE;
/*!40000 ALTER TABLE `ticketbooking` DISABLE KEYS */;
INSERT INTO `ticketbooking` VALUES (1,'2018-12-10 10:10:00','2018-12-10 10:14:00',1,2),(2,'2018-12-11 11:10:00','2018-12-11 11:14:00',2,4),(3,'2018-12-14 09:10:00','2018-12-14 09:14:00',3,5);
/*!40000 ALTER TABLE `ticketbooking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time`
--

DROP TABLE IF EXISTS `time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `time` (
  `TimeSlotNo` int(11) NOT NULL,
  `StartTime` varchar(45) DEFAULT NULL,
  `EndTime` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TimeSlotNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time`
--

LOCK TABLES `time` WRITE;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
INSERT INTO `time` VALUES (1,'1:30:00 PM','3:30:00 PM'),(2,'2:30:00 PM','4:30:00 PM'),(3,'3:30:00 PM','5:30:00 PM');
/*!40000 ALTER TABLE `time` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timestamps`
--

DROP TABLE IF EXISTS `timestamps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `timestamps` (
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timestamps`
--

LOCK TABLES `timestamps` WRITE;
/*!40000 ALTER TABLE `timestamps` DISABLE KEYS */;
/*!40000 ALTER TABLE `timestamps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `GetAllProducts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllProducts`(IN TID int)
BEGIN
   SELECT 
p.PlayersID, p.PlayerName, p.SportsName, p.TeamName, p.Position, p.Rating, p.Weight, p.Sex  from 
players as p inner join team as t on p.TeamName=t.TeamName
where t.TeamID=TID;
   END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SetResults` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SetResults`(IN mch int,IN RESULT varchar(15))
BEGIN
update matches
set Results=RESULT
WHERE MatchesID=mch;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `new_view`
--

/*!50001 DROP VIEW IF EXISTS `new_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `new_view` AS select `t`.`TeamID` AS `TeamID`,`t`.`TeamName` AS `TeamName`,`t`.`NoOfPlayers` AS `NoOfPlayers`,`t`.`Sports_SportsID` AS `Sports_SportsID`,`c`.`CoachName` AS `CoachName` from ((`team` `t` join `team_has_coach` on((`t`.`TeamID` = `team_has_coach`.`Team_Sports_SportsID`))) join `coach` `c` on((`team_has_coach`.`Coach_CoachID` = `c`.`CoachID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-13 11:22:04
