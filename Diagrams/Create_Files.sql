CREATE TABLE `goldfish`.`Files` (
  `ID` int(10) unsigned NOT NULL auto_increment,
  `Description` char(50) default NULL,
  `FileData` longblob,
  `FileName` varchar(250) default NULL,
  `FileSize` char(50) default NULL,
  `FileType` char(50) default NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `ID_2` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=latin1