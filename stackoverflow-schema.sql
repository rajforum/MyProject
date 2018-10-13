DROP SCHEMA IF EXISTS stackoverflow;
CREATE SCHEMA stackoverflow;
USE stackoverflow;



--
--  1. Table structure for table `user_credential`
--

DROP TABLE IF EXISTS `userCredential`;

CREATE TABLE userCredential(
    `UserID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Contact_No` VARCHAR(13) NOT NULL UNIQUE,
    `Email` VARCHAR(60) NOT NULL UNIQUE,
    `Password` VARCHAR(20) NOT NULL,
    `Role` ENUM('Admin', 'User'), 
    
    PRIMARY KEY(`UserID`)

)AUTO_INCREMENT = 1000 ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
--  1.1 Table structure for table `userProfile`
--


DROP TABLE IF EXISTS `userProfile`;

CREATE TABLE userProfile(
    `StackID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(100) NOT NULL,
    `Image`  VARCHAR(200) DEFAULT'-',
    `Country` VARCHAR(50) NOT NULL,
    `Sex` ENUM('MALE', 'FEMALE'),
    `DOB` DATE,

    PRIMARY KEY(`StackID`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
--  1.2 User authentication mapping
--


DROP TABLE IF EXISTS `userAccesMapping`;

CREATE TABLE userAccesMapping(
    `Credential_UserID` INT UNSIGNED NOT NULL,
    `Profile_StackID` INT UNSIGNED NOT NULL,
    `AuthToken` VARCHAR(300) UNIQUE DEFAULT '-',
    `AuthToken_Creation` TIMESTAMP,

    
    CONSTRAINT `fk_uam_profilestackid` FOREIGN KEY (`Profile_StackID`) REFERENCES `userProfile` (`StackID`) ON UPDATE CASCADE,
    CONSTRAINT `fk_uam_credential_userid` FOREIGN KEY (`Credential_UserID`) REFERENCES `userCredential` (`UserID`) ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
--  2. Table structure for table `queryTopic`
--

DROP TABLE IF EXISTS `queryTopic`;

CREATE TABLE `queryTopic`(
    `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `TagName` VARCHAR(100) NOT NULL,
    
    PRIMARY KEY(`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
--  2. Table structure for table `querySubTopic`
--

DROP TABLE IF EXISTS `querySubTopic`;

CREATE TABLE `querySubTopic`(
    `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `TagName` VARCHAR(100) NOT NULL,
    `Super_TagID` INT UNSIGNED,
    
    PRIMARY KEY(`ID`),
    CONSTRAINT `fk_qst_supertagid` FOREIGN KEY (`Super_TagID`) REFERENCES `queryTopic` (`ID`) ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
--  4. Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;


CREATE TABLE `question` (
  `ID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(300) NOT NULL,
  `BodyText` MEDIUMTEXT NOT NULL, 
  `AuthorID` INT UNSIGNED NOT NULL,
  `Vote` INT NOT NULL DEFAULT 0,

  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_q_author` FOREIGN KEY (`AuthorID`) REFERENCES `userProfile` (`StackID`) ON DELETE RESTRICT
  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
--  2.1 Question tag mapping
--

DROP TABLE IF EXISTS `questionTagMapping`;

CREATE TABLE `questionTagMapping`(
    `QuestionID`INT UNSIGNED NOT NULL,
    `TagID`INT UNSIGNED NOT NULL,
    
    
    CONSTRAINT `fk_qtm_questionid` FOREIGN KEY (`QuestionID`) REFERENCES `question` (`ID`) ON DELETE CASCADE,
    CONSTRAINT `fk_qtm_tagID` FOREIGN KEY (`TagID`) REFERENCES `querySubTopic`(`ID`) ON DELETE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
--  3. Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer`(
    `QueryID` INT  UNSIGNED NOT NULL,
    `UserID` INT  UNSIGNED NOT NULL,
    `BodyText` MEDIUMTEXT NOT NULL,
    `Vote` INT NOT NULL DEFAULT 0,
    
    CONSTRAINT `fk_qr_queryid` FOREIGN KEY (`QueryID`) REFERENCES `question` (`ID`) ON DELETE CASCADE,
    CONSTRAINT `fk_qr_userid` FOREIGN KEY (`UserID`) REFERENCES `userProfile` (`StackID`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;








--
--  5. Table structure for table `user_activity`
--

DROP TABLE IF EXISTS `userBookmarkMapping`;

CREATE TABLE `userBookmarkMapping`(
    `UserID` INT  UNSIGNED NOT NULL,
    `QuestionID` INT UNSIGNED NOT NULL,
    
    CONSTRAINT `fk_ubm_userid` FOREIGN KEY (`UserID`) REFERENCES `userProfile`(`StackID`) ON DELETE CASCADE,
    CONSTRAINT `fk_ubm_questionid` FOREIGN KEY (`QuestionID`) REFERENCES `question`(`ID`) ON DELETE CASCADE
    
)ENGINE=InnoDB DEFAULT CHARSET=utf8;








