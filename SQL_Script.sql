SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customer` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Customer` (
  `CustomerID` INT NOT NULL ,
  `Title` VARCHAR(45) NULL ,
  `Address` VARCHAR(45) NULL ,
  `Address2` VARCHAR(45) NULL ,
  `PostCode` VARCHAR(45) NULL ,
  `Telephone` VARCHAR(45) NULL ,
  `Mobile` VARCHAR(45) NULL ,
  `EmailAddress` VARCHAR(45) NULL ,
  `Comments` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`CustomerID`) )
ENGINE = InnoDB
COMMENT = '\n\n';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ServiceSubType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ServiceSubType` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `ServiceSubType` (
  `ServiceSubTypeID` INT NOT NULL ,
  `Title` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`ServiceSubTypeID`) )
ENGINE = InnoDB
COMMENT = '		';

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `ServiceType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ServiceType` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `ServiceType` (
  `ServiceTypeID` INT NOT NULL ,
  `ServiceSubTypeID` INT NULL ,
  `Title` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`ServiceTypeID`) )
ENGINE = InnoDB;

SHOW WARNINGS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
