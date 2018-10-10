DROP SCHEMA IF EXISTS stackoverflow;
CREATE SCHEMA stackoverflow;
USE stackoverflow;



--
--  1. Table structure for table `user_data`
--

DROP TABLE IF EXISTS `user_data`;

CREATE TABLE user_data(
    `ID` INT NOT NULL AUTO_INCREMENT,
    `Name` VARCHAR(50) NOT NULL,
    `Password` VARCHAR(20) NOT NULL,
    `Contact_No` VARCHAR(13) NOT NULL,
    `Email` VARCHAR(60) NOT NULL,

    UNIQUE (`Name`),
    PRIMARY KEY(ID)

) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
--  2. Table structure for table `queryTopic`
--

DROP TABLE IF EXISTS `queryTopic`;

CREATE TABLE `queryTopic`(
    `TagName` VARCHAR(50) NOT NULL,
    
    PRIMARY KEY(`TagName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;;



--
--  3. Table structure for table `queryResponse`
--

DROP TABLE IF EXISTS `queryResponse`;

CREATE TABLE `queryResponse`(
    `ID` INT NOT NULL AUTO_INCREMENT,
    `UserID` INT NOT NULL,
    `Code` MEDIUMTEXT NOT NULL,
    `ResponseDescription` MEDIUMTEXT NOT NULL,
    
    PRIMARY KEY(ID),
    CONSTRAINT `fk_qr_userid` FOREIGN KEY (`UserID`) REFERENCES `user_data` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
--  4. Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;


CREATE TABLE `question` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Tag` VARCHAR(50) NOT NULL,
  `QueryHeading` VARCHAR(300) NOT NULL, 
  `Author` VARCHAR(50) NOT NULL,
  `CodeID` INT NOT NULL,
  `Vote` INT NOT NULL DEFAULT 0,

  PRIMARY KEY (`ID`),
  CONSTRAINT `fk_q_author` FOREIGN KEY (`Author`) REFERENCES `user_data` (`Name`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_q_tag` FOREIGN KEY (`Tag`) REFERENCES `queryTopic` (`TagName`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_q_codeid` FOREIGN KEY (`CodeID`) REFERENCES `queryResponse` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE
  
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
--  5. Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer`(
    `ID` INT NOT NULL AUTO_INCREMENT,
    `UserID` INT NOT NULL,
    `QueryID` INT NOT NULL,
    `ResponseID` INT NOT NULL,
    `Upvote` INT NOT NULL DEFAULT 0,
     
     PRIMARY KEY(`ID`),
     CONSTRAINT `fk_ans_queryid` FOREIGN KEY (`QueryID`) REFERENCES `question` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
     CONSTRAINT `fk_ans_responseid` FOREIGN KEY (`ResponseID`) REFERENCES `queryResponse` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
     CONSTRAINT `fk_ans_userid` FOREIGN KEY (`UserID`) REFERENCES `user_data` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE

)  ENGINE=InnoDB DEFAULT CHARSET=utf8;



--
--  6. Table structure for table `user_activity`
--

DROP TABLE IF EXISTS `user_activity`;

CREATE TABLE `user_activity`(
    `ID` INT NOT NULL AUTO_INCREMENT,
    `UserID` INT NOT NULL,
    `Bookmark` INT NOT NULL,
    `UserQueryID` INT NOT NULL,
    `UserResponseID` INT NOT NULL,
    
    PRIMARY KEY(ID),
    CONSTRAINT `fk_ua_userid` FOREIGN KEY (`UserID`) REFERENCES `user_data` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_ua_bookmark` FOREIGN KEY (`Bookmark`) REFERENCES `question` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_ua_userqueryid` FOREIGN KEY (`UserQueryID`) REFERENCES `question` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT `fk_ua_userresponseid` FOREIGN KEY (`UserResponseID`) REFERENCES `queryResponse` (`ID`) ON DELETE RESTRICT ON UPDATE CASCADE

) ENGINE=InnoDB DEFAULT CHARSET=utf8;







