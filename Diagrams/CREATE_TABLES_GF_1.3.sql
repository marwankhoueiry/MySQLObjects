SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `goldfish` ;
CREATE SCHEMA IF NOT EXISTS `goldfish` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `goldfish` ;

-- -----------------------------------------------------
-- Table `goldfish`.`Booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`Booking` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`Booking` (
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


-- -----------------------------------------------------
-- Table `goldfish`.`CustomerAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`CustomerAddress` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`CustomerAddress` (
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


-- -----------------------------------------------------
-- Table `goldfish`.`Customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`Customer` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`Customer` (
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
  PRIMARY KEY (`CustomerID`, `CustomerAddress_CustomerAddressID`) ,
  INDEX `fk_Customer_CustomerAddress1_idx` (`CustomerAddress_CustomerAddressID` ASC) ,
  CONSTRAINT `fk_Customer_Booking1`
    FOREIGN KEY (`CustomerID` )
    REFERENCES `goldfish`.`Booking` (`CustomerID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer_CustomerAddress1`
    FOREIGN KEY (`CustomerAddress_CustomerAddressID` )
    REFERENCES `goldfish`.`CustomerAddress` (`CustomerAddressID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 1
COMMENT = '\n\n'
PACK_KEYS = DEFAULT;


-- -----------------------------------------------------
-- Table `goldfish`.`UploadPhoto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`UploadPhoto` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`UploadPhoto` (
  `UploadPhotoID` INT NOT NULL ,
  `ServiceID` INT NOT NULL ,
  `Title` VARCHAR(45) NOT NULL ,
  `Photo` BINARY NOT NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`UploadPhotoID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldfish`.`Service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`Service` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`Service` (
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
  PRIMARY KEY (`ServiceID`, `UploadPhoto_UploadPhotoID`) ,
  INDEX `fk_Service_UploadPhoto1_idx` (`UploadPhoto_UploadPhotoID` ASC) ,
  CONSTRAINT `fk_Service_UploadPhoto1`
    FOREIGN KEY (`UploadPhoto_UploadPhotoID` )
    REFERENCES `goldfish`.`UploadPhoto` (`UploadPhotoID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldfish`.`ServiceType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`ServiceType` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`ServiceType` (
  `ServiceTypeID` INT NOT NULL ,
  `ServiceSubTypeID` INT NULL ,
  `Title` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`ServiceTypeID`) ,
  CONSTRAINT `fk_ServiceType_Service1`
    FOREIGN KEY (`ServiceTypeID` )
    REFERENCES `goldfish`.`Service` (`Type` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldfish`.`ServiceSubType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`ServiceSubType` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`ServiceSubType` (
  `ServiceSubTypeID` INT NOT NULL ,
  `Title` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`ServiceSubTypeID`) ,
  CONSTRAINT `fk_ServiceSubType_ServiceType1`
    FOREIGN KEY (`ServiceSubTypeID` )
    REFERENCES `goldfish`.`ServiceType` (`ServiceSubTypeID` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '		';


-- -----------------------------------------------------
-- Table `goldfish`.`Operator`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`Operator` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`Operator` (
  `LastModified` DATE NULL ,
  `Status` VARCHAR(45) NULL ,
  `Verified` VARCHAR(45) NULL ,
  `FirstVisit` TIMESTAMP NULL ,
  `LastVisit` TIMESTAMP NULL ,
  `NextVisit` TIMESTAMP NULL )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldfish`.`BookingConditions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`BookingConditions` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`BookingConditions` (
  `BookingConditionID` INT NOT NULL ,
  `Title` VARCHAR(45) NULL ,
  `Condition` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  `SrviceID` VARCHAR(45) NULL ,
  PRIMARY KEY (`BookingConditionID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldfish`.`LoyaltySchemes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`LoyaltySchemes` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`LoyaltySchemes` (
  `Title` VARCHAR(45) NULL ,
  `Scheme` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldfish`.`CancellationPolicies`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`CancellationPolicies` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`CancellationPolicies` (
  `CancellationPoliciesID` INT NOT NULL AUTO_INCREMENT ,
  `Title` VARCHAR(45) NULL ,
  `Policy` VARCHAR(45) NULL ,
  `Description` VARCHAR(45) NULL ,
  PRIMARY KEY (`CancellationPoliciesID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldfish`.`Business`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`Business` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`Business` (
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


-- -----------------------------------------------------
-- Table `goldfish`.`BusinessAddress`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`BusinessAddress` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`BusinessAddress` (
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


-- -----------------------------------------------------
-- Table `goldfish`.`BusinessDefault`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`BusinessDefault` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`BusinessDefault` (
  `BusinessDefaultID` INT NOT NULL ,
  `BusinessAddressID` VARCHAR(45) NULL ,
  `DayOfWeek` VARCHAR(45) NULL ,
  `StartTime` TIME NULL ,
  `EndTime` TIME NULL ,
  PRIMARY KEY (`BusinessDefaultID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldfish`.`BusinessOperators`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`BusinessOperators` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`BusinessOperators` (
  `BusinessOperatorID` INT NOT NULL ,
  `BusinessID` INT NULL ,
  `BusinessAddressID` INT NULL ,
  `TypeID` INT NULL ,
  `Schedule` VARCHAR(45) NULL ,
  `Status` VARCHAR(45) NULL ,
  PRIMARY KEY (`BusinessOperatorID`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldfish`.`OperatorLocationDefault`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`OperatorLocationDefault` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`OperatorLocationDefault` (
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


-- -----------------------------------------------------
-- Table `goldfish`.`Notifications`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`Notifications` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`Notifications` (
  `NotificationsID` INT NOT NULL AUTO_INCREMENT ,
  `Title` VARCHAR(45) NULL ,
  `Description` VARCHAR(245) NULL ,
  `CreatedBy` VARCHAR(45) NULL ,
  `CreatedDate` DATETIME NULL ,
  `ModifiedBy` VARCHAR(45) NULL ,
  `ModifiedDate` DATETIME NULL ,
  PRIMARY KEY (`NotificationsID`) ,
  INDEX `NotificationsID_idx` (`NotificationsID` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `goldfish`.`Timelines`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `goldfish`.`Timelines` ;

CREATE  TABLE IF NOT EXISTS `goldfish`.`Timelines` (
  `TimelinesID` INT NOT NULL AUTO_INCREMENT ,
  `Title` VARCHAR(45) NULL ,
  `Description` VARCHAR(245) NULL ,
  `CreatedBy` VARCHAR(45) NULL ,
  `CreatedDate` DATETIME NULL ,
  `ModifiedBy` VARCHAR(45) NULL ,
  `ModifiedDate` DATETIME NULL ,
  PRIMARY KEY (`TimelinesID`) ,
  INDEX `TimelinesID_idx` (`TimelinesID` ASC) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
