SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `mydb` ;
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
SHOW WARNINGS;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `Booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Booking` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Booking` (
  `CustomerID` INT NOT NULL ,
  `OperatorID` INT NULL ,
  `ServiceID` INT NOT NULL ,
  `Quantity` INT NOT NULL ,
  `Price` DECIMAL NOT NULL ,
  `PromotionCode` VARCHAR(45) NULL ,
  `BookingDate` DATE NULL ,
  `DeliveryDate` DATE NULL ,
  `DeliveryTime` TIME NULL ,
  `DeliveryAddress` VARCHAR(45) NULL ,
  PRIMARY KEY (`CustomerID`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `CustomerAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CustomerAddress` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `CustomerAddress` (
  `CustomerAddressID` INT NOT NULL ,
  `CustomerID` INT NULL ,
  `Type` VARCHAR(45) NULL ,
  `Status` VARCHAR(45) NULL ,
  `Attention` VARCHAR(45) NULL ,
  `Addressee` VARCHAR(45) NULL ,
  `Line1` VARCHAR(45) NULL ,
  `Line2` VARCHAR(45) NULL ,
  `Line3` VARCHAR(45) NULL ,
  `Country/State` VARCHAR(45) NULL ,
  `PostCode/ZipCode` VARCHAR(45) NULL ,
  `Country` VARCHAR(45) NULL ,
  `Lat` DECIMAL NULL ,
  `Ing` DECIMAL NULL ,
  PRIMARY KEY (`CustomerAddressID`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Customer` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Customer` (
  `CustomerID` INT NOT NULL ,
  `MasterID` INT NULL ,
  `Title` VARCHAR(45) NULL ,
  `FirstName` VARCHAR(45) NULL ,
  `LastName` VARCHAR(45) NULL ,
  `DateOfBirth` DATE NULL ,
  `Address` VARCHAR(45) NULL ,
  `Address2` VARCHAR(45) NULL ,
  `PostCode` VARCHAR(45) NULL ,
  `Telephone` VARCHAR(45) NULL ,
  `Mobile` VARCHAR(45) NULL ,
  `EmailAddress` VARCHAR(45) NULL ,
  `Comments` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  `Status` VARCHAR(45) NULL ,
  `Verified` VARCHAR(45) NULL ,
  `FirstVisit` TIMESTAMP NULL ,
  `LastVisit` TIMESTAMP NULL ,
  `NextVisit` TIMESTAMP NULL ,
  `CustomerAddress_CustomerAddressID` INT NOT NULL ,
  PRIMARY KEY (`CustomerID`, `CustomerAddress_CustomerAddressID`) )
ENGINE = InnoDB
AUTO_INCREMENT = 1
COMMENT = '\n\n'
PACK_KEYS = DEFAULT;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `UploadPhoto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UploadPhoto` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `UploadPhoto` (
  `UploadPhotoID` INT NOT NULL ,
  `ServiceID` INT NOT NULL ,
  `Title` VARCHAR(45) NOT NULL ,
  `Photo` BINARY NOT NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`UploadPhotoID`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Service` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Service` (
  `ServiceID` INT NOT NULL AUTO_INCREMENT ,
  `BusinessID` INT NULL ,
  `OperatorID` INT NULL ,
  `Active` INT NULL ,
  `Type` INT NOT NULL ,
  `Subtype` INT NOT NULL ,
  `Title` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  `Brand` VARCHAR(45) NULL ,
  `CostPerUnit` DECIMAL NULL ,
  `Price` DECIMAL NULL ,
  `PromotionPrice` VARCHAR(45) NULL ,
  `Duration` VARCHAR(45) NULL ,
  `Notes` VARCHAR(45) NULL ,
  `Notice` VARCHAR(45) NULL ,
  `Prerequisites` VARCHAR(45) NULL ,
  `Visibility` VARCHAR(45) NULL ,
  `LoyalitySchemeID` INT NULL ,
  `CancellationPolicyID` INT NULL ,
  `PaymentTypeID` INT NULL ,
  `IsEstimate` TINYINT(1) NULL ,
  `Deposit` DECIMAL NULL ,
  `Amount` DECIMAL NULL ,
  `Currency` VARCHAR(45) NULL ,
  `UploadPhoto_UploadPhotoID` INT NOT NULL ,
  PRIMARY KEY (`ServiceID`, `UploadPhoto_UploadPhotoID`) )
ENGINE = InnoDB;

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
-- Table `Operator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Operator` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Operator` (
  `LastModified` DATE NULL ,
  `Status` VARCHAR(45) NULL ,
  `Verified` VARCHAR(45) NULL ,
  `FirstVisit` TIMESTAMP NULL ,
  `LastVisit` TIMESTAMP NULL ,
  `NextVisit` TIMESTAMP NULL )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `BookingConditions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BookingConditions` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `BookingConditions` (
  `BookingConditionID` INT NOT NULL ,
  `Title` VARCHAR(45) NULL ,
  `Condition` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  `SrviceID` VARCHAR(45) NULL ,
  PRIMARY KEY (`BookingConditionID`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `LoyaltySchemes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `LoyaltySchemes` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `LoyaltySchemes` (
  `Title` VARCHAR(45) NULL ,
  `Scheme` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `CancellationPolicies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CancellationPolicies` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `CancellationPolicies` (
  `CancellationPoliciesID` INT NOT NULL AUTO_INCREMENT ,
  `Title` VARCHAR(45) NULL ,
  `Policy` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`CancellationPoliciesID`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Business`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Business` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Business` (
  `BusinessID` INT NOT NULL ,
  `TypeID` VARCHAR(45) NULL ,
  `Title` VARCHAR(45) NULL ,
  `DescriptionShort` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  `FirstCompleted` DATE NULL ,
  `LastCompleted` DATE NULL ,
  `NextBooking` DATE NULL ,
  PRIMARY KEY (`BusinessID`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `BusinessAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BusinessAddress` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `BusinessAddress` (
  `BusinessAddressID` INT NOT NULL ,
  `BusinessID` INT NOT NULL ,
  `Type` VARCHAR(45) NULL ,
  `Status` VARCHAR(45) NULL ,
  `Attention` VARCHAR(45) NULL ,
  `Addressee` VARCHAR(45) NULL ,
  `Line1` VARCHAR(45) NULL ,
  `Line2` VARCHAR(45) NULL ,
  `Line3` VARCHAR(45) NULL ,
  `County/State` VARCHAR(45) NULL ,
  `PostCode` VARCHAR(45) NULL ,
  `Country` VARCHAR(45) NULL ,
  `Lat` VARCHAR(45) NULL ,
  `Ing` VARCHAR(45) NULL ,
  `OpenHours` VARCHAR(45) NULL ,
  `Visibility` VARCHAR(45) NULL ,
  `Restrictions` VARCHAR(45) NULL ,
  PRIMARY KEY (`BusinessAddressID`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `BusinessDefault`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BusinessDefault` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `BusinessDefault` (
  `BusinessDefaultID` INT NOT NULL ,
  `BusinessAddressID` VARCHAR(45) NULL ,
  `DayOfWeek` VARCHAR(45) NULL ,
  `StartTime` TIME NULL ,
  `EndTime` TIME NULL ,
  PRIMARY KEY (`BusinessDefaultID`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `BusinessOperators`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `BusinessOperators` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `BusinessOperators` (
  `BusinessOperatorID` INT NOT NULL ,
  `BusinessID` INT NULL ,
  `BusinessAddressID` INT NULL ,
  `TypeID` INT NULL ,
  `Schedule` VARCHAR(45) NULL ,
  `Status` VARCHAR(45) NULL ,
  PRIMARY KEY (`BusinessOperatorID`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `OperatorLocationDefault`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `OperatorLocationDefault` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `OperatorLocationDefault` (
  `OperatorLocationDefaultID` INT NOT NULL ,
  `OperatorID` INT NULL ,
  `BusinessID` INT NULL ,
  `DayOfWeek` INT NULL ,
  `StartTime` TIME NULL ,
  `EndTime` TIME NULL ,
  `Created` DATE NULL ,
  `Modified` DATE NULL ,
  PRIMARY KEY (`OperatorLocationDefaultID`) )
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Notifications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Notifications` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Notifications` (
  `NotificationsID` INT NOT NULL AUTO_INCREMENT ,
  `Title` VARCHAR(45) NULL ,
  `Description` VARCHAR(245) NULL ,
  `CreatedBy` VARCHAR(45) NULL ,
  `CreatedDate` DATETIME NULL ,
  `ModifiedBy` VARCHAR(45) NULL ,
  `ModifiedDate` DATETIME NULL ,
  PRIMARY KEY (`NotificationsID`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `NotificationsID_idx` ON `Notifications` (`NotificationsID` ASC) ;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Timelines`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Timelines` ;

SHOW WARNINGS;
CREATE  TABLE IF NOT EXISTS `Timelines` (
  `TimelinesID` INT NOT NULL AUTO_INCREMENT ,
  `Title` VARCHAR(45) NULL ,
  `Description` VARCHAR(245) NULL ,
  `CreatedBy` VARCHAR(45) NULL ,
  `CreatedDate` DATETIME NULL ,
  `ModifiedBy` VARCHAR(45) NULL ,
  `ModifiedDate` DATETIME NULL ,
  PRIMARY KEY (`TimelinesID`) )
ENGINE = InnoDB;

SHOW WARNINGS;
CREATE INDEX `TimelinesID_idx` ON `Timelines` (`TimelinesID` ASC) ;

SHOW WARNINGS;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
