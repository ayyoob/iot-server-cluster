-- MySQL dump 10.13  Distrib 5.6.19, for osx10.7 (i386)
--
-- Host: 127.0.0.1    Database: APPMGT_DB
-- ------------------------------------------------------
-- Server version	5.6.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `APPMGT_DB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `APPMGT_DB` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `APPMGT_DB`;

--
-- Dumping events for database 'APPMGT_DB'
--

--
-- Dumping routines for database 'APPMGT_DB'
--

--
-- Current Database: `CARBON_DB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `CARBON_DB` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `CARBON_DB`;

--
-- Table structure for table `REG_ASSOCIATION`
--

DROP TABLE IF EXISTS `REG_ASSOCIATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_ASSOCIATION` (
  `REG_ASSOCIATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_SOURCEPATH` varchar(750) NOT NULL,
  `REG_TARGETPATH` varchar(750) NOT NULL,
  `REG_ASSOCIATION_TYPE` varchar(2000) NOT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_ASSOCIATION_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_CLUSTER_LOCK`
--

DROP TABLE IF EXISTS `REG_CLUSTER_LOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_CLUSTER_LOCK` (
  `REG_LOCK_NAME` varchar(20) NOT NULL DEFAULT '',
  `REG_LOCK_STATUS` varchar(20) DEFAULT NULL,
  `REG_LOCKED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_TENANT_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`REG_LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_COMMENT`
--

DROP TABLE IF EXISTS `REG_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_COMMENT` (
  `REG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_COMMENT_TEXT` varchar(500) NOT NULL,
  `REG_USER_ID` varchar(31) NOT NULL,
  `REG_COMMENTED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_CONTENT`
--

DROP TABLE IF EXISTS `REG_CONTENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_CONTENT` (
  `REG_CONTENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_CONTENT_DATA` longblob,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_CONTENT_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3377 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_CONTENT_HISTORY`
--

DROP TABLE IF EXISTS `REG_CONTENT_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_CONTENT_HISTORY` (
  `REG_CONTENT_ID` int(11) NOT NULL,
  `REG_CONTENT_DATA` longblob,
  `REG_DELETED` smallint(6) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_CONTENT_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_LOG`
--

DROP TABLE IF EXISTS `REG_LOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_LOG` (
  `REG_LOG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_PATH` varchar(750) DEFAULT NULL,
  `REG_USER_ID` varchar(31) NOT NULL,
  `REG_LOGGED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_ACTION` int(11) NOT NULL,
  `REG_ACTION_DATA` varchar(500) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_LOG_ID`,`REG_TENANT_ID`),
  KEY `REG_LOG_IND_BY_REG_LOGTIME` (`REG_LOGGED_TIME`,`REG_TENANT_ID`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=6866 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_PATH`
--

DROP TABLE IF EXISTS `REG_PATH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_PATH` (
  `REG_PATH_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_PATH_VALUE` varchar(750) NOT NULL,
  `REG_PATH_PARENT_ID` int(11) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_PATH_IND_BY_PATH_VALUE` (`REG_PATH_VALUE`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_PATH_IND_BY_PATH_PARENT_ID` (`REG_PATH_PARENT_ID`,`REG_TENANT_ID`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_PROPERTY`
--

DROP TABLE IF EXISTS `REG_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_PROPERTY` (
  `REG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_NAME` varchar(100) NOT NULL,
  `REG_VALUE` varchar(1000) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38213 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_RATING`
--

DROP TABLE IF EXISTS `REG_RATING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RATING` (
  `REG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_RATING` int(11) NOT NULL,
  `REG_USER_ID` varchar(31) NOT NULL,
  `REG_RATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_RESOURCE`
--

DROP TABLE IF EXISTS `REG_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE` (
  `REG_PATH_ID` int(11) NOT NULL,
  `REG_NAME` varchar(256) DEFAULT NULL,
  `REG_VERSION` int(11) NOT NULL AUTO_INCREMENT,
  `REG_MEDIA_TYPE` varchar(500) DEFAULT NULL,
  `REG_CREATOR` varchar(31) NOT NULL,
  `REG_CREATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REG_LAST_UPDATOR` varchar(31) DEFAULT NULL,
  `REG_LAST_UPDATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REG_DESCRIPTION` varchar(1000) DEFAULT NULL,
  `REG_CONTENT_ID` int(11) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `REG_UUID` varchar(100) NOT NULL,
  PRIMARY KEY (`REG_VERSION`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_FK_BY_CONTENT_ID` (`REG_CONTENT_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_IND_BY_NAME` (`REG_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_IND_BY_PATH_ID_NAME` (`REG_PATH_ID`,`REG_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_IND_BY_UUID` (`REG_UUID`) USING HASH,
  KEY `REG_RESOURCE_IND_BY_TENANT` (`REG_TENANT_ID`,`REG_UUID`) USING HASH,
  KEY `REG_RESOURCE_IND_BY_TYPE` (`REG_TENANT_ID`,`REG_MEDIA_TYPE`) USING HASH,
  KEY `REG_RESOURCE_HISTORY_IND_BY_PATH_ID_NAME` (`REG_PATH_ID`,`REG_NAME`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_FK_BY_CONTENT_ID` FOREIGN KEY (`REG_CONTENT_ID`, `REG_TENANT_ID`) REFERENCES `REG_CONTENT` (`REG_CONTENT_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4300 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_RESOURCE_COMMENT`
--

DROP TABLE IF EXISTS `REG_RESOURCE_COMMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE_COMMENT` (
  `REG_COMMENT_ID` int(11) NOT NULL,
  `REG_VERSION` int(11) DEFAULT NULL,
  `REG_PATH_ID` int(11) DEFAULT NULL,
  `REG_RESOURCE_NAME` varchar(256) DEFAULT NULL,
  `REG_TENANT_ID` int(11) DEFAULT '0',
  KEY `REG_RESOURCE_COMMENT_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_COMMENT_FK_BY_COMMENT_ID` (`REG_COMMENT_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_COMMENT_IND_BY_PATH_ID_AND_RESOURCE_NAME` (`REG_PATH_ID`,`REG_RESOURCE_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_COMMENT_IND_BY_VERSION` (`REG_VERSION`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_COMMENT_FK_BY_COMMENT_ID` FOREIGN KEY (`REG_COMMENT_ID`, `REG_TENANT_ID`) REFERENCES `REG_COMMENT` (`REG_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_COMMENT_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_RESOURCE_HISTORY`
--

DROP TABLE IF EXISTS `REG_RESOURCE_HISTORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE_HISTORY` (
  `REG_PATH_ID` int(11) NOT NULL,
  `REG_NAME` varchar(256) DEFAULT NULL,
  `REG_VERSION` int(11) NOT NULL,
  `REG_MEDIA_TYPE` varchar(500) DEFAULT NULL,
  `REG_CREATOR` varchar(31) NOT NULL,
  `REG_CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_LAST_UPDATOR` varchar(31) DEFAULT NULL,
  `REG_LAST_UPDATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REG_DESCRIPTION` varchar(1000) DEFAULT NULL,
  `REG_CONTENT_ID` int(11) DEFAULT NULL,
  `REG_DELETED` smallint(6) DEFAULT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `REG_UUID` varchar(100) NOT NULL,
  PRIMARY KEY (`REG_VERSION`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_HIST_FK_BY_PATHID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_HIST_FK_BY_CONTENT_ID` (`REG_CONTENT_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_HISTORY_IND_BY_NAME` (`REG_NAME`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_HIST_FK_BY_CONTENT_ID` FOREIGN KEY (`REG_CONTENT_ID`, `REG_TENANT_ID`) REFERENCES `REG_CONTENT_HISTORY` (`REG_CONTENT_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_HIST_FK_BY_PATHID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_RESOURCE_PROPERTY`
--

DROP TABLE IF EXISTS `REG_RESOURCE_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE_PROPERTY` (
  `REG_PROPERTY_ID` int(11) NOT NULL,
  `REG_VERSION` int(11) DEFAULT NULL,
  `REG_PATH_ID` int(11) DEFAULT NULL,
  `REG_RESOURCE_NAME` varchar(256) DEFAULT NULL,
  `REG_TENANT_ID` int(11) DEFAULT '0',
  KEY `REG_RESOURCE_PROPERTY_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_PROPERTY_FK_BY_TAG_ID` (`REG_PROPERTY_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_PROPERTY_IND_BY_PATH_ID_AND_RESOURCE_NAME` (`REG_PATH_ID`,`REG_RESOURCE_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_PROPERTY_IND_BY_VERSION` (`REG_VERSION`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_PROPERTY_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_PROPERTY_FK_BY_TAG_ID` FOREIGN KEY (`REG_PROPERTY_ID`, `REG_TENANT_ID`) REFERENCES `REG_PROPERTY` (`REG_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_RESOURCE_RATING`
--

DROP TABLE IF EXISTS `REG_RESOURCE_RATING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE_RATING` (
  `REG_RATING_ID` int(11) NOT NULL,
  `REG_VERSION` int(11) DEFAULT NULL,
  `REG_PATH_ID` int(11) DEFAULT NULL,
  `REG_RESOURCE_NAME` varchar(256) DEFAULT NULL,
  `REG_TENANT_ID` int(11) DEFAULT '0',
  KEY `REG_RESOURCE_RATING_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_RATING_FK_BY_RATING_ID` (`REG_RATING_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_RATING_IND_BY_PATH_ID_AND_RESOURCE_NAME` (`REG_PATH_ID`,`REG_RESOURCE_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_RATING_IND_BY_VERSION` (`REG_VERSION`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_RATING_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_RATING_FK_BY_RATING_ID` FOREIGN KEY (`REG_RATING_ID`, `REG_TENANT_ID`) REFERENCES `REG_RATING` (`REG_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_RESOURCE_TAG`
--

DROP TABLE IF EXISTS `REG_RESOURCE_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_RESOURCE_TAG` (
  `REG_TAG_ID` int(11) NOT NULL,
  `REG_VERSION` int(11) DEFAULT NULL,
  `REG_PATH_ID` int(11) DEFAULT NULL,
  `REG_RESOURCE_NAME` varchar(256) DEFAULT NULL,
  `REG_TENANT_ID` int(11) DEFAULT '0',
  KEY `REG_RESOURCE_TAG_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_TAG_FK_BY_TAG_ID` (`REG_TAG_ID`,`REG_TENANT_ID`),
  KEY `REG_RESOURCE_TAG_IND_BY_PATH_ID_AND_RESOURCE_NAME` (`REG_PATH_ID`,`REG_RESOURCE_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_RESOURCE_TAG_IND_BY_VERSION` (`REG_VERSION`,`REG_TENANT_ID`) USING HASH,
  CONSTRAINT `REG_RESOURCE_TAG_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`),
  CONSTRAINT `REG_RESOURCE_TAG_FK_BY_TAG_ID` FOREIGN KEY (`REG_TAG_ID`, `REG_TENANT_ID`) REFERENCES `REG_TAG` (`REG_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_SNAPSHOT`
--

DROP TABLE IF EXISTS `REG_SNAPSHOT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_SNAPSHOT` (
  `REG_SNAPSHOT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_PATH_ID` int(11) NOT NULL,
  `REG_RESOURCE_NAME` varchar(255) DEFAULT NULL,
  `REG_RESOURCE_VIDS` longblob NOT NULL,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_SNAPSHOT_ID`,`REG_TENANT_ID`),
  KEY `REG_SNAPSHOT_IND_BY_PATH_ID_AND_RESOURCE_NAME` (`REG_PATH_ID`,`REG_RESOURCE_NAME`,`REG_TENANT_ID`) USING HASH,
  KEY `REG_SNAPSHOT_FK_BY_PATH_ID` (`REG_PATH_ID`,`REG_TENANT_ID`),
  CONSTRAINT `REG_SNAPSHOT_FK_BY_PATH_ID` FOREIGN KEY (`REG_PATH_ID`, `REG_TENANT_ID`) REFERENCES `REG_PATH` (`REG_PATH_ID`, `REG_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `REG_TAG`
--

DROP TABLE IF EXISTS `REG_TAG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `REG_TAG` (
  `REG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `REG_TAG_NAME` varchar(500) NOT NULL,
  `REG_USER_ID` varchar(31) NOT NULL,
  `REG_TAGGED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `REG_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`REG_ID`,`REG_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3663 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_ACCOUNT_MAPPING`
--

DROP TABLE IF EXISTS `UM_ACCOUNT_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_ACCOUNT_MAPPING` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL,
  `UM_USER_STORE_DOMAIN` varchar(100) DEFAULT NULL,
  `UM_ACC_LINK_ID` int(11) NOT NULL,
  PRIMARY KEY (`UM_ID`),
  UNIQUE KEY `UM_USER_NAME` (`UM_USER_NAME`,`UM_TENANT_ID`,`UM_USER_STORE_DOMAIN`,`UM_ACC_LINK_ID`),
  KEY `UM_TENANT_ID` (`UM_TENANT_ID`),
  CONSTRAINT `um_account_mapping_ibfk_1` FOREIGN KEY (`UM_TENANT_ID`) REFERENCES `UM_TENANT` (`UM_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_CLAIM`
--

DROP TABLE IF EXISTS `UM_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_CLAIM` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_DIALECT_ID` int(11) NOT NULL,
  `UM_CLAIM_URI` varchar(255) NOT NULL,
  `UM_DISPLAY_TAG` varchar(255) DEFAULT NULL,
  `UM_DESCRIPTION` varchar(255) DEFAULT NULL,
  `UM_MAPPED_ATTRIBUTE_DOMAIN` varchar(255) DEFAULT NULL,
  `UM_MAPPED_ATTRIBUTE` varchar(255) DEFAULT NULL,
  `UM_REG_EX` varchar(255) DEFAULT NULL,
  `UM_SUPPORTED` smallint(6) DEFAULT NULL,
  `UM_REQUIRED` smallint(6) DEFAULT NULL,
  `UM_DISPLAY_ORDER` int(11) DEFAULT NULL,
  `UM_CHECKED_ATTRIBUTE` smallint(6) DEFAULT NULL,
  `UM_READ_ONLY` smallint(6) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_DIALECT_ID` (`UM_DIALECT_ID`,`UM_CLAIM_URI`,`UM_TENANT_ID`,`UM_MAPPED_ATTRIBUTE_DOMAIN`),
  KEY `UM_DIALECT_ID_2` (`UM_DIALECT_ID`,`UM_TENANT_ID`),
  CONSTRAINT `um_claim_ibfk_1` FOREIGN KEY (`UM_DIALECT_ID`, `UM_TENANT_ID`) REFERENCES `UM_DIALECT` (`UM_ID`, `UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_DIALECT`
--

DROP TABLE IF EXISTS `UM_DIALECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_DIALECT` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_DIALECT_URI` varchar(255) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_DIALECT_URI` (`UM_DIALECT_URI`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_DOMAIN`
--

DROP TABLE IF EXISTS `UM_DOMAIN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_DOMAIN` (
  `UM_DOMAIN_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_DOMAIN_NAME` varchar(255) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_DOMAIN_ID`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_HYBRID_REMEMBER_ME`
--

DROP TABLE IF EXISTS `UM_HYBRID_REMEMBER_ME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_HYBRID_REMEMBER_ME` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) NOT NULL,
  `UM_COOKIE_VALUE` varchar(1024) DEFAULT NULL,
  `UM_CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_HYBRID_ROLE`
--

DROP TABLE IF EXISTS `UM_HYBRID_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_HYBRID_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_ROLE_NAME` varchar(255) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_HYBRID_USER_ROLE`
--

DROP TABLE IF EXISTS `UM_HYBRID_USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_HYBRID_USER_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) DEFAULT NULL,
  `UM_ROLE_ID` int(11) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `UM_DOMAIN_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_USER_NAME` (`UM_USER_NAME`,`UM_ROLE_ID`,`UM_TENANT_ID`,`UM_DOMAIN_ID`),
  KEY `UM_ROLE_ID` (`UM_ROLE_ID`,`UM_TENANT_ID`),
  KEY `UM_DOMAIN_ID` (`UM_DOMAIN_ID`,`UM_TENANT_ID`),
  CONSTRAINT `um_hybrid_user_role_ibfk_1` FOREIGN KEY (`UM_ROLE_ID`, `UM_TENANT_ID`) REFERENCES `UM_HYBRID_ROLE` (`UM_ID`, `UM_TENANT_ID`) ON DELETE CASCADE,
  CONSTRAINT `um_hybrid_user_role_ibfk_2` FOREIGN KEY (`UM_DOMAIN_ID`, `UM_TENANT_ID`) REFERENCES `UM_DOMAIN` (`UM_DOMAIN_ID`, `UM_TENANT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_MODULE`
--

DROP TABLE IF EXISTS `UM_MODULE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_MODULE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_MODULE_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`UM_ID`),
  UNIQUE KEY `UM_MODULE_NAME` (`UM_MODULE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_MODULE_ACTIONS`
--

DROP TABLE IF EXISTS `UM_MODULE_ACTIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_MODULE_ACTIONS` (
  `UM_ACTION` varchar(255) NOT NULL,
  `UM_MODULE_ID` int(11) NOT NULL,
  PRIMARY KEY (`UM_ACTION`,`UM_MODULE_ID`),
  KEY `UM_MODULE_ID` (`UM_MODULE_ID`),
  CONSTRAINT `um_module_actions_ibfk_1` FOREIGN KEY (`UM_MODULE_ID`) REFERENCES `UM_MODULE` (`UM_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_PERMISSION`
--

DROP TABLE IF EXISTS `UM_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_PERMISSION` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_RESOURCE_ID` varchar(255) NOT NULL,
  `UM_ACTION` varchar(255) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `UM_MODULE_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  KEY `INDEX_UM_PERMISSION_UM_RESOURCE_ID_UM_ACTION` (`UM_RESOURCE_ID`,`UM_ACTION`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_PROFILE_CONFIG`
--

DROP TABLE IF EXISTS `UM_PROFILE_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_PROFILE_CONFIG` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_DIALECT_ID` int(11) NOT NULL,
  `UM_PROFILE_NAME` varchar(255) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  KEY `UM_DIALECT_ID` (`UM_DIALECT_ID`,`UM_TENANT_ID`),
  CONSTRAINT `um_profile_config_ibfk_1` FOREIGN KEY (`UM_DIALECT_ID`, `UM_TENANT_ID`) REFERENCES `UM_DIALECT` (`UM_ID`, `UM_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_ROLE`
--

DROP TABLE IF EXISTS `UM_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_ROLE_NAME` varchar(255) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `UM_SHARED_ROLE` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_ROLE_NAME` (`UM_ROLE_NAME`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_ROLE_PERMISSION`
--

DROP TABLE IF EXISTS `UM_ROLE_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_ROLE_PERMISSION` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_PERMISSION_ID` int(11) NOT NULL,
  `UM_ROLE_NAME` varchar(255) NOT NULL,
  `UM_IS_ALLOWED` smallint(6) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `UM_DOMAIN_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_PERMISSION_ID` (`UM_PERMISSION_ID`,`UM_ROLE_NAME`,`UM_TENANT_ID`,`UM_DOMAIN_ID`),
  KEY `UM_PERMISSION_ID_2` (`UM_PERMISSION_ID`,`UM_TENANT_ID`),
  KEY `UM_DOMAIN_ID` (`UM_DOMAIN_ID`,`UM_TENANT_ID`),
  CONSTRAINT `um_role_permission_ibfk_1` FOREIGN KEY (`UM_PERMISSION_ID`, `UM_TENANT_ID`) REFERENCES `UM_PERMISSION` (`UM_ID`, `UM_TENANT_ID`) ON DELETE CASCADE,
  CONSTRAINT `um_role_permission_ibfk_2` FOREIGN KEY (`UM_DOMAIN_ID`, `UM_TENANT_ID`) REFERENCES `UM_DOMAIN` (`UM_DOMAIN_ID`, `UM_TENANT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_SHARED_USER_ROLE`
--

DROP TABLE IF EXISTS `UM_SHARED_USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_SHARED_USER_ROLE` (
  `UM_ROLE_ID` int(11) NOT NULL,
  `UM_USER_ID` int(11) NOT NULL,
  `UM_USER_TENANT_ID` int(11) NOT NULL,
  `UM_ROLE_TENANT_ID` int(11) NOT NULL,
  UNIQUE KEY `UM_USER_ID` (`UM_USER_ID`,`UM_ROLE_ID`,`UM_USER_TENANT_ID`,`UM_ROLE_TENANT_ID`),
  KEY `UM_ROLE_ID` (`UM_ROLE_ID`,`UM_ROLE_TENANT_ID`),
  KEY `UM_USER_ID_2` (`UM_USER_ID`,`UM_USER_TENANT_ID`),
  CONSTRAINT `um_shared_user_role_ibfk_1` FOREIGN KEY (`UM_ROLE_ID`, `UM_ROLE_TENANT_ID`) REFERENCES `UM_ROLE` (`UM_ID`, `UM_TENANT_ID`) ON DELETE CASCADE,
  CONSTRAINT `um_shared_user_role_ibfk_2` FOREIGN KEY (`UM_USER_ID`, `UM_USER_TENANT_ID`) REFERENCES `UM_USER` (`UM_ID`, `UM_TENANT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_SYSTEM_ROLE`
--

DROP TABLE IF EXISTS `UM_SYSTEM_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_SYSTEM_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_ROLE_NAME` varchar(255) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_SYSTEM_USER`
--

DROP TABLE IF EXISTS `UM_SYSTEM_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_SYSTEM_USER` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) NOT NULL,
  `UM_USER_PASSWORD` varchar(255) NOT NULL,
  `UM_SALT_VALUE` varchar(31) DEFAULT NULL,
  `UM_REQUIRE_CHANGE` tinyint(1) DEFAULT '0',
  `UM_CHANGED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_USER_NAME` (`UM_USER_NAME`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_SYSTEM_USER_ROLE`
--

DROP TABLE IF EXISTS `UM_SYSTEM_USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_SYSTEM_USER_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) DEFAULT NULL,
  `UM_ROLE_ID` int(11) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_USER_NAME` (`UM_USER_NAME`,`UM_ROLE_ID`,`UM_TENANT_ID`),
  KEY `UM_ROLE_ID` (`UM_ROLE_ID`,`UM_TENANT_ID`),
  CONSTRAINT `um_system_user_role_ibfk_1` FOREIGN KEY (`UM_ROLE_ID`, `UM_TENANT_ID`) REFERENCES `UM_SYSTEM_ROLE` (`UM_ID`, `UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_TENANT`
--

DROP TABLE IF EXISTS `UM_TENANT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_TENANT` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_DOMAIN_NAME` varchar(255) NOT NULL,
  `UM_EMAIL` varchar(255) DEFAULT NULL,
  `UM_ACTIVE` tinyint(1) DEFAULT '0',
  `UM_CREATED_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UM_USER_CONFIG` longblob,
  PRIMARY KEY (`UM_ID`),
  UNIQUE KEY `UM_DOMAIN_NAME` (`UM_DOMAIN_NAME`),
  UNIQUE KEY `INDEX_UM_TENANT_UM_DOMAIN_NAME` (`UM_DOMAIN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_USER`
--

DROP TABLE IF EXISTS `UM_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_USER` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_USER_NAME` varchar(255) NOT NULL,
  `UM_USER_PASSWORD` varchar(255) NOT NULL,
  `UM_SALT_VALUE` varchar(31) DEFAULT NULL,
  `UM_REQUIRE_CHANGE` tinyint(1) DEFAULT '0',
  `UM_CHANGED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_USER_NAME` (`UM_USER_NAME`,`UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `UM_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_USER_ATTRIBUTE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_ATTR_NAME` varchar(255) NOT NULL,
  `UM_ATTR_VALUE` varchar(1024) DEFAULT NULL,
  `UM_PROFILE_ID` varchar(255) DEFAULT NULL,
  `UM_USER_ID` int(11) DEFAULT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  KEY `UM_USER_ID` (`UM_USER_ID`,`UM_TENANT_ID`),
  KEY `UM_USER_ID_INDEX` (`UM_USER_ID`),
  CONSTRAINT `um_user_attribute_ibfk_1` FOREIGN KEY (`UM_USER_ID`, `UM_TENANT_ID`) REFERENCES `UM_USER` (`UM_ID`, `UM_TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_USER_PERMISSION`
--

DROP TABLE IF EXISTS `UM_USER_PERMISSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_USER_PERMISSION` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_PERMISSION_ID` int(11) NOT NULL,
  `UM_USER_NAME` varchar(255) NOT NULL,
  `UM_IS_ALLOWED` smallint(6) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  KEY `UM_PERMISSION_ID` (`UM_PERMISSION_ID`,`UM_TENANT_ID`),
  CONSTRAINT `um_user_permission_ibfk_1` FOREIGN KEY (`UM_PERMISSION_ID`, `UM_TENANT_ID`) REFERENCES `UM_PERMISSION` (`UM_ID`, `UM_TENANT_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `UM_USER_ROLE`
--

DROP TABLE IF EXISTS `UM_USER_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UM_USER_ROLE` (
  `UM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `UM_ROLE_ID` int(11) NOT NULL,
  `UM_USER_ID` int(11) NOT NULL,
  `UM_TENANT_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`UM_ID`,`UM_TENANT_ID`),
  UNIQUE KEY `UM_USER_ID` (`UM_USER_ID`,`UM_ROLE_ID`,`UM_TENANT_ID`),
  KEY `UM_ROLE_ID` (`UM_ROLE_ID`,`UM_TENANT_ID`),
  KEY `UM_USER_ID_2` (`UM_USER_ID`,`UM_TENANT_ID`),
  CONSTRAINT `um_user_role_ibfk_1` FOREIGN KEY (`UM_ROLE_ID`, `UM_TENANT_ID`) REFERENCES `UM_ROLE` (`UM_ID`, `UM_TENANT_ID`),
  CONSTRAINT `um_user_role_ibfk_2` FOREIGN KEY (`UM_USER_ID`, `UM_TENANT_ID`) REFERENCES `UM_USER` (`UM_ID`, `UM_TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'CARBON_DB'
--

--
-- Dumping routines for database 'CARBON_DB'
--

--
-- Current Database: `ANALYTICS_PROCESSED_DATA_STORE`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ANALYTICS_PROCESSED_DATA_STORE` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ANALYTICS_PROCESSED_DATA_STORE`;

--
-- Table structure for table `ANX___7LgGz1xQ_`
--

DROP TABLE IF EXISTS `ANX___7LgGz1xQ_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LgGz1xQ_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LgGz1xQ__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LgGz1xQ__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lh7WC4U_`
--

DROP TABLE IF EXISTS `ANX___7Lh7WC4U_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lh7WC4U_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lh7WC4U__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lh7WC4U__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lh_RWPg_`
--

DROP TABLE IF EXISTS `ANX___7Lh_RWPg_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lh_RWPg_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lh_RWPg__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lh_RWPg__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lii6VtM_`
--

DROP TABLE IF EXISTS `ANX___7Lii6VtM_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lii6VtM_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lii6VtM__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lii6VtM__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lj1PtK8_`
--

DROP TABLE IF EXISTS `ANX___7Lj1PtK8_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lj1PtK8_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lj1PtK8__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lj1PtK8__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lj1kXmA_`
--

DROP TABLE IF EXISTS `ANX___7Lj1kXmA_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lj1kXmA_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lj1kXmA__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lj1kXmA__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lj_9EPw_`
--

DROP TABLE IF EXISTS `ANX___7Lj_9EPw_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lj_9EPw_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lj_9EPw__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lj_9EPw__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LjvRS8E_`
--

DROP TABLE IF EXISTS `ANX___7LjvRS8E_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LjvRS8E_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LjvRS8E__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LjvRS8E__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LkCZimc_`
--

DROP TABLE IF EXISTS `ANX___7LkCZimc_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LkCZimc_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LkCZimc__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LkCZimc__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LklC0tQ_`
--

DROP TABLE IF EXISTS `ANX___7LklC0tQ_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LklC0tQ_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LklC0tQ__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LklC0tQ__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LkvfuDI_`
--

DROP TABLE IF EXISTS `ANX___7LkvfuDI_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LkvfuDI_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LkvfuDI__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LkvfuDI__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LlMG_f0_`
--

DROP TABLE IF EXISTS `ANX___7LlMG_f0_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LlMG_f0_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LlMG_f0__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LlMG_f0__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lldfxow_`
--

DROP TABLE IF EXISTS `ANX___7Lldfxow_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lldfxow_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lldfxow__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lldfxow__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lm8xBdk_`
--

DROP TABLE IF EXISTS `ANX___7Lm8xBdk_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lm8xBdk_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lm8xBdk__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lm8xBdk__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LmdrDVI_`
--

DROP TABLE IF EXISTS `ANX___7LmdrDVI_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LmdrDVI_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LmdrDVI__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LmdrDVI__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LmyweWo_`
--

DROP TABLE IF EXISTS `ANX___7LmyweWo_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LmyweWo_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LmyweWo__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LmyweWo__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LnZLWEQ_`
--

DROP TABLE IF EXISTS `ANX___7LnZLWEQ_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LnZLWEQ_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LnZLWEQ__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LnZLWEQ__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LnjUAo4_`
--

DROP TABLE IF EXISTS `ANX___7LnjUAo4_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LnjUAo4_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LnjUAo4__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LnjUAo4__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LpmWZGg_`
--

DROP TABLE IF EXISTS `ANX___7LpmWZGg_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LpmWZGg_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LpmWZGg__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LpmWZGg__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LqUghxQ_`
--

DROP TABLE IF EXISTS `ANX___7LqUghxQ_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LqUghxQ_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LqUghxQ__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LqUghxQ__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lql55uQ_`
--

DROP TABLE IF EXISTS `ANX___7Lql55uQ_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lql55uQ_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lql55uQ__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lql55uQ__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lr_PUk0_`
--

DROP TABLE IF EXISTS `ANX___7Lr_PUk0_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lr_PUk0_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lr_PUk0__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lr_PUk0__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lt5FTKA_`
--

DROP TABLE IF EXISTS `ANX___7Lt5FTKA_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lt5FTKA_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lt5FTKA__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lt5FTKA__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lt_c9IM_`
--

DROP TABLE IF EXISTS `ANX___7Lt_c9IM_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lt_c9IM_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lt_c9IM__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lt_c9IM__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LtgHu48_`
--

DROP TABLE IF EXISTS `ANX___7LtgHu48_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LtgHu48_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LtgHu48__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LtgHu48__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LuX1UlU_`
--

DROP TABLE IF EXISTS `ANX___7LuX1UlU_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LuX1UlU_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LuX1UlU__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LuX1UlU__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lv6M00s_`
--

DROP TABLE IF EXISTS `ANX___7Lv6M00s_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lv6M00s_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lv6M00s__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lv6M00s__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'ANALYTICS_PROCESSED_DATA_STORE'
--

--
-- Dumping routines for database 'ANALYTICS_PROCESSED_DATA_STORE'
--

--
-- Current Database: `CDM_DB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `CDM_DB` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `CDM_DB`;

--
-- Table structure for table `DM_APPLICATION`
--

DROP TABLE IF EXISTS `DM_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_APPLICATION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(150) NOT NULL,
  `APP_IDENTIFIER` varchar(150) NOT NULL,
  `PLATFORM` varchar(50) DEFAULT NULL,
  `CATEGORY` varchar(50) DEFAULT NULL,
  `VERSION` varchar(50) DEFAULT NULL,
  `TYPE` varchar(50) DEFAULT NULL,
  `LOCATION_URL` varchar(100) DEFAULT NULL,
  `IMAGE_URL` varchar(100) DEFAULT NULL,
  `APP_PROPERTIES` blob,
  `MEMORY_USAGE` int(10) DEFAULT NULL,
  `IS_ACTIVE` tinyint(1) NOT NULL DEFAULT '0',
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_COMMAND_OPERATION`
--

DROP TABLE IF EXISTS `DM_COMMAND_OPERATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_COMMAND_OPERATION` (
  `OPERATION_ID` int(11) NOT NULL,
  `ENABLED` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`OPERATION_ID`),
  CONSTRAINT `FK_DM_OPERATION_COMMAND` FOREIGN KEY (`OPERATION_ID`) REFERENCES `DM_OPERATION` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_CONFIG_OPERATION`
--

DROP TABLE IF EXISTS `DM_CONFIG_OPERATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_CONFIG_OPERATION` (
  `OPERATION_ID` int(11) NOT NULL,
  `OPERATION_CONFIG` blob,
  PRIMARY KEY (`OPERATION_ID`),
  CONSTRAINT `FK_DM_OPERATION_CONFIG` FOREIGN KEY (`OPERATION_ID`) REFERENCES `DM_OPERATION` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_CRITERIA`
--

DROP TABLE IF EXISTS `DM_CRITERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_CRITERIA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE`
--

DROP TABLE IF EXISTS `DM_DEVICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text,
  `NAME` varchar(100) DEFAULT NULL,
  `DEVICE_TYPE_ID` int(11) DEFAULT NULL,
  `DEVICE_IDENTIFICATION` varchar(300) DEFAULT NULL,
  `LAST_UPDATED_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TENANT_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_DM_DEVICE_DM_DEVICE_TYPE2` (`DEVICE_TYPE_ID`),
  KEY `IDX_DM_DEVICE` (`TENANT_ID`,`DEVICE_TYPE_ID`),
  CONSTRAINT `fk_DM_DEVICE_DM_DEVICE_TYPE2` FOREIGN KEY (`DEVICE_TYPE_ID`) REFERENCES `DM_DEVICE_TYPE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE_APPLICATION_MAPPING`
--

DROP TABLE IF EXISTS `DM_DEVICE_APPLICATION_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE_APPLICATION_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(11) NOT NULL,
  `APPLICATION_ID` int(11) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_dm_device` (`DEVICE_ID`),
  KEY `fk_dm_application` (`APPLICATION_ID`),
  CONSTRAINT `fk_dm_application` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `DM_APPLICATION` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dm_device` FOREIGN KEY (`DEVICE_ID`) REFERENCES `DM_DEVICE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE_DETAIL`
--

DROP TABLE IF EXISTS `DM_DEVICE_DETAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE_DETAIL` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(11) NOT NULL,
  `DEVICE_MODEL` varchar(45) DEFAULT NULL,
  `VENDOR` varchar(45) DEFAULT NULL,
  `OS_VERSION` varchar(45) DEFAULT NULL,
  `OS_BUILD_DATE` varchar(100) DEFAULT NULL,
  `BATTERY_LEVEL` decimal(4,0) DEFAULT NULL,
  `INTERNAL_TOTAL_MEMORY` decimal(30,3) DEFAULT NULL,
  `INTERNAL_AVAILABLE_MEMORY` decimal(30,3) DEFAULT NULL,
  `EXTERNAL_TOTAL_MEMORY` decimal(30,3) DEFAULT NULL,
  `EXTERNAL_AVAILABLE_MEMORY` decimal(30,3) DEFAULT NULL,
  `CONNECTION_TYPE` varchar(10) DEFAULT NULL,
  `SSID` varchar(45) DEFAULT NULL,
  `CPU_USAGE` decimal(5,0) DEFAULT NULL,
  `TOTAL_RAM_MEMORY` decimal(30,3) DEFAULT NULL,
  `AVAILABLE_RAM_MEMORY` decimal(30,3) DEFAULT NULL,
  `PLUGGED_IN` int(1) DEFAULT NULL,
  `UPDATE_TIMESTAMP` bigint(15) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DM_DEVICE_DETAILS_DEVICE_idx` (`DEVICE_ID`),
  CONSTRAINT `FK_DM_DEVICE_DETAILS_DEVICE` FOREIGN KEY (`DEVICE_ID`) REFERENCES `DM_DEVICE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE_GROUP_MAP`
--

DROP TABLE IF EXISTS `DM_DEVICE_GROUP_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE_GROUP_MAP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(11) DEFAULT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_DM_DEVICE_GROUP_MAP_DM_DEVICE2` (`DEVICE_ID`),
  KEY `fk_DM_DEVICE_GROUP_MAP_DM_GROUP2` (`GROUP_ID`),
  CONSTRAINT `fk_DM_DEVICE_GROUP_MAP_DM_DEVICE2` FOREIGN KEY (`DEVICE_ID`) REFERENCES `DM_DEVICE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_DM_DEVICE_GROUP_MAP_DM_GROUP2` FOREIGN KEY (`GROUP_ID`) REFERENCES `DM_GROUP` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE_GROUP_POLICY`
--

DROP TABLE IF EXISTS `DM_DEVICE_GROUP_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE_GROUP_POLICY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_GROUP_ID` int(11) NOT NULL,
  `POLICY_ID` int(11) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DM_DEVICE_GROUP_POLICY` (`DEVICE_GROUP_ID`),
  KEY `FK_DM_DEVICE_GROUP_DM_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_DM_DEVICE_GROUP_DM_POLICY` FOREIGN KEY (`POLICY_ID`) REFERENCES `DM_POLICY` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_DM_DEVICE_GROUP_POLICY` FOREIGN KEY (`DEVICE_GROUP_ID`) REFERENCES `DM_GROUP` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE_INFO`
--

DROP TABLE IF EXISTS `DM_DEVICE_INFO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE_INFO` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(11) DEFAULT NULL,
  `KEY_FIELD` varchar(45) DEFAULT NULL,
  `VALUE_FIELD` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `DM_DEVICE_INFO_DEVICE_idx` (`DEVICE_ID`),
  CONSTRAINT `DM_DEVICE_INFO_DEVICE` FOREIGN KEY (`DEVICE_ID`) REFERENCES `DM_DEVICE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE_LOCATION`
--

DROP TABLE IF EXISTS `DM_DEVICE_LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE_LOCATION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(11) DEFAULT NULL,
  `LATITUDE` double DEFAULT NULL,
  `LONGITUDE` double DEFAULT NULL,
  `STREET1` varchar(45) DEFAULT NULL,
  `STREET2` varchar(45) DEFAULT NULL,
  `CITY` varchar(45) DEFAULT NULL,
  `ZIP` varchar(10) DEFAULT NULL,
  `STATE` varchar(45) DEFAULT NULL,
  `COUNTRY` varchar(45) DEFAULT NULL,
  `UPDATE_TIMESTAMP` bigint(15) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `DM_DEVICE_LOCATION_DEVICE_idx` (`DEVICE_ID`),
  CONSTRAINT `DM_DEVICE_LOCATION_DEVICE` FOREIGN KEY (`DEVICE_ID`) REFERENCES `DM_DEVICE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE_OPERATION_RESPONSE`
--

DROP TABLE IF EXISTS `DM_DEVICE_OPERATION_RESPONSE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE_OPERATION_RESPONSE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENROLMENT_ID` int(11) NOT NULL,
  `OPERATION_ID` int(11) NOT NULL,
  `OPERATION_RESPONSE` longblob,
  `RECEIVED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_dm_device_operation_response_enrollment` (`ENROLMENT_ID`),
  KEY `IDX_ENID_OPID` (`OPERATION_ID`,`ENROLMENT_ID`),
  CONSTRAINT `fk_dm_device_operation_response_enrollment` FOREIGN KEY (`ENROLMENT_ID`) REFERENCES `DM_ENROLMENT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dm_device_operation_response_operation` FOREIGN KEY (`OPERATION_ID`) REFERENCES `DM_OPERATION` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE_POLICY`
--

DROP TABLE IF EXISTS `DM_DEVICE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE_POLICY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(11) NOT NULL,
  `ENROLMENT_ID` int(11) NOT NULL,
  `DEVICE` blob NOT NULL,
  `POLICY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_POLICY_DEVICE_POLICY` (`POLICY_ID`),
  KEY `FK_DEVICE_DEVICE_POLICY` (`DEVICE_ID`),
  CONSTRAINT `FK_DEVICE_DEVICE_POLICY` FOREIGN KEY (`DEVICE_ID`) REFERENCES `DM_DEVICE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_POLICY_DEVICE_POLICY` FOREIGN KEY (`POLICY_ID`) REFERENCES `DM_POLICY` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE_POLICY_APPLIED`
--

DROP TABLE IF EXISTS `DM_DEVICE_POLICY_APPLIED`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE_POLICY_APPLIED` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(11) NOT NULL,
  `ENROLMENT_ID` int(11) NOT NULL,
  `POLICY_ID` int(11) NOT NULL,
  `POLICY_CONTENT` blob,
  `TENANT_ID` int(11) NOT NULL,
  `APPLIED` tinyint(1) DEFAULT NULL,
  `CREATED_TIME` timestamp NULL DEFAULT NULL,
  `UPDATED_TIME` timestamp NULL DEFAULT NULL,
  `APPLIED_TIME` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DM_POLICY_DEVCIE_APPLIED` (`DEVICE_ID`),
  CONSTRAINT `FK_DM_POLICY_DEVCIE_APPLIED` FOREIGN KEY (`DEVICE_ID`) REFERENCES `DM_DEVICE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE_TYPE`
--

DROP TABLE IF EXISTS `DM_DEVICE_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE_TYPE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(300) DEFAULT NULL,
  `PROVIDER_TENANT_ID` int(11) DEFAULT '0',
  `SHARED_WITH_ALL_TENANTS` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_DEVICE_TYPE` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_DEVICE_TYPE_POLICY`
--

DROP TABLE IF EXISTS `DM_DEVICE_TYPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_DEVICE_TYPE_POLICY` (
  `ID` int(11) NOT NULL,
  `DEVICE_TYPE` varchar(300) NOT NULL,
  `POLICY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DEVICE_TYPE_POLICY` (`POLICY_ID`),
  KEY `FK_DEVICE_TYPE_POLICY_DEVICE_TYPE` (`DEVICE_TYPE`),
  CONSTRAINT `FK_DEVICE_TYPE_POLICY` FOREIGN KEY (`POLICY_ID`) REFERENCES `DM_POLICY` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_DEVICE_TYPE_POLICY_DEVICE_TYPE` FOREIGN KEY (`DEVICE_TYPE`) REFERENCES `DM_DEVICE_TYPE` (`NAME`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_ENROLMENT`
--

DROP TABLE IF EXISTS `DM_ENROLMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_ENROLMENT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(11) NOT NULL,
  `OWNER` varchar(50) NOT NULL,
  `OWNERSHIP` varchar(45) DEFAULT NULL,
  `STATUS` varchar(50) DEFAULT NULL,
  `DATE_OF_ENROLMENT` timestamp NULL DEFAULT NULL,
  `DATE_OF_LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ENROLMENT_FK_DEVICE_ID` (`DEVICE_ID`),
  KEY `IDX_ENROLMENT_DEVICE_ID_TENANT_ID` (`DEVICE_ID`,`TENANT_ID`),
  CONSTRAINT `FK_DM_DEVICE_ENROLMENT` FOREIGN KEY (`DEVICE_ID`) REFERENCES `DM_DEVICE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_ENROLMENT_OP_MAPPING`
--

DROP TABLE IF EXISTS `DM_ENROLMENT_OP_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_ENROLMENT_OP_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENROLMENT_ID` int(11) NOT NULL,
  `OPERATION_ID` int(11) NOT NULL,
  `STATUS` varchar(50) DEFAULT NULL,
  `CREATED_TIMESTAMP` int(11) NOT NULL,
  `UPDATED_TIMESTAMP` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_dm_device_operation_mapping_operation` (`OPERATION_ID`),
  KEY `IDX_DM_ENROLMENT_OP_MAPPING` (`ENROLMENT_ID`,`OPERATION_ID`),
  KEY `ID_DM_ENROLMENT_OP_MAPPING_UPDATED_TIMESTAMP` (`UPDATED_TIMESTAMP`),
  KEY `IDX_ENROLMENT_OP_MAPPING` (`UPDATED_TIMESTAMP`),
  KEY `IDX_EN_OP_MAPPING_EN_ID` (`ENROLMENT_ID`),
  KEY `IDX_EN_OP_MAPPING_OP_ID` (`OPERATION_ID`),
  CONSTRAINT `fk_dm_device_operation_mapping_device` FOREIGN KEY (`ENROLMENT_ID`) REFERENCES `DM_ENROLMENT` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dm_device_operation_mapping_operation` FOREIGN KEY (`OPERATION_ID`) REFERENCES `DM_OPERATION` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_GROUP`
--

DROP TABLE IF EXISTS `DM_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_GROUP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_NAME` varchar(100) DEFAULT NULL,
  `DESCRIPTION` text,
  `OWNER` varchar(45) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_NOTIFICATION`
--

DROP TABLE IF EXISTS `DM_NOTIFICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_NOTIFICATION` (
  `NOTIFICATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(11) NOT NULL,
  `OPERATION_ID` int(11) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`NOTIFICATION_ID`),
  KEY `fk_dm_device_notification` (`DEVICE_ID`),
  KEY `fk_dm_operation_notification` (`OPERATION_ID`),
  CONSTRAINT `fk_dm_device_notification` FOREIGN KEY (`DEVICE_ID`) REFERENCES `DM_DEVICE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_dm_operation_notification` FOREIGN KEY (`OPERATION_ID`) REFERENCES `DM_OPERATION` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_OPERATION`
--

DROP TABLE IF EXISTS `DM_OPERATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_OPERATION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(20) NOT NULL,
  `CREATED_TIMESTAMP` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `RECEIVED_TIMESTAMP` timestamp NULL DEFAULT NULL,
  `OPERATION_CODE` varchar(50) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_POLICY`
--

DROP TABLE IF EXISTS `DM_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_POLICY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `PROFILE_ID` int(11) NOT NULL,
  `OWNERSHIP_TYPE` varchar(45) DEFAULT NULL,
  `COMPLIANCE` varchar(100) DEFAULT NULL,
  `PRIORITY` int(11) NOT NULL,
  `ACTIVE` int(2) NOT NULL,
  `UPDATED` int(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DM_PROFILE_DM_POLICY` (`PROFILE_ID`),
  CONSTRAINT `FK_DM_PROFILE_DM_POLICY` FOREIGN KEY (`PROFILE_ID`) REFERENCES `DM_PROFILE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_POLICY_CHANGE_MGT`
--

DROP TABLE IF EXISTS `DM_POLICY_CHANGE_MGT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_POLICY_CHANGE_MGT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POLICY_ID` int(11) NOT NULL,
  `DEVICE_TYPE` varchar(300) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_POLICY_COMPLIANCE_FEATURES`
--

DROP TABLE IF EXISTS `DM_POLICY_COMPLIANCE_FEATURES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_POLICY_COMPLIANCE_FEATURES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMPLIANCE_STATUS_ID` int(11) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `FEATURE_CODE` varchar(100) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_COMPLIANCE_FEATURES_STATUS` (`COMPLIANCE_STATUS_ID`),
  CONSTRAINT `FK_COMPLIANCE_FEATURES_STATUS` FOREIGN KEY (`COMPLIANCE_STATUS_ID`) REFERENCES `DM_POLICY_COMPLIANCE_STATUS` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_POLICY_COMPLIANCE_STATUS`
--

DROP TABLE IF EXISTS `DM_POLICY_COMPLIANCE_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_POLICY_COMPLIANCE_STATUS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` int(11) NOT NULL,
  `ENROLMENT_ID` int(11) NOT NULL,
  `POLICY_ID` int(11) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `LAST_SUCCESS_TIME` timestamp NULL DEFAULT NULL,
  `LAST_REQUESTED_TIME` timestamp NULL DEFAULT NULL,
  `LAST_FAILED_TIME` timestamp NULL DEFAULT NULL,
  `ATTEMPTS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_POLICY_CRITERIA`
--

DROP TABLE IF EXISTS `DM_POLICY_CRITERIA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_POLICY_CRITERIA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CRITERIA_ID` int(11) NOT NULL,
  `POLICY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_CRITERIA_POLICY_CRITERIA` (`CRITERIA_ID`),
  KEY `FK_POLICY_POLICY_CRITERIA` (`POLICY_ID`),
  CONSTRAINT `FK_CRITERIA_POLICY_CRITERIA` FOREIGN KEY (`CRITERIA_ID`) REFERENCES `DM_CRITERIA` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_POLICY_POLICY_CRITERIA` FOREIGN KEY (`POLICY_ID`) REFERENCES `DM_POLICY` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_POLICY_CRITERIA_PROPERTIES`
--

DROP TABLE IF EXISTS `DM_POLICY_CRITERIA_PROPERTIES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_POLICY_CRITERIA_PROPERTIES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POLICY_CRITERION_ID` int(11) NOT NULL,
  `PROP_KEY` varchar(45) DEFAULT NULL,
  `PROP_VALUE` varchar(100) DEFAULT NULL,
  `CONTENT` blob COMMENT 'This is used to ',
  PRIMARY KEY (`ID`),
  KEY `FK_POLICY_CRITERIA_PROPERTIES` (`POLICY_CRITERION_ID`),
  CONSTRAINT `FK_POLICY_CRITERIA_PROPERTIES` FOREIGN KEY (`POLICY_CRITERION_ID`) REFERENCES `DM_POLICY_CRITERIA` (`ID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_POLICY_OPERATION`
--

DROP TABLE IF EXISTS `DM_POLICY_OPERATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_POLICY_OPERATION` (
  `OPERATION_ID` int(11) NOT NULL,
  `ENABLED` int(11) NOT NULL DEFAULT '0',
  `OPERATION_DETAILS` blob,
  PRIMARY KEY (`OPERATION_ID`),
  CONSTRAINT `FK_DM_OPERATION_POLICY` FOREIGN KEY (`OPERATION_ID`) REFERENCES `DM_OPERATION` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_PROFILE`
--

DROP TABLE IF EXISTS `DM_PROFILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_PROFILE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROFILE_NAME` varchar(45) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DEVICE_TYPE` varchar(300) NOT NULL,
  `CREATED_TIME` datetime NOT NULL,
  `UPDATED_TIME` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `DM_PROFILE_DEVICE_TYPE` (`DEVICE_TYPE`),
  CONSTRAINT `DM_PROFILE_DEVICE_TYPE` FOREIGN KEY (`DEVICE_TYPE`) REFERENCES `DM_DEVICE_TYPE` (`NAME`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_PROFILE_FEATURES`
--

DROP TABLE IF EXISTS `DM_PROFILE_FEATURES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_PROFILE_FEATURES` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROFILE_ID` int(11) NOT NULL,
  `FEATURE_CODE` varchar(100) NOT NULL,
  `DEVICE_TYPE` varchar(300) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `CONTENT` blob,
  PRIMARY KEY (`ID`),
  KEY `FK_DM_PROFILE_DM_POLICY_FEATURES` (`PROFILE_ID`),
  CONSTRAINT `FK_DM_PROFILE_DM_POLICY_FEATURES` FOREIGN KEY (`PROFILE_ID`) REFERENCES `DM_PROFILE` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_PROFILE_OPERATION`
--

DROP TABLE IF EXISTS `DM_PROFILE_OPERATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_PROFILE_OPERATION` (
  `OPERATION_ID` int(11) NOT NULL,
  `ENABLED` int(11) NOT NULL DEFAULT '0',
  `OPERATION_DETAILS` blob,
  PRIMARY KEY (`OPERATION_ID`),
  CONSTRAINT `FK_DM_OPERATION_PROFILE` FOREIGN KEY (`OPERATION_ID`) REFERENCES `DM_OPERATION` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_ROLE_GROUP_MAP`
--

DROP TABLE IF EXISTS `DM_ROLE_GROUP_MAP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_ROLE_GROUP_MAP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) DEFAULT NULL,
  `ROLE` varchar(45) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `DM_ROLE_GROUP_MAP_DM_GROUP2` (`GROUP_ID`),
  CONSTRAINT `DM_ROLE_GROUP_MAP_DM_GROUP2` FOREIGN KEY (`GROUP_ID`) REFERENCES `DM_GROUP` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_ROLE_POLICY`
--

DROP TABLE IF EXISTS `DM_ROLE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_ROLE_POLICY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(45) NOT NULL,
  `POLICY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ROLE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_ROLE_POLICY_POLICY` FOREIGN KEY (`POLICY_ID`) REFERENCES `DM_POLICY` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DM_USER_POLICY`
--

DROP TABLE IF EXISTS `DM_USER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DM_USER_POLICY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POLICY_ID` int(11) NOT NULL,
  `USERNAME` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `DM_POLICY_USER_POLICY` (`POLICY_ID`),
  CONSTRAINT `DM_POLICY_USER_POLICY` FOREIGN KEY (`POLICY_ID`) REFERENCES `DM_POLICY` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `device_info_view`
--

DROP TABLE IF EXISTS `device_info_view`;
/*!50001 DROP VIEW IF EXISTS `device_info_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `device_info_view` AS SELECT 
 1 AS `DEVICE_ID`,
 1 AS `DEVICE_IDENTIFICATION`,
 1 AS `PLATFORM`,
 1 AS `OWNERSHIP`,
 1 AS `CONNECTIVITY_STATUS`,
 1 AS `TENANT_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `device_with_policy_info_view`
--

DROP TABLE IF EXISTS `device_with_policy_info_view`;
/*!50001 DROP VIEW IF EXISTS `device_with_policy_info_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `device_with_policy_info_view` AS SELECT 
 1 AS `DEVICE_ID`,
 1 AS `POLICY_ID`,
 1 AS `IS_COMPLIANT`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `feature_non_compliance_info`
--

DROP TABLE IF EXISTS `feature_non_compliance_info`;
/*!50001 DROP VIEW IF EXISTS `feature_non_compliance_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `feature_non_compliance_info` AS SELECT 
 1 AS `DEVICE_ID`,
 1 AS `DEVICE_IDENTIFICATION`,
 1 AS `DEVICE_MODEL`,
 1 AS `VENDOR`,
 1 AS `OS_VERSION`,
 1 AS `OWNERSHIP`,
 1 AS `OWNER`,
 1 AS `CONNECTIVITY_STATUS`,
 1 AS `POLICY_ID`,
 1 AS `PLATFORM`,
 1 AS `FEATURE_CODE`,
 1 AS `IS_COMPLAINT`,
 1 AS `TENANT_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `policy_compliance_info`
--

DROP TABLE IF EXISTS `policy_compliance_info`;
/*!50001 DROP VIEW IF EXISTS `policy_compliance_info`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `policy_compliance_info` AS SELECT 
 1 AS `DEVICE_ID`,
 1 AS `DEVICE_IDENTIFICATION`,
 1 AS `PLATFORM`,
 1 AS `OWNERSHIP`,
 1 AS `CONNECTIVITY_STATUS`,
 1 AS `POLICY_ID`,
 1 AS `IS_COMPLIANT`,
 1 AS `TENANT_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'CDM_DB'
--

--
-- Dumping routines for database 'CDM_DB'
--

--
-- Current Database: `APIMGT_DB`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `APIMGT_DB` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `APIMGT_DB`;

--
-- Table structure for table `AM_ALERT_EMAILLIST`
--

DROP TABLE IF EXISTS `AM_ALERT_EMAILLIST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_ALERT_EMAILLIST` (
  `EMAIL_LIST_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(255) NOT NULL,
  `STAKE_HOLDER` varchar(100) NOT NULL,
  PRIMARY KEY (`EMAIL_LIST_ID`),
  UNIQUE KEY `AM_ALERT_EMAILLIST_CONSTRAINT` (`EMAIL_LIST_ID`,`USER_NAME`,`STAKE_HOLDER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_ALERT_EMAILLIST_DETAILS`
--

DROP TABLE IF EXISTS `AM_ALERT_EMAILLIST_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_ALERT_EMAILLIST_DETAILS` (
  `EMAIL_LIST_ID` int(11) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  UNIQUE KEY `AM_ALERT_EMAILLIST_DETAILS_CONSTRAINT` (`EMAIL_LIST_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_ALERT_TYPES`
--

DROP TABLE IF EXISTS `AM_ALERT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_ALERT_TYPES` (
  `ALERT_TYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `ALERT_TYPE_NAME` varchar(255) NOT NULL,
  `STAKE_HOLDER` varchar(100) NOT NULL,
  PRIMARY KEY (`ALERT_TYPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_ALERT_TYPES_VALUES`
--

DROP TABLE IF EXISTS `AM_ALERT_TYPES_VALUES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_ALERT_TYPES_VALUES` (
  `ALERT_TYPE_ID` int(11) DEFAULT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `STAKE_HOLDER` varchar(100) NOT NULL,
  UNIQUE KEY `AM_ALERT_TYPES_VALUES_CONSTRAINT` (`ALERT_TYPE_ID`,`USER_NAME`,`STAKE_HOLDER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_API`
--

DROP TABLE IF EXISTS `AM_API`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API` (
  `API_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_PROVIDER` varchar(200) DEFAULT NULL,
  `API_NAME` varchar(200) DEFAULT NULL,
  `API_VERSION` varchar(30) DEFAULT NULL,
  `CONTEXT` varchar(256) DEFAULT NULL,
  `CONTEXT_TEMPLATE` varchar(256) DEFAULT NULL,
  `API_TIER` varchar(256) DEFAULT NULL,
  `CREATED_BY` varchar(100) DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `UPDATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`API_ID`),
  UNIQUE KEY `API_PROVIDER` (`API_PROVIDER`,`API_NAME`,`API_VERSION`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_API_COMMENTS`
--

DROP TABLE IF EXISTS `AM_API_COMMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_COMMENTS` (
  `COMMENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `COMMENT_TEXT` varchar(512) DEFAULT NULL,
  `COMMENTED_USER` varchar(255) DEFAULT NULL,
  `DATE_COMMENTED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `API_ID` int(11) NOT NULL,
  PRIMARY KEY (`COMMENT_ID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `am_api_comments_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_API_DEFAULT_VERSION`
--

DROP TABLE IF EXISTS `AM_API_DEFAULT_VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_DEFAULT_VERSION` (
  `DEFAULT_VERSION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_NAME` varchar(256) NOT NULL,
  `API_PROVIDER` varchar(256) NOT NULL,
  `DEFAULT_API_VERSION` varchar(30) DEFAULT NULL,
  `PUBLISHED_DEFAULT_API_VERSION` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`DEFAULT_VERSION_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_API_LC_EVENT`
--

DROP TABLE IF EXISTS `AM_API_LC_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_LC_EVENT` (
  `EVENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_ID` int(11) NOT NULL,
  `PREVIOUS_STATE` varchar(50) DEFAULT NULL,
  `NEW_STATE` varchar(50) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `EVENT_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`EVENT_ID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `am_api_lc_event_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_API_RATINGS`
--

DROP TABLE IF EXISTS `AM_API_RATINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_RATINGS` (
  `RATING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_ID` int(11) DEFAULT NULL,
  `RATING` int(11) DEFAULT NULL,
  `SUBSCRIBER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`RATING_ID`),
  KEY `API_ID` (`API_ID`),
  KEY `SUBSCRIBER_ID` (`SUBSCRIBER_ID`),
  CONSTRAINT `am_api_ratings_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON UPDATE CASCADE,
  CONSTRAINT `am_api_ratings_ibfk_2` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `AM_SUBSCRIBER` (`SUBSCRIBER_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_API_SCOPES`
--

DROP TABLE IF EXISTS `AM_API_SCOPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_SCOPES` (
  `API_ID` int(11) NOT NULL,
  `SCOPE_ID` int(11) NOT NULL,
  KEY `API_ID` (`API_ID`),
  KEY `SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `am_api_scopes_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `am_api_scopes_ibfk_2` FOREIGN KEY (`SCOPE_ID`) REFERENCES `IDN_OAUTH2_SCOPE` (`SCOPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_API_THROTTLE_POLICY`
--

DROP TABLE IF EXISTS `AM_API_THROTTLE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_THROTTLE_POLICY` (
  `POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DISPLAY_NAME` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `DEFAULT_QUOTA_TYPE` varchar(25) NOT NULL,
  `DEFAULT_QUOTA` int(11) NOT NULL,
  `DEFAULT_QUOTA_UNIT` varchar(10) DEFAULT NULL,
  `DEFAULT_UNIT_TIME` int(11) NOT NULL,
  `DEFAULT_TIME_UNIT` varchar(25) NOT NULL,
  `APPLICABLE_LEVEL` varchar(25) NOT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `UUID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `API_NAME_TENANT` (`NAME`,`TENANT_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_AATP_DQT` (`DEFAULT_QUOTA_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_API_URL_MAPPING`
--

DROP TABLE IF EXISTS `AM_API_URL_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_API_URL_MAPPING` (
  `URL_MAPPING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_ID` int(11) NOT NULL,
  `HTTP_METHOD` varchar(20) DEFAULT NULL,
  `AUTH_SCHEME` varchar(50) DEFAULT NULL,
  `URL_PATTERN` varchar(512) DEFAULT NULL,
  `THROTTLING_TIER` varchar(512) DEFAULT NULL,
  `MEDIATION_SCRIPT` blob,
  PRIMARY KEY (`URL_MAPPING_ID`),
  KEY `IDX_AAUM_AI` (`API_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_APPLICATION`
--

DROP TABLE IF EXISTS `AM_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_APPLICATION` (
  `APPLICATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `SUBSCRIBER_ID` int(11) DEFAULT NULL,
  `APPLICATION_TIER` varchar(50) DEFAULT 'Unlimited',
  `CALLBACK_URL` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `APPLICATION_STATUS` varchar(50) DEFAULT 'APPROVED',
  `GROUP_ID` varchar(100) DEFAULT NULL,
  `CREATED_BY` varchar(100) DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `UPDATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UUID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`APPLICATION_ID`),
  UNIQUE KEY `NAME` (`NAME`,`SUBSCRIBER_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `SUBSCRIBER_ID` (`SUBSCRIBER_ID`),
  KEY `IDX_AA_AT_CB` (`APPLICATION_TIER`,`CREATED_BY`),
  CONSTRAINT `am_application_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `AM_SUBSCRIBER` (`SUBSCRIBER_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_APPLICATION_KEY_MAPPING`
--

DROP TABLE IF EXISTS `AM_APPLICATION_KEY_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_APPLICATION_KEY_MAPPING` (
  `APPLICATION_ID` int(11) NOT NULL DEFAULT '0',
  `CONSUMER_KEY` varchar(255) DEFAULT NULL,
  `KEY_TYPE` varchar(255) NOT NULL,
  `STATE` varchar(30) NOT NULL,
  `CREATE_MODE` varchar(30) DEFAULT 'CREATED',
  PRIMARY KEY (`APPLICATION_ID`,`KEY_TYPE`),
  KEY `IDX_AAKM_CK` (`CONSUMER_KEY`),
  CONSTRAINT `am_application_key_mapping_ibfk_1` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_APPLICATION_REGISTRATION`
--

DROP TABLE IF EXISTS `AM_APPLICATION_REGISTRATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_APPLICATION_REGISTRATION` (
  `REG_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUBSCRIBER_ID` int(11) DEFAULT NULL,
  `WF_REF` varchar(255) NOT NULL,
  `APP_ID` int(11) DEFAULT NULL,
  `TOKEN_TYPE` varchar(30) DEFAULT NULL,
  `TOKEN_SCOPE` varchar(256) DEFAULT 'default',
  `INPUTS` varchar(1000) DEFAULT NULL,
  `ALLOWED_DOMAINS` varchar(256) DEFAULT NULL,
  `VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`REG_ID`),
  UNIQUE KEY `SUBSCRIBER_ID` (`SUBSCRIBER_ID`,`APP_ID`,`TOKEN_TYPE`),
  KEY `APP_ID` (`APP_ID`),
  CONSTRAINT `am_application_registration_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `AM_SUBSCRIBER` (`SUBSCRIBER_ID`) ON UPDATE CASCADE,
  CONSTRAINT `am_application_registration_ibfk_2` FOREIGN KEY (`APP_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_APP_KEY_DOMAIN_MAPPING`
--

DROP TABLE IF EXISTS `AM_APP_KEY_DOMAIN_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_APP_KEY_DOMAIN_MAPPING` (
  `CONSUMER_KEY` varchar(255) NOT NULL DEFAULT '',
  `AUTHZ_DOMAIN` varchar(255) NOT NULL DEFAULT 'ALL',
  PRIMARY KEY (`CONSUMER_KEY`,`AUTHZ_DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_BLOCK_CONDITIONS`
--

DROP TABLE IF EXISTS `AM_BLOCK_CONDITIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_BLOCK_CONDITIONS` (
  `CONDITION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(45) DEFAULT NULL,
  `VALUE` varchar(512) DEFAULT NULL,
  `ENABLED` varchar(45) DEFAULT NULL,
  `DOMAIN` varchar(45) DEFAULT NULL,
  `UUID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`CONDITION_ID`),
  UNIQUE KEY `UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_CONDITION_GROUP`
--

DROP TABLE IF EXISTS `AM_CONDITION_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_CONDITION_GROUP` (
  `CONDITION_GROUP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `POLICY_ID` int(11) NOT NULL,
  `QUOTA_TYPE` varchar(25) DEFAULT NULL,
  `QUOTA` int(11) NOT NULL,
  `QUOTA_UNIT` varchar(10) DEFAULT NULL,
  `UNIT_TIME` int(11) NOT NULL,
  `TIME_UNIT` varchar(25) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`CONDITION_GROUP_ID`),
  KEY `POLICY_ID` (`POLICY_ID`),
  KEY `IDX_ACG_QT` (`QUOTA_TYPE`),
  CONSTRAINT `am_condition_group_ibfk_1` FOREIGN KEY (`POLICY_ID`) REFERENCES `AM_API_THROTTLE_POLICY` (`POLICY_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_EXTERNAL_STORES`
--

DROP TABLE IF EXISTS `AM_EXTERNAL_STORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_EXTERNAL_STORES` (
  `APISTORE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `API_ID` int(11) DEFAULT NULL,
  `STORE_ID` varchar(255) NOT NULL,
  `STORE_DISPLAY_NAME` varchar(255) NOT NULL,
  `STORE_ENDPOINT` varchar(255) NOT NULL,
  `STORE_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`APISTORE_ID`),
  KEY `API_ID` (`API_ID`),
  CONSTRAINT `am_external_stores_ibfk_1` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_HEADER_FIELD_CONDITION`
--

DROP TABLE IF EXISTS `AM_HEADER_FIELD_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_HEADER_FIELD_CONDITION` (
  `HEADER_FIELD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONDITION_GROUP_ID` int(11) NOT NULL,
  `HEADER_FIELD_NAME` varchar(255) DEFAULT NULL,
  `HEADER_FIELD_VALUE` varchar(255) DEFAULT NULL,
  `IS_HEADER_FIELD_MAPPING` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`HEADER_FIELD_ID`),
  KEY `CONDITION_GROUP_ID` (`CONDITION_GROUP_ID`),
  CONSTRAINT `am_header_field_condition_ibfk_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_IP_CONDITION`
--

DROP TABLE IF EXISTS `AM_IP_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_IP_CONDITION` (
  `AM_IP_CONDITION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `STARTING_IP` varchar(45) DEFAULT NULL,
  `ENDING_IP` varchar(45) DEFAULT NULL,
  `SPECIFIC_IP` varchar(45) DEFAULT NULL,
  `WITHIN_IP_RANGE` tinyint(1) DEFAULT '1',
  `CONDITION_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AM_IP_CONDITION_ID`),
  KEY `fk_AM_IP_CONDITION_1_idx` (`CONDITION_GROUP_ID`),
  CONSTRAINT `fk_AM_IP_CONDITION_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_JWT_CLAIM_CONDITION`
--

DROP TABLE IF EXISTS `AM_JWT_CLAIM_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_JWT_CLAIM_CONDITION` (
  `JWT_CLAIM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONDITION_GROUP_ID` int(11) NOT NULL,
  `CLAIM_URI` varchar(512) DEFAULT NULL,
  `CLAIM_ATTRIB` varchar(1024) DEFAULT NULL,
  `IS_CLAIM_MAPPING` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`JWT_CLAIM_ID`),
  KEY `CONDITION_GROUP_ID` (`CONDITION_GROUP_ID`),
  CONSTRAINT `am_jwt_claim_condition_ibfk_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_POLICY_APPLICATION`
--

DROP TABLE IF EXISTS `AM_POLICY_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_POLICY_APPLICATION` (
  `POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DISPLAY_NAME` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `QUOTA_TYPE` varchar(25) NOT NULL,
  `QUOTA` int(11) NOT NULL,
  `QUOTA_UNIT` varchar(10) DEFAULT NULL,
  `UNIT_TIME` int(11) NOT NULL,
  `TIME_UNIT` varchar(25) NOT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `CUSTOM_ATTRIBUTES` blob,
  `UUID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `APP_NAME_TENANT` (`NAME`,`TENANT_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_APA_QT` (`QUOTA_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_POLICY_GLOBAL`
--

DROP TABLE IF EXISTS `AM_POLICY_GLOBAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_POLICY_GLOBAL` (
  `POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `KEY_TEMPLATE` varchar(512) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `SIDDHI_QUERY` blob,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `UUID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_POLICY_HARD_THROTTLING`
--

DROP TABLE IF EXISTS `AM_POLICY_HARD_THROTTLING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_POLICY_HARD_THROTTLING` (
  `POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `QUOTA_TYPE` varchar(25) NOT NULL,
  `QUOTA` int(11) NOT NULL,
  `QUOTA_UNIT` varchar(10) DEFAULT NULL,
  `UNIT_TIME` int(11) NOT NULL,
  `TIME_UNIT` varchar(25) NOT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `POLICY_HARD_NAME_TENANT` (`NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_POLICY_SUBSCRIPTION`
--

DROP TABLE IF EXISTS `AM_POLICY_SUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_POLICY_SUBSCRIPTION` (
  `POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) NOT NULL,
  `DISPLAY_NAME` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `QUOTA_TYPE` varchar(25) NOT NULL,
  `QUOTA` int(11) NOT NULL,
  `QUOTA_UNIT` varchar(10) DEFAULT NULL,
  `UNIT_TIME` int(11) NOT NULL,
  `TIME_UNIT` varchar(25) NOT NULL,
  `RATE_LIMIT_COUNT` int(11) DEFAULT NULL,
  `RATE_LIMIT_TIME_UNIT` varchar(25) DEFAULT NULL,
  `IS_DEPLOYED` tinyint(1) NOT NULL DEFAULT '0',
  `CUSTOM_ATTRIBUTES` blob,
  `STOP_ON_QUOTA_REACH` tinyint(1) NOT NULL DEFAULT '0',
  `BILLING_PLAN` varchar(20) NOT NULL,
  `UUID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`POLICY_ID`),
  UNIQUE KEY `AM_POLICY_SUBSCRIPTION_NAME_TENANT` (`NAME`,`TENANT_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_APS_QT` (`QUOTA_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_QUERY_PARAMETER_CONDITION`
--

DROP TABLE IF EXISTS `AM_QUERY_PARAMETER_CONDITION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_QUERY_PARAMETER_CONDITION` (
  `QUERY_PARAMETER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONDITION_GROUP_ID` int(11) NOT NULL,
  `PARAMETER_NAME` varchar(255) DEFAULT NULL,
  `PARAMETER_VALUE` varchar(255) DEFAULT NULL,
  `IS_PARAM_MAPPING` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`QUERY_PARAMETER_ID`),
  KEY `CONDITION_GROUP_ID` (`CONDITION_GROUP_ID`),
  CONSTRAINT `am_query_parameter_condition_ibfk_1` FOREIGN KEY (`CONDITION_GROUP_ID`) REFERENCES `AM_CONDITION_GROUP` (`CONDITION_GROUP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_SUBSCRIBER`
--

DROP TABLE IF EXISTS `AM_SUBSCRIBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_SUBSCRIBER` (
  `SUBSCRIBER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `EMAIL_ADDRESS` varchar(256) DEFAULT NULL,
  `DATE_SUBSCRIBED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(100) DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `UPDATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`SUBSCRIBER_ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_SUBSCRIPTION`
--

DROP TABLE IF EXISTS `AM_SUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_SUBSCRIPTION` (
  `SUBSCRIPTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIER_ID` varchar(50) DEFAULT NULL,
  `API_ID` int(11) DEFAULT NULL,
  `LAST_ACCESSED` timestamp NULL DEFAULT NULL,
  `APPLICATION_ID` int(11) DEFAULT NULL,
  `SUB_STATUS` varchar(50) DEFAULT NULL,
  `SUBS_CREATE_STATE` varchar(50) DEFAULT 'SUBSCRIBE',
  `CREATED_BY` varchar(100) DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UPDATED_BY` varchar(100) DEFAULT NULL,
  `UPDATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `UUID` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`SUBSCRIPTION_ID`),
  UNIQUE KEY `UUID` (`UUID`),
  KEY `IDX_SUB_APP_ID` (`APPLICATION_ID`,`SUBSCRIPTION_ID`),
  KEY `IDX_AS_AITIAI` (`API_ID`,`TIER_ID`,`APPLICATION_ID`),
  CONSTRAINT `am_subscription_ibfk_1` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `AM_APPLICATION` (`APPLICATION_ID`) ON UPDATE CASCADE,
  CONSTRAINT `am_subscription_ibfk_2` FOREIGN KEY (`API_ID`) REFERENCES `AM_API` (`API_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_SUBSCRIPTION_KEY_MAPPING`
--

DROP TABLE IF EXISTS `AM_SUBSCRIPTION_KEY_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_SUBSCRIPTION_KEY_MAPPING` (
  `SUBSCRIPTION_ID` int(11) NOT NULL DEFAULT '0',
  `ACCESS_TOKEN` varchar(255) NOT NULL DEFAULT '',
  `KEY_TYPE` varchar(255) NOT NULL,
  PRIMARY KEY (`SUBSCRIPTION_ID`,`ACCESS_TOKEN`),
  CONSTRAINT `am_subscription_key_mapping_ibfk_1` FOREIGN KEY (`SUBSCRIPTION_ID`) REFERENCES `AM_SUBSCRIPTION` (`SUBSCRIPTION_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_THROTTLE_TIER_PERMISSIONS`
--

DROP TABLE IF EXISTS `AM_THROTTLE_TIER_PERMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_THROTTLE_TIER_PERMISSIONS` (
  `THROTTLE_TIER_PERMISSIONS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIER` varchar(50) DEFAULT NULL,
  `PERMISSIONS_TYPE` varchar(50) DEFAULT NULL,
  `ROLES` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`THROTTLE_TIER_PERMISSIONS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_TIER_PERMISSIONS`
--

DROP TABLE IF EXISTS `AM_TIER_PERMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_TIER_PERMISSIONS` (
  `TIER_PERMISSIONS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIER` varchar(50) NOT NULL,
  `PERMISSIONS_TYPE` varchar(50) NOT NULL,
  `ROLES` varchar(512) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`TIER_PERMISSIONS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `AM_WORKFLOWS`
--

DROP TABLE IF EXISTS `AM_WORKFLOWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AM_WORKFLOWS` (
  `WF_ID` int(11) NOT NULL AUTO_INCREMENT,
  `WF_REFERENCE` varchar(255) NOT NULL,
  `WF_TYPE` varchar(255) NOT NULL,
  `WF_STATUS` varchar(255) NOT NULL,
  `WF_CREATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `WF_UPDATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `WF_STATUS_DESC` varchar(1000) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `TENANT_DOMAIN` varchar(255) DEFAULT NULL,
  `WF_EXTERNAL_REFERENCE` varchar(255) NOT NULL,
  PRIMARY KEY (`WF_ID`),
  UNIQUE KEY `WF_EXTERNAL_REFERENCE` (`WF_EXTERNAL_REFERENCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_API_CONSUMER_APPS`
--

DROP TABLE IF EXISTS `APM_API_CONSUMER_APPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_API_CONSUMER_APPS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SAML2_SSO_ISSUER` varchar(500) DEFAULT NULL,
  `APP_CONSUMER_KEY` varchar(512) NOT NULL DEFAULT '',
  `API_TOKEN_ENDPOINT` varchar(1024) DEFAULT NULL,
  `API_CONSUMER_KEY` varchar(512) DEFAULT NULL,
  `API_CONSUMER_SECRET` varchar(512) DEFAULT NULL,
  `APP_NAME` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`ID`,`APP_CONSUMER_KEY`),
  KEY `APP_CONSUMER_KEY` (`APP_CONSUMER_KEY`),
  CONSTRAINT `apm_api_consumer_apps_ibfk_1` FOREIGN KEY (`APP_CONSUMER_KEY`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`CONSUMER_KEY`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_APP`
--

DROP TABLE IF EXISTS `APM_APP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_APP` (
  `APP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_PROVIDER` varchar(256) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `APP_NAME` varchar(256) DEFAULT NULL,
  `APP_VERSION` varchar(30) DEFAULT NULL,
  `CONTEXT` varchar(256) DEFAULT NULL,
  `TRACKING_CODE` varchar(100) DEFAULT NULL,
  `VISIBLE_ROLES` varchar(500) DEFAULT NULL,
  `UUID` varchar(500) NOT NULL,
  `SAML2_SSO_ISSUER` varchar(500) DEFAULT NULL,
  `LOG_OUT_URL` varchar(500) DEFAULT NULL,
  `APP_ALLOW_ANONYMOUS` tinyint(1) DEFAULT NULL,
  `APP_ENDPOINT` varchar(500) DEFAULT NULL,
  `TREAT_AS_SITE` tinyint(1) NOT NULL,
  PRIMARY KEY (`APP_ID`),
  UNIQUE KEY `APP_PROVIDER` (`APP_PROVIDER`,`APP_NAME`,`APP_VERSION`,`TRACKING_CODE`,`UUID`),
  KEY `IDX_APM_APP_UUID` (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_APPLICATION`
--

DROP TABLE IF EXISTS `APM_APPLICATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_APPLICATION` (
  `APPLICATION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) DEFAULT NULL,
  `SUBSCRIBER_ID` int(11) DEFAULT NULL,
  `APPLICATION_TIER` varchar(50) DEFAULT 'Unlimited',
  `CALLBACK_URL` varchar(512) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `APPLICATION_STATUS` varchar(50) DEFAULT 'APPROVED',
  PRIMARY KEY (`APPLICATION_ID`),
  UNIQUE KEY `NAME` (`NAME`,`SUBSCRIBER_ID`),
  KEY `SUBSCRIBER_ID` (`SUBSCRIBER_ID`),
  CONSTRAINT `apm_application_ibfk_1` FOREIGN KEY (`SUBSCRIBER_ID`) REFERENCES `APM_SUBSCRIBER` (`SUBSCRIBER_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_APP_DEFAULT_VERSION`
--

DROP TABLE IF EXISTS `APM_APP_DEFAULT_VERSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_APP_DEFAULT_VERSION` (
  `DEFAULT_VERSION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_NAME` varchar(256) DEFAULT NULL,
  `APP_PROVIDER` varchar(256) DEFAULT NULL,
  `DEFAULT_APP_VERSION` varchar(30) DEFAULT NULL,
  `PUBLISHED_DEFAULT_APP_VERSION` varchar(30) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`DEFAULT_VERSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_APP_HITS`
--

DROP TABLE IF EXISTS `APM_APP_HITS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_APP_HITS` (
  `UUID` varchar(500) NOT NULL,
  `APP_NAME` varchar(200) NOT NULL,
  `VERSION` varchar(50) DEFAULT NULL,
  `CONTEXT` varchar(256) NOT NULL,
  `USER_ID` varchar(50) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `HIT_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`UUID`,`USER_ID`,`TENANT_ID`,`HIT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_APP_JAVA_POLICY`
--

DROP TABLE IF EXISTS `APM_APP_JAVA_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_APP_JAVA_POLICY` (
  `JAVA_POLICY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `DISPLAY_NAME` varchar(100) NOT NULL,
  `FULL_QUALIFI_NAME` varchar(256) NOT NULL,
  `DESCRIPTION` varchar(2500) DEFAULT NULL,
  `DISPLAY_ORDER_SEQ_NO` int(11) NOT NULL,
  `IS_MANDATORY` tinyint(1) DEFAULT '0',
  `POLICY_PROPERTIES` varchar(512) DEFAULT NULL,
  `IS_GLOBAL` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`JAVA_POLICY_ID`),
  UNIQUE KEY `FULL_QUALIFI_NAME` (`FULL_QUALIFI_NAME`,`DISPLAY_ORDER_SEQ_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_APP_JAVA_POLICY_MAPPING`
--

DROP TABLE IF EXISTS `APM_APP_JAVA_POLICY_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_APP_JAVA_POLICY_MAPPING` (
  `JAVA_POLICY_ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`JAVA_POLICY_ID`,`APP_ID`),
  KEY `APP_ID` (`APP_ID`),
  CONSTRAINT `apm_app_java_policy_mapping_ibfk_1` FOREIGN KEY (`JAVA_POLICY_ID`) REFERENCES `APM_APP_JAVA_POLICY` (`JAVA_POLICY_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apm_app_java_policy_mapping_ibfk_2` FOREIGN KEY (`APP_ID`) REFERENCES `APM_APP` (`APP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_APP_LC_EVENT`
--

DROP TABLE IF EXISTS `APM_APP_LC_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_APP_LC_EVENT` (
  `EVENT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) NOT NULL,
  `PREVIOUS_STATE` varchar(50) DEFAULT NULL,
  `NEW_STATE` varchar(50) NOT NULL,
  `USER_ID` varchar(50) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `EVENT_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`EVENT_ID`),
  KEY `APP_ID` (`APP_ID`),
  CONSTRAINT `apm_app_lc_event_ibfk_1` FOREIGN KEY (`APP_ID`) REFERENCES `APM_APP` (`APP_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_APP_URL_MAPPING`
--

DROP TABLE IF EXISTS `APM_APP_URL_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_APP_URL_MAPPING` (
  `URL_MAPPING_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) NOT NULL,
  `HTTP_METHOD` varchar(20) DEFAULT NULL,
  `URL_PATTERN` varchar(512) DEFAULT NULL,
  `SKIP_THROTTLING` tinyint(1) DEFAULT '0',
  `POLICY_GRP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`URL_MAPPING_ID`),
  KEY `APP_ID` (`APP_ID`),
  KEY `POLICY_GRP_ID` (`POLICY_GRP_ID`),
  CONSTRAINT `apm_app_url_mapping_ibfk_1` FOREIGN KEY (`APP_ID`) REFERENCES `APM_APP` (`APP_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apm_app_url_mapping_ibfk_2` FOREIGN KEY (`POLICY_GRP_ID`) REFERENCES `APM_POLICY_GROUP` (`POLICY_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_BUSINESS_OWNER`
--

DROP TABLE IF EXISTS `APM_BUSINESS_OWNER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_BUSINESS_OWNER` (
  `OWNER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_NAME` varchar(200) NOT NULL,
  `OWNER_EMAIL` varchar(300) NOT NULL,
  `OWNER_DESC` varchar(1500) DEFAULT NULL,
  `OWNER_SITE` varchar(200) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OWNER_ID`),
  UNIQUE KEY `OWNER_NAME` (`OWNER_NAME`,`OWNER_EMAIL`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_BUSINESS_OWNER_PROPERTY`
--

DROP TABLE IF EXISTS `APM_BUSINESS_OWNER_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_BUSINESS_OWNER_PROPERTY` (
  `OWNER_PROP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_ID` int(11) NOT NULL,
  `NAME` varchar(200) NOT NULL,
  `VALUE` varchar(300) NOT NULL,
  `SHOW_IN_STORE` tinyint(1) NOT NULL,
  PRIMARY KEY (`OWNER_PROP_ID`),
  KEY `OWNER_ID` (`OWNER_ID`),
  CONSTRAINT `apm_business_owner_property_ibfk_1` FOREIGN KEY (`OWNER_ID`) REFERENCES `APM_BUSINESS_OWNER` (`OWNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_ENTITLEMENT_POLICY_PARTIAL`
--

DROP TABLE IF EXISTS `APM_ENTITLEMENT_POLICY_PARTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_ENTITLEMENT_POLICY_PARTIAL` (
  `ENTITLEMENT_POLICY_PARTIAL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(256) DEFAULT NULL,
  `CONTENT` varchar(2048) DEFAULT NULL,
  `SHARED` tinyint(1) DEFAULT '0',
  `AUTHOR` varchar(256) DEFAULT NULL,
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ENTITLEMENT_POLICY_PARTIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_EXTERNAL_STORES`
--

DROP TABLE IF EXISTS `APM_EXTERNAL_STORES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_EXTERNAL_STORES` (
  `APP_STORE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `STORE_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`APP_STORE_ID`),
  KEY `APP_ID` (`APP_ID`),
  CONSTRAINT `apm_external_stores_ibfk_1` FOREIGN KEY (`APP_ID`) REFERENCES `APM_APP` (`APP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_FAVOURITE_APPS`
--

DROP TABLE IF EXISTS `APM_FAVOURITE_APPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_FAVOURITE_APPS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(50) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`USER_ID`,`APP_ID`),
  KEY `APP_ID` (`APP_ID`),
  CONSTRAINT `apm_favourite_apps_ibfk_1` FOREIGN KEY (`APP_ID`) REFERENCES `APM_APP` (`APP_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_ONE_TIME_DOWNLOAD_LINK`
--

DROP TABLE IF EXISTS `APM_ONE_TIME_DOWNLOAD_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_ONE_TIME_DOWNLOAD_LINK` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BINARY_FILE` varchar(500) NOT NULL,
  `UUID` varchar(500) NOT NULL,
  `IS_DOWNLOADED` tinyint(1) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_POLICY_GROUP`
--

DROP TABLE IF EXISTS `APM_POLICY_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_POLICY_GROUP` (
  `POLICY_GRP_ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(256) DEFAULT NULL,
  `AUTH_SCHEME` varchar(50) DEFAULT NULL,
  `THROTTLING_TIER` varchar(512) DEFAULT NULL,
  `USER_ROLES` varchar(512) DEFAULT NULL,
  `URL_ALLOW_ANONYMOUS` tinyint(1) DEFAULT '0',
  `DESCRIPTION` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`POLICY_GRP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_POLICY_GROUP_MAPPING`
--

DROP TABLE IF EXISTS `APM_POLICY_GROUP_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_POLICY_GROUP_MAPPING` (
  `POLICY_GRP_ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`POLICY_GRP_ID`,`APP_ID`),
  KEY `APP_ID` (`APP_ID`),
  CONSTRAINT `apm_policy_group_mapping_ibfk_1` FOREIGN KEY (`APP_ID`) REFERENCES `APM_APP` (`APP_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apm_policy_group_mapping_ibfk_2` FOREIGN KEY (`POLICY_GRP_ID`) REFERENCES `APM_POLICY_GROUP` (`POLICY_GRP_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_POLICY_GRP_PARTIAL_MAPPING`
--

DROP TABLE IF EXISTS `APM_POLICY_GRP_PARTIAL_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_POLICY_GRP_PARTIAL_MAPPING` (
  `POLICY_GRP_ID` int(11) NOT NULL,
  `POLICY_PARTIAL_ID` int(11) NOT NULL,
  `EFFECT` varchar(50) DEFAULT NULL,
  `POLICY_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`POLICY_GRP_ID`,`POLICY_PARTIAL_ID`),
  KEY `POLICY_PARTIAL_ID` (`POLICY_PARTIAL_ID`),
  CONSTRAINT `apm_policy_grp_partial_mapping_ibfk_1` FOREIGN KEY (`POLICY_GRP_ID`) REFERENCES `APM_POLICY_GROUP` (`POLICY_GRP_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `apm_policy_grp_partial_mapping_ibfk_2` FOREIGN KEY (`POLICY_PARTIAL_ID`) REFERENCES `APM_ENTITLEMENT_POLICY_PARTIAL` (`ENTITLEMENT_POLICY_PARTIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_STORE_FAVOURITE_PAGE`
--

DROP TABLE IF EXISTS `APM_STORE_FAVOURITE_PAGE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_STORE_FAVOURITE_PAGE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(50) NOT NULL,
  `TENANT_ID_OF_USER` int(11) NOT NULL,
  `TENANT_ID_OF_STORE` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_SUBSCRIBER`
--

DROP TABLE IF EXISTS `APM_SUBSCRIBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_SUBSCRIBER` (
  `SUBSCRIBER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(50) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `EMAIL_ADDRESS` varchar(256) DEFAULT NULL,
  `DATE_SUBSCRIBED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`SUBSCRIBER_ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`USER_ID`),
  KEY `IDX_APM_SUBSCRIBER_USER_ID` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_SUBSCRIPTION`
--

DROP TABLE IF EXISTS `APM_SUBSCRIPTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_SUBSCRIPTION` (
  `SUBSCRIPTION_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SUBSCRIPTION_TYPE` varchar(50) DEFAULT NULL,
  `TIER_ID` varchar(50) DEFAULT NULL,
  `APP_ID` int(11) DEFAULT NULL,
  `LAST_ACCESSED` timestamp NULL DEFAULT NULL,
  `APPLICATION_ID` int(11) DEFAULT NULL,
  `SUB_STATUS` varchar(50) DEFAULT NULL,
  `TRUSTED_IDP` varchar(255) DEFAULT NULL,
  `SUBSCRIPTION_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`SUBSCRIPTION_ID`),
  UNIQUE KEY `APP_ID` (`APP_ID`,`APPLICATION_ID`,`SUBSCRIPTION_TYPE`),
  KEY `IDX_SUB_APP_ID` (`APPLICATION_ID`,`SUBSCRIPTION_ID`),
  CONSTRAINT `apm_subscription_ibfk_1` FOREIGN KEY (`APPLICATION_ID`) REFERENCES `APM_APPLICATION` (`APPLICATION_ID`) ON UPDATE CASCADE,
  CONSTRAINT `apm_subscription_ibfk_2` FOREIGN KEY (`APP_ID`) REFERENCES `APM_APP` (`APP_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_TIER_PERMISSIONS`
--

DROP TABLE IF EXISTS `APM_TIER_PERMISSIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_TIER_PERMISSIONS` (
  `TIER_PERMISSIONS_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIER` varchar(50) NOT NULL,
  `PERMISSIONS_TYPE` varchar(50) NOT NULL,
  `ROLES` varchar(512) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`TIER_PERMISSIONS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `APM_WORKFLOWS`
--

DROP TABLE IF EXISTS `APM_WORKFLOWS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APM_WORKFLOWS` (
  `WF_ID` int(11) NOT NULL AUTO_INCREMENT,
  `WF_REFERENCE` varchar(255) NOT NULL,
  `WF_TYPE` varchar(255) NOT NULL,
  `WF_STATUS` varchar(255) NOT NULL,
  `WF_CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `WF_UPDATED_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `WF_STATUS_DESC` varchar(1000) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `TENANT_DOMAIN` varchar(255) DEFAULT NULL,
  `WF_EXTERNAL_REFERENCE` varchar(255) NOT NULL,
  PRIMARY KEY (`WF_ID`),
  UNIQUE KEY `WF_EXTERNAL_REFERENCE` (`WF_EXTERNAL_REFERENCE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `FIDO_DEVICE_STORE`
--

DROP TABLE IF EXISTS `FIDO_DEVICE_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FIDO_DEVICE_STORE` (
  `TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `DOMAIN_NAME` varchar(255) NOT NULL,
  `USER_NAME` varchar(45) NOT NULL,
  `TIME_REGISTERED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `KEY_HANDLE` varchar(200) NOT NULL,
  `DEVICE_DATA` varchar(2048) NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`DOMAIN_NAME`,`USER_NAME`,`KEY_HANDLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_ASSOCIATED_ID`
--

DROP TABLE IF EXISTS `IDN_ASSOCIATED_ID`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_ASSOCIATED_ID` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_USER_ID` varchar(255) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1234',
  `IDP_ID` int(11) NOT NULL,
  `DOMAIN_NAME` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_USER_ID` (`IDP_USER_ID`,`TENANT_ID`,`IDP_ID`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `idn_associated_id_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_AUTH_SESSION_STORE`
--

DROP TABLE IF EXISTS `IDN_AUTH_SESSION_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_AUTH_SESSION_STORE` (
  `SESSION_ID` varchar(100) NOT NULL,
  `SESSION_TYPE` varchar(100) NOT NULL,
  `OPERATION` varchar(10) NOT NULL,
  `SESSION_OBJECT` blob,
  `TIME_CREATED` bigint(20) NOT NULL DEFAULT '0',
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`SESSION_ID`,`SESSION_TYPE`,`TIME_CREATED`,`OPERATION`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_BASE_TABLE`
--

DROP TABLE IF EXISTS `IDN_BASE_TABLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_BASE_TABLE` (
  `PRODUCT_NAME` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`PRODUCT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_CLAIM`
--

DROP TABLE IF EXISTS `IDN_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_CLAIM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIALECT_ID` int(11) DEFAULT NULL,
  `CLAIM_URI` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CLAIM_URI_CONSTRAINT` (`DIALECT_ID`,`CLAIM_URI`,`TENANT_ID`),
  CONSTRAINT `idn_claim_ibfk_1` FOREIGN KEY (`DIALECT_ID`) REFERENCES `IDN_CLAIM_DIALECT` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_CLAIM_DIALECT`
--

DROP TABLE IF EXISTS `IDN_CLAIM_DIALECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_CLAIM_DIALECT` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DIALECT_URI` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DIALECT_URI_CONSTRAINT` (`DIALECT_URI`,`TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_CLAIM_MAPPED_ATTRIBUTE`
--

DROP TABLE IF EXISTS `IDN_CLAIM_MAPPED_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_CLAIM_MAPPED_ATTRIBUTE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCAL_CLAIM_ID` int(11) DEFAULT NULL,
  `USER_STORE_DOMAIN_NAME` varchar(255) NOT NULL,
  `ATTRIBUTE_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_STORE_DOMAIN_CONSTRAINT` (`LOCAL_CLAIM_ID`,`USER_STORE_DOMAIN_NAME`,`TENANT_ID`),
  CONSTRAINT `idn_claim_mapped_attribute_ibfk_1` FOREIGN KEY (`LOCAL_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `IDN_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_CLAIM_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXT_CLAIM_ID` int(11) NOT NULL,
  `MAPPED_LOCAL_CLAIM_ID` int(11) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `EXT_TO_LOC_MAPPING_CONSTRN` (`EXT_CLAIM_ID`,`TENANT_ID`),
  KEY `MAPPED_LOCAL_CLAIM_ID` (`MAPPED_LOCAL_CLAIM_ID`),
  CONSTRAINT `idn_claim_mapping_ibfk_1` FOREIGN KEY (`EXT_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `idn_claim_mapping_ibfk_2` FOREIGN KEY (`MAPPED_LOCAL_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_CLAIM_PROPERTY`
--

DROP TABLE IF EXISTS `IDN_CLAIM_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_CLAIM_PROPERTY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCAL_CLAIM_ID` int(11) DEFAULT NULL,
  `PROPERTY_NAME` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `PROPERTY_NAME_CONSTRAINT` (`LOCAL_CLAIM_ID`,`PROPERTY_NAME`,`TENANT_ID`),
  CONSTRAINT `idn_claim_property_ibfk_1` FOREIGN KEY (`LOCAL_CLAIM_ID`) REFERENCES `IDN_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_IDENTITY_META_DATA`
--

DROP TABLE IF EXISTS `IDN_IDENTITY_META_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_IDENTITY_META_DATA` (
  `USER_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1234',
  `METADATA_TYPE` varchar(255) NOT NULL,
  `METADATA` varchar(255) NOT NULL,
  `VALID` varchar(255) NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`USER_NAME`,`METADATA_TYPE`,`METADATA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_IDENTITY_USER_DATA`
--

DROP TABLE IF EXISTS `IDN_IDENTITY_USER_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_IDENTITY_USER_DATA` (
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1234',
  `USER_NAME` varchar(255) NOT NULL,
  `DATA_KEY` varchar(255) NOT NULL,
  `DATA_VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TENANT_ID`,`USER_NAME`,`DATA_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH1A_ACCESS_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH1A_ACCESS_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH1A_ACCESS_TOKEN` (
  `ACCESS_TOKEN` varchar(255) NOT NULL DEFAULT '',
  `ACCESS_TOKEN_SECRET` varchar(512) DEFAULT NULL,
  `CONSUMER_KEY_ID` int(11) DEFAULT NULL,
  `SCOPE` varchar(2048) DEFAULT NULL,
  `AUTHZ_USER` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`ACCESS_TOKEN`),
  KEY `CONSUMER_KEY_ID` (`CONSUMER_KEY_ID`),
  CONSTRAINT `idn_oauth1a_access_token_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH1A_REQUEST_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH1A_REQUEST_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH1A_REQUEST_TOKEN` (
  `REQUEST_TOKEN` varchar(255) NOT NULL DEFAULT '',
  `REQUEST_TOKEN_SECRET` varchar(512) DEFAULT NULL,
  `CONSUMER_KEY_ID` int(11) DEFAULT NULL,
  `CALLBACK_URL` varchar(1024) DEFAULT NULL,
  `SCOPE` varchar(2048) DEFAULT NULL,
  `AUTHORIZED` varchar(128) DEFAULT NULL,
  `OAUTH_VERIFIER` varchar(512) DEFAULT NULL,
  `AUTHZ_USER` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`REQUEST_TOKEN`),
  KEY `CONSUMER_KEY_ID` (`CONSUMER_KEY_ID`),
  CONSTRAINT `idn_oauth1a_request_token_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH2_ACCESS_TOKEN`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_ACCESS_TOKEN`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_ACCESS_TOKEN` (
  `TOKEN_ID` varchar(255) NOT NULL DEFAULT '',
  `ACCESS_TOKEN` varchar(255) DEFAULT NULL,
  `REFRESH_TOKEN` varchar(255) DEFAULT NULL,
  `CONSUMER_KEY_ID` int(11) DEFAULT NULL,
  `AUTHZ_USER` varchar(100) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `USER_DOMAIN` varchar(50) DEFAULT NULL,
  `USER_TYPE` varchar(25) DEFAULT NULL,
  `GRANT_TYPE` varchar(50) DEFAULT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `REFRESH_TOKEN_TIME_CREATED` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  `REFRESH_TOKEN_VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  `TOKEN_SCOPE_HASH` varchar(32) DEFAULT NULL,
  `TOKEN_STATE` varchar(25) DEFAULT 'ACTIVE',
  `TOKEN_STATE_ID` varchar(128) DEFAULT 'NONE',
  `SUBJECT_IDENTIFIER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`TOKEN_ID`),
  UNIQUE KEY `CON_APP_KEY` (`CONSUMER_KEY_ID`,`AUTHZ_USER`,`TENANT_ID`,`USER_DOMAIN`,`USER_TYPE`,`TOKEN_SCOPE_HASH`,`TOKEN_STATE`,`TOKEN_STATE_ID`),
  KEY `IDX_AT_CK_AU` (`CONSUMER_KEY_ID`,`AUTHZ_USER`,`TOKEN_STATE`,`USER_TYPE`),
  KEY `IDX_TC` (`TIME_CREATED`),
  KEY `IDX_AT` (`ACCESS_TOKEN`),
  KEY `IDX_IOAT_AT` (`ACCESS_TOKEN`),
  KEY `IDX_IOAT_UT` (`USER_TYPE`),
  CONSTRAINT `idn_oauth2_access_token_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH2_ACCESS_TOKEN_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_ACCESS_TOKEN_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_ACCESS_TOKEN_SCOPE` (
  `TOKEN_ID` varchar(255) NOT NULL DEFAULT '',
  `TOKEN_SCOPE` varchar(60) NOT NULL DEFAULT '',
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`TOKEN_ID`,`TOKEN_SCOPE`),
  CONSTRAINT `idn_oauth2_access_token_scope_ibfk_1` FOREIGN KEY (`TOKEN_ID`) REFERENCES `IDN_OAUTH2_ACCESS_TOKEN` (`TOKEN_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH2_AUTHORIZATION_CODE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_AUTHORIZATION_CODE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_AUTHORIZATION_CODE` (
  `CODE_ID` varchar(255) NOT NULL DEFAULT '',
  `AUTHORIZATION_CODE` varchar(512) DEFAULT NULL,
  `CONSUMER_KEY_ID` int(11) DEFAULT NULL,
  `CALLBACK_URL` varchar(1024) DEFAULT NULL,
  `SCOPE` varchar(2048) DEFAULT NULL,
  `AUTHZ_USER` varchar(100) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `USER_DOMAIN` varchar(50) DEFAULT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VALIDITY_PERIOD` bigint(20) DEFAULT NULL,
  `STATE` varchar(25) DEFAULT 'ACTIVE',
  `TOKEN_ID` varchar(255) DEFAULT NULL,
  `SUBJECT_IDENTIFIER` varchar(255) DEFAULT NULL,
  `PKCE_CODE_CHALLENGE` varchar(255) DEFAULT NULL,
  `PKCE_CODE_CHALLENGE_METHOD` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`CODE_ID`),
  KEY `CONSUMER_KEY_ID` (`CONSUMER_KEY_ID`),
  KEY `IDX_AUTHORIZATION_CODE` (`AUTHORIZATION_CODE`,`CONSUMER_KEY_ID`),
  CONSTRAINT `idn_oauth2_authorization_code_ibfk_1` FOREIGN KEY (`CONSUMER_KEY_ID`) REFERENCES `IDN_OAUTH_CONSUMER_APPS` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH2_RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_RESOURCE_SCOPE` (
  `RESOURCE_PATH` varchar(255) NOT NULL,
  `SCOPE_ID` int(11) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`RESOURCE_PATH`),
  KEY `SCOPE_ID` (`SCOPE_ID`),
  CONSTRAINT `idn_oauth2_resource_scope_ibfk_1` FOREIGN KEY (`SCOPE_ID`) REFERENCES `IDN_OAUTH2_SCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH2_SCOPE`
--

DROP TABLE IF EXISTS `IDN_OAUTH2_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH2_SCOPE` (
  `SCOPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `SCOPE_KEY` varchar(100) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(512) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `ROLES` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`SCOPE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=548 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OAUTH_CONSUMER_APPS`
--

DROP TABLE IF EXISTS `IDN_OAUTH_CONSUMER_APPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OAUTH_CONSUMER_APPS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CONSUMER_KEY` varchar(255) DEFAULT NULL,
  `CONSUMER_SECRET` varchar(512) DEFAULT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '0',
  `USER_DOMAIN` varchar(50) DEFAULT NULL,
  `APP_NAME` varchar(255) DEFAULT NULL,
  `OAUTH_VERSION` varchar(128) DEFAULT NULL,
  `CALLBACK_URL` varchar(1024) DEFAULT NULL,
  `GRANT_TYPES` varchar(1024) DEFAULT NULL,
  `PKCE_MANDATORY` char(1) DEFAULT '0',
  `PKCE_SUPPORT_PLAIN` char(1) DEFAULT '0',
  `APP_STATE` varchar(25) DEFAULT 'ACTIVE',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CONSUMER_KEY_CONSTRAINT` (`CONSUMER_KEY`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OPENID_ASSOCIATIONS`
--

DROP TABLE IF EXISTS `IDN_OPENID_ASSOCIATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OPENID_ASSOCIATIONS` (
  `HANDLE` varchar(255) NOT NULL,
  `ASSOC_TYPE` varchar(255) NOT NULL,
  `EXPIRE_IN` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MAC_KEY` varchar(255) NOT NULL,
  `ASSOC_STORE` varchar(128) DEFAULT 'SHARED',
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`HANDLE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OPENID_REMEMBER_ME`
--

DROP TABLE IF EXISTS `IDN_OPENID_REMEMBER_ME`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OPENID_REMEMBER_ME` (
  `USER_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `COOKIE_VALUE` varchar(1024) DEFAULT NULL,
  `CREATED_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`USER_NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_OPENID_USER_RPS`
--

DROP TABLE IF EXISTS `IDN_OPENID_USER_RPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_OPENID_USER_RPS` (
  `USER_NAME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `RP_URL` varchar(255) NOT NULL,
  `TRUSTED_ALWAYS` varchar(128) DEFAULT 'FALSE',
  `LAST_VISIT` date NOT NULL,
  `VISIT_COUNT` int(11) DEFAULT '0',
  `DEFAULT_PROFILE_NAME` varchar(255) DEFAULT 'DEFAULT',
  PRIMARY KEY (`USER_NAME`,`TENANT_ID`,`RP_URL`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_PASSWORD_HISTORY_DATA`
--

DROP TABLE IF EXISTS `IDN_PASSWORD_HISTORY_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_PASSWORD_HISTORY_DATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_NAME` varchar(255) NOT NULL,
  `USER_DOMAIN` varchar(127) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  `SALT_VALUE` varchar(255) DEFAULT NULL,
  `HASH` varchar(255) NOT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USER_NAME` (`USER_NAME`,`USER_DOMAIN`,`TENANT_ID`,`SALT_VALUE`,`HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_RECOVERY_DATA`
--

DROP TABLE IF EXISTS `IDN_RECOVERY_DATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_RECOVERY_DATA` (
  `USER_NAME` varchar(255) NOT NULL,
  `USER_DOMAIN` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1',
  `CODE` varchar(255) NOT NULL,
  `SCENARIO` varchar(255) NOT NULL,
  `STEP` varchar(255) NOT NULL,
  `TIME_CREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `REMAINING_SETS` varchar(2500) DEFAULT NULL,
  PRIMARY KEY (`USER_NAME`,`USER_DOMAIN`,`TENANT_ID`,`SCENARIO`,`STEP`),
  UNIQUE KEY `CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_SCIM_GROUP`
--

DROP TABLE IF EXISTS `IDN_SCIM_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_SCIM_GROUP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `ROLE_NAME` varchar(255) NOT NULL,
  `ATTR_NAME` varchar(1024) NOT NULL,
  `ATTR_VALUE` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_STS_STORE`
--

DROP TABLE IF EXISTS `IDN_STS_STORE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_STS_STORE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TOKEN_ID` varchar(255) NOT NULL,
  `TOKEN_CONTENT` blob NOT NULL,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EXPIRE_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `STATE` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_THRIFT_SESSION`
--

DROP TABLE IF EXISTS `IDN_THRIFT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_THRIFT_SESSION` (
  `SESSION_ID` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `CREATED_TIME` varchar(255) NOT NULL,
  `LAST_MODIFIED_TIME` varchar(255) NOT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`SESSION_ID`),
  KEY `IDX_ITS_LMT` (`LAST_MODIFIED_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDN_USER_ACCOUNT_ASSOCIATION`
--

DROP TABLE IF EXISTS `IDN_USER_ACCOUNT_ASSOCIATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDN_USER_ACCOUNT_ASSOCIATION` (
  `ASSOCIATION_KEY` varchar(255) NOT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '0',
  `DOMAIN_NAME` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`TENANT_ID`,`DOMAIN_NAME`,`USER_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP`
--

DROP TABLE IF EXISTS `IDP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `NAME` varchar(254) NOT NULL,
  `IS_ENABLED` char(1) NOT NULL DEFAULT '1',
  `IS_PRIMARY` char(1) NOT NULL DEFAULT '0',
  `HOME_REALM_ID` varchar(254) DEFAULT NULL,
  `IMAGE` mediumblob,
  `CERTIFICATE` blob,
  `ALIAS` varchar(254) DEFAULT NULL,
  `INBOUND_PROV_ENABLED` char(1) NOT NULL DEFAULT '0',
  `INBOUND_PROV_USER_STORE_ID` varchar(254) DEFAULT NULL,
  `USER_CLAIM_URI` varchar(254) DEFAULT NULL,
  `ROLE_CLAIM_URI` varchar(254) DEFAULT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `DEFAULT_AUTHENTICATOR_NAME` varchar(254) DEFAULT NULL,
  `DEFAULT_PRO_CONNECTOR_NAME` varchar(254) DEFAULT NULL,
  `PROVISIONING_ROLE` varchar(128) DEFAULT NULL,
  `IS_FEDERATION_HUB` char(1) NOT NULL DEFAULT '0',
  `IS_LOCAL_CLAIM_DIALECT` char(1) NOT NULL DEFAULT '0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_AUTHENTICATOR`
--

DROP TABLE IF EXISTS `IDP_AUTHENTICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_AUTHENTICATOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `IDP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `IS_ENABLED` char(1) DEFAULT '1',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`NAME`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `idp_authenticator_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_AUTHENTICATOR_PROPERTY`
--

DROP TABLE IF EXISTS `IDP_AUTHENTICATOR_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_AUTHENTICATOR_PROPERTY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `AUTHENTICATOR_ID` int(11) DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(2047) DEFAULT NULL,
  `IS_SECRET` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`AUTHENTICATOR_ID`,`PROPERTY_KEY`),
  KEY `AUTHENTICATOR_ID` (`AUTHENTICATOR_ID`),
  CONSTRAINT `idp_authenticator_property_ibfk_1` FOREIGN KEY (`AUTHENTICATOR_ID`) REFERENCES `IDP_AUTHENTICATOR` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_CLAIM`
--

DROP TABLE IF EXISTS `IDP_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_CLAIM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `CLAIM` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ID` (`IDP_ID`,`CLAIM`),
  CONSTRAINT `idp_claim_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `IDP_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_CLAIM_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_CLAIM_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `LOCAL_CLAIM` varchar(253) DEFAULT NULL,
  `DEFAULT_VALUE` varchar(255) DEFAULT NULL,
  `IS_REQUESTED` varchar(128) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_CLAIM_ID` (`IDP_CLAIM_ID`,`TENANT_ID`,`LOCAL_CLAIM`),
  CONSTRAINT `idp_claim_mapping_ibfk_1` FOREIGN KEY (`IDP_CLAIM_ID`) REFERENCES `IDP_CLAIM` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_LOCAL_CLAIM`
--

DROP TABLE IF EXISTS `IDP_LOCAL_CLAIM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_LOCAL_CLAIM` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `IDP_ID` int(11) DEFAULT NULL,
  `CLAIM_URI` varchar(255) NOT NULL,
  `DEFAULT_VALUE` varchar(255) DEFAULT NULL,
  `IS_REQUESTED` varchar(128) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`CLAIM_URI`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `idp_local_claim_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_METADATA`
--

DROP TABLE IF EXISTS `IDP_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_METADATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_METADATA_CONSTRAINT` (`IDP_ID`,`NAME`),
  CONSTRAINT `idp_metadata_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_PROVISIONING_CONFIG`
--

DROP TABLE IF EXISTS `IDP_PROVISIONING_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_PROVISIONING_CONFIG` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `IDP_ID` int(11) DEFAULT NULL,
  `PROVISIONING_CONNECTOR_TYPE` varchar(255) NOT NULL,
  `IS_ENABLED` char(1) DEFAULT '0',
  `IS_BLOCKING` char(1) DEFAULT '0',
  `IS_RULES_ENABLED` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`IDP_ID`,`PROVISIONING_CONNECTOR_TYPE`),
  KEY `IDP_ID` (`IDP_ID`),
  CONSTRAINT `idp_provisioning_config_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_PROVISIONING_ENTITY`
--

DROP TABLE IF EXISTS `IDP_PROVISIONING_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_PROVISIONING_ENTITY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROVISIONING_CONFIG_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE` varchar(255) NOT NULL,
  `ENTITY_LOCAL_USERSTORE` varchar(255) NOT NULL,
  `ENTITY_NAME` varchar(255) NOT NULL,
  `ENTITY_VALUE` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `ENTITY_LOCAL_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ENTITY_TYPE` (`ENTITY_TYPE`,`TENANT_ID`,`ENTITY_LOCAL_USERSTORE`,`ENTITY_NAME`,`PROVISIONING_CONFIG_ID`),
  UNIQUE KEY `PROVISIONING_CONFIG_ID` (`PROVISIONING_CONFIG_ID`,`ENTITY_TYPE`,`ENTITY_VALUE`),
  CONSTRAINT `idp_provisioning_entity_ibfk_1` FOREIGN KEY (`PROVISIONING_CONFIG_ID`) REFERENCES `IDP_PROVISIONING_CONFIG` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_PROV_CONFIG_PROPERTY`
--

DROP TABLE IF EXISTS `IDP_PROV_CONFIG_PROPERTY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_PROV_CONFIG_PROPERTY` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) DEFAULT NULL,
  `PROVISIONING_CONFIG_ID` int(11) DEFAULT NULL,
  `PROPERTY_KEY` varchar(255) NOT NULL,
  `PROPERTY_VALUE` varchar(2048) DEFAULT NULL,
  `PROPERTY_BLOB_VALUE` blob,
  `PROPERTY_TYPE` char(32) NOT NULL,
  `IS_SECRET` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TENANT_ID` (`TENANT_ID`,`PROVISIONING_CONFIG_ID`,`PROPERTY_KEY`),
  KEY `PROVISIONING_CONFIG_ID` (`PROVISIONING_CONFIG_ID`),
  CONSTRAINT `idp_prov_config_property_ibfk_1` FOREIGN KEY (`PROVISIONING_CONFIG_ID`) REFERENCES `IDP_PROVISIONING_CONFIG` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_ROLE`
--

DROP TABLE IF EXISTS `IDP_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_ROLE` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `ROLE` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ID` (`IDP_ID`,`ROLE`),
  CONSTRAINT `idp_role_ibfk_1` FOREIGN KEY (`IDP_ID`) REFERENCES `IDP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `IDP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `IDP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `IDP_ROLE_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IDP_ROLE_ID` int(11) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT NULL,
  `USER_STORE_ID` varchar(253) DEFAULT NULL,
  `LOCAL_ROLE` varchar(253) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IDP_ROLE_ID` (`IDP_ROLE_ID`,`TENANT_ID`,`USER_STORE_ID`,`LOCAL_ROLE`),
  CONSTRAINT `idp_role_mapping_ibfk_1` FOREIGN KEY (`IDP_ROLE_ID`) REFERENCES `IDP_ROLE` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_APP`
--

DROP TABLE IF EXISTS `SP_APP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_APP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `APP_NAME` varchar(255) NOT NULL,
  `USER_STORE` varchar(255) NOT NULL,
  `USERNAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(1024) DEFAULT NULL,
  `ROLE_CLAIM` varchar(512) DEFAULT NULL,
  `AUTH_TYPE` varchar(255) NOT NULL,
  `PROVISIONING_USERSTORE_DOMAIN` varchar(512) DEFAULT NULL,
  `IS_LOCAL_CLAIM_DIALECT` char(1) DEFAULT '1',
  `IS_SEND_LOCAL_SUBJECT_ID` char(1) DEFAULT '0',
  `IS_SEND_AUTH_LIST_OF_IDPS` char(1) DEFAULT '0',
  `IS_USE_TENANT_DOMAIN_SUBJECT` char(1) DEFAULT '1',
  `IS_USE_USER_DOMAIN_SUBJECT` char(1) DEFAULT '1',
  `ENABLE_AUTHORIZATION` char(1) DEFAULT '0',
  `SUBJECT_CLAIM_URI` varchar(512) DEFAULT NULL,
  `IS_SAAS_APP` char(1) DEFAULT '0',
  `IS_DUMB_MODE` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `APPLICATION_NAME_CONSTRAINT` (`APP_NAME`,`TENANT_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_AUTH_STEP`
--

DROP TABLE IF EXISTS `SP_AUTH_STEP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_AUTH_STEP` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `STEP_ORDER` int(11) DEFAULT '1',
  `APP_ID` int(11) NOT NULL,
  `IS_SUBJECT_STEP` char(1) DEFAULT '0',
  `IS_ATTRIBUTE_STEP` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `APPLICATION_ID_CONSTRAINT_STEP` (`APP_ID`),
  CONSTRAINT `APPLICATION_ID_CONSTRAINT_STEP` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_CLAIM_MAPPING`
--

DROP TABLE IF EXISTS `SP_CLAIM_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_CLAIM_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `IDP_CLAIM` varchar(512) NOT NULL,
  `SP_CLAIM` varchar(512) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `IS_REQUESTED` varchar(128) DEFAULT '0',
  `IS_MANDATORY` varchar(128) DEFAULT '0',
  `DEFAULT_VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CLAIMID_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `CLAIMID_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_FEDERATED_IDP`
--

DROP TABLE IF EXISTS `SP_FEDERATED_IDP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_FEDERATED_IDP` (
  `ID` int(11) NOT NULL,
  `TENANT_ID` int(11) NOT NULL,
  `AUTHENTICATOR_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`AUTHENTICATOR_ID`),
  CONSTRAINT `STEP_ID_CONSTRAINT` FOREIGN KEY (`ID`) REFERENCES `SP_AUTH_STEP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_INBOUND_AUTH`
--

DROP TABLE IF EXISTS `SP_INBOUND_AUTH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_INBOUND_AUTH` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `INBOUND_AUTH_KEY` varchar(255) DEFAULT NULL,
  `INBOUND_AUTH_TYPE` varchar(255) NOT NULL,
  `INBOUND_CONFIG_TYPE` varchar(255) NOT NULL,
  `PROP_NAME` varchar(255) DEFAULT NULL,
  `PROP_VALUE` varchar(1024) DEFAULT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `APPLICATION_ID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `APPLICATION_ID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_METADATA`
--

DROP TABLE IF EXISTS `SP_METADATA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_METADATA` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SP_METADATA_CONSTRAINT` (`SP_ID`,`NAME`),
  CONSTRAINT `sp_metadata_ibfk_1` FOREIGN KEY (`SP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_PROVISIONING_CONNECTOR`
--

DROP TABLE IF EXISTS `SP_PROVISIONING_CONNECTOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_PROVISIONING_CONNECTOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `IDP_NAME` varchar(255) NOT NULL,
  `CONNECTOR_NAME` varchar(255) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `IS_JIT_ENABLED` char(1) NOT NULL DEFAULT '0',
  `BLOCKING` char(1) NOT NULL DEFAULT '0',
  `RULE_ENABLED` char(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PRO_CONNECTOR_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `PRO_CONNECTOR_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_REQ_PATH_AUTHENTICATOR`
--

DROP TABLE IF EXISTS `SP_REQ_PATH_AUTHENTICATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_REQ_PATH_AUTHENTICATOR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `AUTHENTICATOR_NAME` varchar(255) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `REQ_AUTH_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `REQ_AUTH_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `SP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SP_ROLE_MAPPING` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TENANT_ID` int(11) NOT NULL,
  `IDP_ROLE` varchar(255) NOT NULL,
  `SP_ROLE` varchar(255) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLEID_APPID_CONSTRAINT` (`APP_ID`),
  CONSTRAINT `ROLEID_APPID_CONSTRAINT` FOREIGN KEY (`APP_ID`) REFERENCES `SP_APP` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WF_BPS_PROFILE`
--

DROP TABLE IF EXISTS `WF_BPS_PROFILE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_BPS_PROFILE` (
  `PROFILE_NAME` varchar(45) NOT NULL DEFAULT '',
  `HOST_URL_MANAGER` varchar(255) DEFAULT NULL,
  `HOST_URL_WORKER` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(1023) DEFAULT NULL,
  `CALLBACK_HOST` varchar(45) DEFAULT NULL,
  `CALLBACK_USERNAME` varchar(45) DEFAULT NULL,
  `CALLBACK_PASSWORD` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`PROFILE_NAME`,`TENANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WF_REQUEST`
--

DROP TABLE IF EXISTS `WF_REQUEST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_REQUEST` (
  `UUID` varchar(45) NOT NULL DEFAULT '',
  `CREATED_BY` varchar(255) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  `OPERATION_TYPE` varchar(50) DEFAULT NULL,
  `CREATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `UPDATED_AT` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `STATUS` varchar(30) DEFAULT NULL,
  `REQUEST` blob,
  PRIMARY KEY (`UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WF_REQUEST_ENTITY_RELATIONSHIP`
--

DROP TABLE IF EXISTS `WF_REQUEST_ENTITY_RELATIONSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_REQUEST_ENTITY_RELATIONSHIP` (
  `REQUEST_ID` varchar(45) NOT NULL DEFAULT '',
  `ENTITY_NAME` varchar(255) NOT NULL DEFAULT '',
  `ENTITY_TYPE` varchar(50) NOT NULL DEFAULT '',
  `TENANT_ID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`REQUEST_ID`,`ENTITY_NAME`,`ENTITY_TYPE`,`TENANT_ID`),
  CONSTRAINT `wf_request_entity_relationship_ibfk_1` FOREIGN KEY (`REQUEST_ID`) REFERENCES `WF_REQUEST` (`UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WF_WORKFLOW`
--

DROP TABLE IF EXISTS `WF_WORKFLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_WORKFLOW` (
  `ID` varchar(45) NOT NULL DEFAULT '',
  `WF_NAME` varchar(45) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `TEMPLATE_ID` varchar(45) DEFAULT NULL,
  `IMPL_ID` varchar(45) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WF_WORKFLOW_ASSOCIATION`
--

DROP TABLE IF EXISTS `WF_WORKFLOW_ASSOCIATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_WORKFLOW_ASSOCIATION` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ASSOC_NAME` varchar(45) DEFAULT NULL,
  `EVENT_ID` varchar(45) DEFAULT NULL,
  `ASSOC_CONDITION` varchar(2000) DEFAULT NULL,
  `WORKFLOW_ID` varchar(45) DEFAULT NULL,
  `IS_ENABLED` char(1) DEFAULT '1',
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`ID`),
  KEY `WORKFLOW_ID` (`WORKFLOW_ID`),
  CONSTRAINT `wf_workflow_association_ibfk_1` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `WF_WORKFLOW` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WF_WORKFLOW_CONFIG_PARAM`
--

DROP TABLE IF EXISTS `WF_WORKFLOW_CONFIG_PARAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_WORKFLOW_CONFIG_PARAM` (
  `WORKFLOW_ID` varchar(45) NOT NULL DEFAULT '',
  `PARAM_NAME` varchar(45) NOT NULL DEFAULT '',
  `PARAM_VALUE` varchar(1000) DEFAULT NULL,
  `PARAM_QNAME` varchar(45) NOT NULL DEFAULT '',
  `PARAM_HOLDER` varchar(45) NOT NULL DEFAULT '',
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`WORKFLOW_ID`,`PARAM_NAME`,`PARAM_QNAME`,`PARAM_HOLDER`),
  CONSTRAINT `wf_workflow_config_param_ibfk_1` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `WF_WORKFLOW` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `WF_WORKFLOW_REQUEST_RELATION`
--

DROP TABLE IF EXISTS `WF_WORKFLOW_REQUEST_RELATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WF_WORKFLOW_REQUEST_RELATION` (
  `RELATIONSHIP_ID` varchar(45) NOT NULL DEFAULT '',
  `WORKFLOW_ID` varchar(45) DEFAULT NULL,
  `REQUEST_ID` varchar(45) DEFAULT NULL,
  `UPDATED_AT` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `STATUS` varchar(30) DEFAULT NULL,
  `TENANT_ID` int(11) DEFAULT '-1',
  PRIMARY KEY (`RELATIONSHIP_ID`),
  KEY `WORKFLOW_ID` (`WORKFLOW_ID`),
  KEY `REQUEST_ID` (`REQUEST_ID`),
  CONSTRAINT `wf_workflow_request_relation_ibfk_1` FOREIGN KEY (`WORKFLOW_ID`) REFERENCES `WF_WORKFLOW` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `wf_workflow_request_relation_ibfk_2` FOREIGN KEY (`REQUEST_ID`) REFERENCES `WF_REQUEST` (`UUID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'APIMGT_DB'
--

--
-- Dumping routines for database 'APIMGT_DB'
--

--
-- Current Database: `ANALYTICS_EVENT_STORE`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ANALYTICS_EVENT_STORE` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ANALYTICS_EVENT_STORE`;

--
-- Table structure for table `ANX___7LgG_HPI_`
--

DROP TABLE IF EXISTS `ANX___7LgG_HPI_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LgG_HPI_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LgG_HPI__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LgG_HPI__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LgSqDNk_`
--

DROP TABLE IF EXISTS `ANX___7LgSqDNk_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LgSqDNk_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LgSqDNk__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LgSqDNk__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LhSZQNY_`
--

DROP TABLE IF EXISTS `ANX___7LhSZQNY_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LhSZQNY_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LhSZQNY__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LhSZQNY__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LhkT_sY_`
--

DROP TABLE IF EXISTS `ANX___7LhkT_sY_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LhkT_sY_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LhkT_sY__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LhkT_sY__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LiwnGJ0_`
--

DROP TABLE IF EXISTS `ANX___7LiwnGJ0_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LiwnGJ0_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LiwnGJ0__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LiwnGJ0__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LjY6VbM_`
--

DROP TABLE IF EXISTS `ANX___7LjY6VbM_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LjY6VbM_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LjY6VbM__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LjY6VbM__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LjoOG9U_`
--

DROP TABLE IF EXISTS `ANX___7LjoOG9U_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LjoOG9U_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LjoOG9U__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LjoOG9U__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lk4lvLs_`
--

DROP TABLE IF EXISTS `ANX___7Lk4lvLs_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lk4lvLs_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lk4lvLs__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lk4lvLs__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lkz9Ub8_`
--

DROP TABLE IF EXISTS `ANX___7Lkz9Ub8_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lkz9Ub8_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lkz9Ub8__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lkz9Ub8__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LlunCZ4_`
--

DROP TABLE IF EXISTS `ANX___7LlunCZ4_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LlunCZ4_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LlunCZ4__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LlunCZ4__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LlwM1M8_`
--

DROP TABLE IF EXISTS `ANX___7LlwM1M8_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LlwM1M8_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LlwM1M8__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LlwM1M8__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LmYRdtU_`
--

DROP TABLE IF EXISTS `ANX___7LmYRdtU_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LmYRdtU_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LmYRdtU__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LmYRdtU__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LmhiWeg_`
--

DROP TABLE IF EXISTS `ANX___7LmhiWeg_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LmhiWeg_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LmhiWeg__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LmhiWeg__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LnGx2Qc_`
--

DROP TABLE IF EXISTS `ANX___7LnGx2Qc_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LnGx2Qc_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LnGx2Qc__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LnGx2Qc__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LnGxkxw_`
--

DROP TABLE IF EXISTS `ANX___7LnGxkxw_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LnGxkxw_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LnGxkxw__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LnGxkxw__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LnRWfFw_`
--

DROP TABLE IF EXISTS `ANX___7LnRWfFw_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LnRWfFw_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LnRWfFw__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LnRWfFw__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LnXSEdY_`
--

DROP TABLE IF EXISTS `ANX___7LnXSEdY_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LnXSEdY_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LnXSEdY__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LnXSEdY__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lo137N8_`
--

DROP TABLE IF EXISTS `ANX___7Lo137N8_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lo137N8_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lo137N8__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lo137N8__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LoVkB_w_`
--

DROP TABLE IF EXISTS `ANX___7LoVkB_w_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LoVkB_w_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LoVkB_w__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LoVkB_w__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lorp6QQ_`
--

DROP TABLE IF EXISTS `ANX___7Lorp6QQ_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lorp6QQ_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lorp6QQ__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lorp6QQ__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LpboMzA_`
--

DROP TABLE IF EXISTS `ANX___7LpboMzA_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LpboMzA_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LpboMzA__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LpboMzA__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lpt51wo_`
--

DROP TABLE IF EXISTS `ANX___7Lpt51wo_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lpt51wo_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lpt51wo__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lpt51wo__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7Lq3NyTA_`
--

DROP TABLE IF EXISTS `ANX___7Lq3NyTA_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7Lq3NyTA_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7Lq3NyTA__TIMESTAMP` (`timestamp`),
  KEY `ANX___7Lq3NyTA__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LqAx6zI_`
--

DROP TABLE IF EXISTS `ANX___7LqAx6zI_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LqAx6zI_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LqAx6zI__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LqAx6zI__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LqJRtY0_`
--

DROP TABLE IF EXISTS `ANX___7LqJRtY0_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LqJRtY0_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LqJRtY0__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LqJRtY0__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LrzrM_s_`
--

DROP TABLE IF EXISTS `ANX___7LrzrM_s_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LrzrM_s_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LrzrM_s__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LrzrM_s__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LsJGa6k_`
--

DROP TABLE IF EXISTS `ANX___7LsJGa6k_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LsJGa6k_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LsJGa6k__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LsJGa6k__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LsQrqM0_`
--

DROP TABLE IF EXISTS `ANX___7LsQrqM0_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LsQrqM0_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LsQrqM0__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LsQrqM0__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LusJbNc_`
--

DROP TABLE IF EXISTS `ANX___7LusJbNc_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LusJbNc_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LusJbNc__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LusJbNc__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LvAifJU_`
--

DROP TABLE IF EXISTS `ANX___7LvAifJU_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LvAifJU_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LvAifJU__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LvAifJU__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___7LvHafos_`
--

DROP TABLE IF EXISTS `ANX___7LvHafos_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___7LvHafos_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___7LvHafos__TIMESTAMP` (`timestamp`),
  KEY `ANX___7LvHafos__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GBFh8Sk_`
--

DROP TABLE IF EXISTS `ANX___8GBFh8Sk_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GBFh8Sk_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GBFh8Sk__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GBFh8Sk__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GCrE4g4_`
--

DROP TABLE IF EXISTS `ANX___8GCrE4g4_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GCrE4g4_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GCrE4g4__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GCrE4g4__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GE68t_s_`
--

DROP TABLE IF EXISTS `ANX___8GE68t_s_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GE68t_s_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GE68t_s__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GE68t_s__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GECw_vE_`
--

DROP TABLE IF EXISTS `ANX___8GECw_vE_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GECw_vE_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GECw_vE__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GECw_vE__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GECxAtQ_`
--

DROP TABLE IF EXISTS `ANX___8GECxAtQ_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GECxAtQ_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GECxAtQ__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GECxAtQ__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GECyzG0_`
--

DROP TABLE IF EXISTS `ANX___8GECyzG0_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GECyzG0_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GECyzG0__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GECyzG0__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GEkYomM_`
--

DROP TABLE IF EXISTS `ANX___8GEkYomM_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GEkYomM_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GEkYomM__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GEkYomM__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GFNJEgY_`
--

DROP TABLE IF EXISTS `ANX___8GFNJEgY_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GFNJEgY_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GFNJEgY__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GFNJEgY__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GIwXfq0_`
--

DROP TABLE IF EXISTS `ANX___8GIwXfq0_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GIwXfq0_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GIwXfq0__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GIwXfq0__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GLAPVIo_`
--

DROP TABLE IF EXISTS `ANX___8GLAPVIo_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GLAPVIo_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GLAPVIo__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GLAPVIo__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GO1qG0w_`
--

DROP TABLE IF EXISTS `ANX___8GO1qG0w_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GO1qG0w_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GO1qG0w__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GO1qG0w__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___8GO8JC2Q_`
--

DROP TABLE IF EXISTS `ANX___8GO8JC2Q_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___8GO8JC2Q_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___8GO8JC2Q__TIMESTAMP` (`timestamp`),
  KEY `ANX___8GO8JC2Q__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ANX___seJgCO3I_`
--

DROP TABLE IF EXISTS `ANX___seJgCO3I_`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ANX___seJgCO3I_` (
  `record_id` varchar(128) NOT NULL DEFAULT '',
  `timestamp` bigint(20) DEFAULT NULL,
  `data` longblob,
  `ED0` varchar(4000) DEFAULT NULL,
  `ED1` varchar(4000) DEFAULT NULL,
  `ED2` varchar(4000) DEFAULT NULL,
  `ED3` varchar(4000) DEFAULT NULL,
  `ED4` varchar(4000) DEFAULT NULL,
  `ED5` varchar(4000) DEFAULT NULL,
  `ED6` varchar(4000) DEFAULT NULL,
  `ED7` varchar(4000) DEFAULT NULL,
  `ED8` varchar(4000) DEFAULT NULL,
  `ED9` varchar(4000) DEFAULT NULL,
  `partition_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `ANX___seJgCO3I__TIMESTAMP` (`timestamp`),
  KEY `ANX___seJgCO3I__PARTITION_KEY` (`partition_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'ANALYTICS_EVENT_STORE'
--

--
-- Dumping routines for database 'ANALYTICS_EVENT_STORE'
--

--
-- Current Database: `APPMGT_DB`
--

USE `APPMGT_DB`;

--
-- Current Database: `CARBON_DB`
--

USE `CARBON_DB`;

--
-- Current Database: `ANALYTICS_PROCESSED_DATA_STORE`
--

USE `ANALYTICS_PROCESSED_DATA_STORE`;

--
-- Current Database: `CDM_DB`
--

USE `CDM_DB`;

--
-- Final view structure for view `device_info_view`
--

/*!50001 DROP VIEW IF EXISTS `device_info_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `device_info_view` AS select `dm_device`.`ID` AS `DEVICE_ID`,`dm_device`.`DEVICE_IDENTIFICATION` AS `DEVICE_IDENTIFICATION`,`dm_device_type`.`NAME` AS `PLATFORM`,`dm_enrolment`.`OWNERSHIP` AS `OWNERSHIP`,`dm_enrolment`.`STATUS` AS `CONNECTIVITY_STATUS`,`dm_device`.`TENANT_ID` AS `TENANT_ID` from ((`dm_device` join `dm_device_type`) join `dm_enrolment`) where ((`dm_device`.`DEVICE_TYPE_ID` = `dm_device_type`.`ID`) and (`dm_device`.`ID` = `dm_enrolment`.`DEVICE_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `device_with_policy_info_view`
--

/*!50001 DROP VIEW IF EXISTS `device_with_policy_info_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `device_with_policy_info_view` AS select `dm_policy_compliance_status`.`DEVICE_ID` AS `DEVICE_ID`,`dm_policy_compliance_status`.`POLICY_ID` AS `POLICY_ID`,`dm_policy_compliance_status`.`STATUS` AS `IS_COMPLIANT` from `dm_policy_compliance_status` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `feature_non_compliance_info`
--

/*!50001 DROP VIEW IF EXISTS `feature_non_compliance_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `feature_non_compliance_info` AS select `dm_device`.`ID` AS `DEVICE_ID`,`dm_device`.`DEVICE_IDENTIFICATION` AS `DEVICE_IDENTIFICATION`,`dm_device_detail`.`DEVICE_MODEL` AS `DEVICE_MODEL`,`dm_device_detail`.`VENDOR` AS `VENDOR`,`dm_device_detail`.`OS_VERSION` AS `OS_VERSION`,`dm_enrolment`.`OWNERSHIP` AS `OWNERSHIP`,`dm_enrolment`.`OWNER` AS `OWNER`,`dm_enrolment`.`STATUS` AS `CONNECTIVITY_STATUS`,`dm_policy_compliance_status`.`POLICY_ID` AS `POLICY_ID`,`dm_device_type`.`NAME` AS `PLATFORM`,`dm_policy_compliance_features`.`FEATURE_CODE` AS `FEATURE_CODE`,`dm_policy_compliance_features`.`STATUS` AS `IS_COMPLAINT`,`dm_device`.`TENANT_ID` AS `TENANT_ID` from (((((`dm_policy_compliance_features` join `dm_policy_compliance_status`) join `dm_enrolment`) join `dm_device`) join `dm_device_type`) join `dm_device_detail`) where ((`dm_policy_compliance_features`.`COMPLIANCE_STATUS_ID` = `dm_policy_compliance_status`.`ID`) and (`dm_policy_compliance_status`.`ENROLMENT_ID` = `dm_enrolment`.`ID`) and (`dm_policy_compliance_status`.`DEVICE_ID` = `dm_device`.`ID`) and (`dm_device`.`DEVICE_TYPE_ID` = `dm_device_type`.`ID`) and (`dm_device`.`ID` = `dm_device_detail`.`DEVICE_ID`)) order by `dm_device`.`TENANT_ID`,`dm_device`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `policy_compliance_info`
--

/*!50001 DROP VIEW IF EXISTS `policy_compliance_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `policy_compliance_info` AS select `device_info_view`.`DEVICE_ID` AS `DEVICE_ID`,`device_info_view`.`DEVICE_IDENTIFICATION` AS `DEVICE_IDENTIFICATION`,`device_info_view`.`PLATFORM` AS `PLATFORM`,`device_info_view`.`OWNERSHIP` AS `OWNERSHIP`,`device_info_view`.`CONNECTIVITY_STATUS` AS `CONNECTIVITY_STATUS`,ifnull(`device_with_policy_info_view`.`POLICY_ID`,-(1)) AS `POLICY_ID`,ifnull(`device_with_policy_info_view`.`IS_COMPLIANT`,-(1)) AS `IS_COMPLIANT`,`device_info_view`.`TENANT_ID` AS `TENANT_ID` from (`device_info_view` left join `device_with_policy_info_view` on((`device_info_view`.`DEVICE_ID` = `device_with_policy_info_view`.`DEVICE_ID`))) order by `device_info_view`.`DEVICE_ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Current Database: `APIMGT_DB`
--

USE `APIMGT_DB`;

--
-- Current Database: `ANALYTICS_EVENT_STORE`
--

USE `ANALYTICS_EVENT_STORE`;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-01-10 22:49:25
